const DartGenerator = {
  generate(ast, _options = {}) {
    const context = {
      indent: '                ',
      controllers: new Map(),
      dropdowns: new Map(),
      checkboxes: new Map(),
      dateFields: new Map(),
      timeFields: new Map(),
      searchFields: new Map(),
      signatureFields: new Map(),
      customWidgets: new Set(),
      usesGesture: false,
      usesTable: false,
      usesDiagonalBorder: false,
      usesDashedBorder: false,
      usesComment: false,
      usesFormWidgets: false,
      bodyStyles: null,
    };

    if (ast.bodyStyles) context.bodyStyles = ast.bodyStyles;

    // Split document at top-level <pagebreak> tags into separate page ASTs.
    const pageAsts = this._splitPages(ast);
    const widgetCodes = pageAsts.map(pageAst => {
      const code = this.generateNode(pageAst, context);
      return 'child: ' + code.trimStart();
    });
    const widgetCode = widgetCodes[0];

    const controllersCode  = this.generateControllers(context);
    const importsCode      = this.generateImports(context);
    const stateCode        = this.generateStateVariables(context);
    const boilerplateCode  = this.generateBoilerplate(context, widgetCodes.join('\n'));

    return {
      widgetCode,
      widgetCodes,
      controllersCode,
      importsCode,
      stateCode,
      boilerplateCode,
      controllers:  context.controllers,
      dropdowns:    context.dropdowns,
      checkboxes:   context.checkboxes,
      usesTable:    context.usesTable,
    };
  },

  // Split ast.children at <pagebreak> elements into separate pseudo-document objects.
  // Because browsers treat <pagebreak> as an unknown inline element, multiple <pagebreak>
  // tags get nested inside each other. We walk recursively so N pagebreaks → N+1 pages.
  _splitPages(ast) {
    const segments = [];
    let current = [];

    const walk = (children) => {
      for (const child of children) {
        if (child.type === 'element' && child.tagName === 'pagebreak') {
          segments.push(current);
          current = [];
          walk(child.children || []); // recurse: next pagebreak may be nested inside
        } else {
          current.push(child);
        }
      }
    };

    walk(ast.children);
    segments.push(current);

    return segments
      .filter(s => s.some(c => c.type !== 'text' || c.content?.trim()))
      .map(children => ({ ...ast, children }));
  },

  generateNode(node, context) {
    if (!node) return 'const SizedBox.shrink()';
    switch (node.type) {
      case 'document':    return this.generateDocument(node, context);
      case 'text':        return this.generateText(node, context);
      case 'table':       return this.generateTable(node, context);
      case 'svg':         return '';
      case 'tr': case 'td': case 'th':
      case 'thead': case 'tbody': case 'tfoot':
      case 'colgroup': case 'col': case 'caption':
        return '';
      case 'input':       return this.generateInput(node, context);
      case 'select':      return this.generateSelect(node, context);
      case 'textarea':    return this.generateTextArea(node, context);
      case 'date-picker': return this.generateDatePicker(node, context);
      case 'time-picker': return this.generateTimePicker(node, context);
      case 'signature':   return this.generateSignature(node, context);
      case 'image-upload':return this.generateImageUpload(node, context);
      case 'checkbox':    return this.generateCheckbox(node, context);
      case 'radio':       return this.generateRadio(node, context);
      case 'file':        return this.generateFile(node, context);
      case 'search':      return this.generateSearch(node, context);
      case 'option':      return '';
      case 'element':     return this.generateElement(node, context);
      default:            return this.generateChildren(node, context);
    }
  },

  generateDocument(node, context) {
    const children = node.children
      .map(c => this.generateNode(c, context))
      .filter(c => c && c.trim());
    if (children.length === 0) return 'const SizedBox.shrink()';
    if (children.length === 1) return children[0];
    const ind = context.indent;
    return `Column(
${ind}crossAxisAlignment: CrossAxisAlignment.start,
${ind}children: [
${children.map(c => `${ind}  ${c},`).join('\n')}
${ind}],
)`;
  },

  generateChildren(node, context) {
    if (!node.children || node.children.length === 0) return 'const SizedBox.shrink()';

    const visibleChildren = this._visibleChildren(node);

    const children = visibleChildren
      .map(c => this.generateNode(c, context))
      .filter(c => c && c.trim());

    if (children.length === 0) return 'const SizedBox.shrink()';
    if (children.length === 1) return children[0];

    const ind = context.indent;
    return `Column(
${ind}crossAxisAlignment: CrossAxisAlignment.start,
${ind}mainAxisSize: MainAxisSize.min,
${ind}children: [
${children.map(c => `${ind}  ${c},`).join('\n')}
${ind}],
)`;
  },

  generateText(node, _context) {
    const text = node.content.trim();
    if (!text) return '';
    return `Text('${this.escapeString(text)}')`;
  },

  _visibleChildren(node) {
    return (node.children || []).filter(c =>
      c.type !== 'svg' && c.styles?.position !== 'absolute'
    );
  },

  hasMixedInlineContent(node) {
    if (!node.children) return false;
    const visible = this._visibleChildren(node);
    const hasText  = visible.some(c => c.type === 'text' && c.content.trim());
    const hasSpan  = visible.some(c =>
      ['span','a','b','strong','i','em','u','s','strike','del','mark','sub','sup'].includes(c.tagName)
    );
    return hasText || hasSpan;
  },

  generateInlineContent(node, context, opts = {}) {
    const baseStyleProps = opts.baseStyleProps || null;
    const textAlign      = opts.textAlign      || null;
    const visible = this._visibleChildren(node);

    const spans = [];
    for (const child of visible) {
      if (child.type === 'text') {
        const t = child.content;
        if (t) spans.push(`TextSpan(text: '${this.escapeString(t)}')`);
        continue;
      }
      if (child.tagName === 'a') {
        const text = this.extractAllText(child);
        if (!text) continue;
        const href = child.attributes?.href || '#';
        context.usesGesture = true;
        spans.push(`TextSpan(text: '${this.escapeString(text)}', style: const TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = () { /* ${this.escapeString(href)} */ })`);
        continue;
      }
      const inlineTags = ['span','b','strong','i','em','u','s','strike','del','mark','code','sub','sup'];
      if (inlineTags.includes(child.tagName)) {
        if (this.hasMixedInlineContent(child)) {
          const nestedSpans = this.collectTextSpans(child, context);
          spans.push(...nestedSpans);
        } else {
          const text = this.extractAllText(child);
          if (!text) continue;
          const sp = this.buildTextSpanStyle(child.styles || {}, child.tagName);
          if (sp) {
            spans.push(`TextSpan(text: '${this.escapeString(text)}', style: TextStyle(${sp}))`);
          } else {
            spans.push(`TextSpan(text: '${this.escapeString(text)}')`);
          }
        }
        continue;
      }
      const text = this.extractAllText(child);
      if (text.trim()) spans.push(`TextSpan(text: '${this.escapeString(text)}')`);
    }

    if (spans.length === 0) return null;

    // Single styleless span — collapse to plain Text() but still attach base style + alignment
    // when the caller supplied them (e.g. paragraph color, heading defaults).
    if (spans.length === 1 && !spans[0].includes('style:') && !spans[0].includes('recognizer:')) {
      const m = spans[0].match(/TextSpan\(text: '(.*)'\)$/s);
      if (m) {
        const args = [`'${m[1]}'`];
        if (textAlign) args.push(`textAlign: ${textAlign}`);
        if (baseStyleProps) args.push(`style: TextStyle(${baseStyleProps})`);
        return `Text(${args.join(', ')})`;
      }
    }

    // Multiple/styled spans — emit RichText. Base style goes on the outer TextSpan
    // so all children inherit it; child-level styles override per Flutter's normal
    // TextSpan inheritance.
    const tsArgs = [];
    if (baseStyleProps) tsArgs.push(`style: TextStyle(${baseStyleProps})`);
    tsArgs.push(`children: [${spans.join(', ')}]`);
    const outerArgs = [];
    if (textAlign) outerArgs.push(`textAlign: ${textAlign}`);
    outerArgs.push(`text: TextSpan(${tsArgs.join(', ')})`);
    return `RichText(${outerArgs.join(', ')})`;
  },

  collectTextSpans(node, _context) {
    // Compute parent's tag-level styling (e.g. <i> → fontStyle: FontStyle.italic).
    // Text-node children inherit this; inline-tag children merge their own style
    // on top of the parent's. Without this inheritance, <p>x<i>italic</i>y</p>
    // would emit a styleless TextSpan for "italic" and lose the italic.
    const parentSp = this.buildTextSpanStyle(node.styles || {}, node.tagName);
    const spans = [];
    for (const child of this._visibleChildren(node)) {
      if (child.type === 'text') {
        const t = child.content;
        if (!t) continue;
        if (parentSp) {
          spans.push(`TextSpan(text: '${this.escapeString(t)}', style: TextStyle(${parentSp}))`);
        } else {
          spans.push(`TextSpan(text: '${this.escapeString(t)}')`);
        }
      } else {
        const text = this.extractAllText(child);
        if (!text) continue;
        const childSp = this.buildTextSpanStyle(child.styles || {}, child.tagName);
        // Merge parent + child by concatenating prop lists. Child props come
        // last so a child override (e.g. inner <span color:red>) takes effect
        // over the parent's color, matching the inline CSS specificity model.
        const merged = [parentSp, childSp].filter(Boolean).join(', ');
        if (merged) {
          spans.push(`TextSpan(text: '${this.escapeString(text)}', style: TextStyle(${merged}))`);
        } else {
          spans.push(`TextSpan(text: '${this.escapeString(text)}')`);
        }
      }
    }
    return spans;
  },

  buildTextSpanStyle(styles, tagName = 'span') {
    const props = [];

    if (tagName === 'b' || tagName === 'strong') props.push('fontWeight: FontWeight.bold');
    if (tagName === 'i' || tagName === 'em')     props.push('fontStyle: FontStyle.italic');
    if (tagName === 'u')                          props.push('decoration: TextDecoration.underline');
    if (tagName === 's' || tagName === 'strike' || tagName === 'del')
                                                  props.push('decoration: TextDecoration.lineThrough');
    if (tagName === 'mark')                       props.push('backgroundColor: Color(0xFFFFFF00)');
    if (tagName === 'code' || tagName === 'pre')  props.push("fontFamily: 'monospace'");
    if (tagName === 'sub')                        props.push('fontSize: 10, fontFeatures: [FontFeature.subscripts()]');
    if (tagName === 'sup')                        props.push('fontSize: 10, fontFeatures: [FontFeature.superscripts()]');

    if (styles.fontWeight) {
      const fw = StyleParser.fontWeightToFlutter(styles.fontWeight);
      if (fw) props.push(`fontWeight: ${fw}`);
    }
    if (styles.fontStyle === 'italic') props.push('fontStyle: FontStyle.italic');
    if (styles.color) {
      const c = StyleParser.colorToFlutter(styles.color);
      if (c) props.push(`color: ${c}`);
    }
    if (styles.fontSize) {
      const dim = StyleParser.parseDimension(styles.fontSize);
      if (dim) props.push(`fontSize: ${dim.value}`);
    }
    if (styles.fontFamily) {
      const ff = StyleParser.firstFontFamily(styles.fontFamily);
      if (ff) props.push(`fontFamily: '${ff}'`);
    }
    if (styles.textDecoration) {
      const td  = StyleParser.textDecorationToFlutter(styles.textDecoration);
      const tds = StyleParser.textDecorationStyleToFlutter(styles.textDecoration);
      if (td)  props.push(`decoration: ${td}`);
      if (tds) props.push(`decorationStyle: ${tds}`);
    }
    if (styles.backgroundColor) {
      const bg = StyleParser.colorToFlutter(styles.backgroundColor);
      if (bg) props.push(`backgroundColor: ${bg}`);
    }

    return props.length > 0 ? props.join(', ') : null;
  },

  generateElement(node, context) {
    const tag = node.tagName;
    switch (tag) {
      case 'div':
      case 'section':
      case 'article':
      case 'main':
      case 'aside':
      case 'header':
      case 'footer':
      case 'nav':          return this.generateDiv(node, context);
      case 'p':            return this.generateParagraph(node, context);
      case 'span':         return this.generateSpan(node, context);
      case 'br':           return 'const SizedBox(height: 8)';
      case 'hr':           return 'const Divider()';
      case 'h1': case 'h2': case 'h3':
      case 'h4': case 'h5': case 'h6': return this.generateHeading(node, context);
      case 'b':
      case 'strong':       return this.generateBold(node, context);
      case 'i':
      case 'em':           return this.generateItalic(node, context);
      case 'u':            return this.generateUnderline(node, context);
      case 's':
      case 'strike':
      case 'del':          return this.generateStrikethrough(node, context);
      case 'mark':         return this.generateMark(node, context);
      case 'a':            return this.generateLink(node, context);
      case 'img':          return this.generateImage(node, context);
      case 'ul':
      case 'ol':           return this.generateList(node, context);
      case 'li':           return this.generateListItem(node, context);
      case 'label':        return this.generateLabel(node, context);
      case 'code':
      case 'pre':          return this.generateCode(node, context);
      case 'blockquote':   return this.generateBlockquote(node, context);
      case 'table':        return this.generateTable(node, context);
      case 'svg':          return '';
      case 'script': case 'style': case 'head':
      case 'meta': case 'link': case 'title':
        return '';
      default:             return this.generateChildren(node, context);
    }
  },

  _hasAbsoluteChildren(node) {
    return (node.children || []).some(c => c.styles?.position === 'absolute');
  },

  // Generate a positioned child code for Stack. Phase 1: px only for offsets + width/height.
  // Over-constrained (left+right+width): drop right. (top+bottom+height): drop bottom.
  generatePositioned(childNode, context) {
    const styles = childNode.styles || {};
    const childCode = this.generateNode(childNode, context);
    if (!childCode) return null;

    const ind = context.indent;
    const dim = (v) => {
      if (!v) return null;
      const d = StyleParser.parseDimension(v);
      if (!d || d.unit === '%') return null;
      return d.value;
    };

    let left   = dim(styles.left);
    let top    = dim(styles.top);
    let right  = dim(styles.right);
    let bottom = dim(styles.bottom);
    const width  = dim(styles.width);
    const height = dim(styles.height);

    if (left != null && right != null && width != null) right = null;
    if (top != null && bottom != null && height != null) bottom = null;

    const stretched = left === 0 && right === 0 && top === 0 && bottom === 0
      && width == null && height == null;
    if (stretched) {
      return `Positioned.fill(\n${ind}child: ${childCode},\n)`;
    }

    const parts = [];
    if (left   != null) parts.push(`left: ${left}`);
    if (top    != null) parts.push(`top: ${top}`);
    if (right  != null) parts.push(`right: ${right}`);
    if (bottom != null) parts.push(`bottom: ${bottom}`);
    if (width  != null) parts.push(`width: ${width}`);
    if (height != null) parts.push(`height: ${height}`);
    parts.push(`child: ${childCode}`);
    return `Positioned(\n${parts.map(p => `${ind}${p}`).join(',\n')},\n)`;
  },

  // Generate a Stack for position:relative container with absolute children.
  generateStack(node, context) {
    const ind = context.indent;
    const childrenCode = [];
    for (const child of (node.children || [])) {
      if (child.type === 'svg') continue;
      if (child.styles?.position === 'absolute') {
        const pos = this.generatePositioned(child, context);
        if (pos) childrenCode.push(pos);
      } else {
        const c = this.generateNode(child, context);
        if (c) childrenCode.push(c);
      }
    }
    if (childrenCode.length === 0) return '';
    const kids = childrenCode.map(c => `${ind}${c}`).join(',\n');
    return `Stack(\n${ind}children: [\n${kids},\n${ind}],\n)`;
  },

  generateDiv(node, context) {
    const ind    = context.indent;
    const styles = node.styles || {};
    const isStackParent = styles.position === 'relative' && this._hasAbsoluteChildren(node);

    const decorationProps = [];
    const containerProps  = [];

    if (styles.backgroundColor) {
      const c = StyleParser.colorToFlutter(styles.backgroundColor);
      decorationProps.push(`color: ${c}`);
    }

    const border = StyleParser.cellBorderToFlutter(styles);
    if (border) decorationProps.push(`border: ${border}`);

    if (!border && styles.borderWidth && styles.borderColor) {
      const w = StyleParser.parseDimension(styles.borderWidth)?.value || 1;
      const c = StyleParser.colorToFlutter(styles.borderColor);
      decorationProps.push(`border: Border.all(color: ${c}, width: ${w})`);
    }

    if (styles.borderRadius) {
      const r = StyleParser.parseDimension(styles.borderRadius)?.value || 4;
      decorationProps.push(`borderRadius: BorderRadius.circular(${r})`);
    }

    const paddingSides = this._boxSides(styles, 'padding');
    const marginSides  = this._boxSides(styles, 'margin');
    const paddingCode  = this._sidesToEdgeInsetsCode(paddingSides);
    const marginCode   = this._sidesToEdgeInsetsCode(marginSides);
    const hasResponsiveBox = this._sideHasResponsive(paddingSides) || this._sideHasResponsive(marginSides);
    const marginHAlign = this._sideHAlign(marginSides);

    if (paddingCode) containerProps.push(`padding: ${paddingCode}`);
    if (marginCode)  containerProps.push(`margin: ${marginCode}`);

    let fixedWidth = null;
    if (styles.width) {
      const dim = StyleParser.parseDimension(styles.width);
      if (dim && dim.unit !== '%') { containerProps.push(`width: ${dim.value}`); fixedWidth = dim.value; }
      else if (!dim || dim.unit === '%') containerProps.push('width: double.infinity');
    } else {
      containerProps.push('width: double.infinity');
    }
    if (styles.height) {
      const dim = StyleParser.parseDimension(styles.height);
      if (dim && dim.unit !== '%') containerProps.push(`height: ${dim.value}`);
    }

    if (decorationProps.length > 0) {
      containerProps.push(`decoration: BoxDecoration(${decorationProps.join(', ')})`);
    }

    const prevContainerWidth = context.containerWidth;
    if (fixedWidth != null) context.containerWidth = fixedWidth;

    const childCode = isStackParent
      ? this.generateStack(node, context)
      : this.hasMixedInlineContent(node)
          ? (this.generateInlineContent(node, context) || this.generateChildren(node, context))
          : this.generateChildren(node, context);

    context.containerWidth = prevContainerWidth;

    let code = `Container(
${containerProps.map(p => `${ind}${p},`).join('\n')}
${ind}child: ${childCode},
)`;

    // margin: auto centering — Align replaces UnconstrainedBox (both unbound the child).
    if (marginHAlign) {
      const alignExpr = marginHAlign === 'center' ? 'Alignment.topCenter'
                      : marginHAlign === 'right'  ? 'Alignment.topRight'
                      :                             'Alignment.topLeft';
      code = `Align(\n${ind}alignment: ${alignExpr},\n${ind}child: ${code},\n)`;
    } else if (fixedWidth != null) {
      code = `UnconstrainedBox(\n${ind}alignment: Alignment.topLeft,\n${ind}child: ${code},\n)`;
    }

    // Responsive padding/margin (%, vh, vw) needs parent-size context at runtime.
    if (hasResponsiveBox) {
      code = `LayoutBuilder(
${ind}builder: (context, constraints) {
${ind}  final parentW = constraints.maxWidth.isFinite ? constraints.maxWidth : MediaQuery.of(context).size.width;
${ind}  final vpW = MediaQuery.of(context).size.width;
${ind}  final vpH = MediaQuery.of(context).size.height;
${ind}  return ${code};
${ind}},
)`;
    }

    if (styles.rotateAngle != null && styles.rotateAngle !== 0) {
      const radians = (styles.rotateAngle * Math.PI / 180).toFixed(4);
      code = `Transform.rotate(angle: ${radians}, child: ${code})`;
    }

    return code;
  },

  generateParagraph(node, context) {
    const ind       = context.indent;
    const styles    = node.styles || {};
    const alignCode = StyleParser.textAlignToFlutter(styles.textAlign);
    const sp        = this.buildTextSpanStyle(styles, 'span');

    // Mixed inline content (text + <i>, <b>, <span>, etc.) needs RichText to keep
    // per-span styling. Plain extractAllText would flatten the children and drop
    // any italic/bold/decoration on inner inline tags. The paragraph's own style
    // (sp) becomes the outer TextSpan's base so children inherit it.
    if (this.hasMixedInlineContent(node)) {
      const inner = this.generateInlineContent(node, context, { baseStyleProps: sp, textAlign: alignCode });
      if (inner) {
        const margin = this.generateEdgeInsets(styles, 'margin');
        return margin ? `Container(\n${ind}margin: ${margin},\n${ind}child: ${inner},\n)` : inner;
      }
    }

    const text      = this.escapeString(this.extractAllText(node));
    const textArgs = [`'${text}'`];
    if (alignCode) textArgs.push(`textAlign: ${alignCode}`);
    if (sp) textArgs.push(`style: TextStyle(${sp})`);

    let inner = `Text(${textArgs.join(', ')})`;

    const margin = this.generateEdgeInsets(styles, 'margin');
    if (margin) return `Container(\n${ind}margin: ${margin},\n${ind}child: ${inner},\n)`;
    return inner;
  },

  generateSpan(node, context) {
    const styles = node.styles || {};

    if (this.hasMixedInlineContent(node)) {
      return this.generateInlineContent(node, context) || this.generateChildren(node, context);
    }

    const text = this.extractAllText(node);
    if (!text) return '';

    const sp = this.buildTextSpanStyle(styles, 'span');

    let widget;
    if (sp) {
      widget = `Text('${this.escapeString(text)}', style: TextStyle(${sp}))`;
    } else {
      widget = `Text('${this.escapeString(text)}')`;
    }

    if (styles.rotateAngle != null && styles.rotateAngle !== 0) {
      const radians = (styles.rotateAngle * Math.PI / 180).toFixed(4);
      widget = `Transform.rotate(angle: ${radians}, child: ${widget})`;
    }

    return widget;
  },

  generateHeading(node, context) {
    const ind    = context.indent;
    const tag    = node.tagName;
    const styles = node.styles || {};
    const defaults = { h1:28, h2:22, h3:18, h4:16, h5:14, h6:12 };
    const size = (styles.fontSize && StyleParser.parseDimension(styles.fontSize)?.value) || defaults[tag] || 16;

    // Merge heading defaults (size + bold) with any inline styles
    const headingStyles = { ...styles, fontSize: `${size}px`, fontWeight: styles.fontWeight || 'bold' };
    const sp = this.buildTextSpanStyle(headingStyles, 'span');
    const alignCode = StyleParser.textAlignToFlutter(styles.textAlign);

    // Mixed inline content needs RichText with heading defaults on the outer TextSpan;
    // inner spans (e.g. <i>, <span style="color:red">) inherit + override per Flutter
    // TextSpan rules. Without this, extractAllText flattens children and drops their styles.
    if (this.hasMixedInlineContent(node)) {
      const inner = this.generateInlineContent(node, context, { baseStyleProps: sp, textAlign: alignCode });
      if (inner) {
        const margin = this.generateEdgeInsets(styles, 'margin');
        return margin ? `Container(\n${ind}margin: ${margin},\n${ind}child: ${inner},\n)` : inner;
      }
    }

    const text      = this.escapeString(this.extractAllText(node));
    const textArgs  = [`'${text}'`];
    if (alignCode) textArgs.push(`textAlign: ${alignCode}`);
    textArgs.push(`style: TextStyle(${sp})`);

    let inner = `Text(${textArgs.join(', ')})`;

    const margin = this.generateEdgeInsets(styles, 'margin');
    if (margin) return `Container(\n${ind}margin: ${margin},\n${ind}child: ${inner},\n)`;
    return inner;
  },

  _generateStyledText(node, styleProp) {
    const text = this.extractAllText(node);
    return `Text('${this.escapeString(text)}', style: const TextStyle(${styleProp}))`;
  },

  generateBold(node, _context)          { return this._generateStyledText(node, 'fontWeight: FontWeight.bold'); },
  generateItalic(node, _context)        { return this._generateStyledText(node, 'fontStyle: FontStyle.italic'); },
  generateUnderline(node, _context)     { return this._generateStyledText(node, 'decoration: TextDecoration.underline'); },
  generateStrikethrough(node, _context) { return this._generateStyledText(node, 'decoration: TextDecoration.lineThrough'); },

  generateMark(node, _context) {
    const text = this.extractAllText(node);
    return `Container(color: const Color(0xFFFFFF00), child: Text('${this.escapeString(text)}'))`;
  },

  generateLink(node, context) {
    const text = this.extractAllText(node);
    const href = node.attributes?.href || '#';
    context.usesGesture = true;
    return `InkWell(
  onTap: () { /* ${this.escapeString(href)} */ },
  child: Text('${this.escapeString(text)}', style: const TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline)),
)`;
  },

  generateImage(node, context) {
    const src    = node.attributes?.src || '';
    const alt    = node.attributes?.alt || '';
    const width  = node.attributes?.width  || node.styles?.width;
    const height = node.attributes?.height || node.styles?.height;

    const wDim = width  ? StyleParser.parseDimension(width)  : null;
    const hDim = height ? StyleParser.parseDimension(height) : null;
    const fallbackW = wDim?.value || 100;
    const fallbackH = hDim?.value || 100;

    const props = [];
    if (wDim) props.push(`width: ${wDim.value}`);
    if (hDim) props.push(`height: ${hDim.value}`);
    props.push(`fit: ${this._objectFitToBoxFit(node.styles?.objectFit)}`);

    // errorBuilder — show alt text or broken_image icon on load failure
    const altEscaped = this.escapeString(alt);
    const fallbackChild = alt
      ? `Text('${altEscaped}', style: const TextStyle(fontSize: 11, color: Color(0xFF9E9E9E)), textAlign: TextAlign.center)`
      : `const Icon(Icons.broken_image, size: 32, color: Color(0xFF9E9E9E))`;
    const errFallback = `Container(width: ${fallbackW}, height: ${fallbackH}, color: const Color(0xFFEEEEEE), alignment: Alignment.center, child: ${fallbackChild})`;
    props.push(`errorBuilder: (ctx, err, stack) => ${errFallback}`);

    if (src.startsWith('http')) {
      return `Image.network('${this.escapeString(src)}', ${props.join(', ')})`;
    }
    if (src.startsWith('assets/')) {
      return `Image.asset('${this.escapeString(src)}', ${props.join(', ')})`;
    }
    if (src.startsWith('data:')) {
      const comma = src.indexOf(',');
      const b64 = comma >= 0 ? src.slice(comma + 1) : '';
      context.usesBase64 = true;
      return `Image.memory(base64Decode('${b64}'), ${props.join(', ')})`;
    }
    // Unknown src — inline fallback (no network/asset/data prefix)
    return errFallback;
  },

  // CSS object-fit → Flutter BoxFit
  _objectFitToBoxFit(v) {
    if (!v) return 'BoxFit.contain';
    switch (String(v).toLowerCase().trim()) {
      case 'cover':      return 'BoxFit.cover';
      case 'fill':       return 'BoxFit.fill';
      case 'none':       return 'BoxFit.none';
      case 'scale-down': return 'BoxFit.scaleDown';
      case 'contain':
      default:           return 'BoxFit.contain';
    }
  },

  generateList(node, context) {
    const ind       = context.indent;
    const isOrdered = node.tagName === 'ol';
    const items = node.children
      .filter(c => c.tagName === 'li' || (c.type === 'element' && c.tagName === 'li'))
      .map((c, i) => {
        const text   = this.extractAllText(c);
        const prefix = isOrdered ? `${i + 1}. ` : '• ';
        return `Text('${prefix}${this.escapeString(text)}')`;
      });
    return `Column(
${ind}crossAxisAlignment: CrossAxisAlignment.start,
${ind}children: [
${items.map(item => `${ind}  ${item},`).join('\n')}
${ind}],
)`;
  },

  generateListItem(node, _context) {
    const text = this.extractAllText(node);
    return `Text('• ${this.escapeString(text)}')`;
  },

  generateLabel(node, _context) {
    const text = this.extractAllText(node);
    return `Text('${this.escapeString(text)}')`;
  },

  generateCode(node, context) {
    const text = this.extractAllText(node);
    const ind  = context.indent;
    return `Container(
${ind}padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
${ind}color: const Color(0xFFF5F5F5),
${ind}child: Text('${this.escapeString(text)}', style: const TextStyle(fontFamily: 'monospace', fontSize: 13)),
)`;
  },

  generateBlockquote(node, context) {
    const ind   = context.indent;
    const child = this.generateChildren(node, context);
    return `Container(
${ind}margin: const EdgeInsets.symmetric(vertical: 4),
${ind}padding: const EdgeInsets.only(left: 12),
${ind}decoration: const BoxDecoration(border: Border(left: BorderSide(color: Color(0xFFBDBDBD), width: 4))),
${ind}child: ${child},
)`;
  },

  generateTable(node, context) {
    context.usesTable = true;
    return TableHandler.generate(node, context, context.bodyStyles || null);
  },

  generateInput(node, context) {
    const ind         = context.indent;
    const name        = node.name || `input_${context.controllers.size}`;
    const type        = node.inputType || 'text';
    const placeholder = node.placeholder;
    const required    = node.required;
    const readonly    = node.readonly;

    context.controllers.set(name, { type: 'text', name });

    const ctrl = this.toControllerName(name);

    const kbMap = { number:'TextInputType.number', email:'TextInputType.emailAddress', tel:'TextInputType.phone', url:'TextInputType.url' };
    const keyboardType = kbMap[type] || 'TextInputType.text';

    const decorationProps = [
      'border: const OutlineInputBorder()',
      'isDense: true',
      'contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)',
    ];
    if (placeholder) decorationProps.push(`hintText: '${this.escapeString(placeholder)}'`);
    if (required)    decorationProps.push('filled: true', 'fillColor: Colors.yellow.shade100');

    const tf = `TextField(
${ind}  controller: ${ctrl},
${ind}  keyboardType: ${keyboardType},
${ind}  readOnly: ${readonly},
${ind}  decoration: InputDecoration(
${ind}    ${decorationProps.join(`,\n${ind}    `)},
${ind}  ),
${ind})`;

    if (node.styles?.width) {
      const dim = StyleParser.parseDimension(node.styles.width);
      if (dim && dim.unit !== '%') {
        return `SizedBox(\n${ind}width: ${dim.value},\n${ind}child: ${tf},\n)`;
      }
    }
    return tf;
  },

  generateSelect(node, context) {
    const ind  = context.indent;
    const name = node.name || `select_${context.dropdowns.size}`;

    const options = node.children
      .filter(c => c.type === 'option')
      .map(opt => ({ value: opt.value, label: opt.label || opt.value }));
    context.dropdowns.set(name, { name, options });

    const varName     = this.toVariableName(name);
    const optionItems = options.map(opt =>
      `DropdownMenuItem(value: '${opt.value}', child: Text('${this.escapeString(opt.label)}'))`
    );

    return `DropdownButton<String>(
${ind}value: ${varName},
${ind}hint: const Text('เลือก...'),
${ind}items: const [
${optionItems.map(i => `${ind}  ${i},`).join('\n')}
${ind}],
${ind}onChanged: (value) {
${ind}  setState(() { ${varName} = value; });
${ind}},
)`;
  },

  generateTextArea(node, context) {
    const ind         = context.indent;
    const name        = node.name || `textarea_${context.controllers.size}`;
    const placeholder = node.placeholder;
    const rows        = node.rows || 3;

    context.controllers.set(name, { type: 'textarea', name });

    const ctrl = this.toControllerName(name);

    // max-width takes precedence over CSS width; falls back to CSS width, then double.infinity
    let width = 'double.infinity';
    if (node.maxWidth != null && isFinite(node.maxWidth)) {
      width = parseFloat(node.maxWidth);
    } else if (node.styles?.width) {
      const dim = StyleParser.parseDimension(node.styles.width);
      if (dim && dim.unit !== '%') width = dim.value;
    }

    // max-height: fixed SizedBox height + expands:true; else fall back to rows-capped maxLines
    const useExpand = node.maxHeight != null && isFinite(node.maxHeight);
    const heightLine = useExpand ? `${ind}height: ${parseFloat(node.maxHeight)},\n` : '';
    const tfBody = useExpand
      ? `TextField(
${ind}  controller: ${ctrl},
${ind}  maxLines: null, minLines: null, expands: true,
${ind}  textAlignVertical: TextAlignVertical.top,
${ind}  decoration: InputDecoration(
${ind}    border: const OutlineInputBorder(),
${ind}    isDense: true,
${ind}    contentPadding: const EdgeInsets.all(10),
${placeholder ? `${ind}    hintText: '${this.escapeString(placeholder)}',` : ''}
${ind}  ),
${ind})`
      : `TextField(
${ind}  controller: ${ctrl},
${ind}  maxLines: ${rows},
${ind}  decoration: InputDecoration(
${ind}    border: const OutlineInputBorder(),
${ind}    isDense: true,
${ind}    contentPadding: const EdgeInsets.all(10),
${placeholder ? `${ind}    hintText: '${this.escapeString(placeholder)}',` : ''}
${ind}  ),
${ind})`;

    return `SizedBox(
${ind}width: ${width},
${heightLine}${ind}child: ${tfBody},
)`;
  },

  generateDatePicker(node, context) {
    const ind         = context.indent;
    const name        = node.name || `date_${context.controllers.size}`;
    const placeholder = node.placeholder || 'เลือกวันที่...';

    context.controllers.set(name, { type: 'date', name });

    const ctrl = this.toControllerName(name);

    return `SizedBox(
${ind}width: 200,
${ind}child: TextField(
${ind}  controller: ${ctrl},
${ind}  readOnly: true,
${ind}  decoration: InputDecoration(
${ind}    border: const OutlineInputBorder(),
${ind}    isDense: true,
${ind}    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
${ind}    hintText: '${this.escapeString(placeholder)}',
${ind}    suffixIcon: const Icon(Icons.calendar_today, size: 18),
${ind}  ),
${ind}  onTap: () async {
${ind}    final picked = await showDatePicker(
${ind}      context: context,
${ind}      initialDate: DateTime.now(),
${ind}      firstDate: DateTime(1950),
${ind}      lastDate: DateTime(2100),
${ind}    );
${ind}    if (picked != null) {
${ind}      ${ctrl}.text = '\${picked.day.toString().padLeft(2, '0')}-\${picked.month.toString().padLeft(2, '0')}-\${picked.year}';
${ind}    }
${ind}  },
${ind}),
)`;
  },

  generateTimePicker(node, context) {
    const ind         = context.indent;
    const name        = node.name || `time_${context.controllers.size}`;
    const placeholder = node.placeholder || 'เลือกเวลา...';

    context.controllers.set(name, { type: 'time', name });

    const ctrl = this.toControllerName(name);

    return `SizedBox(
${ind}width: 160,
${ind}child: TextField(
${ind}  controller: ${ctrl},
${ind}  readOnly: true,
${ind}  decoration: InputDecoration(
${ind}    border: const OutlineInputBorder(),
${ind}    isDense: true,
${ind}    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
${ind}    hintText: '${this.escapeString(placeholder)}',
${ind}    suffixIcon: const Icon(Icons.access_time, size: 18),
${ind}  ),
${ind}  onTap: () async {
${ind}    final picked = await showTimePicker(
${ind}      context: context,
${ind}      initialTime: TimeOfDay.now(),
${ind}    );
${ind}    if (picked != null) {
${ind}      ${ctrl}.text = '\${picked.hour.toString().padLeft(2, '0')}:\${picked.minute.toString().padLeft(2, '0')}';
${ind}    }
${ind}  },
${ind}),
)`;
  },

  generateSignature(node, _context) {
    _context.usesFormWidgets = true;
    const name = node.name || 'signature';
    const props = [`name: '${name}'`];
    if (node.label) props.push(`label: '${this.escapeString(node.label)}'`);
    if (node.width) props.push(`width: ${parseFloat(node.width) || 200}`);
    if (node.height) props.push(`height: ${parseFloat(node.height) || 100}`);
    if (node.value) props.push(`value: '${this.escapeString(node.value)}'`);
    return `FormSignature(${props.join(', ')})`;
  },

  generateImageUpload(node, _context) {
    _context.usesFormWidgets = true;
    const name = node.name || 'image';
    const props = [`name: '${name}'`];
    if (node.source && node.source !== 'both') props.push(`source: '${node.source}'`);
    if (node.width) props.push(`width: ${parseFloat(node.width) || 150}`);
    if (node.height) props.push(`height: ${parseFloat(node.height) || 150}`);
    if (node.required) props.push('required: true');
    return `FormImageUpload(${props.join(', ')})`;
  },

  generateCheckbox(node, context) {
    context.usesFormWidgets = true;
    const name = node.name || `checkbox_${context.checkboxes.size}`;
    context.checkboxes.set(name, { name });
    const props = [`name: '${name}'`];
    if (node.label) props.push(`label: '${this.escapeString(node.label)}'`);
    if (node.options && node.options.length) props.push(`options: [${node.options.map(o => `'${this.escapeString(o)}'`).join(', ')}]`);
    if (node.hasOther) props.push('hasOther: true');
    if (node.value) props.push(`value: '${this.escapeString(String(node.value))}'`);
    if (node.disabled) props.push('disabled: true');
    return `FormCheckbox(${props.join(', ')})`;
  },

  generateRadio(node, _context) {
    _context.usesFormWidgets = true;
    const name = node.name || 'radio';
    const props = [`name: '${name}'`];
    if (node.options && node.options.length) props.push(`options: [${node.options.map(o => `'${this.escapeString(o)}'`).join(', ')}]`);
    if (node.value) props.push(`value: '${this.escapeString(node.value)}'`);
    if (node.required) props.push('required: true');
    if (node.disabled) props.push('disabled: true');
    return `FormRadio(${props.join(', ')})`;
  },

  generateFile(node, _context) {
    _context.usesFormWidgets = true;
    const name = node.name || 'file';
    const props = [`name: '${name}'`];
    if (node.accept) props.push(`accept: '${node.accept}'`);
    if (node.multiple) props.push('multiple: true');
    if (node.maxSize) props.push(`maxSizeMb: ${node.maxSize}`);
    if (node.required) props.push('required: true');
    return `FormFile(${props.join(', ')})`;
  },

  generateSearch(node, _context) {
    _context.usesFormWidgets = true;
    const name = node.name || 'search';
    const props = [`name: '${name}'`, `source: '${node.source || ''}'`];
    if (node.display) props.push(`displayFields: '${node.display}'`);
    if (node.valueField) props.push(`valueField: '${node.valueField}'`);
    if (node.fields) props.push(`fields: '${node.fields}'`);
    if (node.placeholder) props.push(`placeholder: '${this.escapeString(node.placeholder)}'`);
    if (node.required) props.push('required: true');
    return `FormSearch(${props.join(', ')})`;
  },

  generateControllers(context) {
    const lines = [];
    for (const [name] of context.controllers) {
      lines.push(`final ${this.toControllerName(name)} = TextEditingController();`);
    }
    // Controller map + auto dispose (for save/load draft workflows)
    if (context.controllers.size > 0) {
      lines.push('');
      lines.push('Map<String, TextEditingController> get _controllerMap => {');
      for (const [name] of context.controllers) {
        const key = this.toCamelCase(name);
        const ctrl = this.toControllerName(name);
        lines.push(`  '${key}': ${ctrl},`);
      }
      lines.push('};');
      lines.push('');
      lines.push('@override');
      lines.push('void dispose() {');
      lines.push('  for (final c in _controllerMap.values) { c.dispose(); }');
      lines.push('  super.dispose();');
      lines.push('}');
    }
    return lines.join('\n');
  },

  generateStateVariables(context) {
    const lines = [];
    const dateFields = context.dateFields || new Map();
    const timeFields = context.timeFields || new Map();
    const searchFields = context.searchFields || new Map();
    const signatureFields = context.signatureFields || new Map();
    // Snap-mode toggle + capture key for screenshot feature (always emit when any form widget exists)
    const hasAnyForm = context.controllers.size > 0 || context.dropdowns.size > 0 || context.checkboxes.size > 0
      || dateFields.size > 0 || timeFields.size > 0 || searchFields.size > 0 || signatureFields.size > 0 || context.usesFormWidgets;
    if (hasAnyForm) {
      lines.push('bool _snapMode = false;');
      lines.push('final GlobalKey _captureKey = GlobalKey();');
      lines.push('');
    }
    // Non-controller state for FormDate (String? date) / FormSearch (String? value) / FormSignature (Uint8List? bytes)
    for (const [name] of dateFields) {
      lines.push(`String? _${this.toCamelCase(name)};`);
    }
    for (const [name] of timeFields) {
      lines.push(`String? _${this.toCamelCase(name)};`);
    }
    for (const [name] of searchFields) {
      lines.push(`String? _${this.toCamelCase(name)};`);
    }
    for (const [name] of signatureFields) {
      lines.push(`Uint8List? _${this.toCamelCase(name)}Bytes;`);
    }
    for (const [name, info] of context.dropdowns) {
      const varName    = this.toVariableName(name);
      const firstValue = info.options[0]?.value || '';
      lines.push(`String? ${varName} = '${firstValue}';`);
    }
    for (const [name] of context.checkboxes) {
      lines.push(`bool ${this.toVariableName(name)} = false;`);
    }
    // Snap-aware input decoration getter
    //
    // contentPadding: vertical 0 — table cells in this generator can be as
    // small as 20 px (rowHeights). With contentPadding 8v + fontSize 16 +
    // OutlineBorder 2px the TextField's intrinsic height was ~37 px,
    // overflowing the cell and rendering text past the border. Vertical 0
    // keeps the textbox flush with the cell, with horizontal padding kept for
    // visual separation between text and the side borders.
    if (hasAnyForm) {
      lines.push('');
      lines.push('InputDecoration get _inputDecoration => _snapMode');
      lines.push("    ? const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0))");
      lines.push("    : const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0));");
    }
    return lines.join('\n');
  },

  generateImports(context) {
    const imports = new Set(["import 'package:flutter/material.dart';"]);
    if (context.usesGesture) {
      imports.add("import 'package:flutter/gestures.dart';");
    }
    if (context.usesDashedBorder) {
      imports.add("import 'dart:math' as math;");
    }
    if (context.signatureFields && context.signatureFields.size > 0) {
      imports.add("import 'dart:typed_data';");
    }
    if (context.usesBase64) {
      imports.add("import 'dart:convert';");
    }
    if (context.usesFormWidgets || context.checkboxes.size > 0 || context.controllers.size > 0 || context.dropdowns.size > 0) {
      imports.add("import 'form_widgets/form_widgets.dart';");
    }
    return Array.from(imports).join('\n');
  },

  generateBoilerplate(context, widgetCode = '') {
    if (!context.usesTable && !context.usesDiagonalBorder && !context.usesComment) {
      return '// No helper classes needed';
    }
    const parts = [];

    // ── Text / border helpers (always added alongside table boilerplate) ─────
    if (context.usesTable) {
      parts.push(`// ── Text helpers ──────────────────────────────────────────────────────────────

Widget _t(String s, {double sz = 16, bool bold = false, bool italic = false, Color? color, String ff = 'Browallia New', TextAlign? align}) =>
    Text(s, style: TextStyle(fontFamily: ff, fontSize: sz, fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontStyle: italic ? FontStyle.italic : FontStyle.normal, color: color), softWrap: true, overflow: TextOverflow.clip, textAlign: align);

Widget _rt(List<(String, bool)> spans, {double sz = 16, String ff = 'Browallia New', TextAlign align = TextAlign.start}) =>
    RichText(softWrap: true, overflow: TextOverflow.clip, textAlign: align,
        text: TextSpan(style: TextStyle(fontFamily: ff, fontSize: sz),
            children: [for (final (t, b) in spans) TextSpan(text: t, style: b ? const TextStyle(fontWeight: FontWeight.bold) : null)]));

// ── Border helpers ────────────────────────────────────────────────────────────

const _bk = Colors.black;` +
        (widgetCode.includes('_bTop(')       ? `\nBorder _bTop([double w = 1])    => Border(top:    BorderSide(color: _bk, width: w));` : '') +
        (widgetCode.includes('_bBottom(')    ? `\nBorder _bBottom([double w = 1]) => Border(bottom: BorderSide(color: _bk, width: w));` : '') +
        (widgetCode.includes('_bLeft(')      ? `\nBorder _bLeft([double w = 1])   => Border(left:   BorderSide(color: _bk, width: w));` : '') +
        (widgetCode.includes('_bRight(')     ? `\nBorder _bRight([double w = 1])  => Border(right:  BorderSide(color: _bk, width: w));` : '') +
        (widgetCode.includes('_bTopBottom(') ? `\nBorder _bTopBottom(double t, double b) => Border(top: BorderSide(color: _bk, width: t), bottom: BorderSide(color: _bk, width: b));` : '') +
        (widgetCode.includes('_bAll(')       ? `\nBorder _bAll([double w = 1]) => Border.all(color: _bk, width: w);` : '') +
        ``);
    }

    if (context.usesTable) {
      parts.push(`class _TableGridPainter extends CustomPainter {
  final List<double> colStarts;
  final List<double> rowStarts;
  final Color borderColor;
  final double borderWidth;
  final List<List<int>> matrixData;
  final int numRows;
  final int numCols;

  const _TableGridPainter({
    required this.colStarts,
    required this.rowStarts,
    required this.borderColor,
    required this.borderWidth,
    required this.matrixData,
    required this.numRows,
    required this.numCols,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (borderWidth == 0) return;
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if (c >= colStarts.length - 1 || r >= rowStarts.length - 1) continue;
        final idx = (r < matrixData.length && c < matrixData[r].length)
            ? matrixData[r][c]
            : -1;
        if (idx < 0) continue;
        final sameAsLeft  = c > 0 && matrixData[r][c - 1] == idx;
        final sameAsAbove = r > 0 && matrixData[r - 1][c] == idx;
        if (sameAsLeft || sameAsAbove) continue;
        int endC = c + 1;
        while (endC < numCols && endC < matrixData[r].length && matrixData[r][endC] == idx) endC++;
        int endR = r + 1;
        while (endR < numRows && endR < matrixData.length && matrixData[endR][c] == idx) endR++;
        final right  = endC < colStarts.length ? colStarts[endC] : colStarts.last;
        final bottom = endR < rowStarts.length ? rowStarts[endR] : rowStarts.last;
        canvas.drawRect(Rect.fromLTRB(colStarts[c], rowStarts[r], right, bottom), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_TableGridPainter old) =>
      old.borderColor != borderColor || old.borderWidth != borderWidth;
}`);
    }

    if (context.usesDiagonalBorder) {
      parts.push(`class _DiagonalBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool topLeftToBottomRight;
  final bool bottomLeftToTopRight;

  const _DiagonalBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.topLeftToBottomRight,
    required this.bottomLeftToTopRight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    if (topLeftToBottomRight) {
      canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    }
    if (bottomLeftToTopRight) {
      canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
    }
  }

  @override
  bool shouldRepaint(_DiagonalBorderPainter old) =>
      old.color != color ||
      old.strokeWidth != strokeWidth ||
      old.topLeftToBottomRight != topLeftToBottomRight ||
      old.bottomLeftToTopRight != bottomLeftToTopRight;
}`);
    }

    if (context.usesDashedBorder) {
      parts.push(`class _DashSide {
  final Color color;
  final double width;
  final bool dotted;
  final bool doubled;
  final String side;
  const _DashSide._(this.side, {required this.color, required this.width, this.dotted = false, this.doubled = false});
  const _DashSide.top({required Color color, required double width, bool dotted = false, bool doubled = false}) : this._('top', color: color, width: width, dotted: dotted, doubled: doubled);
  const _DashSide.right({required Color color, required double width, bool dotted = false, bool doubled = false}) : this._('right', color: color, width: width, dotted: dotted, doubled: doubled);
  const _DashSide.bottom({required Color color, required double width, bool dotted = false, bool doubled = false}) : this._('bottom', color: color, width: width, dotted: dotted, doubled: doubled);
  const _DashSide.left({required Color color, required double width, bool dotted = false, bool doubled = false}) : this._('left', color: color, width: width, dotted: dotted, doubled: doubled);
}

class _DashedBorderPainter extends CustomPainter {
  final List<_DashSide> sides;
  const _DashedBorderPainter({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    for (final s in sides) {
      if (s.doubled) {
        _drawDouble(canvas, s, size);
        continue;
      }
      final paint = Paint()
        ..color = s.color
        ..strokeWidth = s.width
        ..style = PaintingStyle.stroke;
      final dashLen = s.dotted ? s.width : s.width * 3;
      final gapLen = s.dotted ? s.width * 2 : s.width * 3;
      switch (s.side) {
        case 'top':    _drawDash(canvas, paint, Offset.zero, Offset(size.width, 0), dashLen, gapLen); break;
        case 'bottom': _drawDash(canvas, paint, Offset(0, size.height), Offset(size.width, size.height), dashLen, gapLen); break;
        case 'left':   _drawDash(canvas, paint, Offset.zero, Offset(0, size.height), dashLen, gapLen); break;
        case 'right':  _drawDash(canvas, paint, Offset(size.width, 0), Offset(size.width, size.height), dashLen, gapLen); break;
      }
    }
  }

  // CSS "double": two parallel solid lines of thickness W/3 with a W/3 gap, drawn inside
  // the cell so total visual span equals the specified width W.
  void _drawDouble(Canvas canvas, _DashSide s, Size size) {
    final lineW = s.width / 3.0;
    final paint = Paint()
      ..color = s.color
      ..strokeWidth = lineW
      ..style = PaintingStyle.stroke;
    final outer = lineW / 2.0;         // stroke centerline of the outer line, from the edge
    final inner = s.width - lineW / 2.0; // stroke centerline of the inner line, from the edge
    switch (s.side) {
      case 'top':
        canvas.drawLine(Offset(0, outer), Offset(size.width, outer), paint);
        canvas.drawLine(Offset(0, inner), Offset(size.width, inner), paint);
        break;
      case 'bottom':
        canvas.drawLine(Offset(0, size.height - outer), Offset(size.width, size.height - outer), paint);
        canvas.drawLine(Offset(0, size.height - inner), Offset(size.width, size.height - inner), paint);
        break;
      case 'left':
        canvas.drawLine(Offset(outer, 0), Offset(outer, size.height), paint);
        canvas.drawLine(Offset(inner, 0), Offset(inner, size.height), paint);
        break;
      case 'right':
        canvas.drawLine(Offset(size.width - outer, 0), Offset(size.width - outer, size.height), paint);
        canvas.drawLine(Offset(size.width - inner, 0), Offset(size.width - inner, size.height), paint);
        break;
    }
  }

  void _drawDash(Canvas canvas, Paint paint, Offset start, Offset end, double dashLen, double gapLen) {
    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final totalLen = math.sqrt(dx * dx + dy * dy);
    if (totalLen == 0) return;
    final ux = dx / totalLen;
    final uy = dy / totalLen;
    double pos = 0;
    bool draw = true;
    while (pos < totalLen) {
      final double seg = draw ? dashLen : gapLen;
      final double segEnd = (pos + seg).clamp(0.0, totalLen);
      if (draw) {
        canvas.drawLine(
          Offset(start.dx + ux * pos, start.dy + uy * pos),
          Offset(start.dx + ux * segEnd, start.dy + uy * segEnd),
          paint,
        );
      }
      pos = segEnd;
      draw = !draw;
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => true;
}`);
    }

    if (context.usesComment) {
      parts.push(`class _CommentIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFF0000);
    final path = Path()
      ..moveTo(size.width - 6, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 6)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CommentIndicatorPainter old) => false;
}`);
    }

    return parts.join('\n\n');
  },

  // Safe version for callers that don't wrap with LayoutBuilder (e.g. paragraph/heading).
  // Responsive/auto sides degrade to 0 — caller only gets const EdgeInsets or null.
  generateEdgeInsets(styles, prefix) {
    const sides = this._boxSides(styles, prefix);
    if (!sides) return null;
    const flatten = v => (typeof v === 'number') ? v : 0;
    const safe = {
      top:    flatten(sides.top),
      right:  flatten(sides.right),
      bottom: flatten(sides.bottom),
      left:   flatten(sides.left),
    };
    return this._sidesToEdgeInsetsCode(safe);
  },

  // Parse a single box-side value. Returns:
  //   - number (px)
  //   - { t:'pct', v:N } | { t:'vh', v:N } | { t:'vw', v:N } for responsive
  //   - { t:'auto' } for margin horizontal centering
  //   - null if absent/invalid
  _parseBoxSide(str) {
    if (str == null) return null;
    const s = String(str).trim();
    if (s === 'auto') return { t: 'auto' };
    const dim = StyleParser.parseDimension(s);
    if (!dim) return null;
    if (dim.unit === '%')  return { t: 'pct', v: dim.value };
    if (dim.unit === 'vh') return { t: 'vh', v: dim.value };
    if (dim.unit === 'vw') return { t: 'vw', v: dim.value };
    return dim.value;
  },

  _boxSides(styles, prefix) {
    const top    = this._parseBoxSide(styles[`${prefix}Top`]);
    const right  = this._parseBoxSide(styles[`${prefix}Right`]);
    const bottom = this._parseBoxSide(styles[`${prefix}Bottom`]);
    const left   = this._parseBoxSide(styles[`${prefix}Left`]);
    if (top == null && right == null && bottom == null && left == null) return null;
    return { top, right, bottom, left };
  },

  _sideHasResponsive(sides) {
    if (!sides) return false;
    const chk = s => typeof s === 'object' && s && (s.t === 'pct' || s.t === 'vh' || s.t === 'vw');
    return chk(sides.top) || chk(sides.right) || chk(sides.bottom) || chk(sides.left);
  },

  // Returns 'center' | 'left' | 'right' | null based on margin horizontal auto.
  _sideHAlign(margin) {
    if (!margin) return null;
    const isAuto = s => typeof s === 'object' && s && s.t === 'auto';
    const l = isAuto(margin.left), r = isAuto(margin.right);
    if (l && r) return 'center';
    if (l && !r) return 'right';
    if (!l && r) return 'left';
    return null;
  },

  // Emit a Dart expression for a side, referencing runtime vars parentW/vpW/vpH when needed.
  _sideToDart(v) {
    if (v == null) return '0';
    if (typeof v === 'number') return String(v);
    if (v.t === 'pct') return `(parentW * ${(v.v / 100).toFixed(4)})`;
    if (v.t === 'vw')  return `(vpW * ${(v.v / 100).toFixed(4)})`;
    if (v.t === 'vh')  return `(vpH * ${(v.v / 100).toFixed(4)})`;
    if (v.t === 'auto') return '0';
    return '0';
  },

  _sidesToEdgeInsetsCode(sides) {
    if (!sides) return null;
    const t = this._sideToDart(sides.top);
    const r = this._sideToDart(sides.right);
    const b = this._sideToDart(sides.bottom);
    const l = this._sideToDart(sides.left);
    const allNumeric = [t, r, b, l].every(x => /^\d+(\.\d+)?$/.test(x));
    if (allNumeric) {
      const tn = parseFloat(t), rn = parseFloat(r), bn = parseFloat(b), ln = parseFloat(l);
      if (tn === rn && rn === bn && bn === ln) return `const EdgeInsets.all(${tn})`;
      if (tn === bn && ln === rn)              return `const EdgeInsets.symmetric(vertical: ${tn}, horizontal: ${ln})`;
      return `const EdgeInsets.fromLTRB(${ln}, ${tn}, ${rn}, ${bn})`;
    }
    return `EdgeInsets.fromLTRB(${l}, ${t}, ${r}, ${b})`;
  },

  extractAllText(node) {
    if (node.type === 'text') return node.content;
    if (node.type === 'svg') return '';
    if (node.styles?.position === 'absolute') return '';
    let text = '';
    for (const c of (node.children || [])) text += this.extractAllText(c);
    return text.trim();
  },

  escapeString(str) {
    if (!str) return '';
    return String(str)
      .replace(/\\/g, '\\\\')
      .replace(/'/g, "\\'")
      .replace(/\n/g, '\\n')
      .replace(/\r/g, '')
      .replace(/\t/g, '\\t')
      .replace(/\$/g, '\\$');
  },

  toControllerName(name) { return `_${this.toCamelCase(name)}Controller`; },
  toVariableName(name)   { return `_${this.toCamelCase(name)}`; },

  toCamelCase(str) {
    return str
      .replace(/[-_\s]+(.)?/g, (_, c) => c ? c.toUpperCase() : '')
      .replace(/^./, c => c.toLowerCase());
  },
};

if (typeof window !== 'undefined') window.DartGenerator = DartGenerator;
if (typeof module !== 'undefined') module.exports = DartGenerator;
