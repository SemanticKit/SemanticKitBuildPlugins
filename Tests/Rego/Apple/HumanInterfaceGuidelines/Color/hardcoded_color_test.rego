package apple.hig.color.hardcoded_color

test_warns_for_literal_rgb_color if {
  result := decision with input as rgb_color_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.color.review_hardcoded_color"
  result.warn[0].message == "Review hardcoded color; prefer system colors."
  result.warn[0].line == 21
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_literal_uicolor_rgb_color if {
  result := decision with input as uicolor_rgb_color_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.color.review_hardcoded_color"
  result.warn[0].message == "Review hardcoded color; prefer system colors."
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_literal_nscolor_calibrated_rgb_color if {
  result := decision with input as nscolor_calibrated_rgb_color_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.color.review_hardcoded_color"
  result.warn[0].message == "Review hardcoded color; prefer system colors."
  result.warn[0].line == 23
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_literal_hsb_color if {
  result := decision with input as hsb_color_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.color.review_hardcoded_color"
  result.warn[0].message == "Review hardcoded color; prefer system colors."
  result.warn[0].line == 24
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_named_asset_color if {
  result := decision with input as named_asset_color_node

  count(result.warn) == 0
}

test_does_not_warn_for_rgb_color_without_literal_components if {
  result := decision with input as rgb_color_from_variables_node

  count(result.warn) == 0
}

# Parser output for `Color(red: 0.2, green: 0.4, blue: 0.8)` at 21:9.
rgb_color_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 14}}, "token": {"kind": "identifier", "text": "Color"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 18}}, "token": {"kind": "identifier", "text": "red"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 18}, "end": {"line": 21, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 23}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 23}}, "token": {"kind": "floatLiteral", "text": "0.2"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 25}, "end": {"line": 21, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 25}, "end": {"line": 21, "column": 30}}, "token": {"kind": "identifier", "text": "green"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 30}, "end": {"line": 21, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 21, "column": 32}, "end": {"line": 21, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 32}, "end": {"line": 21, "column": 35}}, "token": {"kind": "floatLiteral", "text": "0.4"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 35}, "end": {"line": 21, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 41}}, "token": {"kind": "identifier", "text": "blue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 41}, "end": {"line": 21, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 21, "column": 43}, "end": {"line": 21, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 43}, "end": {"line": 21, "column": 46}}, "token": {"kind": "floatLiteral", "text": "0.8"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 47}, "end": {"line": 21, "column": 47}}, "children": []},
]}

# Parser output for `UIColor(red: 1, green: 0, blue: 0, alpha: 1)` at 22:9.
uicolor_rgb_color_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 16}}, "token": {"kind": "identifier", "text": "UIColor"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 20}}, "token": {"kind": "identifier", "text": "red"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 21}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 23}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 23}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 23}, "end": {"line": 22, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 25}, "end": {"line": 22, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 25}, "end": {"line": 22, "column": 30}}, "token": {"kind": "identifier", "text": "green"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 30}, "end": {"line": 22, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 22, "column": 32}, "end": {"line": 22, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 32}, "end": {"line": 22, "column": 33}}, "token": {"kind": "integerLiteral", "text": "0"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 33}, "end": {"line": 22, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 43}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 39}}, "token": {"kind": "identifier", "text": "blue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 39}, "end": {"line": 22, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 22, "column": 41}, "end": {"line": 22, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 41}, "end": {"line": 22, "column": 42}}, "token": {"kind": "integerLiteral", "text": "0"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 42}, "end": {"line": 22, "column": 43}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 44}, "end": {"line": 22, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 44}, "end": {"line": 22, "column": 49}}, "token": {"kind": "identifier", "text": "alpha"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 49}, "end": {"line": 22, "column": 50}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 22, "column": 51}, "end": {"line": 22, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 51}, "end": {"line": 22, "column": 52}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 52}, "end": {"line": 22, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 53}, "end": {"line": 22, "column": 53}}, "children": []},
]}

# Parser output for `NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)` at 23:9.
nscolor_calibrated_rgb_color_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 69}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 16}}, "token": {"kind": "identifier", "text": "NSColor"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 16}, "end": {"line": 23, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 68}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 17}, "end": {"line": 23, "column": 30}}, "token": {"kind": "identifier", "text": "calibratedRed"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 30}, "end": {"line": 23, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 23, "column": 32}, "end": {"line": 23, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 32}, "end": {"line": 23, "column": 35}}, "token": {"kind": "floatLiteral", "text": "0.1"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 35}, "end": {"line": 23, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 37}, "end": {"line": 23, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 37}, "end": {"line": 23, "column": 42}}, "token": {"kind": "identifier", "text": "green"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 42}, "end": {"line": 23, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 23, "column": 44}, "end": {"line": 23, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 44}, "end": {"line": 23, "column": 47}}, "token": {"kind": "floatLiteral", "text": "0.1"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 47}, "end": {"line": 23, "column": 48}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 49}, "end": {"line": 23, "column": 59}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 49}, "end": {"line": 23, "column": 53}}, "token": {"kind": "identifier", "text": "blue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 53}, "end": {"line": 23, "column": 54}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 23, "column": 55}, "end": {"line": 23, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 55}, "end": {"line": 23, "column": 58}}, "token": {"kind": "floatLiteral", "text": "0.1"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 58}, "end": {"line": 23, "column": 59}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 60}, "end": {"line": 23, "column": 68}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 60}, "end": {"line": 23, "column": 65}}, "token": {"kind": "identifier", "text": "alpha"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 65}, "end": {"line": 23, "column": 66}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 23, "column": 67}, "end": {"line": 23, "column": 68}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 67}, "end": {"line": 23, "column": 68}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 68}, "end": {"line": 23, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 23, "column": 69}, "end": {"line": 23, "column": 69}}, "children": []},
]}

# Parser output for `Color(hue: 0.6, saturation: 0.5, brightness: 0.9)` at 24:9.
hsb_color_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 14}}, "token": {"kind": "identifier", "text": "Color"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 14}, "end": {"line": 24, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 18}}, "token": {"kind": "identifier", "text": "hue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 23}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 23}}, "token": {"kind": "floatLiteral", "text": "0.6"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 25}, "end": {"line": 24, "column": 41}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 25}, "end": {"line": 24, "column": 35}}, "token": {"kind": "identifier", "text": "saturation"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 35}, "end": {"line": 24, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 40}}, "token": {"kind": "floatLiteral", "text": "0.5"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 40}, "end": {"line": 24, "column": 41}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 42}, "end": {"line": 24, "column": 57}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 42}, "end": {"line": 24, "column": 52}}, "token": {"kind": "identifier", "text": "brightness"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 53}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 24, "column": 54}, "end": {"line": 24, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 54}, "end": {"line": 24, "column": 57}}, "token": {"kind": "floatLiteral", "text": "0.9"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 57}, "end": {"line": 24, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 58}}, "children": []},
]}

# Parser output for `Color("AccentColor")` at 25:9.
named_asset_color_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 29}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "token": {"kind": "identifier", "text": "Color"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 14}, "end": {"line": 25, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 28}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 28}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 27}}, "token": {"kind": "stringSegment", "text": "AccentColor"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 27}, "end": {"line": 25, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 29}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 25, "column": 29}, "end": {"line": 25, "column": 29}}, "children": []},
]}

# Parser output for `Color(red: red, green: green, blue: blue)` at 26:9.
rgb_color_from_variables_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 50}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 14}}, "token": {"kind": "identifier", "text": "Color"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 14}, "end": {"line": 26, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 18}}, "token": {"kind": "identifier", "text": "red"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 18}, "end": {"line": 26, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 20}, "end": {"line": 26, "column": 23}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 20}, "end": {"line": 26, "column": 23}}, "token": {"kind": "identifier", "text": "red"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 23}, "end": {"line": 26, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 25}, "end": {"line": 26, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 25}, "end": {"line": 26, "column": 30}}, "token": {"kind": "identifier", "text": "green"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 30}, "end": {"line": 26, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 32}, "end": {"line": 26, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 32}, "end": {"line": 26, "column": 37}}, "token": {"kind": "identifier", "text": "green"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 37}, "end": {"line": 26, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 39}, "end": {"line": 26, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 39}, "end": {"line": 26, "column": 43}}, "token": {"kind": "identifier", "text": "blue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 43}, "end": {"line": 26, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 45}, "end": {"line": 26, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 45}, "end": {"line": 26, "column": 49}}, "token": {"kind": "identifier", "text": "blue"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 49}, "end": {"line": 26, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 26, "column": 50}, "end": {"line": 26, "column": 50}}, "children": []},
]}
