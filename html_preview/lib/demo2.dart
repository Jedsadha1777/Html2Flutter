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
  child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 960.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      30.0,
      206.0,
      190.0,
      78.0,
      78.0,
      110.0,
      110.0,
      158.0,
    ];

    final rowHeights = <double>[53.0, 84.0, 58.0, 20.0, 24.0, 71.0, 24.0, 58.0, 84.0, 71.0, 58.0, 97.0, 24.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 32.0, 24.0, 24.0, 32.0, 84.0, 24.0, 84.0, 58.0, 58.0, 123.0, 24.0, 24.0, 48.0, 24.0, 20.0, 27.0];

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
      <int>[0, 0, 0, 0, 0, 0, 0, 0],
      <int>[1, 2, 3, 4, 5, 6, 7, 8],
      <int>[9, 10, 11, 12, 13, 14, 15, 16],
      <int>[17, 18, 19, 20, 21, 22, 23, 24],
      <int>[25, 25, 25, 25, 25, 25, 25, 25],
      <int>[26, 27, 28, 29, 30, 31, 32, 33],
      <int>[34, 34, 34, 34, 35, 35, 35, 35],
      <int>[36, 37, 37, 37, 38, 39, 39, 39],
      <int>[40, 41, 41, 41, 42, 43, 43, 43],
      <int>[44, 45, 45, 45, 46, 47, 47, 47],
      <int>[48, 49, 49, 49, 50, 51, 51, 51],
      <int>[52, 53, 53, 53, 54, 55, 55, 55],
      <int>[56, 56, 56, 56, 56, 56, 56, 56],
      <int>[57, 58, 59, 60, 61, 62, 63, 64],
      <int>[65, 66, 67, 68, 69, 70, 71, 72],
      <int>[73, 74, 75, 76, 77, 78, 79, 80],
      <int>[81, 82, 83, 84, 85, 86, 87, 88],
      <int>[89, 90, 91, 92, 93, 94, 95, 96],
      <int>[97, 98, 99, 100, 101, 102, 103, 104],
      <int>[105, 106, 107, 108, 109, 110, 111, 112],
      <int>[113, 114, 115, 116, 117, 118, 119, 120],
      <int>[121, 122, 123, 124, 125, 126, 127, 128],
      <int>[129, 130, 131, 132, 133, 134, 135, 136],
      <int>[137, 138, 139, 140, 141, 142, 143, 144],
      <int>[145, 145, 145, 145, 145, 146, 147, 148],
      <int>[149, 149, 149, 149, 149, 150, 151, 152],
      <int>[153, 153, 153, 153, 153, 154, 155, 156],
      <int>[157, 158, 158, 158, 158, 158, 158, 158],
      <int>[159, 159, 159, 159, 159, 159, 159, 159],
      <int>[160, 161, 161, 161, 161, 161, 161, 161],
      <int>[162, 163, 163, 163, 163, 163, 163, 163],
      <int>[164, 165, 165, 165, 165, 165, 165, 165],
      <int>[166, 167, 167, 167, 167, 167, 167, 167],
      <int>[168, 168, 168, 168, 168, 168, 168, 168],
      <int>[169, 169, 170, 170, 171, 171, 172, 172],
      <int>[173, 173, 174, 174, 175, 175, 176, 176],
      <int>[177, 177, 178, 178, 179, 179, 180, 180],
      <int>[181, 182, 183, 184, 185, 186, 187, 188],
      <int>[189, 189, 189, 189, 189, 189, 189, 189],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(left: cs[0], top: rs[0], width: cs[8] - cs[0], height: rs[1] - rs[0], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(top: BorderSide(color: Color(0xFFCCCCCC), width: 1), right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('PURCHASE ORDER', sz: 12.0, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[1], width: cs[1] - cs[0], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Doc'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ume'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'nt'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'No.'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[1], width: cs[2] - cs[1], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('PO-XXXXXX', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[2], top: rs[1], width: cs[3] - cs[2], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Version', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[3], top: rs[1], width: cs[4] - cs[3], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Rev.01', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[4], top: rs[1], width: cs[5] - cs[4], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Issue Date', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[5], top: rs[1], width: cs[6] - cs[5], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[6], top: rs[1], width: cs[7] - cs[6], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Dept.', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[7], top: rs[1], width: cs[8] - cs[7], height: rs[2] - rs[1], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Purchasing / Finance', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[2], width: cs[1] - cs[0], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Pre'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'par'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ed'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'by'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[2], width: cs[2] - cs[1], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Name / Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[2], top: rs[2], width: cs[3] - cs[2], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Reviewed by', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[3], top: rs[2], width: cs[4] - cs[3], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, color: Color(0xFF64748B)),
                  children: [
                    TextSpan(text: 'Name /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Signature'),
                  ],
                ),
              ))),
          Positioned(left: cs[4], top: rs[2], width: cs[5] - cs[4], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Approved by', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[5], top: rs[2], width: cs[6] - cs[5], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Name / Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[6], top: rs[2], width: cs[7] - cs[6], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Status', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[7], top: rs[2], width: cs[8] - cs[7], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, color: Color(0xFF64748B)),
                  children: [
                    TextSpan(text: 'Draft / Under Review /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Approved'),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[3], width: cs[1] - cs[0], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[3], width: cs[2] - cs[1], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[3], width: cs[3] - cs[2], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[3], width: cs[4] - cs[3], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[3], width: cs[5] - cs[4], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[3], width: cs[6] - cs[5], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[3], width: cs[7] - cs[6], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[3], width: cs[8] - cs[7], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[4], width: cs[8] - cs[0], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('1. ORDER INFORMATION', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[5], width: cs[1] - cs[0], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'PO'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Nu'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'mbe'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'r'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[5], width: cs[2] - cs[1], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('PO-XXXXXX', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[2], top: rs[5], width: cs[3] - cs[2], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('PO Date', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[3], top: rs[5], width: cs[4] - cs[3], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[4], top: rs[5], width: cs[5] - cs[4], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Ref. PR No.', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[5], top: rs[5], width: cs[6] - cs[5], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('PR-RD-XXXXXX', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[6], top: rs[5], width: cs[7] - cs[6], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Required Delivery', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[7], top: rs[5], width: cs[8] - cs[7], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[6], width: cs[4] - cs[0], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0891B2), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('2. VENDOR INFORMATION', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[4], top: rs[6], width: cs[8] - cs[4], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0891B2), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('3. SHIP TO (BUYER)', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[7], width: cs[1] - cs[0], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Ven'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'dor'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Na'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'me'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[7], width: cs[4] - cs[1], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[7], width: cs[5] - cs[4], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Company'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Name'),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[7], width: cs[8] - cs[5], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[8], width: cs[1] - cs[0], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Ven'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'dor'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Add'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ress'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[8], width: cs[4] - cs[1], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[8], width: cs[5] - cs[4], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Delivery'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Address'),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[8], width: cs[8] - cs[5], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[9], width: cs[1] - cs[0], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Con'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'tact'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Per'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'son'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[9], width: cs[4] - cs[1], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[9], width: cs[5] - cs[4], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Contact'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Person'),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[9], width: cs[8] - cs[5], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[10], width: cs[1] - cs[0], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Tel /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Em'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ail'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[10], width: cs[4] - cs[1], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[10], width: cs[5] - cs[4], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Tel / Email', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[5], top: rs[10], width: cs[8] - cs[5], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[11], width: cs[1] - cs[0], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Tax'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ID /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Ven'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'dor'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Cod'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'e'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[11], width: cs[4] - cs[1], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[11], width: cs[5] - cs[4], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Dept. /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Section'),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[11], width: cs[8] - cs[5], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[12], width: cs[8] - cs[0], height: rs[13] - rs[12], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('4. ORDER DETAILS', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[13], width: cs[1] - cs[0], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('#', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[13], width: cs[2] - cs[1], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Item Description / Part Name', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[2], top: rs[13], width: cs[3] - cs[2], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Part No. / Model / Spec.', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[3], top: rs[13], width: cs[4] - cs[3], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Qty', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[4], top: rs[13], width: cs[5] - cs[4], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Unit', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[5], top: rs[13], width: cs[6] - cs[5], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Unit Price (THB)', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[6], top: rs[13], width: cs[7] - cs[6], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Amount (THB)', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[7], top: rs[13], width: cs[8] - cs[7], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Delivery Conditions /'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Remarks'),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[14], width: cs[1] - cs[0], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('1', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[14], width: cs[2] - cs[1], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[14], width: cs[3] - cs[2], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[14], width: cs[4] - cs[3], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[14], width: cs[5] - cs[4], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[14], width: cs[6] - cs[5], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[14], width: cs[7] - cs[6], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[14], width: cs[8] - cs[7], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[15], width: cs[1] - cs[0], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('2', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[15], width: cs[2] - cs[1], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[15], width: cs[3] - cs[2], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[15], width: cs[4] - cs[3], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[15], width: cs[5] - cs[4], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[15], width: cs[6] - cs[5], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[15], width: cs[7] - cs[6], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[15], width: cs[8] - cs[7], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[16], width: cs[1] - cs[0], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('3', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[16], width: cs[2] - cs[1], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[16], width: cs[3] - cs[2], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[16], width: cs[4] - cs[3], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[16], width: cs[5] - cs[4], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[16], width: cs[6] - cs[5], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[16], width: cs[7] - cs[6], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[16], width: cs[8] - cs[7], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[17], width: cs[1] - cs[0], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('4', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[17], width: cs[2] - cs[1], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[17], width: cs[3] - cs[2], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[17], width: cs[4] - cs[3], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[17], width: cs[5] - cs[4], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[17], width: cs[6] - cs[5], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[17], width: cs[7] - cs[6], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[17], width: cs[8] - cs[7], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[18], width: cs[1] - cs[0], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('5', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[18], width: cs[2] - cs[1], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[18], width: cs[3] - cs[2], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[18], width: cs[4] - cs[3], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[18], width: cs[5] - cs[4], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[18], width: cs[6] - cs[5], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[18], width: cs[7] - cs[6], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[18], width: cs[8] - cs[7], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[19], width: cs[1] - cs[0], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('6', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[19], width: cs[2] - cs[1], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[19], width: cs[3] - cs[2], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[19], width: cs[4] - cs[3], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[19], width: cs[5] - cs[4], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[19], width: cs[6] - cs[5], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[19], width: cs[7] - cs[6], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[19], width: cs[8] - cs[7], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[20], width: cs[1] - cs[0], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('7', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[20], width: cs[2] - cs[1], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[20], width: cs[3] - cs[2], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[20], width: cs[4] - cs[3], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[20], width: cs[5] - cs[4], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[20], width: cs[6] - cs[5], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[20], width: cs[7] - cs[6], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[20], width: cs[8] - cs[7], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[21], width: cs[1] - cs[0], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('8', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[21], width: cs[2] - cs[1], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[21], width: cs[3] - cs[2], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[21], width: cs[4] - cs[3], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[21], width: cs[5] - cs[4], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[21], width: cs[6] - cs[5], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[21], width: cs[7] - cs[6], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[21], width: cs[8] - cs[7], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[22], width: cs[1] - cs[0], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('9', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[22], width: cs[2] - cs[1], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[22], width: cs[3] - cs[2], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[22], width: cs[4] - cs[3], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[22], width: cs[5] - cs[4], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[22], width: cs[6] - cs[5], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[22], width: cs[7] - cs[6], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[22], width: cs[8] - cs[7], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[23], width: cs[1] - cs[0], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('10', sz: 10.6, bold: true, color: Color(0xFF64748B), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[23], width: cs[2] - cs[1], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[23], width: cs[3] - cs[2], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[23], width: cs[4] - cs[3], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[23], width: cs[5] - cs[4], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('pc / kg / L / set', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[5], top: rs[23], width: cs[6] - cs[5], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[23], width: cs[7] - cs[6], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('undefined', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[23], width: cs[8] - cs[7], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[24], width: cs[5] - cs[0], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[24], width: cs[6] - cs[5], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('Sub Total (THB)', sz: 10.6, bold: true, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[6], top: rs[24], width: cs[7] - cs[6], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFE2E8F0), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('0.00', sz: 10.6, bold: true, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[24], width: cs[8] - cs[7], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[25], width: cs[5] - cs[0], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[25], width: cs[6] - cs[5], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('VAT 7% (THB)', sz: 10.6, bold: true, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[6], top: rs[25], width: cs[7] - cs[6], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFFFFFFF), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('0.00', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[25], width: cs[8] - cs[7], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[26], width: cs[5] - cs[0], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[26], width: cs[6] - cs[5], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFFFFFFFF), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.right,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'GRAND TOTAL'),
                    TextSpan(text: '\n'),
                    TextSpan(text: '(THB)'),
                  ],
                ),
              ))),
          Positioned(left: cs[6], top: rs[26], width: cs[7] - cs[6], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFF1A7A4A), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerRight, child: _t('0.00', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.right))),
          Positioned(left: cs[7], top: rs[26], width: cs[8] - cs[7], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[27], width: cs[1] - cs[0], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Am'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'oun'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 't in'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Wor'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ds'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[27], width: cs[8] - cs[1], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('e.g. Thai Baht Five Thousand Only', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[28], width: cs[8] - cs[0], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0891B2), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('5. TERMS & CONDITIONS', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[29], width: cs[1] - cs[0], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Pay'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'men'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 't'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Ter'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ms'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[29], width: cs[8] - cs[1], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('□ 30 days net □ 60 days net □ Upon delivery □ Advance Payment □ Other: ___', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[30], width: cs[1] - cs[0], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Inco'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ter'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ms'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[30], width: cs[8] - cs[1], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('□ EXW □ FOB □ CIF □ DDP □ DAP □ Other: ___', sz: 10.6, color: Color(0xFF1E293B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[31], width: cs[1] - cs[0], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'War'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'rant'),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'y'),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[31], width: cs[8] - cs[1], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('e.g. 12 months from delivery date', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[32], width: cs[1] - cs[0], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFF0F2044), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Arial', fontSize: 10.6, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                  children: [
                    TextSpan(text: 'Spe', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'cial', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Not', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'es /', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Inst', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ruct', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'ions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 10.6, fontFamily: 'Arial')),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[32], width: cs[8] - cs[1], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFEF9C3), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Packing requirements, safety data sheet, inspection, etc.', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[33], width: cs[8] - cs[0], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFF5B2D8E), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('6. AUTHORIZED SIGNATURES', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[34], width: cs[2] - cs[0], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFF5B2D8E), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Purchasing Officer', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[2], top: rs[34], width: cs[4] - cs[2], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFF5B2D8E), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Finance Manager', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[4], top: rs[34], width: cs[6] - cs[4], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFF5B2D8E), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Plant Manager', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[6], top: rs[34], width: cs[8] - cs[6], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFF5B2D8E), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('Vendor Acknowledgement', sz: 10.6, bold: true, color: Color(0xFFFFFFFF), ff: 'Arial', align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[35], width: cs[2] - cs[0], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1), left: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[2], top: rs[35], width: cs[4] - cs[2], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[4], top: rs[35], width: cs[6] - cs[4], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[6], top: rs[35], width: cs[8] - cs[6], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Signature', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[36], width: cs[2] - cs[0], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1), left: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Date: YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[2], top: rs[36], width: cs[4] - cs[2], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Date: YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[4], top: rs[36], width: cs[6] - cs[4], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Date: YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[6], top: rs[36], width: cs[8] - cs[6], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFF999999), width: 1), bottom: BorderSide(color: Color(0xFF999999), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Date: YYYY-MM-DD', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned(left: cs[0], top: rs[37], width: cs[1] - cs[0], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[37], width: cs[2] - cs[1], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[37], width: cs[3] - cs[2], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[37], width: cs[4] - cs[3], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[37], width: cs[5] - cs[4], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[37], width: cs[6] - cs[5], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[37], width: cs[7] - cs[6], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[37], width: cs[8] - cs[7], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[38], width: cs[8] - cs[0], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9), border: Border(right: BorderSide(color: Color(0xFFCCCCCC), width: 1), bottom: BorderSide(color: Color(0xFFCCCCCC), width: 1), left: BorderSide(color: Color(0xFFCCCCCC), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('※ This PO is legally binding upon authorized signature. Vendor must confirm receipt within 3 business days.', sz: 10.6, italic: true, color: Color(0xFF64748B), ff: 'Arial'))),
          Positioned.fill(
            child: IgnorePointer(child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 39,
                numCols: 8,
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

Widget _t(String s, {double sz = 16, bool bold = false, bool italic = false, Color? color, String ff = 'Browallia New', TextAlign? align}) =>
    Text(s, style: TextStyle(fontFamily: ff, fontSize: sz, fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontStyle: italic ? FontStyle.italic : FontStyle.normal, color: color), softWrap: true, overflow: TextOverflow.clip, textAlign: align);

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