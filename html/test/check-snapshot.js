// Re-runs StyleParser over the recorded inputs and diffs against the saved
// snapshot. Exits non-zero on any drift, with the first 20 mismatches printed.

const fs = require('fs');
const path = require('path');
const StyleParser = require('../js/style-parser');

const SNAPSHOT_PATH = path.join(__dirname, 'snapshot.json');

if (!fs.existsSync(SNAPSHOT_PATH)) {
  console.error(`missing ${SNAPSHOT_PATH} — run 'npm run snapshot:build' first`);
  process.exit(2);
}

const expected = JSON.parse(fs.readFileSync(SNAPSHOT_PATH, 'utf8'));
const inputs = Object.keys(expected);

let mismatches = 0;
const examples = [];
for (const s of inputs) {
  const actual = StyleParser.parse(s);
  const a = JSON.stringify(actual);
  const e = JSON.stringify(expected[s]);
  if (a !== e) {
    mismatches++;
    if (examples.length < 20) examples.push({ input: s, expected: expected[s], actual });
  }
}

if (mismatches === 0) {
  console.log(`OK  ${inputs.length} inputs match snapshot`);
  process.exit(0);
}

console.error(`FAIL ${mismatches}/${inputs.length} inputs drifted`);
for (const e of examples) {
  console.error('---');
  console.error('input:    ', e.input);
  console.error('expected: ', JSON.stringify(e.expected));
  console.error('actual:   ', JSON.stringify(e.actual));
}
process.exit(1);
