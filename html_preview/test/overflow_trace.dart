import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('trace overflow locations', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    final errors = <FlutterErrorDetails>[];
    final oldHandler = FlutterError.onError;
    FlutterError.onError = (details) => errors.add(details);

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pumpAndSettle();

    FlutterError.onError = oldHandler;

    // ignore: avoid_print
    print('=== Overflow errors: ${errors.length} ===\n');
    for (int i = 0; i < errors.length; i++) {
      final e = errors[i];
      final msg = e.exceptionAsString();
      // ignore: avoid_print
      print('--- Error ${i + 1} ---');
      // Print first 5 lines of the error
      final lines = msg.split('\n');
      for (int j = 0; j < lines.length && j < 8; j++) {
        // ignore: avoid_print
        print(lines[j]);
      }
      // ignore: avoid_print
      print('');
    }

    // Check: find all Column widgets inside Positioned (these cause overflow)
    int colInPositioned = 0;
    final positioned = find.byType(Positioned).evaluate();
    for (final pe in positioned) {
      final pos = pe.widget as Positioned;
      // Check if child tree contains a Column
      void checkForColumn(Element element) {
        if (element.widget is Column) {
          final col = element.widget as Column;
          colInPositioned++;
        }
        element.visitChildren(checkForColumn);
      }
      pe.visitChildren(checkForColumn);
    }
    // ignore: avoid_print
    print('Column widgets inside Positioned cells: $colInPositioned');
    // ignore: avoid_print
    print('(These are the most likely overflow candidates)');
  });
}
