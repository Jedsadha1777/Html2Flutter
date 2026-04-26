// Hard-coded expected values for the converted parse path. Independent of
// snapshot.json so a buggy regenerate can't silently pass.

const assert = require('assert');
const SP = require('../js/style-parser');

let passed = 0, failed = 0;
function check(label, input, expected) {
  const actual = SP.parse(input);
  try {
    assert.deepStrictEqual(actual, expected);
    passed++;
  } catch {
    failed++;
    console.error(`FAIL ${label}`);
    console.error('  input:    ', JSON.stringify(input));
    console.error('  expected: ', JSON.stringify(expected));
    console.error('  actual:   ', JSON.stringify(actual));
  }
}

function checkFn(label, fn, args, expected) {
  const actual = fn.apply(SP, args);
  try {
    assert.deepStrictEqual(actual, expected);
    passed++;
  } catch {
    failed++;
    console.error(`FAIL ${label}`);
    console.error('  args:     ', JSON.stringify(args));
    console.error('  expected: ', JSON.stringify(expected));
    console.error('  actual:   ', JSON.stringify(actual));
  }
}

// === padding / margin shorthand (1–4 values) ===
check('padding 1', 'padding: 10px',
  { paddingTop: '10px', paddingRight: '10px', paddingBottom: '10px', paddingLeft: '10px' });
check('padding 2', 'padding: 10px 20px',
  { paddingTop: '10px', paddingRight: '20px', paddingBottom: '10px', paddingLeft: '20px' });
check('padding 3', 'padding: 10px 20px 30px',
  { paddingTop: '10px', paddingRight: '20px', paddingBottom: '30px', paddingLeft: '20px' });
check('padding 4', 'padding: 10px 20px 30px 40px',
  { paddingTop: '10px', paddingRight: '20px', paddingBottom: '30px', paddingLeft: '40px' });
check('padding 0', 'padding: 0',
  { paddingTop: '0', paddingRight: '0', paddingBottom: '0', paddingLeft: '0' });
check('padding 0 mix', 'padding: 0 10px',
  { paddingTop: '0', paddingRight: '10px', paddingBottom: '0', paddingLeft: '10px' });
check('padding mixed units', 'padding: 1em 0.5rem 2pt 5%',
  { paddingTop: '1em', paddingRight: '0.5rem', paddingBottom: '2pt', paddingLeft: '5%' });
check('margin negative', 'margin: -10px',
  { marginTop: '-10px', marginRight: '-10px', marginBottom: '-10px', marginLeft: '-10px' });
check('margin auto', 'margin: 0 auto',
  { marginTop: '0', marginRight: 'auto', marginBottom: '0', marginLeft: 'auto' });

// === logical padding (bug fixes for 2-value cases) ===
check('padding-block 1', 'padding-block: 10px',
  { paddingTop: '10px', paddingBottom: '10px' });
check('padding-block 2', 'padding-block: 10px 20px',
  { paddingTop: '10px', paddingBottom: '20px' });
check('padding-inline 1', 'padding-inline: 10px',
  { paddingLeft: '10px', paddingRight: '10px' });
check('padding-inline 2', 'padding-inline: 10px 20px',
  { paddingLeft: '10px', paddingRight: '20px' });
check('padding-block-start', 'padding-block-start: 5px', { paddingTop: '5px' });
check('padding-block-end',   'padding-block-end: 5px',   { paddingBottom: '5px' });
check('padding-inline-start','padding-inline-start: 5px',{ paddingLeft: '5px' });
check('padding-inline-end',  'padding-inline-end: 5px',  { paddingRight: '5px' });

// === border shorthand classification ===
check('border full', 'border: 1px solid #ccc',
  { borderWidth: '1px', borderStyle: 'solid', borderColor: '#ccc',
    borderTopWidth: '1px', borderTopStyle: 'solid', borderTopColor: '#ccc',
    borderRightWidth: '1px', borderRightStyle: 'solid', borderRightColor: '#ccc',
    borderBottomWidth: '1px', borderBottomStyle: 'solid', borderBottomColor: '#ccc',
    borderLeftWidth: '1px', borderLeftStyle: 'solid', borderLeftColor: '#ccc' });
check('border with rgb', 'border: 1pt solid rgb(0,0,0)',
  { borderWidth: '1pt', borderStyle: 'solid', borderColor: 'rgb(0,0,0)',
    borderTopWidth: '1pt', borderTopStyle: 'solid', borderTopColor: 'rgb(0,0,0)',
    borderRightWidth: '1pt', borderRightStyle: 'solid', borderRightColor: 'rgb(0,0,0)',
    borderBottomWidth: '1pt', borderBottomStyle: 'solid', borderBottomColor: 'rgb(0,0,0)',
    borderLeftWidth: '1pt', borderLeftStyle: 'solid', borderLeftColor: 'rgb(0,0,0)' });
check('border-top side', 'border-top: 1px dashed red',
  { borderTopWidth: '1px', borderTopStyle: 'dashed', borderTopColor: 'red' });
check('border-bottom hex', 'border-bottom: 0.5px solid #abcdef',
  { borderBottomWidth: '0.5px', borderBottomStyle: 'solid', borderBottomColor: '#abcdef' });

// === border-width shorthand (legacy quirk: keys are borderWidth{Top,...}) ===
check('border-width 4', 'border-width: 1px 2px 3px 4px',
  { borderWidthTop: '1px', borderWidthRight: '2px', borderWidthBottom: '3px', borderWidthLeft: '4px' });

// === transform / rotateAngle ===
check('transform rotate', 'transform: rotate(45deg)',
  { transform: 'rotate(45deg)', rotateAngle: 45 });
check('transform rotate negative', 'transform: rotate(-15deg)',
  { transform: 'rotate(-15deg)', rotateAngle: -15 });
check('transform rotate spaces', 'transform: rotate( 30deg )',
  { transform: 'rotate( 30deg )', rotateAngle: 30 });
check('transform scale (no rotate)', 'transform: scale(1.2)',
  { transform: 'scale(1.2)' });
check('transform-origin passthrough', 'transform-origin: top left',
  { transformOrigin: 'top left' });

// === font shorthand ===
check('font basic', 'font: 12px Arial',
  { fontSize: '12px', fontFamily: 'Arial' });
check('font weight + size + family', 'font: bold 14px Arial',
  { fontWeight: 'bold', fontSize: '14px', fontFamily: 'Arial' });
check('font with line-height', 'font: bold 14px/1.5 Arial',
  { fontWeight: 'bold', fontSize: '14px', lineHeight: '1.5', fontFamily: 'Arial' });
check('font with comma family', 'font: bold 14px Arial, sans-serif',
  { fontWeight: 'bold', fontSize: '14px', fontFamily: 'Arial, sans-serif' });
check('font with quoted family', 'font: bold 14px/1.5 "Helvetica Neue", sans-serif',
  { fontWeight: 'bold', fontSize: '14px', lineHeight: '1.5', fontFamily: '"Helvetica Neue", sans-serif' });
check('font with small-caps (skip unknown)', 'font: small-caps 16px Arial',
  { fontSize: '16px', fontFamily: 'Arial' });
check('font italic + bold', 'font: italic bold 14px Arial',
  { fontStyle: 'italic', fontWeight: 'bold', fontSize: '14px', fontFamily: 'Arial' });
check('font weight 600', 'font: 600 14px Arial',
  { fontWeight: '600', fontSize: '14px', fontFamily: 'Arial' });

// === background ===
check('background hex', 'background: #fff', { backgroundColor: '#fff' });
check('background named', 'background: red', { backgroundColor: 'red' });
check('background rgba', 'background: rgba(0,0,0,0.5)', { backgroundColor: 'rgba(0,0,0,0.5)' });
check('background url', 'background: url(foo.png)', { backgroundImage: 'url(foo.png)' });
check('background url + extras', 'background: url(foo.png) no-repeat center / cover',
  { backgroundImage: 'url(foo.png)' });
check('background-color passthrough', 'background-color: #abcdef', { backgroundColor: '#abcdef' });

// === linear-gradient (Luckysheet pattern) ===
check('linear-gradient supported', 'background: linear-gradient(to right, #abc 50%, transparent 50%)',
  { backgroundGradient: { direction: 'right', color: '#abc', percent: 50 } });
check('linear-gradient with angle (unsupported, returns empty)',
  'background: linear-gradient(45deg, red, blue)', {});

// === multi-decl + tricky whitespace ===
check('multi declarations',
  'padding: 10px; margin: 5px; color: red',
  { paddingTop: '10px', paddingRight: '10px', paddingBottom: '10px', paddingLeft: '10px',
    marginTop: '5px', marginRight: '5px', marginBottom: '5px', marginLeft: '5px',
    color: 'red' });
check('messy whitespace',
  '  color : red ;  padding :  10px  ',
  { color: 'red',
    paddingTop: '10px', paddingRight: '10px', paddingBottom: '10px', paddingLeft: '10px' });
check('empty input', '', {});
check('whitespace only', '   ', {});
check('empty value skipped', 'color:; padding: 10px',
  { paddingTop: '10px', paddingRight: '10px', paddingBottom: '10px', paddingLeft: '10px' });
check('default branch camelCase', 'foo-bar: baz', { fooBar: 'baz' });

// === negative numbers (regex bug zone) ===
check('margin -1.5em', 'margin: -1.5em',
  { marginTop: '-1.5em', marginRight: '-1.5em', marginBottom: '-1.5em', marginLeft: '-1.5em' });
check('rotate negative arg', 'transform: rotate(-45deg)',
  { transform: 'rotate(-45deg)', rotateAngle: -45 });

// === parseDimension ===
checkFn('parseDimension px',         SP.parseDimension, ['10px'],   { value: 10, unit: 'px' });
checkFn('parseDimension negative',   SP.parseDimension, ['-10px'],  { value: -10, unit: 'px' });
checkFn('parseDimension em x16',     SP.parseDimension, ['1.5em'],  { value: 24, unit: 'px' });
checkFn('parseDimension pt x1.33',   SP.parseDimension, ['12pt'],   { value: 16, unit: 'px' });
checkFn('parseDimension %',          SP.parseDimension, ['50%'],    { value: 50, unit: '%' });
checkFn('parseDimension vh',         SP.parseDimension, ['100vh'],  { value: 100, unit: 'vh' });
checkFn('parseDimension vmin',       SP.parseDimension, ['50vmin'], { value: 50, unit: 'vmin' });
checkFn('parseDimension in',         SP.parseDimension, ['1in'],    { value: 96, unit: 'px' });
checkFn('parseDimension cm',         SP.parseDimension, ['1cm'],    { value: 37.8, unit: 'px' });
checkFn('parseDimension number',     SP.parseDimension, [10],       { value: 10, unit: 'px' });
checkFn('parseDimension stretch',    SP.parseDimension, ['stretch'], { value: 100, unit: '%' });
checkFn('parseDimension malformed',  SP.parseDimension, ['1.2.3'],  null);
checkFn('parseDimension auto',       SP.parseDimension, ['auto'],   null);
checkFn('parseDimension calc',       SP.parseDimension, ['calc(100% - 10px)'], null);
checkFn('parseDimension empty',      SP.parseDimension, [''],       null);

// === isColor ===
checkFn('isColor #fff',          SP.isColor, ['#fff'],          true);
checkFn('isColor #ffff',         SP.isColor, ['#ffff'],         true);   // 4-digit RGBA
checkFn('isColor #ffffff',       SP.isColor, ['#ffffff'],       true);
checkFn('isColor #ffffffff',     SP.isColor, ['#ffffffff'],     true);
checkFn('isColor #fffff',        SP.isColor, ['#fffff'],        false);  // 5-digit invalid
checkFn('isColor #fffffff',      SP.isColor, ['#fffffff'],      false);  // 7-digit invalid
checkFn('isColor #xyz',          SP.isColor, ['#xyz'],          false);
checkFn('isColor rgb',           SP.isColor, ['rgb(0,0,0)'],    true);
checkFn('isColor RGBA case-ins', SP.isColor, ['RGBA(0,0,0,1)'], true);
checkFn('isColor unclosed rgb',  SP.isColor, ['rgb(garbage'],   false);
checkFn('isColor hsl',           SP.isColor, ['hsl(120,50%,50%)'], true);
checkFn('isColor oklch',         SP.isColor, ['oklch(50% 0 0)'], true);
checkFn('isColor var',           SP.isColor, ['var(--brand)'],  true);
checkFn('isColor named',         SP.isColor, ['transparent'],   true);
checkFn('isColor non-color',     SP.isColor, ['notacolor'],     false);
checkFn('isColor url',           SP.isColor, ['url(foo.png)'],  false);

// === colorToFlutter ===
checkFn('color hex 3',  SP.colorToFlutter, ['#fff'],     'Color(0xFFFFFFFF)');
checkFn('color hex 6',  SP.colorToFlutter, ['#FF0000'],  'Color(0xFFFF0000)');
checkFn('color hex 8 alpha order',
        SP.colorToFlutter, ['#FF0000FF'], 'Color(0xFFFF0000)');           // RRGGBBAA → AARRGGBB
checkFn('color hex 8 half alpha',
        SP.colorToFlutter, ['#FF000080'], 'Color(0x80FF0000)');
checkFn('color hex 4 (RGBA)',
        SP.colorToFlutter, ['#F00A'],     'Color(0xAAFF0000)');
checkFn('color rgb',        SP.colorToFlutter, ['rgb(255, 0, 0)'],     'Color.fromRGBO(255, 0, 0, 1)');
checkFn('color rgba',       SP.colorToFlutter, ['rgba(255,0,0,0.5)'],  'Color.fromRGBO(255, 0, 0, 0.5)');
checkFn('color RGBA case',  SP.colorToFlutter, ['RGBA(0,0,0,0.5)'],    'Color.fromRGBO(0, 0, 0, 0.5)');
checkFn('color rgb percent',SP.colorToFlutter, ['rgb(100%, 50%, 0%)'], 'Color.fromRGBO(255, 128, 0, 1)');
checkFn('color malformed',  SP.colorToFlutter, ['rgb(.)'],             'Color(0xFF000000) /* rgb(.) */');
checkFn('color named red',  SP.colorToFlutter, ['red'],                'Colors.red');

// === textDecorationToFlutter ===
checkFn('decoration underline',         SP.textDecorationToFlutter, ['underline'],
        'TextDecoration.underline');
checkFn('decoration lineThrough',       SP.textDecorationToFlutter, ['line-through'],
        'TextDecoration.lineThrough');
checkFn('decoration both',              SP.textDecorationToFlutter, ['underline line-through'],
        'TextDecoration.combine([TextDecoration.underline, TextDecoration.lineThrough])');
checkFn('decoration none',              SP.textDecorationToFlutter, ['none'], 'TextDecoration.none');
checkFn('decoration substring rejected', SP.textDecorationToFlutter, ['my-underline-class'], null);
checkFn('decoration UPPERCASE',         SP.textDecorationToFlutter, ['UNDERLINE'],
        'TextDecoration.underline');

// === border style keywords (groove/ridge/inset/outset) ===
check('border groove',
  'border: 1px groove red',
  { borderWidth: '1px', borderStyle: 'groove', borderColor: 'red',
    borderTopWidth: '1px', borderTopStyle: 'groove', borderTopColor: 'red',
    borderRightWidth: '1px', borderRightStyle: 'groove', borderRightColor: 'red',
    borderBottomWidth: '1px', borderBottomStyle: 'groove', borderBottomColor: 'red',
    borderLeftWidth: '1px', borderLeftStyle: 'groove', borderLeftColor: 'red' });
check('border ridge', 'border-top: 2px ridge blue',
  { borderTopWidth: '2px', borderTopStyle: 'ridge', borderTopColor: 'blue' });
check('border inset', 'border-bottom: 1px inset #f00',
  { borderBottomWidth: '1px', borderBottomStyle: 'inset', borderBottomColor: '#f00' });
check('border outset', 'border-left: 1px outset #abc',
  { borderLeftWidth: '1px', borderLeftStyle: 'outset', borderLeftColor: '#abc' });

// === expandBackground recognizes modern color funcs ===
check('background hsl', 'background: hsl(120, 50%, 50%)', { backgroundColor: 'hsl(120, 50%, 50%)' });
check('background var', 'background: var(--brand)', { backgroundColor: 'var(--brand)' });

// === N1: border-color / border-style fan out to 4 sides ===
check('border-color override after shorthand',
  'border: 1px solid black; border-color: red',
  { borderWidth: '1px', borderStyle: 'solid', borderColor: 'red',
    borderTopWidth: '1px', borderTopStyle: 'solid', borderTopColor: 'red',
    borderRightWidth: '1px', borderRightStyle: 'solid', borderRightColor: 'red',
    borderBottomWidth: '1px', borderBottomStyle: 'solid', borderBottomColor: 'red',
    borderLeftWidth: '1px', borderLeftStyle: 'solid', borderLeftColor: 'red' });
check('border-color 4 values',
  'border-color: red green blue yellow',
  { borderColor: 'red green blue yellow',
    borderTopColor: 'red', borderRightColor: 'green',
    borderBottomColor: 'blue', borderLeftColor: 'yellow' });
check('border-style override after shorthand',
  'border: 1px solid red; border-style: dashed',
  { borderWidth: '1px', borderStyle: 'dashed', borderColor: 'red',
    borderTopWidth: '1px', borderTopStyle: 'dashed', borderTopColor: 'red',
    borderRightWidth: '1px', borderRightStyle: 'dashed', borderRightColor: 'red',
    borderBottomWidth: '1px', borderBottomStyle: 'dashed', borderBottomColor: 'red',
    borderLeftWidth: '1px', borderLeftStyle: 'dashed', borderLeftColor: 'red' });

// === N2: gradient parse fail falls through to fallback color ===
check('linear-gradient fail + fallback color',
  'background: linear-gradient(45deg, red, blue) red',
  { backgroundColor: 'red' });
check('linear-gradient supported still wins (no fallthrough)',
  'background: linear-gradient(to right, #abc 50%, transparent 50%) red',
  { backgroundGradient: { direction: 'right', color: '#abc', percent: 50 } });

// === A: full CSS Level 4 named colors recognized + mapped ===
checkFn('isColor lightgray',     SP.isColor, ['lightgray'],     true);
checkFn('isColor darkgreen',     SP.isColor, ['darkgreen'],     true);
checkFn('isColor rebeccapurple', SP.isColor, ['rebeccapurple'], true);
checkFn('isColor gold',          SP.isColor, ['gold'],          true);
checkFn('color lightgray',       SP.colorToFlutter, ['lightgray'],     'Color(0xFFD3D3D3)');
checkFn('color darkgreen',       SP.colorToFlutter, ['darkgreen'],     'Color(0xFF006400)');
checkFn('color rebeccapurple',   SP.colorToFlutter, ['rebeccapurple'], 'Color(0xFF663399)');
checkFn('color gold',            SP.colorToFlutter, ['gold'],          'Color(0xFFFFD700)');
checkFn('color transparent stays Material', SP.colorToFlutter, ['transparent'], 'Colors.transparent');

// background and background-color now consistent for any named color
check('background lightgray',       'background: lightgray',       { backgroundColor: 'lightgray' });
check('background-color lightgray', 'background-color: lightgray', { backgroundColor: 'lightgray' });

console.log(`${passed} passed, ${failed} failed`);
process.exit(failed === 0 ? 0 : 1);
