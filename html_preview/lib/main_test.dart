import 'package:flutter/material.dart';
import 'preview_shell.dart';

void main() => runApp(PreviewShell(pages: [_content()]));

Widget _content() => UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                width: 800,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 0.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 1.000000;
    final colWidths = <double>[
      flexUnit,
    ];

    final rowHeights = <double>[72.0];

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
      <int>[0],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          cell(0, 0, 1, 1, align: Alignment.centerRight, child: _t('INVOICE', sz: 47.9, bold: true, color: Color(0xFF832DA2), ff: 'Arial', align: TextAlign.right)),
          Positioned.fill(
            child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 1,
                numCols: 1,
              ),
            ),
          ),
        ],
      ),
    );
  },
),
                  const SizedBox(height: 8),
                  LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 800.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      400.0,
      400.0,
    ];

    final rowHeights = <double>[213.0];

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
      <int>[0, 1],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [

          cell(1, 0, 2, 1, child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 0.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 2.000000;
    final colWidths = <double>[
      flexUnit,
      flexUnit,
    ];

    final rowHeights = <double>[65.0, 41.0, 41.0, 66.0];

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
      <int>[0, 1],
      <int>[2, 3],
      <int>[4, 5],
      <int>[6, 7],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(left: cs[0], top: rs[0], width: cs[1] - cs[0], height: rs[1] - rs[0], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16.0),
                  children: [
                    TextSpan(text: 'Electricity'),
                    TextSpan(text: '(estimated reading)', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0)),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[0], width: cs[2] - cs[1], height: rs[1] - rs[0], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerRight, child: _t('{d.elec :formatC}', ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[0], top: rs[1], width: cs[1] - cs[0], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16.0),
                  children: [
                    TextSpan(text: 'VAT'),
                    TextSpan(text: '(Value Added Tax)', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0)),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[1], width: cs[2] - cs[1], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerRight, child: _t('{d.VAT :formatC}', ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[0], top: rs[2], width: cs[1] - cs[0], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerLeft, child: _t('Payments already made', ff: 'Arial'))),
          Positioned(left: cs[1], top: rs[2], width: cs[2] - cs[1], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerRight, child: _t('{d.already_paid :formatC}', ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[0], top: rs[3], width: cs[1] - cs[0], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerLeft, child: _t('Total amount (including VAT)', bold: true, color: Color(0xFF832DA1), ff: 'Arial'))),
          Positioned(left: cs[1], top: rs[3], width: cs[2] - cs[1], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF832DA2), width: 1))),
              padding: EdgeInsets.all(8.0), alignment: Alignment.centerRight, child: _t('{d.total:formatC}', sz: 18.6, bold: true, color: Color(0xFF832DA1), ff: 'Arial', align: TextAlign.right))),
          Positioned.fill(
            child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 4,
                numCols: 2,
              ),
            ),
          ),
        ],
      ),
    );
  },
)),
          Positioned.fill(
            child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 1,
                numCols: 2,
              ),
            ),
          ),
        ],
      ),
    );
  },
),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),
                  LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 792.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      264.0,
      264.0,
      264.0,
    ];

    final rowHeights = <double>[68.0];

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
      <int>[0, 1, 2],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          cell(0, 0, 1, 1, pad: EdgeInsets.all(10.0), align: Alignment.topLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: '{d.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '\n'),
                    TextSpan(text: '{d.cust_nb}'),
                  ],
                ),
              )),
          cell(1, 0, 2, 1, pad: EdgeInsets.all(10.0), align: Alignment.topLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'GREEN ENERGY CORPORATION', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF832DA2))),
                  ],
                ),
              )),
          cell(2, 0, 3, 1, pad: EdgeInsets.all(10.0), align: Alignment.topLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 16.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'To pay', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF832DA2))),
                    TextSpan(text: '\n'),
                    TextSpan(text: '{d.total:formatC}', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
          Positioned.fill(
            child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 1,
                numCols: 3,
              ),
            ),
          ),
        ],
      ),
    );
  },
),
                ],
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