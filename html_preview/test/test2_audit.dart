import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('test2.html JSON: full rendering audit', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    // Capture ALL Flutter errors
    final errors = <String>[];
    final oldHandler = FlutterError.onError;
    FlutterError.onError = (details) {
      errors.add(details.exceptionAsString().split('\n').first);
    };

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pump();
    await tester.pump();
    await tester.pump();
    await tester.pumpAndSettle();

    FlutterError.onError = oldHandler;

    // 1. Check for errors
    // ignore: avoid_print
    print('=== Flutter Errors ===');
    if (errors.isEmpty) {
      // ignore: avoid_print
      print('None');
    } else {
      for (final e in errors) {
        // ignore: avoid_print
        print('  ⚠ $e');
      }
    }

    // 2. Check key texts are visible
    // ignore: avoid_print
    print('\n=== Key text checks ===');
    final keyTexts = [
      'Alvish Baldha (Courier)',
      'hello@email.com',
      'Client Name',
      'Pick-up',
      'Drop-off',
      'Job ID',
      '123567',
      'Drops',
      '£5.00',
      'Subtotal',
      'Total Price (2)',
      'MealShift Ltd',
    ];
    for (final t in keyTexts) {
      final found = find.textContaining(t);
      final count = found.evaluate().length;
      // ignore: avoid_print
      print('  ${count > 0 ? "✓" : "✗"} "$t" → found $count');
    }

    // 3. Check table structure
    // ignore: avoid_print
    print('\n=== Widget tree ===');
    final stacks = find.byType(Stack).evaluate().length;
    final positioned = find.byType(Positioned).evaluate().length;
    final texts = find.byType(Text).evaluate().length;
    final richTexts = find.byType(RichText).evaluate().length;
    // ignore: avoid_print
    print('  Stack: $stacks, Positioned: $positioned, Text: $texts, RichText: $richTexts');

    // 4. Check for overflow by looking at RenderFlex overflow
    // ignore: avoid_print
    print('\n=== Overflow check ===');
    // Check if any Positioned child overflows
    int overflowCount = 0;
    for (final e in find.byType(Positioned).evaluate()) {
      final pos = e.widget as Positioned;
      if (pos.height != null && pos.height! < 0) overflowCount++;
    }
    // ignore: avoid_print
    print('  Negative-height Positioned: $overflowCount');

    // 5. Check table borders rendered
    // ignore: avoid_print
    print('\n=== Border rendering ===');
    int borderedContainers = 0;
    for (final e in find.byType(Container).evaluate()) {
      final c = e.widget as Container;
      if (c.decoration is BoxDecoration) {
        final bd = c.decoration as BoxDecoration;
        if (bd.border != null) borderedContainers++;
      }
    }
    // ignore: avoid_print
    print('  Containers with border: $borderedContainers');

    // 6. Check borderRadius (table-level wrapper)
    int roundedContainers = 0;
    for (final e in find.byType(Container).evaluate()) {
      final c = e.widget as Container;
      if (c.decoration is BoxDecoration) {
        final bd = c.decoration as BoxDecoration;
        if (bd.borderRadius != null) roundedContainers++;
      }
    }
    // ignore: avoid_print
    print('  Containers with borderRadius: $roundedContainers');

    // 7. Check SizedBox sizes for table containers
    // ignore: avoid_print
    print('\n=== Table SizedBox sizes ===');
    for (final e in find.byType(SizedBox).evaluate()) {
      final sb = e.widget as SizedBox;
      if ((sb.width ?? 0) > 100 && (sb.height ?? 0) > 50) {
        // ignore: avoid_print
        print('  SizedBox ${sb.width?.toStringAsFixed(0)}x${sb.height?.toStringAsFixed(0)}');
      }
    }

    // 8. Paper size check
    // ignore: avoid_print
    print('\n=== Paper/Visibility ===');
    final opacities = find.byType(Opacity).evaluate();
    for (final e in opacities) {
      final o = e.widget as Opacity;
      // ignore: avoid_print
      print('  Opacity: ${o.opacity}');
    }
    final visibilities = find.byType(Visibility).evaluate();
    for (final e in visibilities) {
      final v = e.widget as Visibility;
      // ignore: avoid_print
      print('  Visibility: ${v.visible}');
    }
  });
}
