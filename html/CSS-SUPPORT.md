# CSS Support Status

สถานะการรองรับ CSS ใน pipeline **HTML → JSON → Flutter** (runtime) และ **HTML → Dart widget code** (static codegen)

ไฟล์หลัก:
- [js/style-parser.js](js/style-parser.js) — CSS value parser (units, colors, borders)
- [js/json-generator.js](js/json-generator.js) — AST → JSON (สำหรับ form_renderer runtime)
- [js/generator.js](js/generator.js) — AST → Dart widget code (static)
- [../html_preview/lib/form_renderer.dart](../html_preview/lib/form_renderer.dart) — JSON → Flutter widgets (runtime)

---

## 📋 Quick Reference — ใช้ได้ / ใช้ไม่ได้ (ณ 2026-04-24)

### Position — ใช้ได้ ✅

| CSS | รองรับ | หมายเหตุ |
|---|:---:|---|
| `position: relative` (parent) | ✅ | ต้องมี `position:absolute` child อย่างน้อย 1 ตัวถึงจะ activate Stack |
| `position: absolute` (child ของ relative parent) | ✅ | emit เป็น `Positioned` |
| `left/top/right/bottom: Npx` | ✅ | px only |
| `width/height: Npx` บน absolute | ✅ | px only |
| Stretch (`left:0; right:0; top:0; bottom:0`) | ✅ | optimize เป็น `Positioned.fill()` |
| Mix absolute + normal flow children | ✅ | normal render ปกติ, absolute ซ้อนทับ |
| Over-constrained (left+right+width) | ✅ | auto drop `right` |
| Over-constrained (top+bottom+height) | ✅ | auto drop `bottom` |

### Position — ใช้ไม่ได้ ❌

| CSS | สถานะ | Workaround / Phase |
|---|:---:|---|
| `position: fixed` | ❌ | pass-through เป็น flow element — Phase 4+ |
| `position: sticky` | ❌ | เช่นกัน |
| `left/top/right/bottom: N%` | ❌ | ถูก ignore — Phase 2 |
| `width/height: N%` บน absolute | ❌ | ถูก ignore — Phase 2 |
| `left/top: Nvh/Nvw` | ❌ | Phase 2 (infra พร้อม) |
| `max-width/max-height` บน absolute | ❌ | Phase 2 |
| `min-width/min-height` บน absolute | ❌ | Phase 2 |
| `margin: auto` บน absolute (center in containing block) | ❌ | Phase 2 |
| Centering hack `top:50%; left:50%; transform:translate(-50%,-50%)` | ❌ | Phase 2 (pattern detection) |
| `z-index: N` (real ordering) | ❌ | ใช้ paint order (ลำดับ children) แทน |
| Nested absolute (absolute inside absolute) | ❌ | inner ถูก filter — Phase 3+ |
| Absolute ไม่มี relative parent | ❌ | **ยังคง filter ออกตามเดิม** (กัน anchor ผิด) |
| `calc(...)` ใน offset/size | ❌ | ไม่ parse — Phase 4+ |
| Deep containing block chain (absolute → ancestor ไกลกว่า direct parent) | ❌ | Phase 3+ |

### Padding/Margin — ใช้ได้ ✅ (Phase 1a)

| CSS | รองรับ | หมายเหตุ |
|---|:---:|---|
| `padding/margin: Npx` (px, pt, em, rem) | ✅ | ของเดิม (pt/em/rem convert เป็น px) |
| `padding/margin: N%` | ✅ | resolve เป็น N% ของ parent width ผ่าน LayoutBuilder |
| `padding/margin: Nvh/Nvw` | ✅ | resolve ผ่าน MediaQuery |
| `margin: 0 auto` (horizontal center) | ✅ | wrap ด้วย `Align(topCenter)` |
| `margin-left: auto` / `margin-right: auto` | ✅ | wrap ด้วย `Align(topRight)` / `Align(topLeft)` |
| `padding/margin` shorthand (1-4 ค่า) | ✅ | style-parser expand ให้ |

### Padding/Margin — ใช้ไม่ได้ ❌

| CSS | สถานะ | หมายเหตุ |
|---|:---:|---|
| `padding/margin` ใน text/heading (P, H1-H6) เมื่อเป็น % | ⚠️ | **degrade เป็น 0** (ไม่ crash แต่ responsive หาย) เพราะ path ไม่มี LayoutBuilder |
| Negative margin (`margin-top: -10px`) | ❌ | parseDimension ไม่รับ negative |
| `calc()` ใน padding/margin | ❌ | Phase 4+ |

### Width/Height (non-absolute) — สถานะปัจจุบัน

| CSS | สถานะ | หมายเหตุ |
|---|:---:|---|
| `width: Npx` (px, pt, em, rem) | ✅ | ของเดิม |
| `width: 100%` | ✅ | → `double.infinity` |
| `width: N%` ที่ N ≠ 100 | ⚠️ | **bug เดิม** — กลายเป็น `double.infinity` (ผิด) |
| `height: Npx` | ✅ | ของเดิม |
| `height: N%` | ❌ | ignore |

### Display/Flex

| CSS | สถานะ |
|---|:---:|
| `display: flex/inline-flex` | ❌ (Phase 3) |
| `flex-direction`, `justify-content`, `align-items`, `gap` | ❌ (Phase 3) |
| `flex-grow`, `flex-shrink`, `flex-basis`, `flex` shorthand | ❌ (Phase 3) |
| `display: grid` | ❌ (ยังไม่มีแผน) |

### Transform

| CSS | สถานะ |
|---|:---:|
| `transform: rotate(Ndeg)` | ✅ (ของเดิม) |
| `transform: translate/scale/skew/matrix` | ❌ (Phase 4+) |

---

## HTML pattern ที่ใช้งานได้ตอนนี้

### ✅ Modal overlay คงที่
```html
<div style="position:relative; width:100%; height:500px">
  <div style="position:absolute; left:0; top:0; right:0; bottom:0; background:rgba(0,0,0,0.5)">
    overlay เต็ม parent
  </div>
</div>
```

### ✅ Tooltip/badge มุมคงที่
```html
<div style="position:relative; width:200px; height:100px">
  <p>content</p>
  <span style="position:absolute; right:0; top:0; width:30px; height:30px">badge</span>
</div>
```

### ✅ Pinned fixed-size box
```html
<div style="position:relative; width:400px; height:300px">
  <div style="position:absolute; left:0; top:100px; width:200px; height:100px">card</div>
</div>
```

### ✅ Centered fixed-width container (margin auto)
```html
<div style="margin: 0 auto; width: 400px; padding: 20px">
  content centered horizontally
</div>
```

### ✅ Responsive padding (%)
```html
<div style="padding: 5% 10%">
  padding ปรับตามขนาด parent
</div>
```

---

## HTML pattern ที่ยัง **ใช้ไม่ได้** (Phase 2+)

### ❌ Responsive modal 50% ของ parent
```html
<div style="position:relative; width:100%; height:500px">
  <div style="position:absolute; left:25%; top:25%; width:50%; height:50%">...</div>
</div>
<!-- % ใน offset/size บน absolute ยังไม่รองรับ -->
```

### ❌ Modal cap size + center (max + margin auto)
```html
<div style="position:relative; width:100%; height:100vh">
  <div style="position:absolute; left:0; top:0; right:0; bottom:0;
              max-width:400px; max-height:600px; margin:auto">
    responsive modal
  </div>
</div>
<!-- max-* + margin:auto บน absolute ยังไม่รองรับ -->
```

### ❌ Centered absolute (translate hack)
```html
<div style="position:relative">
  <div style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%)">
    center
  </div>
</div>
<!-- transform translate + % บน offset ยังไม่รองรับ -->
```

### ❌ Nested absolute
```html
<div style="position:relative">
  <div style="position:absolute; left:10">
    <div style="position:absolute; left:20">inner</div>  <!-- ถูก filter ทิ้ง -->
  </div>
</div>
```

### ❌ Absolute ไม่มี relative parent
```html
<div>
  <div style="position:absolute; left:10">orphan absolute</div>  <!-- ถูก filter ทิ้ง -->
</div>
```

### ❌ Fixed/Sticky
```html
<div style="position:fixed; bottom:10px; right:10px">floating button</div>
<!-- ถูกแปลงเป็น flow element ตามปกติ ไม่ตรึงกับ viewport -->
```

---

## Phase ปัจจุบัน

### ✅ Phase 0 — ของเดิม (ก่อน 2026-04-24)
- Box model: px เท่านั้น (width/height, padding/margin, border)
- Background color, font (size/weight/family/style), text-align, text-decoration
- Border: shorthand, per-side (top/right/bottom/left), border-radius, border-collapse
- Border logical properties (block/inline-start/end)
- Transform: `rotate(Ndeg)` อย่างเดียว
- Units: px, pt (1pt=1.33px), em/rem (1em=16px), basic vh/vw captured
- `width: 100%` → `double.infinity`
- **Table**: full support (% columns, colgroup, shrink, flex distribution, border-collapse, diagonal lines)

### ✅ Phase 1a — Padding/Margin Responsive (2026-04-24)
รายละเอียด commit: ดู backup files `backup/*_20260424_020000.*`

**เพิ่ม**:
- `padding/margin: N%` — resolve เป็น N% ของ parent width ผ่าน LayoutBuilder (ตาม CSS spec ทุกด้านใช้ parent width)
- `padding/margin: Nvh` / `Nvw` — resolve ผ่าน MediaQuery
- `margin: auto` / `margin: 0 auto` — detect horizontal centering, wrap ด้วย `Align(topCenter)`
- `margin-left: auto` / `margin-right: auto` — detect horizontal alignment (topLeft/topRight)

**JSON schema** (backward compat — เป็นได้ทั้ง number หรือ tagged object):
```jsonc
{
  "padding": {
    "top": 10,                     // number = px (ของเดิม)
    "right": { "t": "pct", "v": 10 },   // 10% of parent width
    "bottom": { "t": "vh", "v": 5 },    // 5vh
    "left": { "t": "auto" }             // margin only; centering hint
  }
}
```

**Widget wrap order** (outer → inner):
```
Transform.rotate?          (ถ้ามี rotateAngle)
  → LayoutBuilder?         (ถ้ามี %, vh, vw ใน padding/margin)
    → Align?               (ถ้ามี margin:auto — แทน UnconstrainedBox)
      → UnconstrainedBox?  (ถ้ามี fixed width และไม่มี margin:auto)
        → Container (padding/margin/decoration/width/height)
          → child
```

**Bug ที่ fix**:
- `padding: 10%` เดิมกลายเป็น `EdgeInsets.all(10)` (px) → ตอนนี้ resolve เป็น 10% จริง
- `margin: auto` เดิมถูก ignore → ตอนนี้ center ได้
- `padding: 5vh` เดิม unit ถูก drop → ตอนนี้ใช้ MediaQuery

**Degrade path**: Text/Heading (P, H1-H6) ไม่มี LayoutBuilder wrap → responsive values degrade เป็น 0 (ไม่ crash)

### ✅ Phase 1b — Position Absolute/Relative (2026-04-24)
รายละเอียด commit: ดู backup files `backup/*_20260424_030000.*`

**รองรับ**:
- `position: relative` parent + `position: absolute` direct children → `Stack` + `Positioned`
- `left/top/right/bottom: Npx` → `Positioned(left:N, top:N, ...)`
- `width: Npx` / `height: Npx` บน absolute element → `Positioned(..., width:N, height:N)`
- Stretch pattern (`left:0; right:0; top:0; bottom:0`) → `Positioned.fill()`
- Over-constrained resolution:
  - `left + right + width` → drop `right` (keep left+width)
  - `top + bottom + height` → drop `bottom` (keep top+height)

**JSON schema**:
```jsonc
// Relative parent
{
  "type": "container",   // wraps the stack for the parent's own decoration/padding
  "style": { "width": 400, "height": 300 },
  "child": {
    "type": "stack",
    "children": [
      // Absolute child
      {
        "type": "positioned",
        "left": 0, "top": 0, "right": 0, "bottom": 0,  // all optional px
        "width": 100, "height": 50,                     // optional px
        "child": { ... actual node ... }
      },
      // Non-absolute children pass through as regular Stack children
      { "type": "container", ... },
      { "type": "text", ... }
    ]
  }
}
```

**Activation rule (opt-in)**: emit `stack`/`positioned` เฉพาะเมื่อ parent มี `position: relative` **และ** มี child อย่างน้อยหนึ่งตัวที่ `position: absolute`
- ถ้า parent เป็น relative แต่ไม่มี absolute children → emit ปกติ (container) ไม่ wrap stack
- ถ้า absolute child อยู่ข้างนอก relative parent → ยังคง **filter ออก** (ของเดิม) เพื่อกัน anchor ผิด scope

---

## สิ่งที่ยัง ❌ ไม่รองรับ

### Position
- `position: fixed` — ไม่ handle (pass through as flow element)
- `position: sticky` — ไม่ handle เช่นกัน
- `max-width` / `max-height` บน absolute element — Phase 2
- `%` สำหรับ left/top/right/bottom/width/height บน absolute — Phase 2
- `vh/vw` สำหรับ offset — Phase 2
- `z-index` — ใช้ paint order (ลำดับใน children) เป็น z-order
- Nested absolute (absolute child → absolute grandchild) — grandchild จะถูก filter ตามเดิม
- Centering hack (`top:50%; left:50%; transform:translate(-50%,-50%)`) — Phase 2 ต้อง detect pattern
- `margin: auto` บน absolute element (centering in containing block)
- Containing block chain walking (absolute anchor ไปหา ancestor ที่ไกลกว่า direct parent)

### ทั่วไป
- `calc()` — ไม่มี evaluator (ทุก hack ที่ใช้ calc พัง)
- `width: N%` ที่ N ≠ 100 — แปลงเป็น `double.infinity` (ผิด แต่ของเดิมเป็นแบบนี้ — bug)
- `height: N%` ใน non-absolute context — ignore
- Transform อื่นๆ นอกจาก rotate — translate, scale, skew, matrix ไม่รองรับ
- CSS variables (`var(--x)`)
- Media queries — pipeline ไม่ parse `@media`

### Flex
- ยังไม่เริ่ม (Phase 2 หลัง position)

---

## Roadmap

### Phase 2 — Position Responsive (ยังไม่เริ่ม)
- `left/top/right/bottom: N%` + `Nvh/Nvw` — reuse `_parseBoxSide`/LayoutBuilder infra จาก Phase 1a
- `max-width/max-height` บน absolute — Align+ConstrainedBox+SizedBox.expand pattern
- `width/height: N%` บน absolute — ต้องแยก `parentH` จาก `parentW`
- Centering pattern detection (translate -50%, margin auto)

### Phase 3 — Flex
- `display: flex` + direction + justify + align + gap + basis + grow + shrink
- Reuse table's space distribution algorithm (`fixed + percent + flex` tri-partition)
- Node types ใหม่: `row`, `wrap` (Column มีแล้ว)
- ต้อง deploy form_renderer case ใหม่ก่อน json-generator emit type

### Phase 4 — calc() / transform / advanced positioning
- Expression evaluator สำหรับ `calc()`
- Full transform stack (translate, scale, skew)
- Nested containing block chain walking

---

## Backup convention (per project rule)

ทุกครั้งก่อนแก้ code ให้ backup file เดิมไปที่ `backup/` subfolder พร้อม timestamp:
- `html/js/backup/generator_YYYYMMDD_HHMMSS.js`
- `html/js/backup/json-generator_YYYYMMDD_HHMMSS.js`
- `html_preview/lib/backup/form_renderer_YYYYMMDD_HHMMSS.dart`

Timestamps ล่าสุด (ตามลำดับ):
- `20260423_010000` — ของเดิม (baseline Phase 0)
- `20260424_020000` — ก่อนเพิ่ม Padding/Margin responsive (Phase 1a)
- `20260424_030000` — ก่อนเพิ่ม Position absolute/relative (Phase 1b)
