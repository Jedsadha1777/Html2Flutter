// Captures DartGenerator + JsonGenerator output for every HTML fixture into
// test/golden/. Run before any refactor of generator/table-handler so check-
// golden has a baseline to diff against.

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

for (const rel of FIXTURES) {
  const abs = path.join(ROOT, '..', rel);
  if (!fs.existsSync(abs)) {
    process.stderr.write(`MISS ${rel}\n`);
    continue;
  }
  const html = fs.readFileSync(abs, 'utf8');
  const name = path.basename(rel, '.html');

  const dartOut = runDart(html);
  // Strip Maps (controllers/dropdowns/checkboxes) since their iteration order
  // depends on insertion and they're already represented in widgetCode.
  const dartStable = {
    widgetCode:       dartOut.widgetCode,
    widgetCodes:      dartOut.widgetCodes,
    controllersCode:  dartOut.controllersCode,
    importsCode:      dartOut.importsCode,
    stateCode:        dartOut.stateCode,
    boilerplateCode:  dartOut.boilerplateCode,
    usesTable:        dartOut.usesTable,
  };
  fs.writeFileSync(path.join(__dirname, 'golden', `${name}.dart.json`),
    JSON.stringify(dartStable, null, 2));

  const jsonOut = runJson(html);
  fs.writeFileSync(path.join(__dirname, 'golden', `${name}.json.json`),
    JSON.stringify(jsonOut, null, 2));

  process.stderr.write(`OK   ${rel} (dart ${dartStable.widgetCode.length}b, json ${JSON.stringify(jsonOut).length}b)\n`);
}
