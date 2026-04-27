const StyleParser = {
  parse(styleStr) {
    if (!styleStr || typeof styleStr !== 'string') return {};
    const styles = {};
    const declarations = this._splitDeclarations(styleStr);
    for (const declaration of declarations) {
      const colonIndex = this._findPropertyColon(declaration);
      if (colonIndex === -1) continue;
      const property = declaration.slice(0, colonIndex).trim().toLowerCase();
      const value = declaration.slice(colonIndex + 1).trim();
      if (!property || !value) continue;
      const expanded = this.expandShorthand(property, value);
      Object.assign(styles, expanded);
    }
    return styles;
  },

  // Split CSS declarations by ';' but respect parens and quotes.
  // Handles url(data:image/png;base64,...), "First; Second" font family, etc.
  _splitDeclarations(s) {
    const out = [];
    let buf = '', parenDepth = 0, quote = null;
    for (let i = 0; i < s.length; i++) {
      const c = s[i];
      if (quote) {
        if (c === '\\' && i + 1 < s.length) { buf += c + s[i + 1]; i++; continue; }
        if (c === quote) quote = null;
        buf += c;
      } else if (c === '"' || c === "'") {
        quote = c; buf += c;
      } else if (c === '(') {
        parenDepth++; buf += c;
      } else if (c === ')') {
        if (parenDepth > 0) parenDepth--;
        buf += c;
      } else if (c === ';' && parenDepth === 0) {
        const t = buf.trim();
        if (t) out.push(t);
        buf = '';
      } else {
        buf += c;
      }
    }
    const tail = buf.trim();
    if (tail) out.push(tail);
    return out;
  },

  // Find the property:value separator ':' — first ':' outside parens/quotes.
  _findPropertyColon(s) {
    let parenDepth = 0, quote = null;
    for (let i = 0; i < s.length; i++) {
      const c = s[i];
      if (quote) {
        if (c === '\\' && i + 1 < s.length) { i++; continue; }
        if (c === quote) quote = null;
      } else if (c === '"' || c === "'") {
        quote = c;
      } else if (c === '(') {
        parenDepth++;
      } else if (c === ')') {
        if (parenDepth > 0) parenDepth--;
      } else if (c === ':' && parenDepth === 0) {
        return i;
      }
    }
    return -1;
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
      case 'border-width':   return { borderWidth: value, ...this._expandBorderSideShorthand('Width', value) };
      case 'border-radius':  result.borderRadius = value; return result;
      case 'border-color':   return { borderColor: value, ...this._expandBorderSideShorthand('Color', value) };
      case 'border-style':   return { borderStyle: value, ...this._expandBorderSideShorthand('Style', value) };
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
        // padding-block: <start> [<end>]?  → top, bottom
        const parts = value.trim().split(/\s+/);
        const top = parts[0];
        const bottom = parts[1] !== undefined ? parts[1] : parts[0];
        return { paddingTop: top, paddingBottom: bottom };
      }
      case 'padding-block-start': result.paddingTop    = value; return result;
      case 'padding-block-end':   result.paddingBottom = value; return result;
      case 'padding-inline': {
        // padding-inline: <start> [<end>]?  → left (LTR), right (LTR)
        const parts = value.trim().split(/\s+/);
        const start = parts[0];
        const end = parts[1] !== undefined ? parts[1] : parts[0];
        return { paddingLeft: start, paddingRight: end };
      }
      case 'padding-inline-start': result.paddingLeft  = value; return result;
      case 'padding-inline-end':   result.paddingRight = value; return result;
      case 'transform': {
        result.transform = value;
        const m = value.match(/rotate\(\s*([-\d.]+)deg\s*\)/);
        if (m) result.rotateAngle = parseFloat(m[1]);
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
    const parts = value.split(/\s+/);
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
    const parts = value.split(/\s+/);
    let width = null, style = null, color = null;
    // CSS width keywords → px (browser-typical mapping)
    const WIDTH_KW = { thin: '1px', medium: '3px', thick: '5px' };
    for (const part of parts) {
      const lower = part.toLowerCase();
      // Mirrors /^[\d.]/.test(part): first char is a digit or '.'
      if (part.length > 0 && ((part[0] >= '0' && part[0] <= '9') || part[0] === '.')) width = part;
      else if (lower in WIDTH_KW) width = WIDTH_KW[lower];
      else if (['solid','dashed','dotted','double','none','hidden'].includes(lower)) style = part;
      else color = part;
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

  // Expand a border TRBL shorthand value into per-side keys with the canonical
  // border<Side><Attr> naming used by all consumers (e.g. borderTopWidth).
  // attr: 'Width' | 'Color' | 'Style'.
  _expandBorderSideShorthand(attr, value) {
    const parts = value.trim().split(/\s+/);
    let top, right, bottom, left;
    switch (parts.length) {
      case 1: top = right = bottom = left = parts[0]; break;
      case 2: top = bottom = parts[0]; right = left = parts[1]; break;
      case 3: top = parts[0]; right = left = parts[1]; bottom = parts[2]; break;
      default: top = parts[0]; right = parts[1]; bottom = parts[2]; left = parts[3]; break;
    }
    return {
      [`borderTop${attr}`]: top,
      [`borderRight${attr}`]: right,
      [`borderBottom${attr}`]: bottom,
      [`borderLeft${attr}`]: left,
    };
  },

  parseBorderBlock(value) {
    return { ...this.parseBorderSide('borderTop', value), ...this.parseBorderSide('borderBottom', value) };
  },

  parseBorderSide(prefix, value) {
    const result = {};
    const parts = value.trim().split(/\s+/);
    // CSS width keywords → px (browser-typical mapping)
    const WIDTH_KW = { thin: '1px', medium: '3px', thick: '5px' };
    for (const part of parts) {
      const lower = part.toLowerCase();
      // Mirrors /^[\d.]/.test(part): first char is a digit or '.'
      if (part.length > 0 && ((part[0] >= '0' && part[0] <= '9') || part[0] === '.')) result[`${prefix}Width`] = part;
      else if (lower in WIDTH_KW) result[`${prefix}Width`] = WIDTH_KW[lower];
      else if (['solid','dashed','dotted','double','none','hidden'].includes(lower)) result[`${prefix}Style`] = part;
      else result[`${prefix}Color`] = part;
    }
    return result;
  },

  expandBackground(value) {
    const result = {};
    if (this.isColor(value)) { result.backgroundColor = value; return result; }
    if (value.includes('linear-gradient')) {
      const gradient = this.parseLinearGradient(value);
      if (gradient) result.backgroundGradient = gradient;
      return result;
    }
    const urlMatch = value.match(/url\([^)]+\)/);
    if (urlMatch) result.backgroundImage = urlMatch[0];
    // Scan for color in the remaining string (without url(...)) so filenames like
    // "red.png" don't get picked up by the color regex.
    const valueForColor = urlMatch ? value.replace(urlMatch[0], '') : value;
    const colorMatch = valueForColor.match(/#[0-9a-fA-F]{3,8}|rgba?\([^)]+\)|[a-z]+/gi);
    if (colorMatch) {
      for (const match of colorMatch) {
        if (this.isColor(match) && match.toLowerCase() !== 'url') {
          result.backgroundColor = match;
          break;
        }
      }
    }
    return result;
  },

  // Faithful AST tokenizer of the original regex:
  //   /linear-gradient\(\s*to\s+(\w+)\s*,\s*([^,]+?)\s+(\d+(?:\.\d+)?)%\s*,\s*transparent/i
  // Same accept/reject set, same captures, same return shape, same throws on non-string input.
  parseLinearGradient(value) {
    const lower = value.toLowerCase();
    const len = value.length;
    const isWS = (c) => /\s/.test(c);
    const isDigit = (c) => c >= '0' && c <= '9';
    const isWord = (c) => (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c === '_';

    // Regex has no anchor — try every occurrence of "linear-gradient(" until one matches.
    let searchFrom = 0;
    while (true) {
      const start = lower.indexOf('linear-gradient(', searchFrom);
      if (start === -1) return null;

      let pos = start + 'linear-gradient('.length;

      // \s* to \s+ (\w+) \s* , \s*
      while (pos < len && isWS(value[pos])) pos++;
      if (lower.slice(pos, pos + 2) !== 'to') { searchFrom = start + 1; continue; }
      pos += 2;
      if (pos >= len || !isWS(value[pos])) { searchFrom = start + 1; continue; }
      while (pos < len && isWS(value[pos])) pos++;
      const dirStart = pos;
      while (pos < len && isWord(value[pos])) pos++;
      if (pos === dirStart) { searchFrom = start + 1; continue; }
      const direction = value.slice(dirStart, pos);
      while (pos < len && isWS(value[pos])) pos++;
      if (value[pos] !== ',') { searchFrom = start + 1; continue; }
      pos++;
      while (pos < len && isWS(value[pos])) pos++;

      // Non-greedy color: ([^,]+?) \s+ (\d+(?:\.\d+)?)%
      // Expand color length from 1, find shortest that lets the percent pattern match after.
      const colorStart = pos;
      let colorEnd = colorStart;
      let percentVal = null;
      let afterPct = -1;
      while (colorEnd < len) {
        colorEnd++;
        if (value[colorEnd - 1] === ',') break; // [^,] forbids comma

        let p = colorEnd;
        if (p >= len || !isWS(value[p])) continue;
        while (p < len && isWS(value[p])) p++;

        const numStart = p;
        while (p < len && isDigit(value[p])) p++;
        if (p === numStart) continue;
        if (p < len && value[p] === '.') {
          const dot = p;
          p++;
          const dec = p;
          while (p < len && isDigit(value[p])) p++;
          if (p === dec) p = dot; // ".without-digits" → don't consume dot
        }
        if (p >= len || value[p] !== '%') continue;

        percentVal = parseFloat(value.slice(numStart, p));
        afterPct = p + 1;
        break;
      }
      if (percentVal === null) { searchFrom = start + 1; continue; }

      // \s* , \s* transparent
      pos = afterPct;
      while (pos < len && isWS(value[pos])) pos++;
      if (value[pos] !== ',') { searchFrom = start + 1; continue; }
      pos++;
      while (pos < len && isWS(value[pos])) pos++;
      if (lower.slice(pos, pos + 'transparent'.length) !== 'transparent') { searchFrom = start + 1; continue; }

      return {
        direction: direction.trim(),
        color: value.slice(colorStart, colorEnd).trim(),
        percent: percentVal,
      };
    }
  },

  // Split by whitespace runs but treat quoted strings as a single token,
  // so font family names like "Times New Roman" survive intact.
  _splitWSRespectQuotes(s) {
    const parts = [];
    let buf = '', quote = null;
    for (let i = 0; i < s.length; i++) {
      const c = s[i];
      if (quote) {
        if (c === '\\' && i + 1 < s.length) { buf += c + s[i + 1]; i++; continue; }
        if (c === quote) quote = null;
        buf += c;
      } else if (c === '"' || c === "'") {
        quote = c; buf += c;
      } else if (/\s/.test(c)) {
        if (buf) { parts.push(buf); buf = ''; }
      } else {
        buf += c;
      }
    }
    if (buf) parts.push(buf);
    return parts;
  },

  expandFont(value) {
    const result = {};
    const parts = this._splitWSRespectQuotes(value);
    let familyStart = -1;
    for (let i = 0; i < parts.length; i++) {
      const part = parts[i];
      if (['bold','bolder','lighter','normal'].includes(part) || this._isThreeDigits(part)) {
        result.fontWeight = part;
      } else if (['italic','oblique'].includes(part)) {
        result.fontStyle = part;
      } else if (part.length > 0 && ((part[0] >= '0' && part[0] <= '9') || part[0] === '.')) {
        const parsed = this._parseFontSize(part);
        if (parsed) {
          result.fontSize = parsed.size;
          if (parsed.lineHeight !== null) result.lineHeight = parsed.lineHeight;
        } else {
          // Looked like a size but didn't parse — treat as start of family (e.g. "7Up").
          familyStart = i;
          break;
        }
      } else {
        // First non-keyword/non-size token begins the font family.
        familyStart = i;
        break;
      }
    }
    if (familyStart >= 0) {
      result.fontFamily = parts.slice(familyStart).join(' ');
    }
    return result;
  },

  // Mirrors /^\d{3}$/ — exactly 3 digit characters, nothing else.
  _isThreeDigits(s) {
    if (s.length !== 3) return false;
    for (let i = 0; i < 3; i++) {
      const c = s[i];
      if (c < '0' || c > '9') return false;
    }
    return true;
  },

  // Mirrors /^([\d.]+)(px|em|rem|pt|%)?(?:\/([\d.]+)(px|em|rem|pt|%)?)?$/
  // size: numeric run (digits and/or dots) + optional unit; defaults unit to 'px' if absent.
  // lineHeight: optional, after '/' — same numeric+optional-unit pattern; '' unit stays empty.
  // Returns { size, lineHeight } or null. lineHeight is null if no '/' part matched.
  _parseFontSize(s) {
    const isDigitOrDot = (c) => (c >= '0' && c <= '9') || c === '.';
    const units = ['rem', 'em', 'px', 'pt', '%']; // longest-first so 'em' doesn't shadow 'rem'
    const len = s.length;
    let p = 0;

    const numStart = p;
    while (p < len && isDigitOrDot(s[p])) p++;
    if (p === numStart) return null;
    const sizeNum = s.slice(numStart, p);

    let sizeUnit = '';
    {
      const rest = s.slice(p).toLowerCase();
      for (const u of units) {
        if (rest.startsWith(u)) { sizeUnit = u; p += u.length; break; }
      }
    }

    let lineHeight = null;
    if (p < len && s[p] === '/') {
      p++;
      const lhStart = p;
      while (p < len && isDigitOrDot(s[p])) p++;
      if (p === lhStart) return null; // '/' without digits → original regex fails to match the full pattern
      const lhNum = s.slice(lhStart, p);
      let lhUnit = '';
      const lhRest = s.slice(p).toLowerCase();
      for (const u of units) {
        if (lhRest.startsWith(u)) { lhUnit = u; p += u.length; break; }
      }
      lineHeight = lhNum + lhUnit;
    }

    if (p !== len) return null; // $ anchor — must consume whole input
    return { size: sizeNum + (sizeUnit || 'px'), lineHeight };
  },

  isColor(value) {
    if (!value) return false;
    if (/^#[0-9a-fA-F]{3,8}$/.test(value)) return true;
    // Anchor end so "rgb(...) url(...)" doesn't pass — only the function call alone counts.
    if (/^rgba?\(\s*[^)]*\)\s*$/.test(value)) return true;
    const namedColors = [
      'black','white','red','green','blue','yellow','orange','purple',
      'pink','brown','gray','grey','cyan','magenta','lime','navy',
      'teal','aqua','fuchsia','silver','maroon','olive','transparent',
    ];
    return namedColors.includes(value.toLowerCase());
  },

  // 1pt = 1.33 logical pixels — must match PT_TO_LOGICAL_PIXELS in table-handler.js
  // 1rem/1em = 16px (browser default root font size)
  // Tokenizer: <ws> <sign> <digits>[.<digits>] <unit?> <trailing ws or ';'>
  // Tolerates trailing whitespace + ';' (common in HTML attribute values).
  // Rejects junk after the unit so malformed input doesn't silently parse.
  parseDimension(value) {
    if (value == null) return null;
    if (typeof value === 'number') return isFinite(value) ? { value, unit: 'px' } : null;

    const s = String(value);
    const trimmed = s.trim();
    // CSS fill-available / stretch → treat as 100%
    if (trimmed === '-webkit-fill-available' || trimmed === 'fill-available' || trimmed === 'stretch') {
      return { value: 100, unit: '%' };
    }

    const isWS = (c) => c === ' ' || c === '\t' || c === '\n' || c === '\r' || c === '\u00a0';
    const n = s.length;
    let i = 0;
    while (i < n && isWS(s[i])) i++;

    let sign = 1;
    if (s[i] === '+') i++;
    else if (s[i] === '-') { sign = -1; i++; }

    const numStart = i;
    while (i < n && s[i] >= '0' && s[i] <= '9') i++;
    if (s[i] === '.') {
      i++;
      while (i < n && s[i] >= '0' && s[i] <= '9') i++;
    }
    if (i === numStart) return null;
    const num = sign * parseFloat(s.slice(numStart, i));
    if (!isFinite(num)) return null;

    // Longest unit first ("rem" before "em")
    const units = ['rem', 'em', 'px', 'pt', 'vh', 'vw', '%'];
    let unit = 'px';
    const rest = s.slice(i).toLowerCase();
    for (const u of units) {
      if (rest.startsWith(u)) { unit = u; i += u.length; break; }
    }

    while (i < n) {
      const c = s[i];
      if (isWS(c) || c === ';') i++;
      else return null;
    }

    if (unit === 'pt')  return { value: Math.round(num * 1.33 * 10) / 10, unit: 'px' };
    if (unit === 'rem') return { value: Math.round(num * 16   * 10) / 10, unit: 'px' };
    if (unit === 'em')  return { value: Math.round(num * 16   * 10) / 10, unit: 'px' };
    return { value: num, unit };
  },

  colorToFlutter(color) {
    if (!color) return null;
    color = color.trim();
    if (color.startsWith('#')) {
      let hex = color.slice(1);
      if (hex.length === 3) hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2];
      else if (hex.length === 4) hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2]+hex[3]+hex[3];
      // Validate: every char must be a hex digit. Invalid input falls through to fallback.
      let allHex = hex.length > 0;
      for (let i = 0; i < hex.length; i++) {
        const c = hex[i];
        if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F'))) { allHex = false; break; }
      }
      if (allHex) {
        if (hex.length === 6) return `Color(0xFF${hex.toUpperCase()})`;
        if (hex.length === 8) return `Color(0x${hex.toUpperCase()})`;
      }
    }
    const rgbaMatch = color.match(/rgba?\(\s*([\d.]+%?)\s*,\s*([\d.]+%?)\s*,\s*([\d.]+%?)\s*(?:,\s*([\d.]+%?))?\s*\)/);
    if (rgbaMatch) {
      // CSS rgb/rgba: channels accept 0-255 or 0%-100% (mapped to 0-255).
      // Alpha accepts 0-1 or 0%-100% (mapped to 0-1).
      const parseChannel = (s) => s.endsWith('%')
        ? Math.round(parseFloat(s) * 255 / 100)
        : Math.round(parseFloat(s));
      const parseAlpha = (s) => s.endsWith('%')
        ? parseFloat(s) / 100
        : parseFloat(s);
      const r = parseChannel(rgbaMatch[1]);
      const g = parseChannel(rgbaMatch[2]);
      const b = parseChannel(rgbaMatch[3]);
      const a = rgbaMatch[4] !== undefined ? parseAlpha(rgbaMatch[4]) : 1;
      return `Color.fromRGBO(${r}, ${g}, ${b}, ${a})`;
    }
    const namedColors = {
      'black':'Colors.black','white':'Colors.white','red':'Colors.red',
      'green':'Colors.green','blue':'Colors.blue','yellow':'Colors.yellow',
      'orange':'Colors.orange','purple':'Colors.purple','pink':'Colors.pink',
      'brown':'Colors.brown','gray':'Colors.grey','grey':'Colors.grey',
      'cyan':'Colors.cyan','teal':'Colors.teal','transparent':'Colors.transparent',
      'navy':'Color(0xFF000080)','lime':'Color(0xFF00FF00)','maroon':'Color(0xFF800000)',
    };
    const lowerColor = color.toLowerCase();
    if (namedColors[lowerColor]) return namedColors[lowerColor];
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
    const hasUnderline   = value.includes('underline');
    const hasLineThrough = value.includes('line-through');
    if (hasUnderline && hasLineThrough)
      return 'TextDecoration.combine([TextDecoration.underline, TextDecoration.lineThrough])';
    if (hasLineThrough) return 'TextDecoration.lineThrough';
    if (hasUnderline)   return 'TextDecoration.underline';
    if (value.includes('none')) return 'TextDecoration.none';
    return null;
  },

  textDecorationStyleToFlutter(value) {
    if (!value) return null;
    if (value.includes('double')) return 'TextDecorationStyle.double';
    if (value.includes('dashed')) return 'TextDecorationStyle.dashed';
    if (value.includes('dotted')) return 'TextDecorationStyle.dotted';
    if (value.includes('wavy'))   return 'TextDecorationStyle.wavy';
    return null;
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
