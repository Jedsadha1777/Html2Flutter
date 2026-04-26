// Edge-case inputs that fixture HTML doesn't exercise. Pinning these in the
// snapshot prevents silent regressions on the brittle paths called out in
// review (font shorthand, logical padding, gradient syntax).

module.exports = [
  // font shorthand
  'font: 12px Arial',
  'font: bold 14px/1.5 Arial',
  'font: bold 14px Arial, sans-serif',
  'font: bold 14px Arial,sans-serif',
  'font: small-caps 16px Arial',
  'font: italic bold 14px Arial',
  'font: bold 14px/1.5 "Helvetica Neue", sans-serif',
  'font: 12px Arial sans-serif',

  // logical padding (1 and 2 values)
  'padding-block: 10px',
  'padding-block: 10px 20px',
  'padding-block-start: 5px',
  'padding-block-end: 5px',
  'padding-inline: 10px',
  'padding-inline: 10px 20px',
  'padding-inline-start: 5px',
  'padding-inline-end: 5px',

  // linear-gradient — supported (Luckysheet pattern) and unsupported (angle)
  'background: linear-gradient(to right, #abc 50%, transparent 50%)',
  'background: linear-gradient(to bottom, red 30%, transparent 30%)',
  'background: linear-gradient(45deg, red, blue)',
];
