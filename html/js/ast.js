class ASTNode {
  constructor(type) {
    this.type = type;
    this.children = [];
    this.attributes = {};
    this.styles = {};
  }
}

class DocumentNode extends ASTNode {
  constructor() { super('document'); }
}

class ElementNode extends ASTNode {
  constructor(tagName) {
    super('element');
    this.tagName = tagName.toLowerCase();
  }
}

class TextNode extends ASTNode {
  constructor(content) {
    super('text');
    this.content = content;
  }
}

class SVGNode extends ASTNode {
  constructor() {
    super('svg');
    this.diagonalLines = [];
  }
}

class TableNode extends ASTNode {
  constructor() {
    super('table');
    this.border = null;
    this.cellPadding = null;
    this.cellSpacing = null;
    this.width = null;
    this.height = null;
    this.bgcolor = null;
    this.align = null;
    this.frame = null;
    this.rules = null;
    this.summary = null;
  }
}

class TableRowNode extends ASTNode {
  constructor() {
    super('tr');
    this.align = null;
    this.valign = null;
    this.bgcolor = null;
    this.char = null;
    this.charoff = null;
  }
}

class TableCellNode extends ASTNode {
  constructor(isHeader = false) {
    super(isHeader ? 'th' : 'td');
    this.isHeader = isHeader;
    this.colspan = 1;
    this.rowspan = 1;
    this.align = null;
    this.valign = null;
    this.bgcolor = null;
    this.width = null;
    this.height = null;
    this.nowrap = false;
    this.headers = null;
    this.scope = null;
    this.abbr = null;
    this.axis = null;
    this.char = null;
    this.charoff = null;
    this.dataCell = null;
  }
}

class TableSectionNode extends ASTNode {
  constructor(sectionType) {
    super(sectionType);
    this.align = null;
    this.valign = null;
    this.char = null;
    this.charoff = null;
  }
}

class TableCaptionNode extends ASTNode {
  constructor() {
    super('caption');
    this.align = null;
  }
}

class ColGroupNode extends ASTNode {
  constructor() {
    super('colgroup');
    this.span = 1;
    this.width = null;
    this.align = null;
    this.valign = null;
    this.char = null;
    this.charoff = null;
  }
}

class ColNode extends ASTNode {
  constructor() {
    super('col');
    this.span = 1;
    this.width = null;
    this.align = null;
    this.valign = null;
    this.char = null;
    this.charoff = null;
  }
}

class InputNode extends ASTNode {
  constructor() {
    super('input');
    this.inputType = 'text';
    this.name = '';
    this.placeholder = '';
    this.required = false;
    this.readonly = false;
    this.disabled = false;
    this.value = '';
  }
}

class SelectNode extends ASTNode {
  constructor() {
    super('select');
    this.name = '';
    this.required = false;
    this.disabled = false;
    this.multiple = false;
    this.options = [];
  }
}

class OptionNode extends ASTNode {
  constructor() {
    super('option');
    this.value = '';
    this.selected = false;
    this.disabled = false;
    this.label = '';
  }
}

class TextAreaNode extends ASTNode {
  constructor() {
    super('textarea');
    this.name = '';
    this.placeholder = '';
    this.rows = 3;
    this.cols = 20;
    this.required = false;
    this.readonly = false;
    this.disabled = false;
  }
}

class DatePickerNode extends ASTNode {
  constructor() {
    super('date-picker');
    this.name = '';
    this.placeholder = '';
    this.required = false;
  }
}

class SignatureNode extends ASTNode {
  constructor() {
    super('signature');
    this.name = '';
    this.width = null;
    this.height = null;
  }
}

class ImageUploadNode extends ASTNode {
  constructor() {
    super('image-upload');
    this.name = '';
    this.width = null;
    this.height = null;
  }
}

const ASTNodes = {
  ASTNode,
  DocumentNode,
  ElementNode,
  TextNode,
  SVGNode,
  TableNode,
  TableRowNode,
  TableCellNode,
  TableSectionNode,
  TableCaptionNode,
  ColGroupNode,
  ColNode,
  InputNode,
  SelectNode,
  OptionNode,
  TextAreaNode,
  DatePickerNode,
  SignatureNode,
  ImageUploadNode,
};

if (typeof window !== 'undefined') window.ASTNodes = ASTNodes;
if (typeof module !== 'undefined') module.exports = ASTNodes;
