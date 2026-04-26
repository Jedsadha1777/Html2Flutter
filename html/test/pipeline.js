// Boots the full HTML→Dart/JSON pipeline in Node so golden tests can run end
// to end. Loads jsdom for DOMParser, evaluates the Pretext IIFE bundle to
// expose a real Pretext global (mock would skew row-height calculations), then
// installs StyleParser / ASTNodes / TableHandler as globals before requiring
// parser.js / generator.js / json-generator.js — the source files reference
// those names as free variables.

const fs = require('fs');
const path = require('path');
const vm = require('vm');
const { JSDOM } = require('jsdom');

const ROOT = path.resolve(__dirname, '..');

const dom = new JSDOM('', { url: 'file:///' });
// Pretext calls canvas.measureText for font metrics; jsdom has no canvas.
// Stub with deterministic metrics so output is reproducible — invariance under
// table-handler refactor is what golden tests verify, not absolute pixel widths.
dom.window.HTMLCanvasElement.prototype.getContext = function () {
  return {
    set font(_) { /* ignore */ },
    get font() { return ''; },
    measureText(text) { return { width: text.length * 8 }; },
  };
};
global.window = dom.window;
global.document = dom.window.document;
global.DOMParser = dom.window.DOMParser;
global.Node = dom.window.Node;
global.Element = dom.window.Element;

const pretextSrc = fs.readFileSync(path.join(ROOT, 'js/pretext.bundle.js'), 'utf8');
vm.runInThisContext(pretextSrc.replace('var Pretext', 'globalThis.Pretext'));

global.StyleParser  = require('../js/style-parser');
global.ASTNodes     = require('../js/ast');
global.TableHandler = require('../js/table-handler');
const HTMLParser    = require('../js/parser');
const DartGenerator = require('../js/generator');
const JsonGenerator = require('../js/json-generator');

function runDart(html) {
  const ast = HTMLParser.parse(html);
  return DartGenerator.generate(ast);
}

function runJson(html) {
  const ast = HTMLParser.parse(html);
  return JsonGenerator.generate(ast);
}

module.exports = { runDart, runJson, HTMLParser, DartGenerator, JsonGenerator };
