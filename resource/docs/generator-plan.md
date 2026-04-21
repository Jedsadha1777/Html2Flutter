# Generator Enhancement Plan

เป้าหมาย: ทำให้ generator gen dart file ที่พร้อมใช้แบบ `report_content.dart` (มี snapMode, state binding, controllerMap, captureKey)

## Scope

แก้ที่ `html/js/generator.js` (หรือ `table-handler.js`) ให้ output มี 6 ส่วนเพิ่ม ไม่แตะ business logic (save/send/pdf)

---

## สิ่งที่ gen ปัจจุบัน (form1.dart)

```dart
class _ContentWidgetState extends State<_ContentWidget> {
  final _formNoController = TextEditingController();
  final _customerNameController = TextEditingController();
  // ... controllers ...

  @override
  Widget build(BuildContext context) => UnconstrainedBox(
    child: LayoutBuilder(builder: (ctx, c) {
      // ... layout + Stack + cells ...
      return Stack(children: [
        cell(..., child: TextField(
          controller: _formNoController,
          decoration: const InputDecoration(border: OutlineInputBorder(), ...),  // ← hardcoded
        )),
        cell(..., child: FormDate(name: 'form-date', readonly: true)),  // ← ไม่ bind state
        cell(..., child: FormSearch(name: 'machine_model', ...)),       // ← ไม่ bind state
        cell(..., child: FormSignature(name: 'customer-sign')),         // ← ไม่ bind state
      ]);
    }),
  );
}
```

## เป้าหมาย (แบบ report_content.dart)

```dart
class _ContentWidgetState extends State<_ContentWidget> {
  bool _snapMode = false;
  final GlobalKey _captureKey = GlobalKey();

  // Non-controller state for FormDate/FormSearch/FormSignature
  String? _formDate;
  String? _machineModelSearch;
  String? _installDate;
  String? _inspectionDate;
  Uint8List? _customerSignBytes;
  Uint8List? _engineerSignBytes;

  // Controllers
  final _formNoController = TextEditingController();
  // ...

  // Snap-aware decoration
  InputDecoration get _inputDecoration => _snapMode
    ? const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4))
    : const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8));

  // Controller map for save/load
  Map<String, TextEditingController> get _controllerMap => {
    'formNo': _formNoController,
    'customerName': _customerNameController,
    // ...
  };

  @override
  void dispose() {
    for (final c in _controllerMap.values) { c.dispose(); }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    key: _captureKey,
    child: UnconstrainedBox(
      child: LayoutBuilder(builder: (ctx, c) {
        // ... layout ...
        return Stack(children: [
          cell(..., child: TextField(
            controller: _formNoController,
            decoration: _inputDecoration,  // ← ใช้ getter
          )),
          cell(..., child: FormDate(
            name: 'form-date',
            readonly: true,
            snapMode: _snapMode,
            value: _formDate,
            onChanged: (v) => setState(() => _formDate = v),
          )),
          cell(..., child: FormSearch(
            name: 'machine_model',
            source: 'machines',
            snapMode: _snapMode,
            value: _machineModelSearch,
            onSelected: (v) => setState(() => _machineModelSearch = v?['machine_model'] as String?),
          )),
          cell(..., child: FormSignature(
            name: 'customer-sign',
            initialData: _customerSignBytes,
            onSigned: (v) => setState(() => _customerSignBytes = v),
          )),
        ]);
      }),
    ),
  );
}
```

---

## แผนแก้ทีละข้อ

### ข้อ 1: Non-controller state fields

**ไฟล์:** `html/js/generator.js` → `generateStateVariables(context)`

**ปัจจุบัน:**
```js
generateStateVariables(context) {
  const lines = [];
  for (const [name, info] of context.dropdowns) { ... }
  for (const [name] of context.checkboxes) { ... }
  return lines.join('\n');
}
```

**ที่ต้องเพิ่ม:** track field types ใหม่ใน `context`:
- `context.dateFields` → `Set<String>` — ชื่อ FormDate ทั้งหมด (จาก `[date xxx]`)
- `context.searchFields` → `Set<String>` — ชื่อ FormSearch (จาก `[search xxx]`)
- `context.signatureFields` → `Set<String>` — ชื่อ FormSignature (จาก `[signature xxx]`)

**เพิ่ม generator logic:**
```js
for (const name of context.dateFields) {
  lines.push(`String? ${toVar(name)};`);
}
for (const name of context.searchFields) {
  lines.push(`String? ${toVar(name)};`);
}
for (const name of context.signatureFields) {
  lines.push(`Uint8List? ${toVar(name)}Bytes;`);
}
```

**ต้องเพิ่ม import** `import 'dart:typed_data';` เมื่อมี signature

---

### ข้อ 2: Form widgets bind state

**ไฟล์:** `html/js/table-handler.js` → `datepickerWidget`, `searchWidget`, `signatureWidget`

**ปัจจุบัน (ตัวอย่าง signature):**
```js
return `FormSignature(${props.join(', ')})`;
// props: ["name: 'customer-sign'"]
```

**ที่ต้องเพิ่ม:**

#### FormDate:
```dart
FormDate(
  name: 'form-date',
  readonly: true,  // เดิม
  snapMode: _snapMode,                                    // ← ใหม่
  value: _formDate,                                        // ← ใหม่
  onChanged: (v) => setState(() => _formDate = v),         // ← ใหม่
)
```

#### FormSearch:
```dart
FormSearch(
  name: 'machine_model',
  source: 'machines',           // เดิม
  displayFields: 'code,name',   // เดิม
  fields: 'machine_model',      // เดิม
  required: true,               // เดิม
  snapMode: _snapMode,                                     // ← ใหม่
  value: _machineModelSearch,                              // ← ใหม่
  onSelected: (v) => setState(() => _machineModelSearch = v?['machine_model'] as String?),  // ← ใหม่
)
```

#### FormSignature:
```dart
FormSignature(
  name: 'customer-sign',
  initialData: _customerSignBytes,                         // ← ใหม่
  onSigned: (v) => setState(() => _customerSignBytes = v), // ← ใหม่
)
```

**ต้อง register field name ใน context** เพื่อ coordinate กับข้อ 1:
```js
datepickerWidget(node, context) {
  const name = node.name || 'date';
  context.dateFields = context.dateFields || new Set();
  context.dateFields.add(name);
  // ... build FormDate(...) string
}
```

---

### ข้อ 3: `_snapMode` + `_inputDecoration`

**ไฟล์:** `html/js/generator.js` → `generateStateVariables` + `generateBoilerplate`

**เพิ่มใน state variables:**
```dart
bool _snapMode = false;
final GlobalKey _captureKey = GlobalKey();

InputDecoration get _inputDecoration => _snapMode
  ? const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4))
  : const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8));
```

**Condition ที่จะ gen:** เมื่อมี controllers อย่างน้อย 1 ตัว หรือมี form widgets

---

### ข้อ 4: `TextField(decoration: _inputDecoration)`

**ไฟล์:** `html/js/table-handler.js` → `inputWidget`, `textareaWidget`

**ปัจจุบัน:**
```js
return `TextField(controller: ${controllerName}, style: ..., decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)))`;
```

**เปลี่ยนเป็น:**
```js
return `TextField(controller: ${controllerName}, style: ..., decoration: _inputDecoration)`;
```

**Note:** ไม่ต้อง `const` แล้วเพราะ `_inputDecoration` เป็น getter

---

### ข้อ 5: `_controllerMap` getter

**ไฟล์:** `html/js/generator.js` → `generateStateVariables`

**เพิ่มหลัง declare controllers:**
```dart
Map<String, TextEditingController> get _controllerMap => {
  'formNo': _formNoController,
  'customerName': _customerNameController,
  // ... ทุก controller
};
```

**Mapping key:** ใช้ name เดิมจาก HTML (กำจัด prefix เช่น `input-field-` → `formNo`)

**Pattern:** controller name `_xxxController` → key `xxx` (camelCase)

**เพิ่ม dispose ใน state:**
```dart
@override
void dispose() {
  for (final c in _controllerMap.values) { c.dispose(); }
  super.dispose();
}
```

---

### ข้อ 6: `RepaintBoundary(key: _captureKey)` wrap

**ไฟล์:** `html/js/generator.js` → `generateBoilerplate` / `generate`

**ปัจจุบัน:**
```dart
Widget build(BuildContext context) => UnconstrainedBox(
  alignment: Alignment.topLeft,
  child: LayoutBuilder(...)
);
```

**เปลี่ยนเป็น:**
```dart
Widget build(BuildContext context) => RepaintBoundary(
  key: _captureKey,
  child: UnconstrainedBox(
    alignment: Alignment.topLeft,
    child: LayoutBuilder(...)
  ),
);
```

**Condition:** gen เสมอ (เพราะไม่เสีย performance แต่เพิ่ม flexibility สำหรับ screenshot)

---

## Order of implementation

แนะนำเรียงตามนี้เพื่อลด risk:

1. **ข้อ 3** (`_snapMode` + `_inputDecoration`) — เพิ่ม state + getter, ยังไม่ใช้
2. **ข้อ 4** (TextField → `_inputDecoration`) — ใช้ getter แล้ว
3. **ข้อ 6** (`RepaintBoundary`) — wrap อย่างเดียว
4. **ข้อ 1** (non-controller state) — track field names
5. **ข้อ 2** (form widgets bind state) — ผูก value/onChanged
6. **ข้อ 5** (`_controllerMap`) — aggregate + dispose update

---

## Testing checklist

หลังแก้แต่ละข้อ:
- [ ] Gen file ใหม่จาก HTML (test_akt1.html)
- [ ] เทียบ diff กับ report_content.dart เฉพาะส่วนที่แก้
- [ ] run: `flutter run -d chrome -t lib/form1.dart` ไม่มี compile error
- [ ] Preview ปรากฏถูกต้องไม่ regression

## Backup strategy

ก่อนแก้แต่ละข้อ: `cp html/js/<file>.js html/js/backup/<file>_YYYYMMDD_HHMMSS.js`
