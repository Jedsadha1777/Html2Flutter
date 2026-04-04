import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('visual audit', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pumpAndSettle();

    // 1. Check ALL text content is present (search RichText too)
    // ignore: avoid_print
    print('=== Text content audit ===');
    final allTexts = <String>[];
    // Collect from Text widgets
    for (final e in find.byType(Text).evaluate()) {
      final t = e.widget as Text;
      if (t.data != null && t.data!.trim().isNotEmpty) allTexts.add('T: ${t.data!.substring(0, t.data!.length.clamp(0, 50))}');
    }
    // Collect from RichText
    for (final e in find.byType(RichText).evaluate()) {
      final rt = e.widget as RichText;
      final text = rt.text.toPlainText();
      if (text.trim().isNotEmpty) allTexts.add('R: ${text.substring(0, text.length.clamp(0, 50))}');
    }
    // ignore: avoid_print
    print('Total text widgets: ${allTexts.length}');
    for (final t in allTexts) {
      // ignore: avoid_print
      print('  $t');
    }

    // 2. Check DefaultTextStyle propagation
    // ignore: avoid_print
    print('\n=== DefaultTextStyle audit ===');
    int dtsCount = 0;
    for (final e in find.byType(DefaultTextStyle).evaluate()) {
      final dts = e.widget as DefaultTextStyle;
      final s = dts.style;
      if (s.fontSize != null || s.fontFamily != null) {
        dtsCount++;
        if (dtsCount <= 5) {
          // ignore: avoid_print
          print('  DTS: fontSize=${s.fontSize} family=${s.fontFamily} weight=${s.fontWeight} color=${s.color}');
        }
      }
    }
    // ignore: avoid_print
    print('  Total DefaultTextStyle with font: $dtsCount');

    // 3. Check container styles propagation
    // ignore: avoid_print
    print('\n=== Outer container ===');
    // The outer container has fontSize:16, fontFamily:Inter, color:#555
    // Does this propagate to inner text?
    final firstText = find.text('Client Name');
    if (firstText.evaluate().isNotEmpty) {
      // Walk up to find DefaultTextStyle
      Element? el = firstText.evaluate().first;
      TextStyle? inherited;
      el.visitAncestorElements((ancestor) {
        if (ancestor.widget is DefaultTextStyle) {
          inherited = (ancestor.widget as DefaultTextStyle).style;
          return false;
        }
        return true;
      });
      // ignore: avoid_print
      print('  "Client Name" inherited style: fontSize=${inherited?.fontSize} family=${inherited?.fontFamily} color=${inherited?.color}');
    }

    // 4. Check table-level border/borderRadius
    // ignore: avoid_print
    print('\n=== Table-level styling ===');
    for (final e in find.byType(Container).evaluate()) {
      final c = e.widget as Container;
      if (c.decoration is BoxDecoration) {
        final bd = c.decoration as BoxDecoration;
        if (bd.borderRadius != null) {
          // ignore: avoid_print
          print('  Container with borderRadius: ${bd.borderRadius}');
          if (bd.border != null) {
            // ignore: avoid_print
            print('    + border: present');
          }
          if (bd.color != null) {
            // ignore: avoid_print
            print('    + bg color: ${bd.color}');
          }
        }
      }
    }

    // 5. Check scaling
    // ignore: avoid_print
    print('\n=== Paper scaling ===');
    for (final e in find.byType(SizedBox).evaluate()) {
      final sb = e.widget as SizedBox;
      if ((sb.width ?? 0) > 500) {
        // ignore: avoid_print
        print('  SizedBox: ${sb.width?.toStringAsFixed(0)}x${sb.height?.toStringAsFixed(0)}');
      }
    }
  });
}
