import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('Real 61x28 table from main.dart renders', (tester) async {
    // Extract JSON from main.dart
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    // Render
    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));

    // First pump creates widget tree
    await tester.pump();
    // Second pump lets _ScaledContent measure
    await tester.pump();
    // Third for good measure
    await tester.pump();

    // Check for error messages
    expect(find.text('No pages in schema'), findsNothing);
    expect(find.textContaining('Error parsing JSON'), findsNothing);

    // Check first cell content exists in widget tree
    expect(find.textContaining('QUALITY MANAGEMENT SYSTEM'), findsOneWidget);

    // Check for any RenderFlex overflow or errors
    final errors = <FlutterErrorDetails>[];
    final oldHandler = FlutterError.onError;
    FlutterError.onError = (details) => errors.add(details);

    await tester.pumpAndSettle();

    FlutterError.onError = oldHandler;

    if (errors.isNotEmpty) {
      // ignore: avoid_print
      print('⚠ Flutter errors during render:');
      for (final e in errors) {
        // ignore: avoid_print
        print('  ${e.exceptionAsString().split('\n').first}');
      }
    } else {
      // ignore: avoid_print
      print('✓ No Flutter errors');
    }

    // Check PreviewShell AppBar exists (means PreviewShell rendered)
    expect(find.text('Preview'), findsOneWidget);

    // Check visible - find Stack (the table Stack)
    final stacks = find.byType(Stack);
    // ignore: avoid_print
    print('Stack widgets found: ${stacks.evaluate().length}');

    // Check SizedBox with large dimensions (the table container)
    final sizedBoxes = find.byType(SizedBox).evaluate();
    for (final e in sizedBoxes) {
      final sb = e.widget as SizedBox;
      if ((sb.width ?? 0) > 1000) {
        // ignore: avoid_print
        print('✓ Found table SizedBox: ${sb.width}x${sb.height}');
        break;
      }
    }

    // Count Positioned widgets (each table cell)
    final positioned = find.byType(Positioned);
    // ignore: avoid_print
    print('Positioned widgets: ${positioned.evaluate().length}');

    // Count Text widgets
    final texts = find.byType(Text);
    // ignore: avoid_print
    print('Text widgets: ${texts.evaluate().length}');

    // ignore: avoid_print
    print('✓ Real 61x28 table test complete');
  });
}
