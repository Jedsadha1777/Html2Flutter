import 'package:flutter/material.dart';
import 'form_renderer.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: FormRendererFromJson(
    jsonString: _sampleJson,
    onChanged: (name, value) => debugPrint('$name = $value'),
  ),
));

// ── Paste JSON from the web generator here ──────────────────────────────────
const _sampleJson = r'''
{
  "version": "1.0",
  "pages": [
    {
      "type": "table",
      "numRows": 32,
      "numCols": 28,
      "columnSpecs": [
        {
          "type": "fixed",
          "value": 186
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 54
        },
        {
          "type": "fixed",
          "value": 61
        },
        {
          "type": "fixed",
          "value": 107
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 105
        },
        {
          "type": "fixed",
          "value": 154
        },
        {
          "type": "fixed",
          "value": 76
        },
        {
          "type": "fixed",
          "value": 76
        },
        {
          "type": "fixed",
          "value": 76
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 63
        },
        {
          "type": "fixed",
          "value": 26
        },
        {
          "type": "fixed",
          "value": 69
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 50
        },
        {
          "type": "fixed",
          "value": 50
        },
        {
          "type": "fixed",
          "value": 48
        },
        {
          "type": "fixed",
          "value": 57
        },
        {
          "type": "fixed",
          "value": 57
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 42
        },
        {
          "type": "fixed",
          "value": 50
        }
      ],
      "rowHeights": [
        34,
        65,
        34,
        66,
        104,
        35,
        126,
        156,
        34,
        34,
        35,
        36,
        41,
        66,
        37,
        126,
        126,
        126,
        36,
        96,
        36,
        36,
        36,
        36,
        36,
        36,
        36,
        36,
        36,
        36,
        96,
        36
      ],
      "borderWidth": 0,
      "matrixData": [
        [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        ],
        [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20,
          21,
          22,
          22,
          23,
          23,
          23,
          23
        ],
        [
          24,
          25,
          26,
          27,
          28,
          29,
          30,
          31,
          32,
          33,
          34,
          35,
          36,
          37,
          38,
          39,
          40,
          41,
          42,
          43,
          44,
          45,
          46,
          47,
          48,
          49,
          50,
          51
        ],
        [
          52,
          52,
          52,
          52,
          53,
          53,
          54,
          54,
          54,
          54,
          54,
          54,
          54,
          54,
          54,
          54,
          55,
          55,
          55,
          55,
          55,
          55,
          56,
          56,
          56,
          57,
          57,
          57
        ],
        [
          58,
          58,
          58,
          58,
          59,
          59,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          61,
          61,
          61,
          61,
          61,
          61,
          62,
          62,
          62,
          63,
          63,
          63
        ],
        [
          58,
          58,
          58,
          58,
          59,
          59,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          60,
          61,
          61,
          61,
          61,
          61,
          61,
          64,
          64,
          64,
          65,
          65,
          65
        ],
        [
          66,
          66,
          66,
          66,
          67,
          67,
          67,
          67,
          68,
          69,
          70,
          71,
          72,
          73,
          74,
          75,
          76,
          76,
          76,
          76,
          76,
          76,
          76,
          77,
          77,
          77,
          77,
          77
        ],
        [
          78,
          78,
          78,
          78,
          79,
          79,
          79,
          79,
          80,
          81,
          81,
          81,
          81,
          81,
          81,
          82,
          83,
          83,
          83,
          83,
          83,
          83,
          83,
          84,
          84,
          84,
          84,
          84
        ],
        [
          78,
          78,
          78,
          78,
          79,
          79,
          79,
          79,
          85,
          81,
          81,
          81,
          81,
          81,
          81,
          86,
          83,
          83,
          83,
          83,
          83,
          83,
          83,
          84,
          84,
          84,
          84,
          84
        ],
        [
          78,
          78,
          78,
          78,
          79,
          79,
          79,
          79,
          87,
          81,
          81,
          81,
          81,
          81,
          81,
          88,
          83,
          83,
          83,
          83,
          83,
          83,
          83,
          84,
          84,
          84,
          84,
          84
        ],
        [
          89,
          90,
          91,
          92,
          93,
          94,
          95,
          96,
          97,
          98,
          99,
          100,
          101,
          102,
          103,
          104,
          105,
          106,
          106,
          106,
          106,
          106,
          106,
          106,
          106,
          107,
          107,
          107
        ],
        [
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108,
          108
        ],
        [
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109,
          109
        ],
        [
          110,
          110,
          110,
          110,
          110,
          110,
          110,
          110,
          111,
          111,
          111,
          111,
          111,
          111,
          111,
          111,
          112,
          113,
          114,
          115,
          116,
          117,
          118,
          119,
          120,
          121,
          122,
          123
        ],
        [
          124,
          125,
          126,
          127,
          128,
          129,
          130,
          131,
          132,
          132,
          132,
          132,
          132,
          132,
          132,
          132,
          133,
          133,
          133,
          133,
          133,
          133,
          133,
          133,
          133,
          133,
          133,
          133
        ],
        [
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          134,
          135,
          135,
          135,
          135,
          136,
          136,
          136,
          136
        ],
        [
          137,
          138,
          139,
          139,
          139,
          140,
          140,
          140,
          141,
          141,
          141,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          143,
          143,
          144,
          145,
          146,
          147,
          148,
          148
        ],
        [
          137,
          138,
          139,
          139,
          139,
          140,
          140,
          140,
          149,
          150,
          151,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          142,
          143,
          143,
          144,
          145,
          146,
          147,
          148,
          148
        ],
        [
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152,
          152
        ],
        [
          153,
          154,
          155,
          155,
          155,
          156,
          156,
          156,
          157,
          158,
          159,
          160,
          160,
          160,
          160,
          160,
          160,
          160,
          160,
          160,
          161,
          161,
          162,
          163,
          164,
          165,
          166,
          166
        ],
        [
          153,
          167,
          168,
          168,
          168,
          169,
          169,
          169,
          170,
          171,
          172,
          173,
          173,
          173,
          173,
          173,
          173,
          173,
          173,
          173,
          174,
          174,
          175,
          176,
          177,
          178,
          179,
          179
        ],
        [
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180,
          180
        ],
        [
          181,
          182,
          183,
          183,
          183,
          184,
          184,
          184,
          185,
          186,
          187,
          188,
          188,
          188,
          188,
          188,
          188,
          188,
          188,
          188,
          189,
          189,
          190,
          191,
          192,
          193,
          194,
          194
        ],
        [
          181,
          195,
          196,
          196,
          196,
          197,
          197,
          197,
          198,
          199,
          200,
          201,
          201,
          201,
          201,
          201,
          201,
          201,
          201,
          201,
          202,
          202,
          203,
          204,
          205,
          206,
          207,
          207
        ],
        [
          208,
          209,
          210,
          210,
          210,
          211,
          211,
          211,
          212,
          213,
          214,
          215,
          215,
          215,
          215,
          215,
          215,
          215,
          215,
          215,
          216,
          216,
          217,
          218,
          219,
          220,
          221,
          221
        ],
        [
          208,
          222,
          223,
          223,
          223,
          224,
          224,
          224,
          225,
          226,
          227,
          228,
          228,
          228,
          228,
          228,
          228,
          228,
          228,
          228,
          229,
          229,
          230,
          231,
          232,
          233,
          234,
          234
        ],
        [
          235,
          236,
          237,
          237,
          237,
          238,
          238,
          238,
          239,
          240,
          241,
          242,
          242,
          242,
          242,
          242,
          242,
          242,
          242,
          242,
          243,
          243,
          244,
          245,
          246,
          247,
          248,
          248
        ],
        [
          235,
          249,
          250,
          250,
          250,
          251,
          251,
          251,
          252,
          253,
          254,
          255,
          255,
          255,
          255,
          255,
          255,
          255,
          255,
          255,
          256,
          256,
          257,
          258,
          259,
          260,
          261,
          261
        ],
        [
          262,
          263,
          264,
          264,
          264,
          265,
          265,
          265,
          266,
          267,
          268,
          269,
          269,
          269,
          269,
          269,
          269,
          269,
          269,
          269,
          270,
          270,
          271,
          272,
          273,
          274,
          275,
          275
        ],
        [
          262,
          276,
          277,
          277,
          277,
          278,
          278,
          278,
          279,
          280,
          281,
          282,
          282,
          282,
          282,
          282,
          282,
          282,
          282,
          282,
          283,
          283,
          284,
          285,
          286,
          287,
          288,
          288
        ],
        [
          289,
          290,
          291,
          291,
          291,
          292,
          292,
          292,
          293,
          294,
          295,
          296,
          296,
          296,
          296,
          296,
          296,
          296,
          296,
          296,
          297,
          297,
          298,
          299,
          300,
          301,
          302,
          302
        ],
        [
          289,
          303,
          304,
          304,
          304,
          305,
          305,
          305,
          306,
          307,
          308,
          309,
          309,
          309,
          309,
          309,
          309,
          309,
          309,
          309,
          310,
          310,
          311,
          312,
          313,
          314,
          315,
          315
        ]
      ],
      "placements": [
        {
          "row": 0,
          "col": 0,
          "colEnd": 28,
          "rowEnd": 1,
          "dataCell": "AK-061_1.0:A1",
          "style": {
            "textAlign": "center",
            "verticalAlign": "top",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "QUALITY MANAGEMENT SYSTEM AND ITS PROCESS : (PROCESS APPROACH)"
          }
        },
        {
          "row": 1,
          "col": 6,
          "colEnd": 8,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:G2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:I2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:J2",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:K2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 11,
          "colEnd": 12,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:L2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 12,
          "colEnd": 13,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:M2",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 13,
          "colEnd": 14,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:N2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 14,
          "colEnd": 15,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:O2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:P2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 16,
          "colEnd": 17,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:Q2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 17,
          "colEnd": 18,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:R2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 18,
          "colEnd": 19,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:S2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 19,
          "colEnd": 20,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:T2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 20,
          "colEnd": 21,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:U2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 21,
          "colEnd": 22,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:V2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 1,
          "col": 22,
          "colEnd": 24,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:W2",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Division / Team"
          }
        },
        {
          "row": 1,
          "col": 24,
          "colEnd": 28,
          "rowEnd": 2,
          "dataCell": "AK-061_1.0:Y2",
          "style": {
            "backgroundColor": "#f2f2f2",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "select",
            "name": "select-field-Y2",
            "options": [
              {
                "value": "Option 1",
                "label": "Option 1"
              },
              {
                "value": "Option 2",
                "label": "Option 2"
              },
              {
                "value": "Option 3",
                "label": "Option 3"
              }
            ]
          }
        },
        {
          "row": 2,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:A3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:B3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 2,
          "colEnd": 3,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:C3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 3,
          "colEnd": 4,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:D3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 4,
          "colEnd": 5,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:E3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 5,
          "colEnd": 6,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:F3",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 6,
          "colEnd": 7,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:G3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 7,
          "colEnd": 8,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:H3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:I3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:J3",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:K3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 11,
          "colEnd": 12,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:L3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 12,
          "colEnd": 13,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:M3",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 13,
          "colEnd": 14,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:N3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 14,
          "colEnd": 15,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:O3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:P3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 16,
          "colEnd": 17,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:Q3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 17,
          "colEnd": 18,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:R3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 18,
          "colEnd": 19,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:S3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 19,
          "colEnd": 20,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:T3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 20,
          "colEnd": 21,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:U3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 21,
          "colEnd": 22,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:V3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:W3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:X3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:Y3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:Z3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 26,
          "colEnd": 27,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:AA3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 2,
          "col": 27,
          "colEnd": 28,
          "rowEnd": 3,
          "dataCell": "AK-061_1.0:AB3",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 3,
          "col": 0,
          "colEnd": 4,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:A4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ทรัพยากรที่ต้องใช้ (Resources)"
          }
        },
        {
          "row": 3,
          "col": 4,
          "colEnd": 6,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:E4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "จำนวน (amount)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 3,
          "col": 6,
          "colEnd": 16,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:G4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "อำนาจหน้าที่ความรับผิดชอบ (Person in charge)"
          }
        },
        {
          "row": 3,
          "col": 16,
          "colEnd": 22,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:Q4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "อุปกรณ์ (equipment)"
          }
        },
        {
          "row": 3,
          "col": 22,
          "colEnd": 25,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:W4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Prepare by"
          }
        },
        {
          "row": 3,
          "col": 25,
          "colEnd": 28,
          "rowEnd": 4,
          "dataCell": "AK-061_1.0:Z4",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Approved by"
          }
        },
        {
          "row": 4,
          "col": 0,
          "colEnd": 4,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:A5",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 4,
          "col": 4,
          "colEnd": 6,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:E5",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 4,
          "col": 6,
          "colEnd": 16,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:G5",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 4,
          "col": 16,
          "colEnd": 22,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:Q5",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 4,
          "col": 22,
          "colEnd": 25,
          "rowEnd": 5,
          "dataCell": "AK-061_1.0:W5",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "signature",
            "name": "signature-field-W5"
          }
        },
        {
          "row": 4,
          "col": 25,
          "colEnd": 28,
          "rowEnd": 5,
          "dataCell": "AK-061_1.0:Z5",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "signature",
            "name": "signature-field-Z5"
          }
        },
        {
          "row": 5,
          "col": 22,
          "colEnd": 25,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:W6",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Date :"
          }
        },
        {
          "row": 5,
          "col": 25,
          "colEnd": 28,
          "rowEnd": 6,
          "dataCell": "AK-061_1.0:Z6",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Date :"
          }
        },
        {
          "row": 6,
          "col": 0,
          "colEnd": 4,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:A7",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 6,
          "col": 4,
          "colEnd": 8,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:E7",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "In put"
          }
        },
        {
          "row": 6,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:J7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:K7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 11,
          "colEnd": 12,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:L7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 12,
          "colEnd": 13,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:M7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 13,
          "colEnd": 14,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:N7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 14,
          "colEnd": 15,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:O7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:P7",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 6,
          "col": 16,
          "colEnd": 23,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:Q7",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Out put"
          }
        },
        {
          "row": 6,
          "col": 23,
          "colEnd": 28,
          "rowEnd": 7,
          "dataCell": "AK-061_1.0:X7",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 7,
          "col": 0,
          "colEnd": 4,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:A8",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "textarea",
            "name": "textarea-field-A8",
            "rows": 3
          }
        },
        {
          "row": 7,
          "col": 4,
          "colEnd": 8,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:E8",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-E8",
            "inputType": "text"
          }
        },
        {
          "row": 7,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 8,
          "dataCell": "AK-061_1.0:I8",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 7,
          "col": 9,
          "colEnd": 15,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:J8",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 7,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 8,
          "dataCell": "AK-061_1.0:P8",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 7,
          "col": 16,
          "colEnd": 23,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:Q8",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "image-upload",
            "name": "image-upload-field-Q8",
            "source": "upload"
          }
        },
        {
          "row": 7,
          "col": 23,
          "colEnd": 28,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:X8",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "image-upload",
            "name": "image-upload-field-X8"
          }
        },
        {
          "row": 8,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 9,
          "dataCell": "AK-061_1.0:I9",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 8,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 9,
          "dataCell": "AK-061_1.0:P9",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 9,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:I10",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 9,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 10,
          "dataCell": "AK-061_1.0:P10",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:A11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:B11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 2,
          "colEnd": 3,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:C11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 3,
          "colEnd": 4,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:D11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 4,
          "colEnd": 5,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:E11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 5,
          "colEnd": 6,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:F11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 6,
          "colEnd": 7,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:G11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 7,
          "colEnd": 8,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:H11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:I11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:J11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:K11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 11,
          "colEnd": 12,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:L11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 12,
          "colEnd": 13,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:M11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 13,
          "colEnd": 14,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:N11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 14,
          "colEnd": 15,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:O11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 15,
          "colEnd": 16,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:P11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 16,
          "colEnd": 17,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:Q11",
          "style": {
            "fontSize": 14.6,
            "fontFamily": "Arial",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 17,
          "colEnd": 25,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:R11",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 10,
          "col": 25,
          "colEnd": 28,
          "rowEnd": 11,
          "dataCell": "AK-061_1.0:Z11",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 11,
          "col": 0,
          "colEnd": 28,
          "rowEnd": 12,
          "dataCell": "AK-061_1.0:A12",
          "style": {
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1. เกณฑ์และวิธีการ/ ความรู้ที่จำเป็นในการควบคุม กระบวนการนี้ (Criteria and methods / knowledge needed to control this process.)"
          }
        },
        {
          "row": 12,
          "col": 0,
          "colEnd": 28,
          "rowEnd": 13,
          "dataCell": "AK-061_1.0:A13",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 13,
          "col": 0,
          "colEnd": 8,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:A14",
          "style": {
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2. ดัชนีชี้วัดสมรรถนะและประเมินผลของกระบวนการ (Key Performance Indicator (KPI))"
          }
        },
        {
          "row": 13,
          "col": 8,
          "colEnd": 16,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:I14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "เป้าหมาย (Target)"
          }
        },
        {
          "row": 13,
          "col": 16,
          "colEnd": 17,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:Q14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Jan"
          }
        },
        {
          "row": 13,
          "col": 17,
          "colEnd": 18,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:R14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Feb"
          }
        },
        {
          "row": 13,
          "col": 18,
          "colEnd": 19,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:S14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Mar"
          }
        },
        {
          "row": 13,
          "col": 19,
          "colEnd": 20,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:T14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Apr"
          }
        },
        {
          "row": 13,
          "col": 20,
          "colEnd": 21,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:U14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "May"
          }
        },
        {
          "row": 13,
          "col": 21,
          "colEnd": 22,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:V14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Jun"
          }
        },
        {
          "row": 13,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:W14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Jul"
          }
        },
        {
          "row": 13,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:X14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Aug"
          }
        },
        {
          "row": 13,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:Y14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Sep"
          }
        },
        {
          "row": 13,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:Z14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Oct"
          }
        },
        {
          "row": 13,
          "col": 26,
          "colEnd": 27,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:AA14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Nov"
          }
        },
        {
          "row": 13,
          "col": 27,
          "colEnd": 28,
          "rowEnd": 14,
          "dataCell": "AK-061_1.0:AB14",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Dec"
          }
        },
        {
          "row": 14,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:A15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:B15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 2,
          "colEnd": 3,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:C15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 3,
          "colEnd": 4,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:D15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 4,
          "colEnd": 5,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:E15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 5,
          "colEnd": 6,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:F15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 6,
          "colEnd": 7,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:G15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 7,
          "colEnd": 8,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:H15",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 8,
          "colEnd": 16,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:I15",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 14,
          "col": 16,
          "colEnd": 28,
          "rowEnd": 15,
          "dataCell": "AK-061_1.0:Q15",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 15,
          "col": 0,
          "colEnd": 20,
          "rowEnd": 16,
          "dataCell": "AK-061_1.0:A16",
          "style": {
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontWeight": "bold",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "3.ความเสี่ยง / โอกาส ที่มีผลต่อความสอดคล้องของสินค้าและบริการ และความพึงพอใจของลูกค้า (Risks / Opportunities that Affect Product and Service Needs and Customer) Satisfaction",
                "style": {
                  "fontWeight": "bold",
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 15,
          "col": 20,
          "colEnd": 24,
          "rowEnd": 16,
          "dataCell": "AK-061_1.0:U16",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "แผนงาน (Plan)"
          }
        },
        {
          "row": 15,
          "col": 24,
          "colEnd": 28,
          "rowEnd": 16,
          "dataCell": "AK-061_1.0:Y16",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fac090",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "การประเมินประสิทธิผล (Evaluation of Effectiveness)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:A17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "หัวข้อที่ใช้ประเมินความเสี่ยง Risk Evaluation Points",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:B17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ข้อที่"
          }
        },
        {
          "row": 16,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:C17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "จุดอ่อนของกระบวนการ (Weak point )",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:F17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "ประเด็นความเสี่ยงที่พิจารณา Risk factors considered in the assessment",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 8,
          "colEnd": 11,
          "rowEnd": 17,
          "dataCell": "AK-061_1.0:I17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "คะแนนประเมินความเสี่ยง"
          }
        },
        {
          "row": 16,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:L17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "แนวทางการจัดการความเสี่ยง ( Action to address risk )",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:U17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "ผู้รับผิดชอบ (PIC)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:W17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "เริ่ม (Start)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:X17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "เสร็จ (Finish)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 16,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:Y17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "YES"
          }
        },
        {
          "row": 16,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:Z17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "NO"
          }
        },
        {
          "row": 16,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:AA17",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "แผนปรับปรุง Next Action",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 17,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:I18",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "richtext",
            "spans": [
              {
                "text": "โอกาสเกิด (Likelihood)",
                "style": {
                  "color": "#000000",
                  "fontSize": 20,
                  "fontFamily": "Browallia New"
                }
              }
            ]
          }
        },
        {
          "row": 17,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:J18",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ผลกระทบ (Impact)"
          }
        },
        {
          "row": 17,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 18,
          "dataCell": "AK-061_1.0:K18",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#fdeada",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ระดับความเสี่ยง (L x I)"
          }
        },
        {
          "row": 18,
          "col": 0,
          "colEnd": 28,
          "rowEnd": 19,
          "dataCell": "AK-061_1.0:A19",
          "style": {
            "backgroundColor": "#d9d9d9",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ความเสี่ยงต่อเป้าหมาย"
          }
        },
        {
          "row": 19,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:A20",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 19,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:B20",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 19,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:C20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-C20",
            "inputType": "text"
          }
        },
        {
          "row": 19,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:F20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-F20",
            "inputType": "text"
          }
        },
        {
          "row": 19,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:I20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "date-picker",
            "name": "date-field-I20"
          }
        },
        {
          "row": 19,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:J20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-J20",
            "inputType": "text"
          }
        },
        {
          "row": 19,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:K20",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "#VALUE!"
          }
        },
        {
          "row": 19,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:L20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-L20",
            "inputType": "text"
          }
        },
        {
          "row": 19,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:U20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-U20",
            "inputType": "text"
          }
        },
        {
          "row": 19,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:W20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "date-picker",
            "name": "date-field-W20"
          }
        },
        {
          "row": 19,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:X20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "date-picker",
            "name": "date-field-X20"
          }
        },
        {
          "row": 19,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:Y20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "checkbox",
            "name": "checkbox-field-Y20"
          }
        },
        {
          "row": 19,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:Z20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "checkbox",
            "name": "checkbox-field-Z20"
          }
        },
        {
          "row": 19,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 20,
          "dataCell": "AK-061_1.0:AA20",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 16,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "input",
            "name": "input-field-AA20",
            "inputType": "text"
          }
        },
        {
          "row": 20,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:B21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 20,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:C21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:F21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:I21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:J21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:K21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 20,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:L21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:U21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:W21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:X21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:Y21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:Z21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 20,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 21,
          "dataCell": "AK-061_1.0:AA21",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 21,
          "col": 0,
          "colEnd": 28,
          "rowEnd": 22,
          "dataCell": "AK-061_1.0:A22",
          "style": {
            "backgroundColor": "#d9d9d9",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "ความเสี่ยงต่อกระบวนการ"
          }
        },
        {
          "row": 22,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:A23",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Man (คน)"
          }
        },
        {
          "row": 22,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:B23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 22,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:C23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:F23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:I23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:J23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:K23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 22,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:L23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:U23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:W23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:X23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:Y23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:Z23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 22,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 23,
          "dataCell": "AK-061_1.0:AA23",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:B24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 23,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:C24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:F24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:I24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:J24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:K24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 23,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:L24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:U24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:W24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:X24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:Y24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:Z24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 23,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 24,
          "dataCell": "AK-061_1.0:AA24",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:A25",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Machine (อุปกรณ์)"
          }
        },
        {
          "row": 24,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:B25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 24,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:C25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:F25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:I25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:J25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:K25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 24,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:L25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:U25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:W25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:X25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:Y25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:Z25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 24,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 25,
          "dataCell": "AK-061_1.0:AA25",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:B26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 25,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:C26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:F26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:I26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:J26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:K26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 25,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:L26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:U26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:W26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:X26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:Y26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:Z26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 25,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 26,
          "dataCell": "AK-061_1.0:AA26",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:A27",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Method (วิธีการ)"
          }
        },
        {
          "row": 26,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:B27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 26,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:C27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:F27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:I27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:J27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:K27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 26,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:L27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:U27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:W27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:X27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:Y27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:Z27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 26,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 27,
          "dataCell": "AK-061_1.0:AA27",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:B28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 27,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:C28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:F28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:I28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:J28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:K28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 27,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:L28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:U28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:W28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:X28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:Y28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:Z28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 27,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 28,
          "dataCell": "AK-061_1.0:AA28",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:A29",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Material (วัสดุ)"
          }
        },
        {
          "row": 28,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:B29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 28,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:C29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:F29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:I29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:J29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:K29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 28,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:L29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:U29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:W29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:X29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:Y29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:Z29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 28,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 29,
          "dataCell": "AK-061_1.0:AA29",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:B30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 29,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:C30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:F30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:I30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:J30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:K30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 29,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:L30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:U30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:W30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:X30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:Y30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:Z30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 29,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 30,
          "dataCell": "AK-061_1.0:AA30",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 0,
          "colEnd": 1,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:A31",
          "style": {
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "left": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "Environment (สภาพแวดล้อมในการทำงาน)"
          }
        },
        {
          "row": 30,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:B31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "1"
          }
        },
        {
          "row": 30,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:C31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:F31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:I31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:J31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:K31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 30,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:L31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:U31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:W31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:X31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:Y31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:Z31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 30,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 31,
          "dataCell": "AK-061_1.0:AA31",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 1,
          "colEnd": 2,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:B32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "2"
          }
        },
        {
          "row": 31,
          "col": 2,
          "colEnd": 5,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:C32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 5,
          "colEnd": 8,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:F32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 8,
          "colEnd": 9,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:I32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 9,
          "colEnd": 10,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:J32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 10,
          "colEnd": 11,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:K32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": {
            "type": "text",
            "content": "0"
          }
        },
        {
          "row": 31,
          "col": 11,
          "colEnd": 20,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:L32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "bottom": {
                "color": "#000000",
                "width": 1
              },
              "right": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 20,
          "colEnd": 22,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:U32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 22,
          "colEnd": 23,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:W32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 23,
          "colEnd": 24,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:X32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "pre-wrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 24,
          "colEnd": 25,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:Y32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 25,
          "colEnd": 26,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:Z32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        },
        {
          "row": 31,
          "col": 26,
          "colEnd": 28,
          "rowEnd": 32,
          "dataCell": "AK-061_1.0:AA32",
          "style": {
            "textAlign": "center",
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 20,
            "fontFamily": "Browallia New",
            "cellBorder": {
              "right": {
                "color": "#000000",
                "width": 1
              },
              "bottom": {
                "color": "#000000",
                "width": 1
              }
            },
            "whiteSpace": "nowrap"
          },
          "padding": {
            "top": 2,
            "right": 4,
            "bottom": 2,
            "left": 4
          },
          "child": null
        }
      ]
    }
  ],
  "fields": [
    {
      "name": "select-field-Y2",
      "fieldType": "select",
      "options": [
        {
          "value": "Option 1",
          "label": "Option 1"
        },
        {
          "value": "Option 2",
          "label": "Option 2"
        },
        {
          "value": "Option 3",
          "label": "Option 3"
        }
      ]
    },
    {
      "name": "signature-field-W5",
      "fieldType": "signature"
    },
    {
      "name": "signature-field-Z5",
      "fieldType": "signature"
    },
    {
      "name": "textarea-field-A8",
      "fieldType": "textarea"
    },
    {
      "name": "input-field-E8",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "image-upload-field-Q8",
      "fieldType": "image-upload"
    },
    {
      "name": "image-upload-field-X8",
      "fieldType": "image-upload"
    },
    {
      "name": "input-field-C20",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "input-field-F20",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "date-field-I20",
      "fieldType": "date-picker"
    },
    {
      "name": "input-field-J20",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "input-field-L20",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "input-field-U20",
      "fieldType": "input",
      "inputType": "text"
    },
    {
      "name": "date-field-W20",
      "fieldType": "date-picker"
    },
    {
      "name": "date-field-X20",
      "fieldType": "date-picker"
    },
    {
      "name": "checkbox-field-Y20",
      "fieldType": "checkbox"
    },
    {
      "name": "checkbox-field-Z20",
      "fieldType": "checkbox"
    },
    {
      "name": "input-field-AA20",
      "fieldType": "input",
      "inputType": "text"
    }
  ]
}
''';
