const StyleParser = {
  parse(styleStr) {
    if (!styleStr || typeof styleStr !== 'string') return {};
    const styles = {};
    const declarations = styleStr.split(';').filter(s => s.trim());
    for (const declaration of declarations) {
      const colonIndex = declaration.indexOf(':');
      if (colonIndex === -1) continue;
      const property = declaration.slice(0, colonIndex).trim().toLowerCase();
      const value = declaration.slice(colonIndex + 1).trim();
      if (!property || !value) continue;
      const expanded = this.expandShorthand(property, value);
      Object.assign(styles, expanded);
    }
    return styles;
  },

  expandShorthand(property, value) {
    const result = {};
    switch (property) {
      case 'padding':        return this.expandBoxModel('padding', value);
      case 'margin':         return this.expandBoxModel('margin', value);
      case 'border':         return this.expandBorder(value);
      case 'border-top':     return this.parseBorderSide('borderTop', value);
      case 'border-right':   return this.parseBorderSide('borderRight', value);
      case 'border-bottom':  return this.parseBorderSide('borderBottom', value);
      case 'border-left':    return this.parseBorderSide('borderLeft', value);
      case 'border-width':   return this.expandBoxModel('borderWidth', value);
      case 'border-radius':  result.borderRadius = value; return result;
      case 'border-color':   return this._expandBorderSidesShorthand('Color', value);
      case 'border-style':   return this._expandBorderSidesShorthand('Style', value);
      case 'background':     return this.expandBackground(value);
      case 'background-color': result.backgroundColor = value; return result;
      case 'font':           return this.expandFont(value);
      case 'font-size':      result.fontSize = value; return result;
      case 'font-family':    result.fontFamily = value; return result;
      case 'font-weight':    result.fontWeight = value; return result;
      case 'font-style':     result.fontStyle = value; return result;
      case 'color':          result.color = value; return result;
      case 'text-align':     result.textAlign = value; return result;
      case 'text-decoration':result.textDecoration = value; return result;
      case 'text-overflow':  result.textOverflow = value; return result;
      case 'text-underline-position': result.textUnderlinePosition = value; return result;
      case 'vertical-align': result.verticalAlign = value; return result;
      case 'white-space':    result.whiteSpace = value; return result;
      case 'overflow':       result.overflow = value; return result;
      case 'word-wrap':      result.wordWrap = value; return result;
      case 'line-height':    result.lineHeight = value; return result;
      case 'position':       result.position = value; return result;
      case 'display':        result.display = value; return result;
      case 'width':          result.width = value; return result;
      case 'height':         result.height = value; return result;
      case 'max-width':      result.maxWidth = value; return result;
      case 'min-width':      result.minWidth = value; return result;
      case 'box-sizing':       result.boxSizing = value; return result;
      case 'border-collapse':  result.borderCollapse = value; return result;
      case 'text-transform':   result.textTransform = value; return result;
      // CSS logical properties (block = top+bottom, inline = left+right)
      case 'border-block':        return this.parseBorderBlock(value);
      case 'border-block-start':  return this.parseBorderSide('borderTop', value);
      case 'border-block-end':    return this.parseBorderSide('borderBottom', value);
      case 'border-inline':       return { ...this.parseBorderSide('borderLeft', value), ...this.parseBorderSide('borderRight', value) };
      case 'border-inline-start': return this.parseBorderSide('borderLeft', value);
      case 'border-inline-end':   return this.parseBorderSide('borderRight', value);
      case 'padding-block': {
        const parts = this._parseValueAst(value)
          .filter(n => n.kind !== 'comma' && n.kind !== 'slash')
          .map(n => n.raw);
        if (parts.length === 0) return result;
        const top = parts[0];
        const bottom = parts[1] != null ? parts[1] : parts[0];
        return { paddingTop: top, paddingBottom: bottom };
      }
      case 'padding-block-start': result.paddingTop    = value; return result;
      case 'padding-block-end':   result.paddingBottom = value; return result;
      case 'padding-inline': {
        const parts = this._parseValueAst(value)
          .filter(n => n.kind !== 'comma' && n.kind !== 'slash')
          .map(n => n.raw);
        if (parts.length === 0) return result;
        const left = parts[0];
        const right = parts[1] != null ? parts[1] : parts[0];
        return { paddingLeft: left, paddingRight: right };
      }
      case 'padding-inline-start': result.paddingLeft  = value; return result;
      case 'padding-inline-end':   result.paddingRight = value; return result;
      case 'transform': {
        result.transform = value;
        for (const node of this._parseValueAst(value)) {
          if (node.kind !== 'function' || node.name !== 'rotate') continue;
          const arg = (node.args || [])[0];
          if (arg && arg.kind === 'length' && arg.unit === 'deg') {
            result.rotateAngle = arg.value;
          }
          break;
        }
        return result;
      }
      case 'transform-origin': result.transformOrigin = value; return result;
      default: {
        const camelCase = property.replace(/-([a-z])/g, (_, c) => c.toUpperCase());
        result[camelCase] = value;
        return result;
      }
    }
  },

  expandBoxModel(prefix, value) {
    const parts = this._parseValueAst(value)
      .filter(n => n.kind !== 'comma' && n.kind !== 'slash')
      .map(n => n.raw);
    const result = {};
    switch (parts.length) {
      case 1:
        result[`${prefix}Top`] = parts[0];
        result[`${prefix}Right`] = parts[0];
        result[`${prefix}Bottom`] = parts[0];
        result[`${prefix}Left`] = parts[0];
        break;
      case 2:
        result[`${prefix}Top`] = parts[0];
        result[`${prefix}Right`] = parts[1];
        result[`${prefix}Bottom`] = parts[0];
        result[`${prefix}Left`] = parts[1];
        break;
      case 3:
        result[`${prefix}Top`] = parts[0];
        result[`${prefix}Right`] = parts[1];
        result[`${prefix}Bottom`] = parts[2];
        result[`${prefix}Left`] = parts[1];
        break;
      case 4:
        result[`${prefix}Top`] = parts[0];
        result[`${prefix}Right`] = parts[1];
        result[`${prefix}Bottom`] = parts[2];
        result[`${prefix}Left`] = parts[3];
        break;
    }
    return result;
  },

  expandBorder(value) {
    const result = {};
    const STYLES = ['solid','dashed','dotted','double','none','hidden','groove','ridge','inset','outset'];
    let width = null, style = null, color = null;
    for (const node of this._parseValueAst(value)) {
      if (node.kind === 'comma' || node.kind === 'slash') continue;
      if (node.kind === 'length' || node.kind === 'number' || node.kind === 'percentage') {
        width = node.raw;
      } else if (node.kind === 'keyword' && STYLES.includes(node.value.toLowerCase())) {
        style = node.raw;
      } else {
        color = node.raw;
      }
    }
    // Store as shorthand AND expand to all 4 sides so cellBorderToFlutter can find them
    if (width) result.borderWidth = width;
    if (style) result.borderStyle = style;
    if (color) result.borderColor = color;
    for (const side of ['Top','Right','Bottom','Left']) {
      if (width) result[`border${side}Width`] = width;
      if (style) result[`border${side}Style`] = style;
      if (color) result[`border${side}Color`] = color;
    }
    return result;
  },

  parseBorderBlock(value) {
    return { ...this.parseBorderSide('borderTop', value), ...this.parseBorderSide('borderBottom', value) };
  },

  parseBorderSide(prefix, value) {
    const result = {};
    const STYLES = ['solid','dashed','dotted','double','none','hidden','groove','ridge','inset','outset'];
    for (const node of this._parseValueAst(value)) {
      if (node.kind === 'comma' || node.kind === 'slash') continue;
      if (node.kind === 'length' || node.kind === 'number' || node.kind === 'percentage') {
        result[`${prefix}Width`] = node.raw;
      } else if (node.kind === 'keyword' && STYLES.includes(node.value.toLowerCase())) {
        result[`${prefix}Style`] = node.raw;
      } else {
        result[`${prefix}Color`] = node.raw;
      }
    }
    return result;
  },

  expandBackground(value) {
    const result = {};
    const nodes = this._parseValueAst(value);
    if (nodes.length === 1 && this.isColor(nodes[0].raw)) {
      result.backgroundColor = nodes[0].raw;
      return result;
    }
    const grad = nodes.find(n => n.kind === 'function' && n.name.toLowerCase() === 'linear-gradient');
    if (grad) {
      const parsed = this.parseLinearGradient(value);
      if (parsed) {
        result.backgroundGradient = parsed;
        return result;
      }
      // gradient unsupported — fall through to url + color so accompanying values aren't lost
    }
    const url = nodes.find(n => n.kind === 'url');
    if (url) result.backgroundImage = url.raw;
    for (const n of nodes) {
      if (n.kind === 'url' || n.kind === 'comma' || n.kind === 'slash') continue;
      if (this.isColor(n.raw)) { result.backgroundColor = n.raw; break; }
    }
    return result;
  },

  // Parses Luckysheet dataBar format: "linear-gradient(to right, #63c3f5 45%, transparent 45%)"
  parseLinearGradient(value) {
    const fn = this._parseValueAst(value).find(n => n.kind === 'function' && n.name.toLowerCase() === 'linear-gradient');
    if (!fn) return null;
    const groups = [];
    let cur = [];
    for (const a of fn.args) {
      if (a.kind === 'comma') { groups.push(cur); cur = []; }
      else cur.push(a);
    }
    groups.push(cur);
    if (groups.length < 3) return null;
    if (groups[0].length < 2) return null;
    if (groups[0][0].kind !== 'keyword' || groups[0][0].value.toLowerCase() !== 'to') return null;
    if (groups[0][1].kind !== 'keyword') return null;
    const direction = groups[0][1].value;
    if (groups[1].length < 2) return null;
    const colorNode = groups[1][0];
    const pctNode = groups[1][1];
    if (pctNode.kind !== 'percentage') return null;
    if (groups[2].length === 0 || groups[2][0].kind !== 'keyword' || groups[2][0].value.toLowerCase() !== 'transparent') return null;
    return { direction, color: colorNode.raw, percent: pctNode.value };
  },

  expandFont(value) {
    const result = {};
    const WEIGHT = new Set(['bold','bolder','lighter','normal']);
    const STYLE  = new Set(['italic','oblique']);
    const nodes = this._parseValueAst(value);
    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];
      if (node.kind === 'keyword' && WEIGHT.has(node.value)) { result.fontWeight = node.raw; continue; }
      if (node.kind === 'number' && Number.isInteger(node.value) && node.value >= 100 && node.value <= 999) {
        result.fontWeight = node.raw; continue;
      }
      if (node.kind === 'keyword' && STYLE.has(node.value)) { result.fontStyle = node.raw; continue; }
      if (node.kind === 'length' || node.kind === 'percentage') {
        result.fontSize = node.raw;
        if (nodes[i+1]?.kind === 'slash') {
          const lh = nodes[i+2];
          if (lh && (lh.kind === 'length' || lh.kind === 'number' || lh.kind === 'percentage')) {
            result.lineHeight = lh.raw;
            i += 2;
          }
        }
        continue;
      }
      // Family triggers on comma-ahead OR last token (matches legacy: unknown
      // mid-stream keywords like `small-caps` are skipped without being slurped).
      const hasCommaAhead = nodes.slice(i).some(n => n.kind === 'comma');
      if (hasCommaAhead || i === nodes.length - 1) {
        result.fontFamily = value.slice(node.start).trim();
        break;
      }
    }
    return result;
  },

  // Returns flat list of value nodes. Each has .raw = exact source substring.
  // Kinds: length{value,unit} | percentage{value} | number{value}
  //      | keyword{value} | hash{value} | string{value,quote}
  //      | url{value} | function{name,args} | comma | slash
  _parseValueAst(src) {
    const s = String(src == null ? '' : src);
    const n = s.length;
    let i = 0;

    const isWS = c => c === ' ' || c === '\t' || c === '\n' || c === '\r' || c === '\f';
    const isDigit = c => c >= '0' && c <= '9';
    const isHex = c => isDigit(c) || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F');
    const isIdentStart = c => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c === '_' || (c && c.charCodeAt(0) > 0x7f);
    const isIdentPart = c => isIdentStart(c) || isDigit(c) || c === '-';

    const skipTrivia = () => {
      while (i < n) {
        if (isWS(s[i])) { i++; continue; }
        if (s[i] === '/' && s[i + 1] === '*') {
          i += 2;
          while (i < n && !(s[i] === '*' && s[i + 1] === '/')) i++;
          if (i < n) i += 2;
          continue;
        }
        return;
      }
    };

    const readOne = () => {
      skipTrivia();
      if (i >= n) return null;
      const c = s[i];

      if (c === ',') { const r = i; i++; return { kind: 'comma', start: r, raw: s.slice(r, i) }; }
      if (c === '/') { const r = i; i++; return { kind: 'slash', start: r, raw: s.slice(r, i) }; }
      if (c === ')') return null;

      if (c === '"' || c === "'") {
        const quote = c, start = i; i++;
        let v = '';
        while (i < n && s[i] !== quote) {
          if (s[i] === '\\' && i + 1 < n) { v += s[i + 1]; i += 2; }
          else { v += s[i++]; }
        }
        if (i < n) i++;
        return { kind: 'string', value: v, quote, start, raw: s.slice(start, i) };
      }

      if (c === '#') {
        const start = i; i++;
        while (i < n && (isIdentPart(s[i]) || isHex(s[i]))) i++;
        return { kind: 'hash', value: s.slice(start + 1, i), start, raw: s.slice(start, i) };
      }

      if (isDigit(c) ||
          (c === '.' && isDigit(s[i + 1])) ||
          ((c === '-' || c === '+') && (isDigit(s[i + 1]) || (s[i + 1] === '.' && isDigit(s[i + 2]))))) {
        const start = i;
        if (c === '-' || c === '+') i++;
        while (i < n && isDigit(s[i])) i++;
        if (s[i] === '.' && isDigit(s[i + 1])) {
          i++;
          while (i < n && isDigit(s[i])) i++;
        }
        const value = parseFloat(s.slice(start, i));
        if (s[i] === '%') { i++; return { kind: 'percentage', value, start, raw: s.slice(start, i) }; }
        if (i < n && (isIdentStart(s[i]) || (s[i] === '-' && isIdentStart(s[i + 1])))) {
          const uStart = i;
          while (i < n && isIdentPart(s[i])) i++;
          return { kind: 'length', value, unit: s.slice(uStart, i), start, raw: s.slice(start, i) };
        }
        return { kind: 'number', value, start, raw: s.slice(start, i) };
      }

      if (isIdentStart(c) || (c === '-' && (isIdentStart(s[i + 1]) || s[i + 1] === '-'))) {
        const start = i;
        if (c === '-') i++;
        while (i < n && isIdentPart(s[i])) i++;
        const name = s.slice(start, i);

        if (s[i] === '(') {
          i++; // consume (
          if (name.toLowerCase() === 'url') {
            skipTrivia();
            let v;
            if (s[i] === '"' || s[i] === "'") {
              const q = s[i]; i++;
              let buf = '';
              while (i < n && s[i] !== q) {
                if (s[i] === '\\' && i + 1 < n) { buf += s[i + 1]; i += 2; }
                else buf += s[i++];
              }
              if (i < n) i++;
              v = buf;
            } else {
              const vs = i;
              while (i < n && s[i] !== ')') i++;
              v = s.slice(vs, i).trim();
            }
            skipTrivia();
            if (s[i] === ')') i++;
            return { kind: 'url', value: v, start, raw: s.slice(start, i) };
          }
          const args = [];
          let depth = 1;
          while (i < n && depth > 0) {
            skipTrivia();
            if (s[i] === ')') { depth--; if (depth === 0) { i++; break; } }
            const a = readOne();
            if (!a) { if (i < n && s[i] !== ')') i++; continue; }
            args.push(a);
          }
          return { kind: 'function', name, args, start, raw: s.slice(start, i) };
        }
        return { kind: 'keyword', value: name, start, raw: name };
      }

      i++;
      return readOne();
    };

    const out = [];
    while (i < n) {
      skipTrivia();
      if (i >= n) break;
      const node = readOne();
      if (!node) { if (i < n) i++; continue; }
      out.push(node);
    }
    return out;
  },

  _expandBorderSidesShorthand(suffix, value) {
    const parts = this._parseValueAst(value)
      .filter(n => n.kind !== 'comma' && n.kind !== 'slash')
      .map(n => n.raw);
    const out = { [`border${suffix}`]: value };
    if (parts.length === 0) return out;
    const [t, r, b, l] =
      parts.length === 1 ? [parts[0], parts[0], parts[0], parts[0]] :
      parts.length === 2 ? [parts[0], parts[1], parts[0], parts[1]] :
      parts.length === 3 ? [parts[0], parts[1], parts[2], parts[1]] :
                           [parts[0], parts[1], parts[2], parts[3]];
    out[`borderTop${suffix}`]    = t;
    out[`borderRight${suffix}`]  = r;
    out[`borderBottom${suffix}`] = b;
    out[`borderLeft${suffix}`]   = l;
    return out;
  },

  // CSS Level 4 named colors (147). Single source of truth for both isColor
  // and colorToFlutter so neither lags behind the spec.
  _CSS_NAMED_HEX: {
    aliceblue:'F0F8FF', antiquewhite:'FAEBD7', aqua:'00FFFF', aquamarine:'7FFFD4',
    azure:'F0FFFF', beige:'F5F5DC', bisque:'FFE4C4', black:'000000',
    blanchedalmond:'FFEBCD', blue:'0000FF', blueviolet:'8A2BE2', brown:'A52A2A',
    burlywood:'DEB887', cadetblue:'5F9EA0', chartreuse:'7FFF00', chocolate:'D2691E',
    coral:'FF7F50', cornflowerblue:'6495ED', cornsilk:'FFF8DC', crimson:'DC143C',
    cyan:'00FFFF', darkblue:'00008B', darkcyan:'008B8B', darkgoldenrod:'B8860B',
    darkgray:'A9A9A9', darkgreen:'006400', darkgrey:'A9A9A9', darkkhaki:'BDB76B',
    darkmagenta:'8B008B', darkolivegreen:'556B2F', darkorange:'FF8C00', darkorchid:'9932CC',
    darkred:'8B0000', darksalmon:'E9967A', darkseagreen:'8FBC8F', darkslateblue:'483D8B',
    darkslategray:'2F4F4F', darkslategrey:'2F4F4F', darkturquoise:'00CED1', darkviolet:'9400D3',
    deeppink:'FF1493', deepskyblue:'00BFFF', dimgray:'696969', dimgrey:'696969',
    dodgerblue:'1E90FF', firebrick:'B22222', floralwhite:'FFFAF0', forestgreen:'228B22',
    fuchsia:'FF00FF', gainsboro:'DCDCDC', ghostwhite:'F8F8FF', gold:'FFD700',
    goldenrod:'DAA520', gray:'808080', green:'008000', greenyellow:'ADFF2F',
    grey:'808080', honeydew:'F0FFF0', hotpink:'FF69B4', indianred:'CD5C5C',
    indigo:'4B0082', ivory:'FFFFF0', khaki:'F0E68C', lavender:'E6E6FA',
    lavenderblush:'FFF0F5', lawngreen:'7CFC00', lemonchiffon:'FFFACD', lightblue:'ADD8E6',
    lightcoral:'F08080', lightcyan:'E0FFFF', lightgoldenrodyellow:'FAFAD2', lightgray:'D3D3D3',
    lightgreen:'90EE90', lightgrey:'D3D3D3', lightpink:'FFB6C1', lightsalmon:'FFA07A',
    lightseagreen:'20B2AA', lightskyblue:'87CEFA', lightslategray:'778899', lightslategrey:'778899',
    lightsteelblue:'B0C4DE', lightyellow:'FFFFE0', lime:'00FF00', limegreen:'32CD32',
    linen:'FAF0E6', magenta:'FF00FF', maroon:'800000', mediumaquamarine:'66CDAA',
    mediumblue:'0000CD', mediumorchid:'BA55D3', mediumpurple:'9370DB', mediumseagreen:'3CB371',
    mediumslateblue:'7B68EE', mediumspringgreen:'00FA9A', mediumturquoise:'48D1CC', mediumvioletred:'C71585',
    midnightblue:'191970', mintcream:'F5FFFA', mistyrose:'FFE4E1', moccasin:'FFE4B5',
    navajowhite:'FFDEAD', navy:'000080', oldlace:'FDF5E6', olive:'808000',
    olivedrab:'6B8E23', orange:'FFA500', orangered:'FF4500', orchid:'DA70D6',
    palegoldenrod:'EEE8AA', palegreen:'98FB98', paleturquoise:'AFEEEE', palevioletred:'DB7093',
    papayawhip:'FFEFD5', peachpuff:'FFDAB9', peru:'CD853F', pink:'FFC0CB',
    plum:'DDA0DD', powderblue:'B0E0E6', purple:'800080', rebeccapurple:'663399',
    red:'FF0000', rosybrown:'BC8F8F', royalblue:'4169E1', saddlebrown:'8B4513',
    salmon:'FA8072', sandybrown:'F4A460', seagreen:'2E8B57', seashell:'FFF5EE',
    sienna:'A0522D', silver:'C0C0C0', skyblue:'87CEEB', slateblue:'6A5ACD',
    slategray:'708090', slategrey:'708090', snow:'FFFAFA', springgreen:'00FF7F',
    steelblue:'4682B4', tan:'D2B48C', teal:'008080', thistle:'D8BFD8',
    tomato:'FF6347', transparent:null, turquoise:'40E0D0', violet:'EE82EE',
    wheat:'F5DEB3', white:'FFFFFF', whitesmoke:'F5F5F5', yellow:'FFFF00',
    yellowgreen:'9ACD32',
  },

  isColor(value) {
    if (!value) return false;
    const s = String(value).trim();
    if (s[0] === '#') {
      const hex = s.slice(1);
      if (hex.length !== 3 && hex.length !== 4 && hex.length !== 6 && hex.length !== 8) return false;
      for (const c of hex) {
        if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F'))) return false;
      }
      return true;
    }
    const COLOR_FNS = new Set(['rgb','rgba','hsl','hsla','hwb','lab','lch','oklab','oklch','color','var']);
    const nodes = this._parseValueAst(s);
    if (nodes.length !== 1) return false;
    const n = nodes[0];
    if (n.kind === 'function') return n.raw.endsWith(')') && COLOR_FNS.has(n.name.toLowerCase());
    if (n.kind === 'keyword')  return Object.prototype.hasOwnProperty.call(this._CSS_NAMED_HEX, n.value.toLowerCase());
    return false;
  },

  // 1pt = 1.33 logical pixels — must match PT_TO_LOGICAL_PIXELS in table-handler.js
  // 1rem/1em = 16px (browser default root font size)
  // 1in = 96px, 1cm = 37.8px, 1mm = 3.78px (CSS absolute units)
  parseDimension(value) {
    if (!value) return null;
    if (typeof value === 'number') return { value, unit: 'px' };
    const s = String(value).trim();
    if (s === '-webkit-fill-available' || s === 'fill-available' || s === 'stretch') {
      return { value: 100, unit: '%' };
    }
    const nodes = this._parseValueAst(s);
    if (nodes.length !== 1) return null;
    const n = nodes[0];
    const px = (v) => ({ value: Math.round(v * 10) / 10, unit: 'px' });
    if (n.kind === 'number') return { value: n.value, unit: 'px' };
    if (n.kind === 'percentage') return { value: n.value, unit: '%' };
    if (n.kind === 'length') {
      const v = n.value, u = n.unit.toLowerCase();
      if (u === 'px') return { value: v, unit: 'px' };
      if (u === '%')  return { value: v, unit: '%' };
      if (u === 'vh' || u === 'vw' || u === 'vmin' || u === 'vmax') return { value: v, unit: u };
      if (u === 'pt')                  return px(v * 1.33);
      if (u === 'rem' || u === 'em')   return px(v * 16);
      if (u === 'ch' || u === 'ex')    return px(v * 8);
      if (u === 'in')                  return px(v * 96);
      if (u === 'cm')                  return px(v * 37.8);
      if (u === 'mm')                  return px(v * 3.78);
      return null;
    }
    return null;
  },

  colorToFlutter(color) {
    if (!color) return null;
    color = color.trim();
    if (color.startsWith('#') && /^#[0-9a-fA-F]+$/.test(color)) {
      let hex = color.slice(1);
      if (hex.length === 3) hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2];
      else if (hex.length === 4) hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2]+hex[3]+hex[3];
      if (hex.length === 6) return `Color(0xFF${hex.toUpperCase()})`;
      // CSS #RRGGBBAA → Flutter ARGB (0xAARRGGBB)
      if (hex.length === 8) {
        const rgb = hex.slice(0, 6), a = hex.slice(6, 8);
        return `Color(0x${(a + rgb).toUpperCase()})`;
      }
    }
    const rgbaFn = this._parseValueAst(color).find(n => n.kind === 'function' && /^rgba?$/i.test(n.name));
    if (rgbaFn) {
      const parts = rgbaFn.args.filter(a => a.kind !== 'comma' && a.kind !== 'slash');
      const channel = (p) => {
        if (!p) return null;
        if (p.kind === 'number') return Math.round(p.value);
        if (p.kind === 'percentage') return Math.round(p.value * 255 / 100);
        return null;
      };
      const alpha = (p) => {
        if (!p) return 1;
        if (p.kind === 'number') return p.value;
        if (p.kind === 'percentage') return p.value / 100;
        return null;
      };
      const r = channel(parts[0]), g = channel(parts[1]), b = channel(parts[2]);
      const a = parts.length >= 4 ? alpha(parts[3]) : 1;
      if (r != null && g != null && b != null && a != null) {
        return `Color.fromRGBO(${r}, ${g}, ${b}, ${a})`;
      }
    }
    const materialPreferred = {
      'black':'Colors.black','white':'Colors.white','red':'Colors.red',
      'green':'Colors.green','blue':'Colors.blue','yellow':'Colors.yellow',
      'orange':'Colors.orange','purple':'Colors.purple','pink':'Colors.pink',
      'brown':'Colors.brown','gray':'Colors.grey','grey':'Colors.grey',
      'cyan':'Colors.cyan','teal':'Colors.teal','transparent':'Colors.transparent',
      'navy':'Color(0xFF000080)','lime':'Color(0xFF00FF00)','maroon':'Color(0xFF800000)',
    };
    const lower = color.toLowerCase();
    if (materialPreferred[lower]) return materialPreferred[lower];
    if (Object.prototype.hasOwnProperty.call(this._CSS_NAMED_HEX, lower)) {
      const hex = this._CSS_NAMED_HEX[lower];
      if (hex === null) return 'Colors.transparent';
      return `Color(0xFF${hex})`;
    }
    return `Color(0xFF000000) /* ${color} */`;
  },

  alignToFlutter(align) {
    const m = {
      'left':'Alignment.centerLeft','center':'Alignment.center',
      'right':'Alignment.centerRight','justify':'Alignment.centerLeft',
    };
    return m[align?.toLowerCase()] || null;
  },

  valignToFlutter(valign) {
    const m = {
      'top':'TableCellVerticalAlignment.top','middle':'TableCellVerticalAlignment.middle',
      'bottom':'TableCellVerticalAlignment.bottom','baseline':'TableCellVerticalAlignment.baseline',
    };
    return m[valign?.toLowerCase()] || null;
  },

  textAlignToFlutter(align) {
    const m = {
      'left':'TextAlign.left','start':'TextAlign.left',
      'center':'TextAlign.center',
      'right':'TextAlign.right','end':'TextAlign.right',
      'justify':'TextAlign.justify',
    };
    return m[align?.toLowerCase()] || null;
  },

  textDecorationToFlutter(value) {
    if (!value) return null;
    const tokens = new Set(String(value).toLowerCase().split(/\s+/).filter(Boolean));
    const hasUnderline   = tokens.has('underline');
    const hasLineThrough = tokens.has('line-through');
    if (hasUnderline && hasLineThrough)
      return 'TextDecoration.combine([TextDecoration.underline, TextDecoration.lineThrough])';
    if (hasLineThrough) return 'TextDecoration.lineThrough';
    if (hasUnderline)   return 'TextDecoration.underline';
    if (tokens.has('none')) return 'TextDecoration.none';
    return null;
  },

  textDecorationStyleToFlutter(value) {
    if (!value) return null;
    const tokens = new Set(String(value).toLowerCase().split(/\s+/).filter(Boolean));
    if (tokens.has('double')) return 'TextDecorationStyle.double';
    if (tokens.has('dashed')) return 'TextDecorationStyle.dashed';
    if (tokens.has('dotted')) return 'TextDecorationStyle.dotted';
    if (tokens.has('wavy'))   return 'TextDecorationStyle.wavy';
    return null;
  },

  firstFontFamily(value) {
    if (!value) return '';
    return String(value).split(',')[0].trim().replace(/['"]/g, '');
  },

  fontWeightToFlutter(value) {
    if (!value) return null;
    if (value === 'bold' || value === 'bolder') return 'FontWeight.bold';
    if (value === 'normal') return 'FontWeight.normal';
    const map = {
      '100':'FontWeight.w100','200':'FontWeight.w200','300':'FontWeight.w300',
      '400':'FontWeight.w400','500':'FontWeight.w500','600':'FontWeight.w600',
      '700':'FontWeight.w700','800':'FontWeight.w800','900':'FontWeight.w900',
    };
    return map[String(value)] || null;
  },

  borderSideToFlutter(prefix, styles) {
    const width  = styles[`${prefix}Width`];
    const color  = styles[`${prefix}Color`];
    const style  = styles[`${prefix}Style`];
    if (!width && !color) return null;
    if (style === 'none' || style === 'hidden') return null;
    const w = this.parseDimension(width || '1px')?.value ?? 1;
    if (w === 0) return null;
    const c = color ? this.colorToFlutter(color) : 'Colors.black';
    return `BorderSide(color: ${c}, width: ${w})`;
  },

  // Returns border style info: { side: 'BorderSide(...)', cssStyle: 'dashed'|'dotted'|'solid'|... }
  borderSideInfo(prefix, styles) {
    const width  = styles[`${prefix}Width`];
    const color  = styles[`${prefix}Color`];
    const style  = styles[`${prefix}Style`] || 'solid';
    if (!width && !color) return null;
    if (style === 'none' || style === 'hidden') return null;
    const w = this.parseDimension(width || '1px')?.value ?? 1;
    if (w === 0) return null;
    const c = color ? this.colorToFlutter(color) : 'Colors.black';
    return { side: `BorderSide(color: ${c}, width: ${w})`, cssStyle: style, width: w, flutterColor: c };
  },

  cellBorderToFlutter(styles) {
    const top    = this.borderSideToFlutter('borderTop', styles);
    const right  = this.borderSideToFlutter('borderRight', styles);
    const bottom = this.borderSideToFlutter('borderBottom', styles);
    const left   = this.borderSideToFlutter('borderLeft', styles);
    if (!top && !right && !bottom && !left) return null;
    const parts = [];
    if (top)    parts.push(`top: ${top}`);
    if (right)  parts.push(`right: ${right}`);
    if (bottom) parts.push(`bottom: ${bottom}`);
    if (left)   parts.push(`left: ${left}`);
    return `Border(${parts.join(', ')})`;
  },

  // Returns { border: 'Border(...)', dash: {top,right,bottom,left} } with CSS style info per side
  cellBorderWithDash(styles) {
    const ti = this.borderSideInfo('borderTop', styles);
    const ri = this.borderSideInfo('borderRight', styles);
    const bi = this.borderSideInfo('borderBottom', styles);
    const li = this.borderSideInfo('borderLeft', styles);
    if (!ti && !ri && !bi && !li) return null;
    const parts = [];
    if (ti) parts.push(`top: ${ti.side}`);
    if (ri) parts.push(`right: ${ri.side}`);
    if (bi) parts.push(`bottom: ${bi.side}`);
    if (li) parts.push(`left: ${li.side}`);
    const border = parts.length > 0 ? `Border(${parts.join(', ')})` : null;
    const hasDash = [ti,ri,bi,li].some(s => s && s.cssStyle !== 'solid');
    const _di = (info) => info ? { cssStyle: info.cssStyle, width: info.width, color: info.flutterColor } : null;
    const dash = hasDash ? {
      top: (ti && ti.cssStyle !== 'solid') ? _di(ti) : null,
      right: (ri && ri.cssStyle !== 'solid') ? _di(ri) : null,
      bottom: (bi && bi.cssStyle !== 'solid') ? _di(bi) : null,
      left: (li && li.cssStyle !== 'solid') ? _di(li) : null,
    } : null;
    return { border, dash };
  },

  cellBorderCollapsedWithDash(styles, isFirstRow, isFirstCol) {
    const ti = this.borderSideInfo('borderTop', styles);
    const li = this.borderSideInfo('borderLeft', styles);
    const ri = this.borderSideInfo('borderRight', styles);
    const bi = this.borderSideInfo('borderBottom', styles);
    const sides = [];
    if (ti && isFirstRow) sides.push(`top: ${ti.side}`);
    if (li && isFirstCol) sides.push(`left: ${li.side}`);
    if (ri) sides.push(`right: ${ri.side}`);
    if (bi) sides.push(`bottom: ${bi.side}`);
    if (sides.length === 0) return null;
    const border = `Border(${sides.join(', ')})`;
    const _di = (info) => info ? { cssStyle: info.cssStyle, width: info.width, color: info.flutterColor } : null;
    const activeSides = [];
    if (ti && isFirstRow) activeSides.push({ key: 'top', info: ti });
    if (li && isFirstCol) activeSides.push({ key: 'left', info: li });
    if (ri) activeSides.push({ key: 'right', info: ri });
    if (bi) activeSides.push({ key: 'bottom', info: bi });
    const hasDash = activeSides.some(s => s.info.cssStyle !== 'solid');
    const dash = hasDash ? {
      top: (ti && isFirstRow && ti.cssStyle !== 'solid') ? _di(ti) : null,
      right: (ri && ri.cssStyle !== 'solid') ? _di(ri) : null,
      bottom: (bi && bi.cssStyle !== 'solid') ? _di(bi) : null,
      left: (li && isFirstCol && li.cssStyle !== 'solid') ? _di(li) : null,
    } : null;
    return { border, dash };
  },

  // border-collapse: avoid double lines by shared-edge rule.
  // Each cell draws right+bottom. top/left only when:
  //   - it's the first row/col (outer edge), OR
  //   - the cell has an explicit heavier/different border on that side (separator lines).
  cellBorderCollapsed(styles, isFirstRow, isFirstCol) {
    const sides = [];
    const top    = this.borderSideToFlutter('borderTop', styles);
    const left   = this.borderSideToFlutter('borderLeft', styles);
    const right  = this.borderSideToFlutter('borderRight', styles);
    const bottom = this.borderSideToFlutter('borderBottom', styles);

    // In collapsed mode each cell draws bottom+right only.
    // Top drawn only for first row (outer edge); left only for first col.
    // This prevents doubled borders at shared edges.
    if (top && isFirstRow) sides.push(`top: ${top}`);
    if (left && isFirstCol) sides.push(`left: ${left}`);
    if (right)  sides.push(`right: ${right}`);
    if (bottom) sides.push(`bottom: ${bottom}`);
    if (sides.length === 0) return null;
    return `Border(${sides.join(', ')})`;
  },
};

if (typeof window !== 'undefined') window.StyleParser = StyleParser;
if (typeof module !== 'undefined') module.exports = StyleParser;
