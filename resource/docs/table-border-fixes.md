# Table Border & Cell Height Fixes

บันทึกการแก้ปัญหาที่เกี่ยวกับ table rendering ใน `generator.js` + `table-handler.js`

## ปัญหาที่แก้

### 1. Empty cell inflating row height (line 296-313 ใน `table-handler.js`)

**ปัญหาเดิม:**
```js
if (totalContentH === 0 && widgetContentH === 0) totalContentH = Math.ceil(effFontSize * 1.5);
```
Cell ที่ว่างเปล่าจริง (ไม่มี text/widget/block) ยัง fallback เป็น 1 line ของ font size ของ cell → ทำให้ row ที่มี cell ว่าง แต่มี font 16pt ถูก inflate เป็น 24px

**ที่แก้:**
```js
const cellIsEmpty = totalContentH === 0 && widgetContentH === 0;
const contentHForCell = cellIsEmpty ? Math.ceil(effFontSize * 1.5) : totalContentH;
// ใช้ contentHForCell สำหรับ cell's own rendered height
// แต่ row height calculation ใช้ pre-fallback value
const structuralLines = Math.max(1, Math.round(contentHForCell / Math.ceil(maxChildFs * 1.5)));
const contentH = Math.max(contentHForCell, widgetContentH);
const cellH = contentH + pt + pb + bt + bb;
maxCellHeight = Math.max(maxCellHeight, cellH);

if (!cellIsEmpty) {
  const textCellH = totalContentH + pt + pb + bt + bb;
  maxTextCellHeight = Math.max(maxTextCellHeight, textCellH);
}
```

**ผลลัพธ์:** cell ว่างไม่ contribute ต่อ `maxTextCellHeight` — row height ตาม content ที่มีจริง ไม่ใช่ฟอนต์ potential

---

### 2. Border conflict resolution — CSS 2.1 §17.6.2.1 (line 419-441 ใน `table-handler.js`)

**ปัญหาเดิม:** เมื่อ 2 cells ติดกันต่างมี border ที่ shared edge และ border มี style/width ต่างกัน — ต้องเลือกตัวที่ "ชนะ"

เช่น C17 มี `border-top: 2px solid` แต่ cell เหนือ (C16) มี `border-bottom: 1px solid` → ควรแสดง 2px (ไม่ใช่ 1px)

**ที่แก้ — เพิ่ม 2 methods:**

```js
// CSS priority order: hidden > any > none
// Width: ใหญ่กว่าชนะ
// Style rank: double(8) > solid(7) > dashed(6) > dotted(5) > ridge(4) > outset(3) > groove(2) > inset(1)
_borderSideWins(aStyles, aPrefix, bStyles, bPrefix) {
  if (!aStyles) return false;
  if (!bStyles) return true;
  const aStyle = (aStyles[`${aPrefix}Style`] || 'solid').toLowerCase();
  const bStyle = (bStyles[`${bPrefix}Style`] || 'solid').toLowerCase();
  if (aStyle === 'hidden') return true;
  if (bStyle === 'hidden') return false;
  if (aStyle === 'none') return false;
  if (bStyle === 'none') return true;
  const aW = StyleParser.parseDimension(aStyles[`${aPrefix}Width`] || '1px')?.value ?? 1;
  const bW = StyleParser.parseDimension(bStyles[`${bPrefix}Width`] || '1px')?.value ?? 1;
  if (aW !== bW) return aW > bW;
  const order = { double: 8, solid: 7, dashed: 6, dotted: 5, ridge: 4, outset: 3, groove: 2, inset: 1 };
  return (order[aStyle] ?? 0) > (order[bStyle] ?? 0);
},

// Overwrite neighbor's border side with current cell's winning side
// Also merge borderDash (สำหรับ dashed/dotted/double ต้อง preserve style info)
_overwriteNeighborSide(neighborPlacement, neighborSide, sourceStyles, sourcePrefix) {
  const info = StyleParser.borderSideInfo(sourcePrefix, sourceStyles);
  if (!info) return;
  let updated = this.removeBorderSide(neighborPlacement.style?.cellBorder, neighborSide);
  updated = this.addBorderSide(updated, neighborSide, info.side);
  const prevDash = neighborPlacement.style?.borderDash || null;
  const nextDashEntry = info.cssStyle !== 'solid'
    ? { cssStyle: info.cssStyle, width: info.width, color: info.flutterColor }
    : null;
  const mergedDash = (prevDash || nextDashEntry)
    ? { ...(prevDash || {}), [neighborSide]: nextDashEntry }
    : null;
  const patch = { cellBorder: updated };
  if (mergedDash && Object.values(mergedDash).some(v => v)) patch.borderDash = mergedDash;
  else if (prevDash) patch.borderDash = null;
  neighborPlacement.style = neighborPlacement.style.copyWith(patch);
},
```

**ใช้ตอน cell processing:**
```js
let drawTop  = rowIdx === 0 || !abovePlacement || !aboveHasBottom;
let drawLeft = colIdx === 0 || !leftPlacement  || !leftHasRight;

// ถ้า neighbor ชนะ → skip ไม่ต้องวาด (ปล่อยให้ post-processing จัดการ)
// ถ้า cell ปัจจุบันชนะ → overwrite neighbor ด้วย side ของตัวเอง
if (!drawTop && abovePlacement && this._borderSideWins(cell.styles, 'borderTop', abovePlacement.cell?.styles, 'borderBottom')) {
  this._overwriteNeighborSide(abovePlacement, 'bottom', cell.styles, 'borderTop');
}
if (!drawLeft && leftPlacement && this._borderSideWins(cell.styles, 'borderLeft', leftPlacement.cell?.styles, 'borderRight')) {
  this._overwriteNeighborSide(leftPlacement, 'right', cell.styles, 'borderLeft');
}
```

**ผลลัพธ์:** ที่ shared edge ของ 2 cells ที่มี border ต่างกัน — แสดงเส้นที่ "ชนะ" ตาม CSS spec

---

### 3. Double border support (`_DashSide.doubled` + `_drawDouble`)

**ใน generator.js:**

เพิ่ม `doubled` parameter ใน `_DashSide` class:
```dart
class _DashSide {
  final Color color;
  final double width;
  final bool dotted;
  final bool doubled;
  final String side;

  const _DashSide._(this.side, {required this.color, required this.width, this.dotted = false, this.doubled = false});
  const _DashSide.top({required Color color, required double width, bool dotted = false, bool doubled = false})
    : this._('top', color: color, width: width, dotted: dotted, doubled: doubled);
  // ... bottom/left/right เหมือนกัน
}
```

เพิ่ม `_drawDouble()` method ใน `_DashedBorderPainter`:
```dart
// CSS "double": สองเส้น parallel หนา W/3 กัน gap W/3 รวม visual = W
void _drawDouble(Canvas canvas, _DashSide s, Size size) {
  final lineW = s.width / 3.0;
  final paint = Paint()..color = s.color..strokeWidth = lineW..style = PaintingStyle.stroke;
  final outer = lineW / 2.0;
  final inner = s.width - lineW / 2.0;
  switch (s.side) {
    case 'top':
      canvas.drawLine(Offset(0, outer), Offset(size.width, outer), paint);
      canvas.drawLine(Offset(0, inner), Offset(size.width, inner), paint);
      break;
    // ... bottom/left/right
  }
}
```

ใน `paint()` เพิ่ม branch:
```dart
if (s.doubled) {
  _drawDouble(canvas, s, size);
  continue;
}
```

**ใน table-handler.js renderCell:**
```js
const isDotted = info.cssStyle === 'dotted';
const isDoubled = info.cssStyle === 'double';
const args = [`color: ${info.color}`, `width: ${info.width}`];
if (isDotted) args.push(`dotted: true`);
if (isDoubled) args.push(`doubled: true`);
dashSides.push(`_DashSide.${side}(${args.join(', ')})`);
```

**ผลลัพธ์:** CSS `border-style: double` ใช้ได้จริงใน Flutter (ก่อนหน้านี้ Flutter `BorderSide` ไม่รองรับ double)

---

### 4. Textarea fills cell (line 1942-1944 ใน `table-handler.js`)

**ปัญหาเดิม:**
```js
const rows = node.rows || 3;
return `TextField(controller: ${ctrl}, maxLines: ${rows}, ...)`;
```
Textarea ถูกจำกัดที่ `rows=3` แม้ cell จริงจะสูงกว่า → เหลือช่องว่างด้านล่าง

**ที่แก้:**
```js
return `TextField(controller: ${ctrl}, maxLines: null, minLines: null, expands: true, textAlignVertical: TextAlignVertical.top, style: ..., decoration: _inputDecoration)`;
```

**ผลลัพธ์:** textarea ขยายเต็ม cell — HTML `rows` attribute เป็นแค่ hint ของ designer ส่วน cell height เป็นตัวกำหนดจริง

---

## Files changed

- `html/js/generator.js` — `_DashSide.doubled`, `_drawDouble()`
- `html/js/table-handler.js` — empty cell check, `_borderSideWins()`, `_overwriteNeighborSide()`, double border gen, textarea expands

## Testing notes

- Border overlap: HTML ที่มี cell ติดกัน ทั้ง 2 ตัวมี border ต่าง style/width → ต้องเห็นเส้นเดียวที่ "ชนะ"
- Empty cell: row ที่มี cell ว่าง (ไม่มี content) แม้ font-size ใหญ่ ต้องไม่ inflate row height
- Double border: `border-style: double` ต้อง render เป็น 2 เส้น parallel
- Textarea: cell textarea ที่ cell สูงกว่า HTML rows → textarea ขยายเต็ม cell
