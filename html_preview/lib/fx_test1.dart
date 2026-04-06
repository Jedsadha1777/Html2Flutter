import 'package:flutter/material.dart';
import 'preview_shell.dart';

void main() => runApp(PreviewShell(pages: [_ContentWidget()]));

class _ContentWidget extends StatefulWidget {
  const _ContentWidget({super.key});
  @override
  State<_ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {

  // ============ CONTROLLERS ============
  final _textareaFieldA8Controller = TextEditingController();
  final _inputFieldE8Controller = TextEditingController();
  final _inputFieldC20Controller = TextEditingController();
  final _inputFieldF20Controller = TextEditingController();
  final _dateFieldI20Controller = TextEditingController();
  final _inputFieldJ20Controller = TextEditingController();
  final _inputFieldL20Controller = TextEditingController();
  final _inputFieldU20Controller = TextEditingController();
  final _dateFieldW20Controller = TextEditingController();
  final _dateFieldX20Controller = TextEditingController();
  final _inputFieldAA20Controller = TextEditingController();


  // ============ STATE VARIABLES ============
  String? _selectFieldY2 = 'Option 1';

  @override
  Widget build(BuildContext context) => UnconstrainedBox(
  alignment: Alignment.topLeft,
  child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 1785.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      186.0,
      42.0,
      54.0,
      61.0,
      107.0,
      42.0,
      105.0,
      154.0,
      76.0,
      76.0,
      76.0,
      42.0,
      42.0,
      63.0,
      26.0,
      69.0,
      42.0,
      42.0,
      42.0,
      50.0,
      50.0,
      48.0,
      57.0,
      57.0,
      42.0,
      42.0,
      42.0,
      50.0,
    ];

    final rowHeights = <double>[34.0, 65.0, 34.0, 66.0, 104.0, 35.0, 126.0, 96.0, 34.0, 34.0, 35.0, 36.0, 41.0, 66.0, 37.0, 126.0, 126.0, 126.0, 36.0, 96.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 96.0, 36.0];

    final cs = <double>[0.0];
    for (final w in colWidths) { cs.add(cs.last + w); }
    final rs = <double>[0.0];
    for (final h in rowHeights) { rs.add(rs.last + h); }

    final totalWidth = cs.last;
    final totalHeight = rs.last;

    Positioned cell(int c, int r, int ce, int re,
        {Border? border, Color? bg, EdgeInsets pad = EdgeInsets.zero,
        Alignment align = Alignment.centerLeft, required Widget child}) =>
      Positioned(left: cs[c], top: rs[r], width: cs[ce] - cs[c], height: rs[re] - rs[r],
          child: Container(
              decoration: (border != null || bg != null) ? BoxDecoration(border: border, color: bg) : null,
              padding: pad, alignment: align, child: child));

    final matrixData = <List<int>>[
      <int>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      <int>[1, 2, 3, 4, 5, 6, 7, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 22, 23, 23, 23, 23],
      <int>[24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51],
      <int>[52, 52, 52, 52, 53, 53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 55, 56, 56, 56, 57, 57, 57],
      <int>[58, 58, 58, 58, 59, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 62, 62, 62, 63, 63, 63],
      <int>[58, 58, 58, 58, 59, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 64, 64, 64, 65, 65, 65],
      <int>[66, 66, 66, 66, 67, 67, 67, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 76, 76, 76, 76, 76, 76, 77, 77, 77, 77, 77],
      <int>[78, 78, 78, 78, 79, 79, 79, 79, 80, 81, 81, 81, 81, 81, 81, 82, 83, 83, 83, 83, 83, 83, 83, 84, 84, 84, 84, 84],
      <int>[78, 78, 78, 78, 79, 79, 79, 79, 85, 81, 81, 81, 81, 81, 81, 86, 83, 83, 83, 83, 83, 83, 83, 84, 84, 84, 84, 84],
      <int>[78, 78, 78, 78, 79, 79, 79, 79, 87, 81, 81, 81, 81, 81, 81, 88, 83, 83, 83, 83, 83, 83, 83, 84, 84, 84, 84, 84],
      <int>[89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 106, 106, 106, 106, 106, 106, 106, 107, 107, 107],
      <int>[108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108, 108],
      <int>[109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109, 109],
      <int>[110, 110, 110, 110, 110, 110, 110, 110, 111, 111, 111, 111, 111, 111, 111, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123],
      <int>[124, 125, 126, 127, 128, 129, 130, 131, 132, 132, 132, 132, 132, 132, 132, 132, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133, 133],
      <int>[134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 134, 135, 135, 135, 135, 136, 136, 136, 136],
      <int>[137, 138, 139, 139, 139, 140, 140, 140, 141, 141, 141, 142, 142, 142, 142, 142, 142, 142, 142, 142, 143, 143, 144, 145, 146, 147, 148, 148],
      <int>[137, 138, 139, 139, 139, 140, 140, 140, 149, 150, 151, 142, 142, 142, 142, 142, 142, 142, 142, 142, 143, 143, 144, 145, 146, 147, 148, 148],
      <int>[152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152],
      <int>[153, 154, 155, 155, 155, 156, 156, 156, 157, 158, 159, 160, 160, 160, 160, 160, 160, 160, 160, 160, 161, 161, 162, 163, 164, 165, 166, 166],
      <int>[153, 167, 168, 168, 168, 169, 169, 169, 170, 171, 172, 173, 173, 173, 173, 173, 173, 173, 173, 173, 174, 174, 175, 176, 177, 178, 179, 179],
      <int>[180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180],
      <int>[181, 182, 183, 183, 183, 184, 184, 184, 185, 186, 187, 188, 188, 188, 188, 188, 188, 188, 188, 188, 189, 189, 190, 191, 192, 193, 194, 194],
      <int>[181, 195, 196, 196, 196, 197, 197, 197, 198, 199, 200, 201, 201, 201, 201, 201, 201, 201, 201, 201, 202, 202, 203, 204, 205, 206, 207, 207],
      <int>[208, 209, 210, 210, 210, 211, 211, 211, 212, 213, 214, 215, 215, 215, 215, 215, 215, 215, 215, 215, 216, 216, 217, 218, 219, 220, 221, 221],
      <int>[208, 222, 223, 223, 223, 224, 224, 224, 225, 226, 227, 228, 228, 228, 228, 228, 228, 228, 228, 228, 229, 229, 230, 231, 232, 233, 234, 234],
      <int>[235, 236, 237, 237, 237, 238, 238, 238, 239, 240, 241, 242, 242, 242, 242, 242, 242, 242, 242, 242, 243, 243, 244, 245, 246, 247, 248, 248],
      <int>[235, 249, 250, 250, 250, 251, 251, 251, 252, 253, 254, 255, 255, 255, 255, 255, 255, 255, 255, 255, 256, 256, 257, 258, 259, 260, 261, 261],
      <int>[262, 263, 264, 264, 264, 265, 265, 265, 266, 267, 268, 269, 269, 269, 269, 269, 269, 269, 269, 269, 270, 270, 271, 272, 273, 274, 275, 275],
      <int>[262, 276, 277, 277, 277, 278, 278, 278, 279, 280, 281, 282, 282, 282, 282, 282, 282, 282, 282, 282, 283, 283, 284, 285, 286, 287, 288, 288],
      <int>[289, 290, 291, 291, 291, 292, 292, 292, 293, 294, 295, 296, 296, 296, 296, 296, 296, 296, 296, 296, 297, 297, 298, 299, 300, 301, 302, 302],
      <int>[289, 303, 304, 304, 304, 305, 305, 305, 306, 307, 308, 309, 309, 309, 309, 309, 309, 309, 309, 309, 310, 310, 311, 312, 313, 314, 315, 315],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          cell(0, 0, 28, 1, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('QUALITY MANAGEMENT SYSTEM AND ITS PROCESS : (PROCESS APPROACH)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              )),






          cell(6, 1, 8, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(8, 1, 9, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(9, 1, 10, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), child: const SizedBox.shrink()),
          cell(10, 1, 11, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(11, 1, 12, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(12, 1, 13, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), child: const SizedBox.shrink()),
          cell(13, 1, 14, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(14, 1, 15, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(15, 1, 16, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(16, 1, 17, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(17, 1, 18, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(18, 1, 19, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(19, 1, 20, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(20, 1, 21, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(21, 1, 22, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          Positioned(left: cs[22], top: rs[1], width: cs[24] - cs[22], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Division / Team', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[1], width: cs[28] - cs[24], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF2F2F2), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DropdownButton<String>(value: _selectFieldY2, isDense: true, items: [DropdownMenuItem(value: 'Option 1', child: Text('Option 1', style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16))), DropdownMenuItem(value: 'Option 2', child: Text('Option 2', style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16))), DropdownMenuItem(value: 'Option 3', child: Text('Option 3', style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16)))], onChanged: (v) => setState(() => _selectFieldY2 = v)))),
          Positioned(left: cs[0], top: rs[2], width: cs[1] - cs[0], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[2], width: cs[2] - cs[1], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[2], width: cs[3] - cs[2], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[2], width: cs[4] - cs[3], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[2], width: cs[5] - cs[4], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[2], width: cs[6] - cs[5], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[2], width: cs[7] - cs[6], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[2], width: cs[8] - cs[7], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[2], width: cs[9] - cs[8], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[2], width: cs[10] - cs[9], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[2], width: cs[11] - cs[10], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[2], width: cs[12] - cs[11], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[2], width: cs[13] - cs[12], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[2], width: cs[14] - cs[13], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[2], width: cs[15] - cs[14], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[2], width: cs[16] - cs[15], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[2], width: cs[17] - cs[16], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[17], top: rs[2], width: cs[18] - cs[17], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[18], top: rs[2], width: cs[19] - cs[18], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[19], top: rs[2], width: cs[20] - cs[19], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[2], width: cs[21] - cs[20], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[21], top: rs[2], width: cs[22] - cs[21], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[2], width: cs[23] - cs[22], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[2], width: cs[24] - cs[23], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[2], width: cs[25] - cs[24], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[2], width: cs[26] - cs[25], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[2], width: cs[27] - cs[26], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[27], top: rs[2], width: cs[28] - cs[27], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[3], width: cs[4] - cs[0], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ทรัพยากรที่ต้องใช้ (Resources)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[4], top: rs[3], width: cs[6] - cs[4], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'จำนวน (amount)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[6], top: rs[3], width: cs[16] - cs[6], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('อำนาจหน้าที่ความรับผิดชอบ (Person in charge)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[16], top: rs[3], width: cs[22] - cs[16], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('อุปกรณ์ (equipment)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[22], top: rs[3], width: cs[25] - cs[22], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Prepare by', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[3], width: cs[28] - cs[25], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Approved by', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[0], top: rs[4], width: cs[4] - cs[0], height: rs[6] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[4], width: cs[6] - cs[4], height: rs[6] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[4], width: cs[16] - cs[6], height: rs[6] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[4], width: cs[22] - cs[16], height: rs[6] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[4], width: cs[25] - cs[22], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: Container(width: 200, height: 100, decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)), child: const Center(child: Text('[ Signature ]', style: TextStyle(color: Colors.grey)))))),
          Positioned(left: cs[25], top: rs[4], width: cs[28] - cs[25], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: Container(width: 200, height: 100, decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)), child: const Center(child: Text('[ Signature ]', style: TextStyle(color: Colors.grey)))))),
          Positioned(left: cs[22], top: rs[5], width: cs[25] - cs[22], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Date :', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[25], top: rs[5], width: cs[28] - cs[25], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Date :', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[0], top: rs[6], width: cs[4] - cs[0], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[4], top: rs[6], width: cs[8] - cs[4], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('In put', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),

          Positioned(left: cs[9], top: rs[6], width: cs[10] - cs[9], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[6], width: cs[11] - cs[10], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[6], width: cs[12] - cs[11], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[6], width: cs[13] - cs[12], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[6], width: cs[14] - cs[13], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[6], width: cs[15] - cs[14], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[6], width: cs[16] - cs[15], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[6], width: cs[23] - cs[16], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Out put', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[23], top: rs[6], width: cs[28] - cs[23], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[7], width: cs[4] - cs[0], height: rs[10] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _textareaFieldA8Controller, maxLines: 3, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[4], top: rs[7], width: cs[8] - cs[4], height: rs[10] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldE8Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[8], top: rs[7], width: cs[9] - cs[8], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[7], width: cs[15] - cs[9], height: rs[10] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[7], width: cs[16] - cs[15], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[7], width: cs[23] - cs[16], height: rs[10] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('[image-upload image-upload-field-Q8 source="upload"]', color: Color(0xFFFFFFFF)))),
          Positioned(left: cs[23], top: rs[7], width: cs[28] - cs[23], height: rs[10] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('[image-upload image-upload-field-X8]', color: Color(0xFFFFFFFF)))),
          Positioned(left: cs[8], top: rs[8], width: cs[9] - cs[8], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[8], width: cs[16] - cs[15], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[9], width: cs[9] - cs[8], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[9], width: cs[16] - cs[15], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[10], width: cs[1] - cs[0], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[10], width: cs[2] - cs[1], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[10], width: cs[3] - cs[2], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[10], width: cs[4] - cs[3], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[10], width: cs[5] - cs[4], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[10], width: cs[6] - cs[5], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[10], width: cs[7] - cs[6], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[10], width: cs[8] - cs[7], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[10], width: cs[9] - cs[8], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[10], width: cs[10] - cs[9], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[10], width: cs[11] - cs[10], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[10], width: cs[12] - cs[11], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[10], width: cs[13] - cs[12], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[10], width: cs[14] - cs[13], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[10], width: cs[15] - cs[14], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[10], width: cs[16] - cs[15], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[10], width: cs[17] - cs[16], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[17], top: rs[10], width: cs[25] - cs[17], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[10], width: cs[28] - cs[25], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[11], width: cs[28] - cs[0], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('1. เกณฑ์และวิธีการ/ ความรู้ที่จำเป็นในการควบคุม กระบวนการนี้ (Criteria and methods / knowledge needed to control this process.)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[0], top: rs[12], width: cs[28] - cs[0], height: rs[13] - rs[12], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[13], width: cs[8] - cs[0], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2. ดัชนีชี้วัดสมรรถนะและประเมินผลของกระบวนการ (Key Performance Indicator (KPI))', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[8], top: rs[13], width: cs[16] - cs[8], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('เป้าหมาย (Target)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[16], top: rs[13], width: cs[17] - cs[16], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Jan', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[17], top: rs[13], width: cs[18] - cs[17], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Feb', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[18], top: rs[13], width: cs[19] - cs[18], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Mar', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[19], top: rs[13], width: cs[20] - cs[19], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Apr', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[20], top: rs[13], width: cs[21] - cs[20], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('May', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[21], top: rs[13], width: cs[22] - cs[21], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Jun', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[22], top: rs[13], width: cs[23] - cs[22], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Jul', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[23], top: rs[13], width: cs[24] - cs[23], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Aug', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[13], width: cs[25] - cs[24], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Sep', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[13], width: cs[26] - cs[25], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Oct', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[26], top: rs[13], width: cs[27] - cs[26], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Nov', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[27], top: rs[13], width: cs[28] - cs[27], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Dec', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[0], top: rs[14], width: cs[1] - cs[0], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[14], width: cs[2] - cs[1], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[14], width: cs[3] - cs[2], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[14], width: cs[4] - cs[3], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[14], width: cs[5] - cs[4], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[14], width: cs[6] - cs[5], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[14], width: cs[7] - cs[6], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[14], width: cs[8] - cs[7], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[14], width: cs[16] - cs[8], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[14], width: cs[28] - cs[16], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[15], width: cs[20] - cs[0], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: '3.ความเสี่ยง / โอกาส ที่มีผลต่อความสอดคล้องของสินค้าและบริการ และความพึงพอใจของลูกค้า (Risks / Opportunities that Affect Product and Service Needs and Customer) Satisfaction', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[20], top: rs[15], width: cs[24] - cs[20], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('แผนงาน (Plan)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[15], width: cs[28] - cs[24], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'การประเมินประสิทธิผล (Evaluation of Effectiveness)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[16], width: cs[1] - cs[0], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'หัวข้อที่ใช้ประเมินความเสี่ยง Risk Evaluation Points', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[16], width: cs[2] - cs[1], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ข้อที่', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[16], width: cs[5] - cs[2], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'จุดอ่อนของกระบวนการ (Weak point )', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[16], width: cs[8] - cs[5], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ประเด็นความเสี่ยงที่พิจารณา Risk factors considered in the assessment', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[8], top: rs[16], width: cs[11] - cs[8], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('คะแนนประเมินความเสี่ยง', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[16], width: cs[20] - cs[11], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แนวทางการจัดการความเสี่ยง ( Action to address risk )', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[20], top: rs[16], width: cs[22] - cs[20], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ผู้รับผิดชอบ (PIC)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[22], top: rs[16], width: cs[23] - cs[22], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เริ่ม (Start)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[23], top: rs[16], width: cs[24] - cs[23], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เสร็จ (Finish)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[24], top: rs[16], width: cs[25] - cs[24], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('YES', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[16], width: cs[26] - cs[25], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('NO', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[26], top: rs[16], width: cs[28] - cs[26], height: rs[18] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แผนปรับปรุง Next Action', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[8], top: rs[17], width: cs[9] - cs[8], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'โอกาสเกิด (Likelihood)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[9], top: rs[17], width: cs[10] - cs[9], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ผลกระทบ (Impact)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[10], top: rs[17], width: cs[11] - cs[10], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ระดับความเสี่ยง (L x I)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[18], width: cs[28] - cs[0], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('ความเสี่ยงต่อเป้าหมาย', sz: 20.0))),
          Positioned(left: cs[0], top: rs[19], width: cs[1] - cs[0], height: rs[21] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[19], width: cs[2] - cs[1], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('1', sz: 20.0, align: TextAlign.center))),
          Positioned(left: cs[2], top: rs[19], width: cs[5] - cs[2], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldC20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[5], top: rs[19], width: cs[8] - cs[5], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldF20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[8], top: rs[19], width: cs[9] - cs[8], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: SizedBox(width: 160, child: TextField(controller: _dateFieldI20Controller, readOnly: true, decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), suffixIcon: Icon(Icons.calendar_today, size: 16)))))),
          Positioned(left: cs[9], top: rs[19], width: cs[10] - cs[9], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldJ20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[10], top: rs[19], width: cs[11] - cs[10], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('#VALUE!', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[19], width: cs[20] - cs[11], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldL20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[20], top: rs[19], width: cs[22] - cs[20], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldU20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[22], top: rs[19], width: cs[23] - cs[22], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: SizedBox(width: 160, child: TextField(controller: _dateFieldW20Controller, readOnly: true, decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), suffixIcon: Icon(Icons.calendar_today, size: 16)))))),
          Positioned(left: cs[23], top: rs[19], width: cs[24] - cs[23], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: SizedBox(width: 160, child: TextField(controller: _dateFieldX20Controller, readOnly: true, decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), suffixIcon: Icon(Icons.calendar_today, size: 16)))))),
          Positioned(left: cs[24], top: rs[19], width: cs[25] - cs[24], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[19], width: cs[26] - cs[25], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[19], width: cs[28] - cs[26], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: TextField(controller: _inputFieldAA20Controller, style: const TextStyle(fontFamily: 'Browallia New', fontSize: 16), decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8))))),
          Positioned(left: cs[1], top: rs[20], width: cs[2] - cs[1], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[20], width: cs[5] - cs[2], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[20], width: cs[8] - cs[5], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[20], width: cs[9] - cs[8], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[20], width: cs[10] - cs[9], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[20], width: cs[11] - cs[10], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[20], width: cs[20] - cs[11], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[20], width: cs[22] - cs[20], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[20], width: cs[23] - cs[22], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[20], width: cs[24] - cs[23], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[20], width: cs[25] - cs[24], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[20], width: cs[26] - cs[25], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[20], width: cs[28] - cs[26], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[21], width: cs[28] - cs[0], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('ความเสี่ยงต่อกระบวนการ', sz: 20.0))),
          Positioned(left: cs[0], top: rs[22], width: cs[1] - cs[0], height: rs[24] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Man (คน)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[22], width: cs[2] - cs[1], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[22], width: cs[5] - cs[2], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[22], width: cs[8] - cs[5], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[22], width: cs[9] - cs[8], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[22], width: cs[10] - cs[9], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[22], width: cs[11] - cs[10], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[22], width: cs[20] - cs[11], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[22], width: cs[22] - cs[20], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[22], width: cs[23] - cs[22], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[22], width: cs[24] - cs[23], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[22], width: cs[25] - cs[24], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[22], width: cs[26] - cs[25], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[22], width: cs[28] - cs[26], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[23], width: cs[2] - cs[1], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[23], width: cs[5] - cs[2], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[23], width: cs[8] - cs[5], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[23], width: cs[9] - cs[8], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[23], width: cs[10] - cs[9], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[23], width: cs[11] - cs[10], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[23], width: cs[20] - cs[11], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[23], width: cs[22] - cs[20], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[23], width: cs[23] - cs[22], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[23], width: cs[24] - cs[23], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[23], width: cs[25] - cs[24], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[23], width: cs[26] - cs[25], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[23], width: cs[28] - cs[26], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[24], width: cs[1] - cs[0], height: rs[26] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Machine (อุปกรณ์)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[24], width: cs[2] - cs[1], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[24], width: cs[5] - cs[2], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[24], width: cs[8] - cs[5], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[24], width: cs[9] - cs[8], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[24], width: cs[10] - cs[9], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[24], width: cs[11] - cs[10], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[24], width: cs[20] - cs[11], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[24], width: cs[22] - cs[20], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[24], width: cs[23] - cs[22], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[24], width: cs[24] - cs[23], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[24], width: cs[25] - cs[24], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[24], width: cs[26] - cs[25], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[24], width: cs[28] - cs[26], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[25], width: cs[2] - cs[1], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[25], width: cs[5] - cs[2], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[25], width: cs[8] - cs[5], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[25], width: cs[9] - cs[8], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[25], width: cs[10] - cs[9], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[25], width: cs[11] - cs[10], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[25], width: cs[20] - cs[11], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[25], width: cs[22] - cs[20], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[25], width: cs[23] - cs[22], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[25], width: cs[24] - cs[23], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[25], width: cs[25] - cs[24], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[25], width: cs[26] - cs[25], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[25], width: cs[28] - cs[26], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[26], width: cs[1] - cs[0], height: rs[28] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Method (วิธีการ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[26], width: cs[2] - cs[1], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[26], width: cs[5] - cs[2], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[26], width: cs[8] - cs[5], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[26], width: cs[9] - cs[8], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[26], width: cs[10] - cs[9], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[26], width: cs[11] - cs[10], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[26], width: cs[20] - cs[11], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[26], width: cs[22] - cs[20], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[26], width: cs[23] - cs[22], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[26], width: cs[24] - cs[23], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[26], width: cs[25] - cs[24], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[26], width: cs[26] - cs[25], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[26], width: cs[28] - cs[26], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[27], width: cs[2] - cs[1], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[27], width: cs[5] - cs[2], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[27], width: cs[8] - cs[5], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[27], width: cs[9] - cs[8], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[27], width: cs[10] - cs[9], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[27], width: cs[11] - cs[10], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[27], width: cs[20] - cs[11], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[27], width: cs[22] - cs[20], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[27], width: cs[23] - cs[22], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[27], width: cs[24] - cs[23], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[27], width: cs[25] - cs[24], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[27], width: cs[26] - cs[25], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[27], width: cs[28] - cs[26], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[28], width: cs[1] - cs[0], height: rs[30] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Material (วัสดุ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[28], width: cs[2] - cs[1], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[28], width: cs[5] - cs[2], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[28], width: cs[8] - cs[5], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[28], width: cs[9] - cs[8], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[28], width: cs[10] - cs[9], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[28], width: cs[11] - cs[10], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[28], width: cs[20] - cs[11], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[28], width: cs[22] - cs[20], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[28], width: cs[23] - cs[22], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[28], width: cs[24] - cs[23], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[28], width: cs[25] - cs[24], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[28], width: cs[26] - cs[25], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[28], width: cs[28] - cs[26], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[29], width: cs[2] - cs[1], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[29], width: cs[5] - cs[2], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[29], width: cs[8] - cs[5], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[29], width: cs[9] - cs[8], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[29], width: cs[10] - cs[9], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[29], width: cs[11] - cs[10], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[29], width: cs[20] - cs[11], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[29], width: cs[22] - cs[20], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[29], width: cs[23] - cs[22], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[29], width: cs[24] - cs[23], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[29], width: cs[25] - cs[24], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[29], width: cs[26] - cs[25], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[29], width: cs[28] - cs[26], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[30], width: cs[1] - cs[0], height: rs[32] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Environment (สภาพแวดล้อมในการทำงาน)', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[1], top: rs[30], width: cs[2] - cs[1], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[30], width: cs[5] - cs[2], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[30], width: cs[8] - cs[5], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[30], width: cs[9] - cs[8], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[30], width: cs[10] - cs[9], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[30], width: cs[11] - cs[10], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[30], width: cs[20] - cs[11], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[30], width: cs[22] - cs[20], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[30], width: cs[23] - cs[22], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[30], width: cs[24] - cs[23], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[30], width: cs[25] - cs[24], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[30], width: cs[26] - cs[25], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[30], width: cs[28] - cs[26], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[31], width: cs[2] - cs[1], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[31], width: cs[5] - cs[2], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[31], width: cs[8] - cs[5], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[31], width: cs[9] - cs[8], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[31], width: cs[10] - cs[9], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[31], width: cs[11] - cs[10], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[31], width: cs[20] - cs[11], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[31], width: cs[22] - cs[20], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[31], width: cs[23] - cs[22], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[31], width: cs[24] - cs[23], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[31], width: cs[25] - cs[24], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[31], width: cs[26] - cs[25], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[31], width: cs[28] - cs[26], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned.fill(
            child: IgnorePointer(child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 32,
                numCols: 28,
              ),
            )),
          ),
        ],
      ),
    );
  },
),
);
}

// ============ HELPER CLASSES ============
// ── Text helpers ──────────────────────────────────────────────────────────────

Widget _t(String s, {double sz = 16, bool bold = false, Color? color, String ff = 'Browallia New', TextAlign? align}) =>
    Text(s, style: TextStyle(fontFamily: ff, fontSize: sz, fontWeight: bold ? FontWeight.bold : FontWeight.normal, color: color), softWrap: true, overflow: TextOverflow.clip, textAlign: align);

Widget _rt(List<(String, bool)> spans, {double sz = 16, String ff = 'Browallia New', TextAlign align = TextAlign.start}) =>
    RichText(softWrap: true, overflow: TextOverflow.clip, textAlign: align,
        text: TextSpan(style: TextStyle(fontFamily: ff, fontSize: sz),
            children: [for (final (t, b) in spans) TextSpan(text: t, style: b ? const TextStyle(fontWeight: FontWeight.bold) : null)]));

// ── Border helpers ────────────────────────────────────────────────────────────

const _bk = Colors.black;

class _TableGridPainter extends CustomPainter {
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
}