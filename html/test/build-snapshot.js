// Reads the input list (stdin) and emits a snapshot mapping
// input-string -> StyleParser.parse(input). Sorted by input for stable diffs.

const StyleParser = require('../js/style-parser');

let raw = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => { raw += chunk; });
process.stdin.on('end', () => {
  const inputs = JSON.parse(raw);
  const out = {};
  for (const s of inputs) {
    out[s] = StyleParser.parse(s);
  }
  process.stdout.write(JSON.stringify(out, null, 2));
  process.stderr.write(`snapshotted ${inputs.length} inputs\n`);
});
