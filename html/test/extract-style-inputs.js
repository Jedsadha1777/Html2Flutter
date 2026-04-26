// Walks fixture HTML files and emits every unique style-declaration string
// that StyleParser.parse will see — inline `style="..."` attributes plus rule
// bodies inside `<style>...</style>` blocks. Output is a sorted JSON list on
// stdout so the snapshot stays stable across runs.

const fs = require('fs');
const path = require('path');

const FIXTURES = [
  'test_html/form-template.html',
  'test_html/fx_test1.html',
  'test_html/fx_test2.html',
  'test_html/report_content1.html',
  'test_html/test.html',
  'test_html/test2.html',
  'test_html/test3.html',
  'test_html/test_akt1.html',
  'html/index.html',
];

const ROOT = path.resolve(__dirname, '../..');

function extractInlineStyles(html) {
  const out = [];
  // Match style="..." or style='...'
  const re = /\bstyle\s*=\s*("([^"]*)"|'([^']*)')/gi;
  let m;
  while ((m = re.exec(html)) !== null) {
    const v = m[2] != null ? m[2] : m[3];
    if (v && v.trim()) out.push(v);
  }
  return out;
}

function extractStyleBlockBodies(html) {
  const out = [];
  const re = /<style\b[^>]*>([\s\S]*?)<\/style>/gi;
  let m;
  while ((m = re.exec(html)) !== null) {
    const body = m[1];
    // Strip /* ... */ comments before splitting into rules
    const noComments = body.replace(/\/\*[\s\S]*?\*\//g, '');
    // Each rule body is whatever sits between { and the matching }.
    // We do a tiny brace scan instead of regex so nested braces (e.g. @media)
    // don't trip us up.
    let depth = 0, start = -1;
    for (let i = 0; i < noComments.length; i++) {
      const c = noComments[i];
      if (c === '{') {
        if (depth === 0) start = i + 1;
        depth++;
      } else if (c === '}') {
        depth--;
        if (depth === 0 && start !== -1) {
          const decl = noComments.slice(start, i).trim();
          if (decl && !decl.includes('{')) out.push(decl); // skip @media wrappers themselves
          start = -1;
        }
      }
    }
  }
  return out;
}

const inputs = new Set();
for (const s of require('./synthetic-inputs')) inputs.add(s);
for (const rel of FIXTURES) {
  const abs = path.join(ROOT, rel);
  if (!fs.existsSync(abs)) {
    process.stderr.write(`MISS ${rel}\n`);
    continue;
  }
  const html = fs.readFileSync(abs, 'utf8');
  for (const s of extractInlineStyles(html)) inputs.add(s);
  for (const s of extractStyleBlockBodies(html)) inputs.add(s);
  process.stderr.write(`OK   ${rel}\n`);
}

const sorted = [...inputs].sort();
process.stderr.write(`total unique inputs: ${sorted.length}\n`);
process.stdout.write(JSON.stringify(sorted, null, 2));
