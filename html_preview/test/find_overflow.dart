import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('find the 1 remaining overflow', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    final errors = <FlutterErrorDetails>[];
    final oldHandler = FlutterError.onError;
    FlutterError.onError = (d) => errors.add(d);

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pumpAndSettle();
    FlutterError.onError = oldHandler;

    for (final e in errors) {
      final msg = e.exceptionAsString();
      // ignore: avoid_print
      print('ERROR: ${msg.split('\n').take(3).join('\n')}');

      // Try to find the offending widget
      final info = e.informationCollector?.call() ?? [];
      for (final d in info) {
        final s = d.toString();
        if (s.contains('overflowing') || s.contains('RenderFlex') || s.contains('Column')) {
          // ignore: avoid_print
          print('  INFO: ${s.substring(0, s.length.clamp(0, 200))}');
        }
      }
      // ignore: avoid_print
      print('');
    }

    // Find all Column widgets and check if they overflow
    // ignore: avoid_print
    print('Columns inside Positioned cells:');
    for (final posEl in find.byType(Positioned).evaluate()) {
      void checkColumn(Element el) {
        if (el.widget is Column) {
          final rb = el.renderObject;
          if (rb is RenderBox && rb.hasSize) {
            // Find parent Positioned dimensions
            Element? posParent = el;
            while (posParent != null && posParent.widget is! Positioned) {
              posParent = posParent is Element ? (posParent as Element) : null;
              if (posParent != null) {
                final parent = posParent;
                Element? found;
                parent.visitAncestorElements((ancestor) {
                  if (ancestor.widget is Positioned) {
                    found = ancestor;
                    return false;
                  }
                  return true;
                });
                posParent = found;
                break;
              }
            }
            if (posParent?.widget is Positioned) {
              final pos = posParent!.widget as Positioned;
              final colSize = rb.size;
              // ignore: avoid_print
              print('  Column ${colSize.width.toStringAsFixed(0)}x${colSize.height.toStringAsFixed(0)} in Positioned h=${pos.height?.toStringAsFixed(0)}');
              if (pos.height != null && colSize.height > pos.height! + 1) {
                // ignore: avoid_print
                print('    ⚠ OVERFLOW by ${(colSize.height - pos.height!).toStringAsFixed(0)}px!');
              }
            }
          }
        }
        el.visitChildren(checkColumn);
      }
      posEl.visitChildren(checkColumn);
    }
  });
}
