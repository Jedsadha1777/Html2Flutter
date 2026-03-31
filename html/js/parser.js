const HTMLParser = {
  parse(html) {
    const doc = new ASTNodes.DocumentNode();
    const parser = new DOMParser();
    const dom = parser.parseFromString(html, 'text/html');
    const body = dom.body;
    if (body) {
      const bodyStyle = body.getAttribute('style');
      if (bodyStyle) doc.bodyStyles = StyleParser.parse(bodyStyle);
      for (const child of body.childNodes) {
        const node = this.parseNode(child);
        if (node) doc.children.push(node);
      }
    }
    return doc;
  },

  parseNode(domNode) {
    if (!domNode) return null;
    if (domNode.nodeType === Node.TEXT_NODE) {
      const text = domNode.textContent;
      if (text.trim()) return new ASTNodes.TextNode(text);
      return null;
    }
    if (domNode.nodeType === Node.ELEMENT_NODE) {
      return this.parseElement(domNode);
    }
    return null;
  },

  parseElement(element) {
    const tagName = element.tagName.toLowerCase();
    let node;

    switch (tagName) {
      case 'table':    node = this.parseTable(element); break;
      case 'tr':       node = this.parseTableRow(element); break;
      case 'td':
      case 'th':       node = this.parseTableCell(element, tagName === 'th'); break;
      case 'thead':
      case 'tbody':
      case 'tfoot':    node = this.parseTableSection(element, tagName); break;
      case 'caption':  node = this.parseCaption(element); break;
      case 'colgroup': node = this.parseColGroup(element); break;
      case 'col':      node = this.parseCol(element); break;
      case 'input':    node = this.parseInput(element); break;
      case 'select':   node = this.parseSelect(element); break;
      case 'option':   node = this.parseOption(element); break;
      case 'textarea': node = this.parseTextArea(element); break;
      case 'date-picker':  node = this.parseDatePicker(element); break;
      case 'signature':    node = this.parseSignature(element); break;
      case 'image-upload': node = this.parseImageUpload(element); break;
      case 'svg':      node = this.parseSVG(element); break;
      default:         node = new ASTNodes.ElementNode(tagName); break;
    }

    this.parseCommonAttributes(element, node);

    const voidElements = ['input', 'col', 'br', 'hr', 'img', 'svg'];
    // Note: <pagebreak> is intentionally NOT void — browser nests subsequent content
    // inside it, so we need to read its children and hoist them into the next page.
    if (!voidElements.includes(tagName)) {
      for (const child of element.childNodes) {
        const childNode = this.parseNode(child);
        if (childNode) node.children.push(childNode);
      }
    }

    return node;
  },

  parseCommonAttributes(element, node) {
    for (const attr of element.attributes) {
      node.attributes[attr.name.toLowerCase()] = attr.value;
    }
    const style = element.getAttribute('style');
    if (style) node.styles = StyleParser.parse(style);
    node.className = element.className || '';
    node.id = element.id || '';
  },

  parseSVG(element) {
    const node = new ASTNodes.SVGNode();
    for (const line of element.querySelectorAll('line')) {
      node.diagonalLines.push({
        x1: line.getAttribute('x1') || '0',
        y1: line.getAttribute('y1') || '0',
        x2: line.getAttribute('x2') || '100%',
        y2: line.getAttribute('y2') || '100%',
        stroke: line.getAttribute('stroke') || '#000000',
        strokeWidth: parseFloat(line.getAttribute('stroke-width') || '1'),
      });
    }
    return node;
  },

  parseTable(element) {
    const node = new ASTNodes.TableNode();
    node.border      = this.getAttrInt(element, 'border');
    node.cellPadding = this.getAttrValue(element, 'cellpadding');
    node.cellSpacing = this.getAttrValue(element, 'cellspacing');
    node.width       = this.getAttrValue(element, 'width');
    node.height      = this.getAttrValue(element, 'height');
    node.bgcolor     = this.getAttrValue(element, 'bgcolor');
    node.align       = this.getAttrValue(element, 'align');
    node.frame       = this.getAttrValue(element, 'frame');
    node.rules       = this.getAttrValue(element, 'rules');
    node.summary     = this.getAttrValue(element, 'summary');
    return node;
  },

  parseTableRow(element) {
    const node = new ASTNodes.TableRowNode();
    node.align   = this.getAttrValue(element, 'align');
    node.valign  = this.getAttrValue(element, 'valign');
    node.bgcolor = this.getAttrValue(element, 'bgcolor');
    node.char    = this.getAttrValue(element, 'char');
    node.charoff = this.getAttrValue(element, 'charoff');
    return node;
  },

  parseTableCell(element, isHeader) {
    const node = new ASTNodes.TableCellNode(isHeader);
    node.colspan  = this.getAttrInt(element, 'colspan', 1);
    node.rowspan  = this.getAttrInt(element, 'rowspan', 1);
    node.align    = this.getAttrValue(element, 'align');
    node.valign   = this.getAttrValue(element, 'valign');
    node.bgcolor  = this.getAttrValue(element, 'bgcolor');
    node.width    = this.getAttrValue(element, 'width');
    node.height   = this.getAttrValue(element, 'height');
    node.nowrap   = element.hasAttribute('nowrap');
    node.headers  = this.getAttrValue(element, 'headers');
    node.scope    = this.getAttrValue(element, 'scope');
    node.abbr     = this.getAttrValue(element, 'abbr');
    node.axis     = this.getAttrValue(element, 'axis');
    node.char     = this.getAttrValue(element, 'char');
    node.charoff  = this.getAttrValue(element, 'charoff');
    node.dataCell = this.getAttrValue(element, 'data-cell');
    return node;
  },

  parseTableSection(element, sectionType) {
    const node = new ASTNodes.TableSectionNode(sectionType);
    node.align   = this.getAttrValue(element, 'align');
    node.valign  = this.getAttrValue(element, 'valign');
    node.char    = this.getAttrValue(element, 'char');
    node.charoff = this.getAttrValue(element, 'charoff');
    return node;
  },

  parseCaption(element) {
    const node = new ASTNodes.TableCaptionNode();
    node.align = this.getAttrValue(element, 'align');
    return node;
  },

  parseColGroup(element) {
    const node = new ASTNodes.ColGroupNode();
    node.span    = this.getAttrInt(element, 'span', 1);
    node.width   = this.getAttrValue(element, 'width');
    node.align   = this.getAttrValue(element, 'align');
    node.valign  = this.getAttrValue(element, 'valign');
    node.char    = this.getAttrValue(element, 'char');
    node.charoff = this.getAttrValue(element, 'charoff');
    return node;
  },

  parseCol(element) {
    const node = new ASTNodes.ColNode();
    node.span    = this.getAttrInt(element, 'span', 1);
    node.width   = this.getAttrValue(element, 'width');
    node.align   = this.getAttrValue(element, 'align');
    node.valign  = this.getAttrValue(element, 'valign');
    node.char    = this.getAttrValue(element, 'char');
    node.charoff = this.getAttrValue(element, 'charoff');
    return node;
  },

  parseInput(element) {
    const node = new ASTNodes.InputNode();
    node.inputType   = this.getAttrValue(element, 'type') || 'text';
    node.name        = this.getAttrValue(element, 'name') || '';
    node.placeholder = this.getAttrValue(element, 'placeholder') || '';
    node.value       = this.getAttrValue(element, 'value') || '';
    node.required    = element.hasAttribute('required');
    node.readonly    = element.hasAttribute('readonly');
    node.disabled    = element.hasAttribute('disabled');
    return node;
  },

  parseSelect(element) {
    const node = new ASTNodes.SelectNode();
    node.name     = this.getAttrValue(element, 'name') || '';
    node.required = element.hasAttribute('required');
    node.disabled = element.hasAttribute('disabled');
    node.multiple = element.hasAttribute('multiple');
    return node;
  },

  parseOption(element) {
    const node = new ASTNodes.OptionNode();
    node.value    = this.getAttrValue(element, 'value') || element.textContent.trim();
    node.selected = element.hasAttribute('selected');
    node.disabled = element.hasAttribute('disabled');
    node.label    = element.textContent.trim();
    return node;
  },

  parseTextArea(element) {
    const node = new ASTNodes.TextAreaNode();
    node.name        = this.getAttrValue(element, 'name') || '';
    node.placeholder = this.getAttrValue(element, 'placeholder') || '';
    node.rows        = this.getAttrInt(element, 'rows', 3);
    node.cols        = this.getAttrInt(element, 'cols', 20);
    node.required    = element.hasAttribute('required');
    node.readonly    = element.hasAttribute('readonly');
    node.disabled    = element.hasAttribute('disabled');
    return node;
  },

  parseDatePicker(element) {
    const node = new ASTNodes.DatePickerNode();
    node.name        = this.getAttrValue(element, 'name') || '';
    node.placeholder = this.getAttrValue(element, 'placeholder') || '';
    node.required    = element.hasAttribute('required');
    return node;
  },

  parseSignature(element) {
    const node = new ASTNodes.SignatureNode();
    node.name   = this.getAttrValue(element, 'name') || '';
    node.width  = this.getAttrValue(element, 'width');
    node.height = this.getAttrValue(element, 'height');
    return node;
  },

  parseImageUpload(element) {
    const node = new ASTNodes.ImageUploadNode();
    node.name   = this.getAttrValue(element, 'name') || '';
    node.width  = this.getAttrValue(element, 'width');
    node.height = this.getAttrValue(element, 'height');
    return node;
  },

  getAttrValue(element, name) {
    return element.getAttribute(name) || null;
  },

  getAttrInt(element, name, defaultValue = null) {
    const value = element.getAttribute(name);
    if (value === null) return defaultValue;
    const parsed = parseInt(value, 10);
    return isNaN(parsed) ? defaultValue : parsed;
  },
};

if (typeof window !== 'undefined') window.HTMLParser = HTMLParser;
if (typeof module !== 'undefined') module.exports = HTMLParser;
