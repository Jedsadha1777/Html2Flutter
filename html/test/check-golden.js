// Re-runs the pipeline over every fixture and diffs against test/golden/.
// Exits non-zero on drift.

const fs = require('fs');
const path = require('path');
const { runDart, runJson } = require('./pipeline');

const ROOT = path.resolve(__dirname, '..');
const FIXTURES = [
  'test_html/fx_test1.html',
  'test_html/fx_test2.html',
  'test_html/test_akt1.html',
  'test_html/form-template.html',
  'test_html/test.html',
  'test_html/test2.html',
  'test_html/test3.html',
  'test_html/report_content1.html',
];

let drift = 0, total = 0;

function compare(label, actual, goldenPath) {
  total++;
  if (!fs.existsSync(goldenPath)) {
    drift++;
    console.error(`MISSING ${label}: golden ${goldenPath} not found — run npm run golden:build`);
    return;
  }
  const expected = fs.readFileSync(goldenPath, 'utf8');
  const actualStr = JSON.stringify(actual, null, 2);
  if (actualStr !== expected) {
    drift++;
    console.error(`DRIFT ${label} (golden ${expected.length}b, actual ${actualStr.length}b)`);
    // Brief location of first difference
    const lines = expected.split('\n');
    const aLines = actualStr.split('\n');
    for (let i = 0; i < Math.max(lines.length, aLines.length); i++) {
      if (lines[i] !== aLines[i]) {
        console.error(`  first diff at line ${i + 1}:`);
        console.error(`    golden:`, JSON.stringify(lines[i]?.slice(0, 120) || '<eof>'));
        console.error(`    actual:`, JSON.stringify(aLines[i]?.slice(0, 120) || '<eof>'));
        break;
      }
    }
  }
}

for (const rel of FIXTURES) {
  const abs = path.join(ROOT, '..', rel);
  if (!fs.existsSync(abs)) continue;
  const html = fs.readFileSync(abs, 'utf8');
  const name = path.basename(rel, '.html');

  const dartOut = runDart(html);
  const dartStable = {
    widgetCode:       dartOut.widgetCode,
    widgetCodes:      dartOut.widgetCodes,
    controllersCode:  dartOut.controllersCode,
    importsCode:      dartOut.importsCode,
    stateCode:        dartOut.stateCode,
    boilerplateCode:  dartOut.boilerplateCode,
    usesTable:        dartOut.usesTable,
  };
  compare(`${name}.dart`, dartStable, path.join(__dirname, 'golden', `${name}.dart.json`));

  const jsonOut = runJson(html);
  compare(`${name}.json`, jsonOut, path.join(__dirname, 'golden', `${name}.json.json`));
}

if (drift === 0) {
  console.log(`OK  ${total}/${total} pipeline outputs match golden`);
  process.exit(0);
}
console.error(`FAIL ${drift}/${total} drifted`);
process.exit(1);
