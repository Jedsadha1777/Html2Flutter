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
import 'preview_shell.dart';

void main() => runApp(PreviewShell(pages: [_content()]));

Widget _content() => UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                margin: const EdgeInsets.all(16),
                width: 500,
                child: Container(
  decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 1), right: BorderSide(color: Colors.black, width: 1), bottom: BorderSide(color: Colors.black, width: 1), left: BorderSide(color: Colors.black, width: 1))),
  child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 250.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 250.0 : flexSpace / 1.000000;
    final colWidths = <double>[
      flexUnit,
      250.0,
    ];

    final rowHeights = <double>[128.0, 250.0];

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
      <int>[0, 0],
      <int>[1, 2],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          cell(0, 0, 2, 1, border: _bBottom(), pad: EdgeInsets.all(4.0), child: _t('simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', bold: true)),
          Positioned(left: cs[0], top: rs[1], width: cs[1] - cs[0], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(left: BorderSide(color: Colors.black, width: 1), right: BorderSide(color: Colors.black, width: 1), bottom: BorderSide(color: Colors.black, width: 1))),
              padding: EdgeInsets.all(4.0), alignment: Alignment.centerLeft, child: _t('simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into'))),
          Positioned(left: cs[1], top: rs[1], width: cs[2] - cs[1], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Colors.black, width: 1), bottom: BorderSide(color: Colors.black, width: 1))),
              padding: EdgeInsets.all(4.0), alignment: Alignment.center, child: _t('Col2', align: TextAlign.center))),
          Positioned.fill(
            child: IgnorePointer(child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 2,
                numCols: 2,
              ),
            )),
          ),
        ],
      ),
    );
  },
),
),
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
Border _bBottom([double w = 1]) => Border(bottom: BorderSide(color: _bk, width: w));

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