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
      "type": "container",
      "style": {
        "width": 800
      },
      "child": {
        "type": "column",
        "children": [
          {
            "type": "table",
            "numRows": 1,
            "numCols": 1,
            "columnSpecs": [
              {
                "type": "flex"
              }
            ],
            "rowHeights": [
              72
            ],
            "borderWidth": 0,
            "matrixData": [
              [
                0
              ]
            ],
            "placements": [
              {
                "row": 0,
                "col": 0,
                "colEnd": 1,
                "rowEnd": 1,
                "style": {
                  "textAlign": "right",
                  "color": "#832da2",
                  "fontWeight": "bold",
                  "fontSize": 47.9,
                  "fontFamily": "Arial"
                },
                "padding": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0
                },
                "child": {
                  "type": "text",
                  "content": "INVOICE"
                }
              }
            ]
          },
          {
            "type": "spacer",
            "height": 8
          },
          {
            "type": "table",
            "numRows": 1,
            "numCols": 2,
            "columnSpecs": [
              {
                "type": "fixed",
                "value": 400
              },
              {
                "type": "fixed",
                "value": 400
              }
            ],
            "rowHeights": [
              213
            ],
            "borderWidth": 0,
            "matrixData": [
              [
                0,
                1
              ]
            ],
            "placements": [
              {
                "row": 0,
                "col": 1,
                "colEnd": 2,
                "rowEnd": 1,
                "style": {
                  "color": "#000000",
                  "fontFamily": "Arial"
                },
                "padding": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0
                },
                "child": {
                  "type": "table",
                  "numRows": 4,
                  "numCols": 2,
                  "columnSpecs": [
                    {
                      "type": "flex"
                    },
                    {
                      "type": "flex"
                    }
                  ],
                  "rowHeights": [
                    65,
                    41,
                    41,
                    66
                  ],
                  "borderWidth": 0,
                  "matrixData": [
                    [
                      0,
                      1
                    ],
                    [
                      2,
                      3
                    ],
                    [
                      4,
                      5
                    ],
                    [
                      6,
                      7
                    ]
                  ],
                  "placements": [
                    {
                      "row": 0,
                      "col": 0,
                      "colEnd": 1,
                      "rowEnd": 1,
                      "style": {
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "richtext",
                        "spans": [
                          {
                            "text": "Electricity"
                          },
                          {
                            "text": "(estimated reading)",
                            "style": {
                              "fontStyle": "italic",
                              "fontSize": 9
                            }
                          }
                        ]
                      }
                    },
                    {
                      "row": 0,
                      "col": 1,
                      "colEnd": 2,
                      "rowEnd": 1,
                      "style": {
                        "textAlign": "right",
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "{d.elec :formatC}"
                      }
                    },
                    {
                      "row": 1,
                      "col": 0,
                      "colEnd": 1,
                      "rowEnd": 2,
                      "style": {
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "richtext",
                        "spans": [
                          {
                            "text": "VAT"
                          },
                          {
                            "text": "(Value Added Tax)",
                            "style": {
                              "fontStyle": "italic",
                              "fontSize": 9
                            }
                          }
                        ]
                      }
                    },
                    {
                      "row": 1,
                      "col": 1,
                      "colEnd": 2,
                      "rowEnd": 2,
                      "style": {
                        "textAlign": "right",
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "{d.VAT :formatC}"
                      }
                    },
                    {
                      "row": 2,
                      "col": 0,
                      "colEnd": 1,
                      "rowEnd": 3,
                      "style": {
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "Payments already made"
                      }
                    },
                    {
                      "row": 2,
                      "col": 1,
                      "colEnd": 2,
                      "rowEnd": 3,
                      "style": {
                        "textAlign": "right",
                        "color": "#000000",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "{d.already_paid :formatC}"
                      }
                    },
                    {
                      "row": 3,
                      "col": 0,
                      "colEnd": 1,
                      "rowEnd": 4,
                      "style": {
                        "color": "#832da1",
                        "fontWeight": "bold",
                        "fontSize": 16,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "top": {
                            "width": 1,
                            "color": "#832da2"
                          },
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "Total amount (including VAT)"
                      }
                    },
                    {
                      "row": 3,
                      "col": 1,
                      "colEnd": 2,
                      "rowEnd": 4,
                      "style": {
                        "textAlign": "right",
                        "color": "#832da1",
                        "fontWeight": "bold",
                        "fontSize": 18.6,
                        "fontFamily": "Arial",
                        "cellBorder": {
                          "top": {
                            "width": 1,
                            "color": "#832da2"
                          },
                          "bottom": {
                            "width": 1,
                            "color": "#832da2"
                          }
                        }
                      },
                      "padding": {
                        "top": 8,
                        "right": 8,
                        "bottom": 8,
                        "left": 8
                      },
                      "child": {
                        "type": "text",
                        "content": "{d.total:formatC}"
                      }
                    }
                  ]
                }
              }
            ]
          },
          {
            "type": "spacer",
            "height": 8
          },
          {
            "type": "spacer",
            "height": 8
          },
          {
            "type": "table",
            "numRows": 1,
            "numCols": 3,
            "columnSpecs": [
              {
                "type": "fixed",
                "value": 264
              },
              {
                "type": "fixed",
                "value": 264
              },
              {
                "type": "fixed",
                "value": 264
              }
            ],
            "rowHeights": [
              68
            ],
            "borderWidth": 0,
            "matrixData": [
              [
                0,
                1,
                2
              ]
            ],
            "placements": [
              {
                "row": 0,
                "col": 0,
                "colEnd": 1,
                "rowEnd": 1,
                "style": {
                  "verticalAlign": "top",
                  "color": "#000000",
                  "fontFamily": "Arial"
                },
                "padding": {
                  "top": 10,
                  "right": 10,
                  "bottom": 10,
                  "left": 10
                },
                "child": {
                  "type": "richtext",
                  "spans": [
                    {
                      "text": "{d.name}",
                      "style": {
                        "fontWeight": "bold"
                      }
                    },
                    {
                      "text": "\n"
                    },
                    {
                      "text": "{d.cust_nb}"
                    }
                  ]
                }
              },
              {
                "row": 0,
                "col": 1,
                "colEnd": 2,
                "rowEnd": 1,
                "style": {
                  "verticalAlign": "top",
                  "color": "#000000",
                  "fontFamily": "Arial"
                },
                "padding": {
                  "top": 10,
                  "right": 10,
                  "bottom": 10,
                  "left": 10
                },
                "child": {
                  "type": "richtext",
                  "spans": [
                    {
                      "text": "GREEN ENERGY CORPORATION",
                      "style": {
                        "fontWeight": "bold",
                        "color": "#832da2"
                      }
                    }
                  ]
                }
              },
              {
                "row": 0,
                "col": 2,
                "colEnd": 3,
                "rowEnd": 1,
                "style": {
                  "verticalAlign": "top",
                  "color": "#000000",
                  "fontFamily": "Arial"
                },
                "padding": {
                  "top": 10,
                  "right": 10,
                  "bottom": 10,
                  "left": 10
                },
                "child": {
                  "type": "richtext",
                  "spans": [
                    {
                      "text": "To pay",
                      "style": {
                        "fontWeight": "bold",
                        "color": "#832da2"
                      }
                    },
                    {
                      "text": "\n"
                    },
                    {
                      "text": "{d.total:formatC}",
                      "style": {
                        "fontWeight": "bold"
                      }
                    }
                  ]
                }
              }
            ]
          }
        ]
      }
    }
  ],
  "fields": []
}
''';
