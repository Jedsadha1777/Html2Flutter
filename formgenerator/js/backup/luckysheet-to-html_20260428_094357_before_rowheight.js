// Build a canvas-compatible font string from luckysheet cell properties.
// Format: [italic ][bold ]<size>pt <family> — same shape luckysheet uses for
// canvas rendering, so Pretext measurements line up with what would have been
// drawn on the canvas.
function buildCellFont(cell) {
    const style = cell.it === 1 ? 'italic ' : '';
    const weight = cell.bl === 1 ? 'bold ' : '';
    const size = (cell.fs !== undefined ? cell.fs : 11) + 'pt';
    const family = cell.ff || 'Arial';
    return (style + weight + size + ' ' + family).trim();
}

const _lineHeightCache = {};

// Measure a font's line-height in CSS px. Mirrors luckysheet's approach
// (canvas measureText actualBoundingBoxAscent + Descent) and applies a 1.2x
// leading factor to approximate browser default 'normal' line-height. Cached
// per font string.
function measureLineHeight(font) {
    if (_lineHeightCache[font] !== undefined) return _lineHeightCache[font];
    let h;
    try {
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        ctx.font = font;
        const m = ctx.measureText('AyBp');
        if (m.actualBoundingBoxAscent !== undefined && m.actualBoundingBoxDescent !== undefined) {
            h = Math.ceil(((m.actualBoundingBoxAscent || 0) + (m.actualBoundingBoxDescent || 0)) * 1.2);
        } else {
            const ms = font.match(/(\d+(?:\.\d+)?)\s*pt/);
            h = ms ? Math.ceil(Number(ms[1]) * 1.6) : 19;
        }
    } catch (e) {
        h = 19;
    }
    _lineHeightCache[font] = h;
    return h;
}

// Sum widths/heights across a span for merged cells. Defaults match luckysheet
// (defaultcollen=73, defaultrowlen=19).
function sumColumnWidths(columnlen, startCol, span) {
    let w = 0;
    for (let i = 0; i < span; i++) {
        const cw = columnlen[startCol + i];
        w += (cw !== undefined ? cw : 73);
    }
    return w;
}
function sumRowHeights(rowlen, startRow, span) {
    let h = 0;
    for (let i = 0; i < span; i++) {
        const rh = rowlen[startRow + i];
        h += (rh !== undefined ? rh : 19);
    }
    return h;
}

// Normalize all newline forms to '\n'. Same set luckysheet normalizes (vendor:
// \r\n, &#13;&#10;, \r, \n → _x000D_) plus the OOXML _x000D_ literal that can
// survive xlsx import.
function normalizeNewlines(s) {
    return String(s).replace(/\r\n|\r|_x000D_|&#13;&#10;|&#13;|&#10;/g, '\n');
}

// Plain-text rendering with Pretext-driven line breaking.
// - Wrap mode: Pretext lays out at contentWidth (pre-wrap), emit all lines.
// - Nowrap mode: split on hard breaks only, clip to N lines that fit
//   contentHeight (no horizontal wrapping — overflow is left to CSS).
// Falls back to escape + <br> if Pretext is not loaded.
function renderTextLines(rawText, font, contentWidth, contentHeight, isWrap) {
    if (rawText === '' || rawText === null || rawText === undefined) return '';
    const text = normalizeNewlines(rawText);

    if (typeof window === 'undefined' || !window.Pretext) {
        return escapeHtml(text).replace(/\n/g, '<br>');
    }

    const lineHeight = measureLineHeight(font);
    let lines;

    if (isWrap) {
        const prepared = window.Pretext.prepareWithSegments(text, font, { whiteSpace: 'pre-wrap' });
        const result = window.Pretext.layoutWithLines(prepared, Math.max(0, contentWidth), lineHeight);
        lines = result.lines.map(l => l.text);
    } else {
        lines = text.split('\n');
        const maxLines = Math.max(1, Math.floor(contentHeight / lineHeight));
        if (lines.length > maxLines) lines = lines.slice(0, maxLines);
    }

    return lines.map(escapeHtml).join('<br>');
}

// Rich-text rendering with Pretext line breaking on the plain-text concatenation,
// then re-applying per-segment styling within each measured line. cellFont is a
// coarse approximation when segments mix fonts — Pretext can only measure with a
// single font at a time, so accuracy degrades when segments diverge widely from
// the cell-level font.
function renderRichTextLines(richSegments, cellFont, contentWidth, contentHeight, isWrap) {
    if (!richSegments || !richSegments.length) return '';
    if (typeof window === 'undefined' || !window.Pretext) return convertRichText(richSegments);

    const segNorm = richSegments.map(s => Object.assign({}, s, { _v: normalizeNewlines(s.v || '') }));
    const fullText = segNorm.map(s => s._v).join('');
    if (!fullText) return '';

    const lineHeight = measureLineHeight(cellFont);
    let lineTexts;

    if (isWrap) {
        const prepared = window.Pretext.prepareWithSegments(fullText, cellFont, { whiteSpace: 'pre-wrap' });
        const result = window.Pretext.layoutWithLines(prepared, Math.max(0, contentWidth), lineHeight);
        lineTexts = result.lines.map(l => l.text);
    } else {
        lineTexts = fullText.split('\n');
        const maxLines = Math.max(1, Math.floor(contentHeight / lineHeight));
        if (lineTexts.length > maxLines) lineTexts = lineTexts.slice(0, maxLines);
    }

    // Map each line's text back to a [start, end] character range within fullText
    // so we can walk segments and emit only the portion that falls in this line.
    let cursor = 0;
    const ranges = [];
    for (let i = 0; i < lineTexts.length; i++) {
        const lt = lineTexts[i];
        let idx = fullText.indexOf(lt, cursor);
        if (idx < 0) idx = cursor;
        const start = idx;
        const end = start + lt.length;
        ranges.push({ start: start, end: end });
        cursor = end;
        if (cursor < fullText.length && fullText.charAt(cursor) === '\n') cursor += 1;
    }

    let html = '';
    for (let li = 0; li < ranges.length; li++) {
        if (li > 0) html += '<br>';
        const r = ranges[li];
        let segPos = 0;
        for (const seg of segNorm) {
            const segStart = segPos;
            const segEnd = segPos + seg._v.length;
            const overlapStart = Math.max(segStart, r.start);
            const overlapEnd = Math.min(segEnd, r.end);
            if (overlapStart < overlapEnd) {
                const visible = seg._v.substring(overlapStart - segStart, overlapEnd - segStart);
                let style = '';
                if (seg.bl === 1) style += 'font-weight: bold; ';
                if (seg.it === 1) style += 'font-style: italic; ';
                if (seg.un === 1) style += 'text-decoration: underline; ';
                if (seg.cl === 1) style += 'text-decoration: line-through; ';
                if (seg.fc) style += 'color: ' + seg.fc + '; ';
                if (seg.fs) style += 'font-size: ' + seg.fs + 'pt; ';
                if (seg.ff) style += 'font-family: ' + seg.ff + '; ';
                if (style) {
                    html += '<span style="' + style + '">' + escapeHtml(visible) + '</span>';
                } else {
                    html += escapeHtml(visible);
                }
            }
            segPos = segEnd;
        }
    }

    return html;
}

function columnToLetter(col) {
    let letter = '';
    let temp = col;
    while (temp >= 0) {
        letter = String.fromCharCode(65 + (temp % 26)) + letter;
        temp = Math.floor(temp / 26) - 1;
    }
    return letter;
}

function luckysheetToHtml() {
    const sheets = luckysheet.getAllSheets();
    const result = [];
    
    sheets.forEach((sheet, sheetIndex) => {
        const data = sheet.data;
        
        // Switch ไปยัง sheet นี้เพื่อดึง config ล่าสุด
        const originalActiveIndex = luckysheet.getSheet().index;
        if (sheetIndex !== originalActiveIndex) {
            luckysheet.setSheetActive(sheetIndex);
        }
        
        // ดึง config ล่าสุด
        const currentConfig = luckysheet.getConfig();
        
        const columnlen = currentConfig.columnlen || {};
        const rowlen = currentConfig.rowlen || {};

        const sheetName = sheet.name;

        
        const merge = currentConfig.merge || {};
        
        const maxRow = data.length;
        const maxCol = Math.max(...data.map(row => row ? row.length : 0));
        
        const borderInfo = currentConfig.borderInfo || [];
        const condFormat = currentConfig.condFormat || [];
        
        // Build merge lookup table for performance
        const mergeLookup = buildMergeLookup(merge);

        // Resolve borderInfo into per-cell sides (port of luckysheet's internal zc()).
        // Build once per sheet so the per-cell loop just does a lookup.
        const borderMap = computeBorderMap(borderInfo, data, mergeLookup, maxRow, maxCol);

        // Apply conditional formatting
        const conditionalStyles = applyConditionalFormatting(data, condFormat, maxRow, maxCol);
        
        // // คำนวณ total width
        // let totalWidth = 0;
        // for (let c = 0; c < maxCol; c++) {
        //     totalWidth += columnlen[c] !== undefined ? columnlen[c] : 73;
        // }
        
        let html = '<table style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 11pt; table-layout: fixed; ">';

        // Column widths
        html += '<colgroup>';
        for (let c = 0; c < maxCol; c++) {
            const colWidth = columnlen[c] !== undefined ? columnlen[c] : 73;
            html += '<col style="width: ' + colWidth + 'px;">';
        }
        html += '</colgroup>';
        
        const skipCells = {};
        
       for (let r = 0; r < maxRow; r++) {
            const rowHeight = rowlen[r] !== undefined ? rowlen[r] : 19;
            html += '<tr style="height: ' + rowHeight + 'px;">';
            
            for (let c = 0; c < maxCol; c++) {
                const cellKey = r + '_' + c;
                
                if (skipCells[cellKey]) {
                    continue;
                }
                
                const cell = data[r] && data[r][c] ? data[r][c] : {};
                
                let colspan = 1;
                let rowspan = 1;
                
                // Check merge
                const mergeInfo = mergeLookup[cellKey];
                if (mergeInfo) {
                    rowspan = mergeInfo.rs;
                    colspan = mergeInfo.cs;
                    
                    for (let mr = r; mr < r + rowspan; mr++) {
                        for (let mc = c; mc < c + colspan; mc++) {
                            if (mr !== r || mc !== c) {
                                skipCells[mr + '_' + mc] = true;
                            }
                        }
                    }
                }
                
                let style = '';
                style += 'padding: 2px 4px; ';
                style += 'box-sizing: border-box; ';
                
                // Background color
                if (cell.bg) {
                    style += 'background-color: ' + cell.bg + '; ';
                }
                
                // Apply conditional formatting background
                const condStyle = conditionalStyles[cellKey];
                if (condStyle && condStyle.bg) {
                    style += 'background-color: ' + condStyle.bg + '; ';
                }
                
                // Font color
                if (cell.fc) {
                    style += 'color: ' + cell.fc + '; ';
                }
                
                // Apply conditional formatting color
                if (condStyle && condStyle.fc) {
                    style += 'color: ' + condStyle.fc + '; ';
                }
                
                // Font size
                if (cell.fs) {
                    style += 'font-size: ' + cell.fs + 'pt; ';
                }
                
                // Font family
                if (cell.ff) {
                    style += 'font-family: ' + cell.ff + '; ';
                }
                
                // Bold
                if (cell.bl === 1) {
                    style += 'font-weight: bold; ';
                }
                
                // Italic
                if (cell.it === 1) {
                    style += 'font-style: italic; ';
                }
                
                // Underline types
                if (cell.un) {
                    if (cell.un === 1) {
                        style += 'text-decoration: underline; ';
                    } else if (cell.un === 2) {
                        style += 'text-decoration: underline double; ';
                    } else if (cell.un === 3) {
                        style += 'text-decoration: underline; text-underline-position: under; ';
                    }
                }
                
                // Strikethrough
                if (cell.cl === 1) {
                    style += 'text-decoration: line-through; ';
                }
                
                // Horizontal alignment
                if (cell.ht === 0) {
                    style += 'text-align: center; ';
                } else if (cell.ht === 2) {
                    style += 'text-align: right; ';
                } else if (cell.ht === 1) {
                    style += 'text-align: left; ';
                }
                
                // Vertical alignment
                if (cell.vt === 0) {
                    style += 'vertical-align: middle; ';
                } else if (cell.vt === 2) {
                    style += 'vertical-align: bottom; ';
                } else if (cell.vt === 1) {
                    style += 'vertical-align: top; ';
                }
                                
                // Text wrap and overflow
                if (cell.tb === 2) {
                    style += 'white-space: pre-wrap; word-wrap: break-word; ';
                } else if (cell.tb === 1) {
                    style += 'overflow: visible; white-space: nowrap; ';
                } else {
                    style += 'white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ';
                }
                                
                // Text rotation
                if (cell.tr && cell.tr.t) {
                    const angle = cell.tr.a || 0;
                    if (angle !== 0) {
                        style += 'transform: rotate(' + angle + 'deg); ';
                        style += 'transform-origin: center; ';
                        style += 'display: inline-block; ';
                    }
                }
                
                // Borders
                const borderResult = getCellBorders(borderMap, r, c, rowspan, colspan);
                style += borderResult.borderStyle;
                
                // Pixel-precise content area for Pretext line breaking. cellWidth/Height
                // span the merged region; subtract td padding (2px 4px in 'style' above) to
                // get the true content box that text must fit into.
                const cellWidthPx = sumColumnWidths(columnlen, c, colspan);
                const cellHeightPx = sumRowHeights(rowlen, r, rowspan);
                const contentWidth = Math.max(0, cellWidthPx - 8);
                const contentHeight = Math.max(0, cellHeightPx - 4);
                const cellFont = buildCellFont(cell);
                const isWrap = cell.tb === 2;

                // Get cell content (handle rich text)
                let cellContent = '';

                if (cell.ct && cell.ct.t === 'inlineStr' && cell.ct.s) {
                    cellContent = renderRichTextLines(cell.ct.s, cellFont, contentWidth, contentHeight, isWrap);
                } else if (cell.f) {
                    const rawText = formatCellValueRaw(cell.v, cell.fa, cell.m);
                    cellContent = renderTextLines(rawText, cellFont, contentWidth, contentHeight, isWrap);
                } else if (cell.m !== undefined) {
                    cellContent = renderTextLines(cell.m, cellFont, contentWidth, contentHeight, isWrap);
                } else if (cell.v !== undefined) {
                    const rawText = formatCellValueRaw(cell.v, cell.fa, cell.m);
                    cellContent = renderTextLines(rawText, cellFont, contentWidth, contentHeight, isWrap);
                } else {
                    cellContent = '';
                }
                
                // Hyperlink
                if (cell.hl) {
                    cellContent = '<a href="' + escapeHtml(cell.hl) + '" target="_blank" style="color: #0066cc; text-decoration: underline;">' + cellContent + '</a>';
                }
                
                // Comments/Notes indicator
                let commentIndicator = '';
                if (cell.ps || cell.comment) {
                    const commentText = cell.ps ? cell.ps.value : (cell.comment ? cell.comment.value : '');
                    commentIndicator = '<span title="' + escapeHtml(commentText) + '" style="position: absolute; top: 0; right: 0; width: 0; height: 0; border-left: 6px solid transparent; border-top: 6px solid #ff0000;"></span>';
                }
                
                // Conditional formatting icons
                let iconContent = '';
                if (condStyle && condStyle.icon) {
                    iconContent = '<span style="margin-right: 4px;">' + condStyle.icon + '</span>';
                }
                
                // Diagonal border SVG
                let diagonalSVG = '';
                if (borderResult.diagonalBorder) {
                    diagonalSVG = createDiagonalBorderSVG(borderResult.diagonalBorder, columnlen[c] || 73, rowlen[r] || 19);
                }
                
                const colspanAttr = colspan > 1 ? ' colspan="' + colspan + '"' : '';
                const rowspanAttr = rowspan > 1 ? ' rowspan="' + rowspan + '"' : '';
                
                const cellRef = columnToLetter(c) + (r + 1);
                const dataCellAttr = ' data-cell="' + sheetName + ':' + cellRef + '"';
                
                html += '<td' + dataCellAttr + colspanAttr + rowspanAttr + ' style="' + style + ' position: relative;">' + diagonalSVG + commentIndicator + iconContent + cellContent + '</td>';
            }
            
            html += '</tr>';
        }
        
        html += '</table>';
        
        result.push({
            name: sheet.name,
            html: html
        });
    });
    
    return result;
}

function buildMergeLookup(merge) {
    const lookup = {};
    Object.keys(merge).forEach(key => {
        const m = merge[key];
        const cellKey = m.r + '_' + m.c;
        lookup[cellKey] = m;
    });
    return lookup;
}

function convertRichText(richTextArray) {
    let html = '';
    
    richTextArray.forEach(segment => {
        let text = escapeHtml(segment.v || '');
        let style = '';
        
        if (segment.bl === 1) style += 'font-weight: bold; ';
        if (segment.it === 1) style += 'font-style: italic; ';
        if (segment.un === 1) style += 'text-decoration: underline; ';
        if (segment.cl === 1) style += 'text-decoration: line-through; ';
        if (segment.fc) style += 'color: ' + segment.fc + '; ';
        if (segment.fs) style += 'font-size: ' + segment.fs + 'pt; ';
        if (segment.ff) style += 'font-family: ' + segment.ff + '; ';
        
        if (style) {
            html += '<span style="' + style + '">' + text + '</span>';
        } else {
            html += text;
        }
    });
    
    return html;
}

// Raw value formatter — same logic as formatCellValue but returns the unescaped
// string. Plain-text rendering breaks lines by character position (via Pretext)
// before escaping, so the line-break stage needs the unescaped value.
function formatCellValueRaw(value, format, formattedValue) {
    if (formattedValue !== undefined && formattedValue !== null) {
        return String(formattedValue);
    }

    if (!format || format === 'General') {
        return String(value);
    }

    if (typeof value === 'number') {
        if (format.includes('yyyy') || format.includes('mm') || format.includes('dd')) {
            const date = excelDateToJSDate(value);
            return formatDate(date, format);
        }

        if (format.includes('%')) {
            return (value * 100).toFixed(2) + '%';
        }

        if (format.includes('$') || format.includes('฿')) {
            return formatCurrency(value, format);
        }

        const decimalMatch = format.match(/0\.(0+)/);
        if (decimalMatch) {
            const decimals = decimalMatch[1].length;
            return value.toFixed(decimals);
        }

        if (format.includes('#,##0')) {
            return value.toLocaleString();
        }
    }

    return String(value);
}

function formatCellValue(value, format, formattedValue) {
    return escapeHtml(formatCellValueRaw(value, format, formattedValue));
}

function excelDateToJSDate(excelDate) {
    const daysFrom1900 = excelDate - 25569;
    const millisecondsPerDay = 86400000;
    return new Date(daysFrom1900 * millisecondsPerDay);
}

function formatDate(date, format) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    
    return format
        .replace('yyyy', year)
        .replace('mm', month)
        .replace('dd', day);
}

function formatCurrency(value, format) {
    const formatted = value.toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    
    if (format.includes('$')) {
        return '$' + formatted;
    } else if (format.includes('฿')) {
        return '฿' + formatted;
    }
    
    return formatted;
}

function applyConditionalFormatting(data, condFormat, maxRow, maxCol) {
    const styles = {};
    
    condFormat.forEach(rule => {
        const type = rule.type;
        const cellrange = rule.cellrange || [];
        
        cellrange.forEach(range => {
            const rows = range.row || [0, maxRow - 1];
            const cols = range.column || [0, maxCol - 1];
            
            for (let r = rows[0]; r <= rows[1]; r++) {
                for (let c = cols[0]; c <= cols[1]; c++) {
                    const cell = data[r] && data[r][c] ? data[r][c] : {};
                    const cellKey = r + '_' + c;
                    const value = cell.v;
                    
                    if (type === 'dataBar') {
                        const percent = calculateDataBarPercent(value, rule);
                        styles[cellKey] = {
                            bg: 'linear-gradient(to right, ' + (rule.format || '#63c3f5') + ' ' + percent + '%, transparent ' + percent + '%)'
                        };
                    } else if (type === 'colorScale') {
                        const color = calculateColorScale(value, rule);
                        styles[cellKey] = { bg: color };
                    } else if (type === 'icons') {
                        const icon = getIconForValue(value, rule);
                        styles[cellKey] = { icon: icon };
                    } else if (type === 'highlightCell') {
                        if (evaluateCondition(value, rule)) {
                            styles[cellKey] = {
                                bg: rule.format && rule.format.bg ? rule.format.bg : undefined,
                                fc: rule.format && rule.format.fc ? rule.format.fc : undefined
                            };
                        }
                    }
                }
            }
        });
    });
    
    return styles;
}

function calculateDataBarPercent(value, rule) {
    if (typeof value !== 'number') return 0;
    const min = rule.minValue || 0;
    const max = rule.maxValue || 100;
    const percent = ((value - min) / (max - min)) * 100;
    return Math.max(0, Math.min(100, percent));
}

function calculateColorScale(value, rule) {
    if (typeof value !== 'number') return '#ffffff';
    
    const colors = rule.colors || ['#f8696b', '#ffeb84', '#63be7b'];
    const min = rule.minValue || 0;
    const max = rule.maxValue || 100;
    
    const percent = (value - min) / (max - min);
    
    if (percent <= 0.5) {
        return interpolateColor(colors[0], colors[1], percent * 2);
    } else {
        return interpolateColor(colors[1], colors[2], (percent - 0.5) * 2);
    }
}

function interpolateColor(color1, color2, factor) {
    const c1 = hexToRgb(color1);
    const c2 = hexToRgb(color2);
    
    const r = Math.round(c1.r + (c2.r - c1.r) * factor);
    const g = Math.round(c1.g + (c2.g - c1.g) * factor);
    const b = Math.round(c1.b + (c2.b - c1.b) * factor);
    
    return rgbToHex(r, g, b);
}

function hexToRgb(hex) {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : { r: 0, g: 0, b: 0 };
}

function rgbToHex(r, g, b) {
    return '#' + [r, g, b].map(x => {
        const hex = x.toString(16);
        return hex.length === 1 ? '0' + hex : hex;
    }).join('');
}

function getIconForValue(value, rule) {
    const icons = rule.icons || ['⬇️', '➡️', '⬆️'];
    const thresholds = rule.thresholds || [33, 66];
    
    if (value < thresholds[0]) return icons[0];
    if (value < thresholds[1]) return icons[1];
    return icons[2];
}

function evaluateCondition(value, rule) {
    const operator = rule.operator;
    const compareValue = rule.value;
    
    switch (operator) {
        case 'greaterThan':
            return value > compareValue;
        case 'lessThan':
            return value < compareValue;
        case 'equal':
            return value == compareValue;
        case 'between':
            return value >= rule.value[0] && value <= rule.value[1];
        case 'notBetween':
            return value < rule.value[0] || value > rule.value[1];
        case 'containsText':
            return String(value).includes(compareValue);
        default:
            return false;
    }
}

// Read resolved per-cell border sides from the map and emit CSS for the cell's
// outer perimeter. For merged cells, top/left come from the origin entry but
// bottom comes from the bottom-row entry and right from the right-column entry —
// matches how luckysheet's zc() places borders on edge cells of the merge.
function getCellBorders(borderMap, r, c, rowspan, colspan) {
    const lastRow = r + (rowspan || 1) - 1;
    const lastCol = c + (colspan || 1) - 1;
    const tl = borderMap[r + '_' + c] || {};
    const bl = (rowspan && rowspan > 1) ? (borderMap[lastRow + '_' + c] || {}) : tl;
    const tr = (colspan && colspan > 1) ? (borderMap[r + '_' + lastCol] || {}) : tl;

    const top    = tl.t;
    const left   = tl.l;
    const bottom = bl.b;
    const right  = tr.r;

    let borderStyle = '';
    if (top)    borderStyle += 'border-top: '    + getBorderString(top.style,    top.color)    + '; ';
    if (bottom) borderStyle += 'border-bottom: ' + getBorderString(bottom.style, bottom.color) + '; ';
    if (left)   borderStyle += 'border-left: '   + getBorderString(left.style,   left.color)   + '; ';
    if (right)  borderStyle += 'border-right: '  + getBorderString(right.style,  right.color)  + '; ';

    // luckysheet doesn't model diagonal borders in borderInfo / cell data, so
    // diagonalBorder is always null. The downstream SVG path stays in place
    // for forward compatibility but won't fire.
    return { borderStyle: borderStyle, diagonalBorder: null };
}

// Port of luckysheet's internal zc() border resolver (see vendor/luckysheet/
// luckysheet.umd.js). Builds a map keyed by 'r_c' with each cell's resolved
// {l, r, t, b} sides — each side is {color, style} (set), null (explicitly
// cleared), or undefined (no border). Iterates borderInfo in array order so
// later entries override earlier ones, matching luckysheet's canvas rendering.
function computeBorderMap(borderInfo, data, mergeLookup, maxRow, maxCol) {
    const o = {};
    if (!borderInfo || borderInfo.length === 0) return o;

    const rowMax = maxRow - 1;
    const colMax = maxCol - 1;

    function getMergeOf(rr, cc) {
        const cell = data[rr] && data[rr][cc];
        if (cell && typeof cell === 'object' && cell.mc) {
            return mergeLookup[cell.mc.r + '_' + cell.mc.c] || null;
        }
        return null;
    }

    function ensure(k) {
        if (!o[k]) o[k] = {};
        return o[k];
    }

    function setNeighbor(nr, nc, side, val) {
        if (nr < 0 || nr > rowMax || nc < 0 || nc > colMax) return;
        const nk = nr + '_' + nc;
        if (!o[nk]) return; // luckysheet only sets neighbor sides when the neighbor entry exists
        const nm = getMergeOf(nr, nc);
        if (nm) {
            // For merged neighbor, only set if this cell is on the relevant edge of the merge
            if (side === 'b' && nm.r + nm.rs - 1 !== nr) return;
            if (side === 't' && nm.r !== nr) return;
            if (side === 'r' && nm.c + nm.cs - 1 !== nc) return;
            if (side === 'l' && nm.c !== nc) return;
        }
        o[nk][side] = val;
    }

    for (let i = 0; i < borderInfo.length; i++) {
        const entry = borderInfo[i];
        if (entry.rangeType === 'range') {
            const borderType = entry.borderType;
            const sv = { color: entry.color, style: entry.style };
            const ranges = entry.range || [];

            for (const rng of ranges) {
                let g = rng.row[0], v = rng.row[1];
                let y = rng.column[0], b = rng.column[1];
                if (g < 0) g = 0;
                if (v > rowMax) v = rowMax;
                if (y < 0) y = 0;
                if (b > colMax) b = colMax;

                if (borderType === 'border-left') {
                    for (let r = g; r <= v; r++) {
                        ensure(r + '_' + y).l = sv;
                        setNeighbor(r, y - 1, 'r', sv);
                    }
                } else if (borderType === 'border-right') {
                    for (let r = g; r <= v; r++) {
                        ensure(r + '_' + b).r = sv;
                        setNeighbor(r, b + 1, 'l', sv);
                    }
                } else if (borderType === 'border-top') {
                    for (let c = y; c <= b; c++) {
                        ensure(g + '_' + c).t = sv;
                        setNeighbor(g - 1, c, 'b', sv);
                    }
                } else if (borderType === 'border-bottom') {
                    for (let c = y; c <= b; c++) {
                        ensure(v + '_' + c).b = sv;
                        setNeighbor(v + 1, c, 't', sv);
                    }
                } else if (borderType === 'border-all') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            const k = r + '_' + c;
                            const m = getMergeOf(r, c);
                            if (m) {
                                if (m.r === r) ensure(k).t = sv;
                                if (m.r + m.rs - 1 === r) ensure(k).b = sv;
                                if (m.c === c) ensure(k).l = sv;
                                if (m.c + m.cs - 1 === c) ensure(k).r = sv;
                            } else {
                                const e = ensure(k);
                                e.l = sv; e.r = sv; e.t = sv; e.b = sv;
                            }
                            // Outer-edge propagation to neighbors of the range bounding box
                            if (r === g) setNeighbor(g - 1, c, 'b', sv);
                            if (r === v) setNeighbor(v + 1, c, 't', sv);
                            if (c === y) setNeighbor(r, y - 1, 'r', sv);
                            if (c === b) setNeighbor(r, b + 1, 'l', sv);
                        }
                    }
                } else if (borderType === 'border-outside') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            if (r !== g && r !== v && c !== y && c !== b) continue;
                            if (r === g) {
                                ensure(r + '_' + c).t = sv;
                                setNeighbor(g - 1, c, 'b', sv);
                            }
                            if (r === v) {
                                ensure(r + '_' + c).b = sv;
                                setNeighbor(v + 1, c, 't', sv);
                            }
                            if (c === y) {
                                ensure(r + '_' + c).l = sv;
                                setNeighbor(r, y - 1, 'r', sv);
                            }
                            if (c === b) {
                                ensure(r + '_' + c).r = sv;
                                setNeighbor(r, b + 1, 'l', sv);
                            }
                        }
                    }
                } else if (borderType === 'border-inside') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            const k = r + '_' + c;
                            const m = getMergeOf(r, c);
                            // Range corners — skip merged origin to mirror zc() behavior
                            if (r === g && c === y) {
                                if (m) continue;
                                const e = ensure(k); e.r = sv; e.b = sv;
                            } else if (r === v && c === y) {
                                if (m) continue;
                                const e = ensure(k); e.r = sv; e.t = sv;
                            } else if (r === g && c === b) {
                                if (m) continue;
                                const e = ensure(k); e.l = sv; e.b = sv;
                            } else if (r === v && c === b) {
                                if (m) continue;
                                const e = ensure(k); e.l = sv; e.t = sv;
                            } else if (r === g) {
                                if (m) {
                                    if (m.c === c) ensure(k).l = sv;
                                    else if (m.c + m.cs - 1 === c) ensure(k).r = sv;
                                } else {
                                    const e = ensure(k); e.l = sv; e.r = sv; e.b = sv;
                                }
                            } else if (r === v) {
                                if (m) {
                                    if (m.c === c) ensure(k).l = sv;
                                    else if (m.c + m.cs - 1 === c) ensure(k).r = sv;
                                } else {
                                    const e = ensure(k); e.l = sv; e.r = sv; e.t = sv;
                                }
                            } else if (c === y) {
                                if (m) {
                                    if (m.r === r) ensure(k).t = sv;
                                    else if (m.r + m.rs - 1 === r) ensure(k).b = sv;
                                } else {
                                    const e = ensure(k); e.r = sv; e.t = sv; e.b = sv;
                                }
                            } else if (c === b) {
                                if (m) {
                                    if (m.r === r) ensure(k).t = sv;
                                    else if (m.r + m.rs - 1 === r) ensure(k).b = sv;
                                } else {
                                    const e = ensure(k); e.l = sv; e.t = sv; e.b = sv;
                                }
                            } else {
                                if (m) {
                                    if (m.r === r) ensure(k).t = sv;
                                    else if (m.r + m.rs - 1 === r) ensure(k).b = sv;
                                    if (m.c === c) ensure(k).l = sv;
                                    else if (m.c + m.cs - 1 === c) ensure(k).r = sv;
                                } else {
                                    const e = ensure(k); e.l = sv; e.r = sv; e.t = sv; e.b = sv;
                                }
                            }
                        }
                    }
                } else if (borderType === 'border-horizontal') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            const k = r + '_' + c;
                            const m = getMergeOf(r, c);
                            if (r === g) {
                                if (!m) ensure(k).b = sv;
                            } else if (r === v) {
                                if (!m) ensure(k).t = sv;
                            } else if (m) {
                                if (m.r === r) ensure(k).t = sv;
                                else if (m.r + m.rs - 1 === r) ensure(k).b = sv;
                            } else {
                                const e = ensure(k); e.t = sv; e.b = sv;
                            }
                        }
                    }
                } else if (borderType === 'border-vertical') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            const k = r + '_' + c;
                            const m = getMergeOf(r, c);
                            if (c === y) {
                                if (!m) ensure(k).r = sv;
                            } else if (c === b) {
                                if (!m) ensure(k).l = sv;
                            } else if (m) {
                                if (m.c === c) ensure(k).l = sv;
                                else if (m.c + m.cs - 1 === c) ensure(k).r = sv;
                            } else {
                                const e = ensure(k); e.l = sv; e.r = sv;
                            }
                        }
                    }
                } else if (borderType === 'border-none') {
                    for (let r = g; r <= v; r++) {
                        for (let c = y; c <= b; c++) {
                            delete o[r + '_' + c];
                            if (r === g && g - 1 >= 0 && o[(g - 1) + '_' + c]) delete o[(g - 1) + '_' + c].b;
                            if (r === v && v + 1 <= rowMax && o[(v + 1) + '_' + c]) delete o[(v + 1) + '_' + c].t;
                            if (c === y && y - 1 >= 0 && o[r + '_' + (y - 1)]) delete o[r + '_' + (y - 1)].r;
                            if (c === b && b + 1 <= colMax && o[r + '_' + (b + 1)]) delete o[r + '_' + (b + 1)].l;
                        }
                    }
                }
            }
        } else if (entry.rangeType === 'cell') {
            const v = entry.value || {};
            const fr = v.row_index;
            const fc = v.col_index;
            if (fr == null || fc == null) continue;
            if (fr < 0 || fr > rowMax || fc < 0 || fc > colMax) continue;

            const hasAny = v.l != null || v.r != null || v.t != null || v.b != null;
            if (!hasAny) {
                delete o[fr + '_' + fc];
                continue;
            }

            const k = fr + '_' + fc;
            const ent = ensure(k);
            const m = getMergeOf(fr, fc);

            // Merge edge filter — luckysheet only writes a side when this cell is
            // on the merge edge that aligns with that side.
            const allowL = !m || fc === m.c;
            const allowR = !m || fc === m.c + m.cs - 1;
            const allowT = !m || fr === m.r;
            const allowB = !m || fr === m.r + m.rs - 1;

            if (v.l != null && allowL) {
                ent.l = { color: v.l.color, style: v.l.style };
                setNeighbor(fr, fc - 1, 'r', { color: v.l.color, style: v.l.style });
            } else {
                ent.l = null;
            }
            if (v.r != null && allowR) {
                ent.r = { color: v.r.color, style: v.r.style };
                setNeighbor(fr, fc + 1, 'l', { color: v.r.color, style: v.r.style });
            } else {
                ent.r = null;
            }
            if (v.t != null && allowT) {
                ent.t = { color: v.t.color, style: v.t.style };
                setNeighbor(fr - 1, fc, 'b', { color: v.t.color, style: v.t.style });
            } else {
                ent.t = null;
            }
            if (v.b != null && allowB) {
                ent.b = { color: v.b.color, style: v.b.style };
                setNeighbor(fr + 1, fc, 't', { color: v.b.color, style: v.b.style });
            } else {
                ent.b = null;
            }
        }
    }

    return o;
}

function getBorderString(style, color) {
    const s = Number(style);
    // Luckysheet border style number → name → CSS
    // 1:Thin  2:Hair  3:Dotted  4:Dashed  5:DashDot  6:DashDotDot
    // 7:Double  8:Medium  9:MediumDashed  10:MediumDashDot
    // 11:MediumDashDotDot  12:SlantedDashDot  13:Thick
    switch (s) {
        case 1:  return '1px solid ' + color;         // Thin
        case 2:  return '1px dotted ' + color;        // Hair (hairline dotted in Excel)
        case 3:  return '1px dotted ' + color;        // Dotted
        case 4:  return '1px dashed ' + color;        // Dashed
        case 5:  return '1px dashed ' + color;        // DashDot (CSS ≈ dashed)
        case 6:  return '1px dashed ' + color;        // DashDotDot (CSS ≈ dashed)
        case 7:  return '3px double ' + color;        // Double
        case 8:  return '2px solid ' + color;         // Medium
        case 9:  return '2px dashed ' + color;        // MediumDashed
        case 10: return '2px dashed ' + color;        // MediumDashDot (CSS ≈ dashed)
        case 11: return '2px dashed ' + color;        // MediumDashDotDot (CSS ≈ dashed)
        case 12: return '2px dashed ' + color;        // SlantedDashDot (CSS ≈ dashed)
        case 13: return '3px solid ' + color;         // Thick
        default: return '1px solid ' + color;
    }
}

function createDiagonalBorderSVG(diagonalBorder, width, height) {
    const type = diagonalBorder.type;
    const strokeWidth = parseInt(getBorderString(diagonalBorder.style, '#000').match(/^(\d+)px/)?.[1]) || 1;
    const color = diagonalBorder.color || '#000000';
    
    let lines = '';
    
    if (type === 1 || type === 3) {
        lines += '<line x1="0" y1="0" x2="100%" y2="100%" stroke="' + color + '" stroke-width="' + strokeWidth + '" />';
    }
    
    if (type === 2 || type === 3) {
        lines += '<line x1="0" y1="100%" x2="100%" y2="0" stroke="' + color + '" stroke-width="' + strokeWidth + '" />';
    }
    
    return '<svg style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none;">' + lines + '</svg>';
}

function escapeHtml(text) {
    if (text === null || text === undefined) return '';
    const map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };
    return String(text).replace(/[&<>"']/g, m => map[m]);
}