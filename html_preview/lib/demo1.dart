// ─────────────────────────────────────────────────────────────────────────
// FORM SUFFIX: "1"
//   Classes in this file: FormWidget1, FormWidgetState1
//
// หากต้องการ integrate หลายฟอร์มในโปรเจ็กต์เดียวกัน — rename ใน IDE:
//   FormWidget1  →  FormWidget2 (หรือชื่ออื่น)
//   FormWidgetState1  →  FormWidgetState2
// VS Code: F2 บน class name | JetBrains: Shift+F6
// ─────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'preview_shell.dart';

void main() => runApp(PreviewShell(pages: [_content()]));

Widget _content() => UnconstrainedBox(
  alignment: Alignment.topLeft,
  child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 687.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      73.0,
      73.0,
      73.0,
      175.0,
      155.0,
      138.0,
    ];

    final rowHeights = <double>[26.0, 27.0, 27.0];

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
      <int>[0, 1, 1, 2, 3, 3],
      <int>[4, 5, 6, 7, 8, 9],
      <int>[4, 5, 10, 11, 12, 13],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(left: cs[0], top: rs[0], width: cs[1] - cs[0], height: rs[1] - rs[0], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(top: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), left: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('item_code', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.bottom(color: Color(0xFF000000), width: 1, dotted: true)]))))])),
          Positioned(left: cs[1], top: rs[0], width: cs[3] - cs[1], height: rs[1] - rs[0], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(top: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('item_name', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.bottom(color: Color(0xFF000000), width: 1, dotted: true)]))))])),
          Positioned(left: cs[3], top: rs[0], width: cs[4] - cs[3], height: rs[1] - rs[0], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(top: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('created_by_name', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.right(color: Color(0xFF000000), width: 2), _DashSide.bottom(color: Color(0xFF000000), width: 1, dotted: true)]))))])),
          Positioned(left: cs[4], top: rs[0], width: cs[6] - cs[4], height: rs[1] - rs[0], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(top: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('created_at', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.bottom(color: Color(0xFF000000), width: 1, dotted: true)]))))])),
          Positioned(left: cs[0], top: rs[1], width: cs[1] - cs[0], height: rs[3] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 2), left: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('IC02', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[1], width: cs[2] - cs[1], height: rs[3] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 2))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('Item2', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[2], top: rs[1], width: cs[3] - cs[2], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('0.006 mm.', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[3], top: rs[1], width: cs[4] - cs[3], height: rs[2] - rs[1], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('Admin Parent 102', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.right(color: Color(0xFF000000), width: 2)]))))])),
          Positioned(left: cs[4], top: rs[1], width: cs[5] - cs[4], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('2026-04-19T14:00:58', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[5], top: rs[1], width: cs[6] - cs[5], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('2026-04-19T14:00:58', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[2], top: rs[2], width: cs[3] - cs[2], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 2))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('0.005 mm.', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[3], top: rs[2], width: cs[4] - cs[3], height: rs[3] - rs[2], child: Stack(children: [Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 2))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('Admin Parent 102', softWrap: false, overflow: TextOverflow.ellipsis),
              )), Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: _DashedBorderPainter(sides: [_DashSide.right(color: Color(0xFF000000), width: 2)]))))])),
          Positioned(left: cs[4], top: rs[2], width: cs[5] - cs[4], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 2))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('2026-04-16T07:17:23', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[5], top: rs[2], width: cs[6] - cs[5], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 2))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: '1', fontSize: 13.3, color: Color.fromRGBO(0, 0, 0, 1)),
                child: Text('2026-04-19T14:01:06', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned.fill(
            child: IgnorePointer(child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 3,
                numCols: 6,
              ),
            )),
          ),
        ],
      ),
    );
  },
),
);

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

class _DashSide {
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
}