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
        "backgroundColor": "#F9FAFC",
        "color": "#555",
        "fontSize": 16,
        "fontFamily": "Inter",
        "width": 800,
        "padding": {
          "top": 16,
          "right": 16,
          "bottom": 16,
          "left": 16
        },
        "border": {
          "top": {
            "width": 1,
            "color": "#eee"
          },
          "right": {
            "width": 1,
            "color": "#eee"
          },
          "bottom": {
            "width": 1,
            "color": "#eee"
          },
          "left": {
            "width": 1,
            "color": "#eee"
          }
        }
      },
      "child": {
        "type": "table",
        "numRows": 3,
        "numCols": 1,
        "columnSpecs": [
          {
            "type": "flex"
          }
        ],
        "rowHeights": [
          81,
          905,
          70
        ],
        "borderWidth": 0,
        "matrixData": [
          [
            0
          ],
          [
            1
          ],
          [
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
              "backgroundColor": "#EEEEEE",
              "fontWeight": "bold",
              "fontSize": 12
            },
            "padding": {
              "top": 0,
              "right": 16,
              "bottom": 18,
              "left": 16
            },
            "child": {
              "type": "text",
              "content": "Alvish Baldha (Courier)\nhello@email.com\n+44 7766002333",
              "style": {
                "fontSize": 18,
                "fontWeight": "bold",
                "color": "#1A1C21"
              }
            }
          },
          {
            "row": 1,
            "col": 0,
            "colEnd": 1,
            "rowEnd": 2,
            "style": {
              "fontSize": 12
            },
            "padding": {
              "top": 4,
              "right": 4,
              "bottom": 4,
              "left": 4
            },
            "child": {
              "type": "table",
              "numRows": 3,
              "numCols": 3,
              "columnSpecs": [
                {
                  "type": "percent",
                  "value": 30
                },
                {
                  "type": "percent",
                  "value": 35
                },
                {
                  "type": "flex"
                }
              ],
              "rowHeights": [
                239,
                69,
                493
              ],
              "borderWidth": 0,
              "matrixData": [
                [
                  0,
                  1,
                  2
                ],
                [
                  3,
                  4,
                  5
                ],
                [
                  6,
                  6,
                  6
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
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 35,
                    "left": 20
                  },
                  "child": {
                    "type": "text",
                    "content": "Client Name\nBusiness address City, Country\nemail@company.com"
                  }
                },
                {
                  "row": 0,
                  "col": 1,
                  "colEnd": 2,
                  "rowEnd": 1,
                  "style": {
                    "verticalAlign": "top",
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 35,
                    "left": 20
                  },
                  "child": {
                    "type": "text",
                    "content": "Pick-up\n1 Hight street, London, E1 7QL Uk\nDrop-off\n1 Hight street, London, E1 7QL Uk"
                  }
                },
                {
                  "row": 0,
                  "col": 2,
                  "colEnd": 3,
                  "rowEnd": 1,
                  "style": {
                    "verticalAlign": "top",
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 35,
                    "left": 20
                  },
                  "child": {
                    "type": "table",
                    "numRows": 5,
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
                      32,
                      32,
                      32,
                      32,
                      56
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
                      ],
                      [
                        8,
                        9
                      ]
                    ],
                    "placements": [
                      {
                        "row": 0,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 1,
                        "style": {
                          "color": "#1A1C21",
                          "fontWeight": "bold"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Job ID"
                        }
                      },
                      {
                        "row": 0,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 1,
                        "style": {
                          "textAlign": "right"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "123567"
                        }
                      },
                      {
                        "row": 1,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 2,
                        "style": {
                          "color": "#1A1C21",
                          "fontWeight": "bold"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Job date"
                        }
                      },
                      {
                        "row": 1,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 2,
                        "style": {
                          "textAlign": "right"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "14/12/2020"
                        }
                      },
                      {
                        "row": 2,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 3,
                        "style": {
                          "color": "#1A1C21",
                          "fontWeight": "bold"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Distance"
                        }
                      },
                      {
                        "row": 2,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 3,
                        "style": {
                          "textAlign": "right"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "1.568 miles"
                        }
                      },
                      {
                        "row": 3,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 4,
                        "style": {
                          "color": "#1A1C21",
                          "fontWeight": "bold"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Pick-up time"
                        }
                      },
                      {
                        "row": 3,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 4,
                        "style": {
                          "textAlign": "right"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "19:58"
                        }
                      },
                      {
                        "row": 4,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 5,
                        "style": {
                          "color": "#1A1C21",
                          "fontWeight": "bold"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Time delivered"
                        }
                      },
                      {
                        "row": 4,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 5,
                        "style": {
                          "textAlign": "right"
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "20:58"
                        }
                      }
                    ]
                  }
                },
                {
                  "row": 1,
                  "col": 0,
                  "colEnd": 1,
                  "rowEnd": 2,
                  "style": {
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 13,
                    "left": 20
                  },
                  "child": {
                    "type": "text",
                    "content": "Service \nDelivery Service"
                  }
                },
                {
                  "row": 1,
                  "col": 1,
                  "colEnd": 2,
                  "rowEnd": 2,
                  "style": {
                    "textAlign": "center",
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 13,
                    "left": 20
                  },
                  "child": {
                    "type": "text",
                    "content": "Invoice number\n#AB2324-01"
                  }
                },
                {
                  "row": 1,
                  "col": 2,
                  "colEnd": 3,
                  "rowEnd": 2,
                  "style": {
                    "textAlign": "end",
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 13,
                    "left": 20
                  },
                  "child": {
                    "type": "text",
                    "content": "Invoice date\n01 Aug, 2023"
                  }
                },
                {
                  "row": 2,
                  "col": 0,
                  "colEnd": 3,
                  "rowEnd": 3,
                  "style": {
                    "fontSize": 12
                  },
                  "padding": {
                    "top": 20,
                    "right": 20,
                    "bottom": 20,
                    "left": 20
                  },
                  "child": {
                    "type": "table",
                    "numRows": 5,
                    "numCols": 4,
                    "columnSpecs": [
                      {
                        "type": "flex"
                      },
                      {
                        "type": "fixed",
                        "value": 40
                      },
                      {
                        "type": "fixed",
                        "value": 100
                      },
                      {
                        "type": "fixed",
                        "value": 120
                      }
                    ],
                    "rowHeights": [
                      42,
                      72,
                      72,
                      211,
                      56
                    ],
                    "borderWidth": 0,
                    "matrixData": [
                      [
                        0,
                        1,
                        2,
                        3
                      ],
                      [
                        4,
                        5,
                        6,
                        7
                      ],
                      [
                        8,
                        9,
                        10,
                        11
                      ],
                      [
                        12,
                        13,
                        13,
                        13
                      ],
                      [
                        14,
                        -1,
                        -1,
                        -1
                      ]
                    ],
                    "placements": [
                      {
                        "row": 0,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 1,
                        "style": {
                          "backgroundColor": "#EEEEEE",
                          "fontWeight": "bold",
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            },
                            "bottom": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 8,
                          "right": 0,
                          "bottom": 8,
                          "left": 0
                        },
                        "child": {
                          "type": "text",
                          "content": "Item Detail"
                        }
                      },
                      {
                        "row": 0,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 1,
                        "style": {
                          "backgroundColor": "#EEEEEE",
                          "fontWeight": "bold",
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            },
                            "bottom": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 8,
                          "right": 0,
                          "bottom": 8,
                          "left": 0
                        },
                        "child": {
                          "type": "text",
                          "content": "Qty\n\t\t\t\t\t\t\t\t\t\t\t\t"
                        }
                      },
                      {
                        "row": 0,
                        "col": 2,
                        "colEnd": 3,
                        "rowEnd": 1,
                        "style": {
                          "textAlign": "end",
                          "backgroundColor": "#EEEEEE",
                          "fontWeight": "bold",
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            },
                            "bottom": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 8,
                          "right": 0,
                          "bottom": 8,
                          "left": 0
                        },
                        "child": {
                          "type": "text",
                          "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tRate"
                        }
                      },
                      {
                        "row": 0,
                        "col": 3,
                        "colEnd": 4,
                        "rowEnd": 1,
                        "style": {
                          "textAlign": "end",
                          "backgroundColor": "#EEEEEE",
                          "fontWeight": "bold",
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            },
                            "bottom": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 8,
                          "right": 0,
                          "bottom": 8,
                          "left": 0
                        },
                        "child": {
                          "type": "text",
                          "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tAmount"
                        }
                      },
                      {
                        "row": 1,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 2,
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Drops\nOn-demand delivery"
                        }
                      },
                      {
                        "row": 1,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 2,
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "1"
                        }
                      },
                      {
                        "row": 1,
                        "col": 2,
                        "colEnd": 3,
                        "rowEnd": 2,
                        "style": {
                          "textAlign": "end"
                        },
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "£5.00"
                        }
                      },
                      {
                        "row": 1,
                        "col": 3,
                        "colEnd": 4,
                        "rowEnd": 2,
                        "style": {
                          "textAlign": "end"
                        },
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "£5.00"
                        }
                      },
                      {
                        "row": 2,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 3,
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "Hours\nShift delivery service"
                        }
                      },
                      {
                        "row": 2,
                        "col": 1,
                        "colEnd": 2,
                        "rowEnd": 3,
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "0"
                        }
                      },
                      {
                        "row": 2,
                        "col": 2,
                        "colEnd": 3,
                        "rowEnd": 3,
                        "style": {
                          "textAlign": "end"
                        },
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "£0.00"
                        }
                      },
                      {
                        "row": 2,
                        "col": 3,
                        "colEnd": 4,
                        "rowEnd": 3,
                        "style": {
                          "textAlign": "end"
                        },
                        "padding": {
                          "top": 12,
                          "right": 4,
                          "bottom": 12,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "£0.00"
                        }
                      },
                      {
                        "row": 3,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 4,
                        "style": {
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 12,
                          "right": 0,
                          "bottom": 12,
                          "left": 0
                        },
                        "child": null
                      },
                      {
                        "row": 3,
                        "col": 1,
                        "colEnd": 4,
                        "rowEnd": 4,
                        "style": {
                          "cellBorder": {
                            "top": {
                              "width": 1,
                              "color": "#D7DAE0"
                            }
                          }
                        },
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "table",
                          "numRows": 3,
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
                            40,
                            72,
                            91
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
                            ]
                          ],
                          "placements": [
                            {
                              "row": 0,
                              "col": 0,
                              "colEnd": 1,
                              "rowEnd": 1,
                              "style": {
                                "textAlign": "start",
                                "color": "#1A1C21",
                                "fontWeight": "bold"
                              },
                              "padding": {
                                "top": 12,
                                "right": 4,
                                "bottom": 4,
                                "left": 4
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSubtotal"
                              }
                            },
                            {
                              "row": 0,
                              "col": 1,
                              "colEnd": 2,
                              "rowEnd": 1,
                              "style": {
                                "textAlign": "end",
                                "color": "#1A1C21"
                              },
                              "padding": {
                                "top": 12,
                                "right": 4,
                                "bottom": 4,
                                "left": 4
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t£5.00"
                              }
                            },
                            {
                              "row": 1,
                              "col": 0,
                              "colEnd": 1,
                              "rowEnd": 2,
                              "style": {
                                "textAlign": "start",
                                "color": "#1A1C21",
                                "fontWeight": "bold"
                              },
                              "padding": {
                                "top": 12,
                                "right": 0,
                                "bottom": 12,
                                "left": 0
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tVAT in items (0%) (1)"
                              }
                            },
                            {
                              "row": 1,
                              "col": 1,
                              "colEnd": 2,
                              "rowEnd": 2,
                              "style": {
                                "textAlign": "end",
                                "color": "#1A1C21"
                              },
                              "padding": {
                                "top": 12,
                                "right": 0,
                                "bottom": 12,
                                "left": 0
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t£5.00"
                              }
                            },
                            {
                              "row": 2,
                              "col": 0,
                              "colEnd": 1,
                              "rowEnd": 3,
                              "style": {
                                "textAlign": "start",
                                "color": "#1A1C21",
                                "fontWeight": "bold",
                                "cellBorder": {
                                  "top": {
                                    "width": 1,
                                    "color": "#D7DAE0"
                                  }
                                }
                              },
                              "padding": {
                                "top": 12,
                                "right": 0,
                                "bottom": 30,
                                "left": 0
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTotal Price (2)"
                              }
                            },
                            {
                              "row": 2,
                              "col": 1,
                              "colEnd": 2,
                              "rowEnd": 3,
                              "style": {
                                "textAlign": "end",
                                "color": "#1A1C21",
                                "fontWeight": "bold",
                                "cellBorder": {
                                  "top": {
                                    "width": 1,
                                    "color": "#D7DAE0"
                                  }
                                }
                              },
                              "padding": {
                                "top": 12,
                                "right": 0,
                                "bottom": 30,
                                "left": 0
                              },
                              "child": {
                                "type": "text",
                                "content": "\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t£5.00"
                              }
                            }
                          ]
                        }
                      },
                      {
                        "row": 4,
                        "col": 0,
                        "colEnd": 1,
                        "rowEnd": 5,
                        "padding": {
                          "top": 4,
                          "right": 4,
                          "bottom": 4,
                          "left": 4
                        },
                        "child": {
                          "type": "text",
                          "content": "(1) VAT non applicable\n(2) Price includes the remuneration for\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tMealShift Services"
                        }
                      }
                    ]
                  }
                }
              ],
              "tableStyle": {
                "border": {
                  "top": {
                    "color": "#D7DAE0",
                    "width": 1
                  },
                  "right": {
                    "color": "#D7DAE0",
                    "width": 1
                  },
                  "bottom": {
                    "color": "#D7DAE0",
                    "width": 1
                  },
                  "left": {
                    "color": "#D7DAE0",
                    "width": 1
                  }
                },
                "borderRadius": 12,
                "padding": {
                  "top": 20,
                  "right": 16,
                  "bottom": 20,
                  "left": 16
                },
                "backgroundColor": "#FFFFFF"
              }
            }
          },
          {
            "row": 2,
            "col": 0,
            "colEnd": 1,
            "rowEnd": 3,
            "style": {
              "fontSize": 12
            },
            "padding": {
              "top": 30,
              "right": 4,
              "bottom": 4,
              "left": 4
            },
            "child": {
              "type": "column",
              "children": [
                {
                  "type": "richtext",
                  "spans": [
                    {
                      "text": "MealShift Ltd",
                      "style": {
                        "fontWeight": "700",
                        "color": "#1A1C21"
                      }
                    },
                    {
                      "text": "1 Assam Street, London - E1 7QL"
                    },
                    {
                      "text": "Registration number:12793366"
                    }
                  ]
                },
                {
                  "type": "richtext",
                  "spans": [
                    {
                      "text": "Any questions, contact customer service at "
                    },
                    {
                      "text": "support@mealshift.co.uk",
                      "style": {
                        "color": "#1976D2",
                        "decoration": "underline"
                      },
                      "href": "mailto:support@mealshift.co.uk"
                    },
                    {
                      "text": "."
                    }
                  ]
                }
              ]
            }
          }
        ]
      }
    }
  ],
  "fields": []
}
''';
