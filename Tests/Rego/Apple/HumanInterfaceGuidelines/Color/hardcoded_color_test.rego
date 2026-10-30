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
rgb_color_node := {"declReferenceExprs": [{"baseName": "Color", "range": {"end": {"column": 14, "line": 21}, "start": {"column": 9, "line": 21}}}], "functionCallExprs": [{"arguments": [{"expression": {"floatLiteralExpr": {"literal": "0.2", "range": {"end": {"column": 23, "line": 21}, "start": {"column": 20, "line": 21}}}}, "label": "red", "range": {"end": {"column": 24, "line": 21}, "start": {"column": 15, "line": 21}}}, {"expression": {"floatLiteralExpr": {"literal": "0.4", "range": {"end": {"column": 35, "line": 21}, "start": {"column": 32, "line": 21}}}}, "label": "green", "range": {"end": {"column": 36, "line": 21}, "start": {"column": 25, "line": 21}}}, {"expression": {"floatLiteralExpr": {"literal": "0.8", "range": {"end": {"column": 46, "line": 21}, "start": {"column": 43, "line": 21}}}}, "label": "blue", "range": {"end": {"column": 46, "line": 21}, "start": {"column": 37, "line": 21}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Color", "range": {"end": {"column": 14, "line": 21}, "start": {"column": 9, "line": 21}}}}, "range": {"end": {"column": 47, "line": 21}, "start": {"column": 9, "line": 21}}}]}

# Parser output for `UIColor(red: 1, green: 0, blue: 0, alpha: 1)` at 22:9.
uicolor_rgb_color_node := {"declReferenceExprs": [{"baseName": "UIColor", "range": {"end": {"column": 16, "line": 22}, "start": {"column": 9, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "1", "range": {"end": {"column": 23, "line": 22}, "start": {"column": 22, "line": 22}}}}, "label": "red", "range": {"end": {"column": 24, "line": 22}, "start": {"column": 17, "line": 22}}}, {"expression": {"integerLiteralExpr": {"literal": "0", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 32, "line": 22}}}}, "label": "green", "range": {"end": {"column": 34, "line": 22}, "start": {"column": 25, "line": 22}}}, {"expression": {"integerLiteralExpr": {"literal": "0", "range": {"end": {"column": 42, "line": 22}, "start": {"column": 41, "line": 22}}}}, "label": "blue", "range": {"end": {"column": 43, "line": 22}, "start": {"column": 35, "line": 22}}}, {"expression": {"integerLiteralExpr": {"literal": "1", "range": {"end": {"column": 52, "line": 22}, "start": {"column": 51, "line": 22}}}}, "label": "alpha", "range": {"end": {"column": 52, "line": 22}, "start": {"column": 44, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "UIColor", "range": {"end": {"column": 16, "line": 22}, "start": {"column": 9, "line": 22}}}}, "range": {"end": {"column": 53, "line": 22}, "start": {"column": 9, "line": 22}}}]}

# Parser output for `NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)` at 23:9.
nscolor_calibrated_rgb_color_node := {"declReferenceExprs": [{"baseName": "NSColor", "range": {"end": {"column": 16, "line": 23}, "start": {"column": 9, "line": 23}}}], "functionCallExprs": [{"arguments": [{"expression": {"floatLiteralExpr": {"literal": "0.1", "range": {"end": {"column": 35, "line": 23}, "start": {"column": 32, "line": 23}}}}, "label": "calibratedRed", "range": {"end": {"column": 36, "line": 23}, "start": {"column": 17, "line": 23}}}, {"expression": {"floatLiteralExpr": {"literal": "0.1", "range": {"end": {"column": 47, "line": 23}, "start": {"column": 44, "line": 23}}}}, "label": "green", "range": {"end": {"column": 48, "line": 23}, "start": {"column": 37, "line": 23}}}, {"expression": {"floatLiteralExpr": {"literal": "0.1", "range": {"end": {"column": 58, "line": 23}, "start": {"column": 55, "line": 23}}}}, "label": "blue", "range": {"end": {"column": 59, "line": 23}, "start": {"column": 49, "line": 23}}}, {"expression": {"integerLiteralExpr": {"literal": "1", "range": {"end": {"column": 68, "line": 23}, "start": {"column": 67, "line": 23}}}}, "label": "alpha", "range": {"end": {"column": 68, "line": 23}, "start": {"column": 60, "line": 23}}}], "calledExpression": {"declReferenceExpr": {"baseName": "NSColor", "range": {"end": {"column": 16, "line": 23}, "start": {"column": 9, "line": 23}}}}, "range": {"end": {"column": 69, "line": 23}, "start": {"column": 9, "line": 23}}}]}

# Parser output for `Color(hue: 0.6, saturation: 0.5, brightness: 0.9)` at 24:9.
hsb_color_node := {"declReferenceExprs": [{"baseName": "Color", "range": {"end": {"column": 14, "line": 24}, "start": {"column": 9, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"floatLiteralExpr": {"literal": "0.6", "range": {"end": {"column": 23, "line": 24}, "start": {"column": 20, "line": 24}}}}, "label": "hue", "range": {"end": {"column": 24, "line": 24}, "start": {"column": 15, "line": 24}}}, {"expression": {"floatLiteralExpr": {"literal": "0.5", "range": {"end": {"column": 40, "line": 24}, "start": {"column": 37, "line": 24}}}}, "label": "saturation", "range": {"end": {"column": 41, "line": 24}, "start": {"column": 25, "line": 24}}}, {"expression": {"floatLiteralExpr": {"literal": "0.9", "range": {"end": {"column": 57, "line": 24}, "start": {"column": 54, "line": 24}}}}, "label": "brightness", "range": {"end": {"column": 57, "line": 24}, "start": {"column": 42, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Color", "range": {"end": {"column": 14, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 58, "line": 24}, "start": {"column": 9, "line": 24}}}]}

# Parser output for `Color("AccentColor")` at 25:9.
named_asset_color_node := {"declReferenceExprs": [{"baseName": "Color", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "AccentColor", "range": {"end": {"column": 27, "line": 25}, "start": {"column": 16, "line": 25}}}}]}}, "range": {"end": {"column": 28, "line": 25}, "start": {"column": 15, "line": 25}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Color", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}}, "range": {"end": {"column": 29, "line": 25}, "start": {"column": 9, "line": 25}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "AccentColor", "range": {"end": {"column": 27, "line": 25}, "start": {"column": 16, "line": 25}}}}]}]}

# Parser output for `Color(red: red, green: green, blue: blue)` at 26:9.
rgb_color_from_variables_node := {"declReferenceExprs": [{"baseName": "Color", "range": {"end": {"column": 14, "line": 26}, "start": {"column": 9, "line": 26}}}, {"baseName": "red", "range": {"end": {"column": 23, "line": 26}, "start": {"column": 20, "line": 26}}}, {"baseName": "green", "range": {"end": {"column": 37, "line": 26}, "start": {"column": 32, "line": 26}}}, {"baseName": "blue", "range": {"end": {"column": 49, "line": 26}, "start": {"column": 45, "line": 26}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "red", "range": {"end": {"column": 23, "line": 26}, "start": {"column": 20, "line": 26}}}}, "label": "red", "range": {"end": {"column": 24, "line": 26}, "start": {"column": 15, "line": 26}}}, {"expression": {"declReferenceExpr": {"baseName": "green", "range": {"end": {"column": 37, "line": 26}, "start": {"column": 32, "line": 26}}}}, "label": "green", "range": {"end": {"column": 38, "line": 26}, "start": {"column": 25, "line": 26}}}, {"expression": {"declReferenceExpr": {"baseName": "blue", "range": {"end": {"column": 49, "line": 26}, "start": {"column": 45, "line": 26}}}}, "label": "blue", "range": {"end": {"column": 49, "line": 26}, "start": {"column": 39, "line": 26}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Color", "range": {"end": {"column": 14, "line": 26}, "start": {"column": 9, "line": 26}}}}, "range": {"end": {"column": 50, "line": 26}, "start": {"column": 9, "line": 26}}}]}
