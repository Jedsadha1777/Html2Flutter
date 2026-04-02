import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_preview/form_renderer.dart';

void main() {
  testWidgets('Simple table renders via FormRenderer', (tester) async {
    const json = r'''
    {
      "version": "1.0",
      "pages": [
        {
          "type": "table",
          "numRows": 2,
          "numCols": 2,
          "columnWidths": [100, 100],
          "rowHeights": [40, 40],
          "borderWidth": 1,
          "matrixData": [[0,1],[2,3]],
          "placements": [
            {"row":0,"col":0,"colEnd":1,"rowEnd":1,"padding":{"top":4,"right":4,"bottom":4,"left":4},"child":{"type":"text","content":"A"}},
            {"row":0,"col":1,"colEnd":2,"rowEnd":1,"padding":{"top":4,"right":4,"bottom":4,"left":4},"child":{"type":"text","content":"B"}},
            {"row":1,"col":0,"colEnd":1,"rowEnd":2,"padding":{"top":4,"right":4,"bottom":4,"left":4},"child":{"type":"text","content":"C"}},
            {"row":1,"col":1,"colEnd":2,"rowEnd":2,"padding":{"top":4,"right":4,"bottom":4,"left":4},"child":{"type":"text","content":"D"}}
          ]
        }
      ],
      "fields": []
    }
    ''';

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: json),
    ));
    await tester.pumpAndSettle();

    // Check texts are rendered
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    print('✓ Simple 2x2 table renders correctly');
  });

  testWidgets('Large table from main.dart renders without crash', (tester) async {
    // Use a smaller excerpt to test the rendering pipeline
    const json = r'''
    {
      "version": "1.0",
      "pages": [
        {
          "type": "table",
          "numRows": 3,
          "numCols": 3,
          "columnWidths": [200, 300, 200],
          "rowHeights": [50, 40, 40],
          "borderWidth": 0,
          "matrixData": [[0,0,0],[1,2,3],[4,5,6]],
          "placements": [
            {
              "row": 0, "col": 0, "colEnd": 3, "rowEnd": 1,
              "style": {"textAlign":"center","backgroundColor":"#FFFFFF","fontWeight":"bold","fontSize":20},
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"text","content":"Header spanning all cols"}
            },
            {
              "row": 1, "col": 0, "colEnd": 1, "rowEnd": 2,
              "style": {"cellBorder": null},
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"text","content":"Cell 1"}
            },
            {
              "row": 1, "col": 1, "colEnd": 2, "rowEnd": 2,
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"richtext","spans":[{"text":"Bold","style":{"fontWeight":"bold"}},{"text":" text"}]}
            },
            {
              "row": 1, "col": 2, "colEnd": 3, "rowEnd": 2,
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": null
            },
            {
              "row": 2, "col": 0, "colEnd": 1, "rowEnd": 3,
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"input","name":"test","inputType":"text","placeholder":"Enter"}
            },
            {
              "row": 2, "col": 1, "colEnd": 2, "rowEnd": 3,
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"text","content":"Normal"}
            },
            {
              "row": 2, "col": 2, "colEnd": 3, "rowEnd": 3,
              "padding": {"top":4,"right":4,"bottom":4,"left":4},
              "child": {"type":"text","content":"End"}
            }
          ]
        }
      ],
      "fields": [{"name":"test","fieldType":"input","inputType":"text"}]
    }
    ''';

    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: json),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Header spanning all cols'), findsOneWidget);
    expect(find.text('Cell 1'), findsOneWidget);
    expect(find.text('Normal'), findsOneWidget);
    expect(find.text('End'), findsOneWidget);
    print('✓ 3x3 table with richtext, input, null child renders correctly');
  });

  testWidgets('Error case: empty pages shows message', (tester) async {
    const json = '{"version":"1.0","pages":[],"fields":[]}';
    await tester.pumpWidget(MaterialApp(
      home: FormRendererFromJson(jsonString: json),
    ));
    await tester.pumpAndSettle();
    expect(find.text('No pages in schema'), findsOneWidget);
    print('✓ Empty pages shows error message');
  });
}
