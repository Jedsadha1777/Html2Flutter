import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('Check actual visual rendering of table', (tester) async {
    final content = File('lib/main.dart').readAsStringSync();
    final start = content.indexOf("r'''") + 4;
    final end = content.indexOf("''';");
    final jsonStr = content.substring(start, end);

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: jsonStr),
    ));
    await tester.pumpAndSettle();

    // Check Opacity widgets - is content visible?
    final opacities = find.byType(Opacity).evaluate();
    for (final e in opacities) {
      final o = e.widget as Opacity;
      // ignore: avoid_print
      print('Opacity: ${o.opacity} (${o.opacity == 0.0 ? "INVISIBLE!" : "visible"})');
    }

    // Check Visibility widgets
    final visibilities = find.byType(Visibility).evaluate();
    for (final e in visibilities) {
      final v = e.widget as Visibility;
      // ignore: avoid_print
      print('Visibility: visible=${v.visible}, maintainSize=${v.maintainSize}');
    }

    // Check Transform.scale
    final transforms = find.byType(Transform).evaluate();
    for (final e in transforms) {
      final t = e.widget as Transform;
      final scale = t.transform.getMaxScaleOnAxis();
      // ignore: avoid_print
      print('Transform scale: $scale');
    }

    // borderWidth=0 means NO grid lines drawn
    // Check if there are any cells with non-white background
    final containers = find.byType(Container).evaluate();
    int withBg = 0, withBorder = 0;
    for (final e in containers) {
      final c = e.widget as Container;
      final deco = c.decoration;
      if (deco is BoxDecoration) {
        if (deco.color != null && deco.color != Colors.white && deco.color != const Color(0xFFFFFFFF)) {
          withBg++;
        }
        if (deco.border != null) withBorder++;
      }
    }
    // ignore: avoid_print
    print('\nContainers with non-white background: $withBg');
    // ignore: avoid_print
    print('Containers with border: $withBorder');
    // ignore: avoid_print
    print('borderWidth in JSON = 0 → NO grid lines are painted!');

    // Check CustomPaint for grid painter
    final paints = find.byType(CustomPaint).evaluate();
    // ignore: avoid_print
    print('CustomPaint widgets: ${paints.length}');

    // Check the first text content with its position
    final firstText = find.textContaining('QUALITY MANAGEMENT');
    if (firstText.evaluate().isNotEmpty) {
      final box = tester.getRect(firstText);
      // ignore: avoid_print
      print('\nFirst text "QUALITY MANAGEMENT..." position: $box');
      // ignore: avoid_print
      print('Screen size: ${tester.view.physicalSize / tester.view.devicePixelRatio}');
    }
  });
}
