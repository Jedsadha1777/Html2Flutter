import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('check actual LayoutBuilder widths', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    final errors = <String>[];
    final oldHandler = FlutterError.onError;
    FlutterError.onError = (d) => errors.add(d.exceptionAsString().split('\n').first);

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pumpAndSettle();
    FlutterError.onError = oldHandler;

    // ignore: avoid_print
    print('Errors: ${errors.length}');
    for (final e in errors) {
      // ignore: avoid_print
      print('  ⚠ $e');
    }

    // Check all SizedBox sizes (table containers)
    // ignore: avoid_print
    print('\nAll large SizedBox (table grids):');
    for (final e in find.byType(SizedBox).evaluate()) {
      final sb = e.widget as SizedBox;
      if ((sb.width ?? 0) > 100 && (sb.height ?? 0) > 30) {
        // ignore: avoid_print
        print('  ${sb.width?.toStringAsFixed(0)}x${sb.height?.toStringAsFixed(0)}');
      }
    }

    // Check LayoutBuilder actual constraints
    // ignore: avoid_print
    print('\nLayoutBuilder widgets:');
    int lbCount = 0;
    for (final e in find.byType(LayoutBuilder).evaluate()) {
      lbCount++;
    }
    // ignore: avoid_print
    print('  count: $lbCount');

    // Check for overflow by examining Container widths vs parent
    // ignore: avoid_print
    print('\nContainer with padding (tableStyle wrappers):');
    for (final e in find.byType(Container).evaluate()) {
      final c = e.widget as Container;
      if (c.padding != null && c.decoration is BoxDecoration) {
        final bd = c.decoration as BoxDecoration;
        if (bd.borderRadius != null) {
          final box = tester.getSize(find.byWidget(c));
          // ignore: avoid_print
          print('  tableStyle Container: ${box.width.toStringAsFixed(0)}x${box.height.toStringAsFixed(0)} padding=${c.padding}');

          // Find the SizedBox child (table grid) inside this Container
          // This tells us if the table grid fits within the Container
        }
      }
    }
  });
}
