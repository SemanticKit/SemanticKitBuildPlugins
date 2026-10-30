package apple.hig.accessibility.fixed_font_size

test_warns_for_literal_system_font_size if {
  result := decision with input as fixed_system_font_size_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_fixed_font_size"
  result.warn[0].message == "Review literal SwiftUI system font size use; support larger text sizes."
  result.warn[0].line == 12
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_warns_for_literal_system_font_size_in_implicit_member if {
  result := decision with input as fixed_system_font_size_with_weight_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_fixed_font_size"
  result.warn[0].message == "Review literal SwiftUI system font size use; support larger text sizes."
  result.warn[0].line == 14
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_text_style_system_font if {
  result := decision with input as dynamic_text_style_font_node

  count(result.warn) == 0
}

test_does_not_warn_for_custom_font_size if {
  result := decision with input as custom_font_size_node

  count(result.warn) == 0
}

# Parser output for `Font.system(size: 17)` at 12:19.
fixed_system_font_size_node := {"declReferenceExprs": [{"baseName": "Font", "range": {"end": {"column": 23, "line": 12}, "start": {"column": 19, "line": 12}}}, {"baseName": "system", "range": {"end": {"column": 30, "line": 12}, "start": {"column": 24, "line": 12}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "17", "range": {"end": {"column": 39, "line": 12}, "start": {"column": 37, "line": 12}}}}, "label": "size", "range": {"end": {"column": 39, "line": 12}, "start": {"column": 31, "line": 12}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 12}, "start": {"column": 19, "line": 12}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 12}, "start": {"column": 24, "line": 12}}}, "range": {"end": {"column": 30, "line": 12}, "start": {"column": 19, "line": 12}}}}, "range": {"end": {"column": 40, "line": 12}, "start": {"column": 19, "line": 12}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 12}, "start": {"column": 19, "line": 12}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 12}, "start": {"column": 24, "line": 12}}}, "range": {"end": {"column": 30, "line": 12}, "start": {"column": 19, "line": 12}}}]}

# Parser output for `.system(size: 13.5, weight: .semibold)` at 14:19.
fixed_system_font_size_with_weight_node := {"declReferenceExprs": [{"baseName": "system", "range": {"end": {"column": 26, "line": 14}, "start": {"column": 20, "line": 14}}}, {"baseName": "semibold", "range": {"end": {"column": 56, "line": 14}, "start": {"column": 48, "line": 14}}}], "functionCallExprs": [{"arguments": [{"expression": {"floatLiteralExpr": {"literal": "13.5", "range": {"end": {"column": 37, "line": 14}, "start": {"column": 33, "line": 14}}}}, "label": "size", "range": {"end": {"column": 38, "line": 14}, "start": {"column": 27, "line": 14}}}, {"expression": {"memberAccessExpr": {"declName": {"baseName": "semibold", "range": {"end": {"column": 56, "line": 14}, "start": {"column": 48, "line": 14}}}, "range": {"end": {"column": 56, "line": 14}, "start": {"column": 47, "line": 14}}}}, "label": "weight", "range": {"end": {"column": 56, "line": 14}, "start": {"column": 39, "line": 14}}}], "calledExpression": {"memberAccessExpr": {"declName": {"baseName": "system", "range": {"end": {"column": 26, "line": 14}, "start": {"column": 20, "line": 14}}}, "range": {"end": {"column": 26, "line": 14}, "start": {"column": 19, "line": 14}}}}, "range": {"end": {"column": 57, "line": 14}, "start": {"column": 19, "line": 14}}}], "memberAccessExprs": [{"declName": {"baseName": "system", "range": {"end": {"column": 26, "line": 14}, "start": {"column": 20, "line": 14}}}, "range": {"end": {"column": 26, "line": 14}, "start": {"column": 19, "line": 14}}}, {"declName": {"baseName": "semibold", "range": {"end": {"column": 56, "line": 14}, "start": {"column": 48, "line": 14}}}, "range": {"end": {"column": 56, "line": 14}, "start": {"column": 47, "line": 14}}}]}

# Parser output for `Font.system(.body)` at 16:19.
dynamic_text_style_font_node := {"declReferenceExprs": [{"baseName": "Font", "range": {"end": {"column": 23, "line": 16}, "start": {"column": 19, "line": 16}}}, {"baseName": "system", "range": {"end": {"column": 30, "line": 16}, "start": {"column": 24, "line": 16}}}, {"baseName": "body", "range": {"end": {"column": 36, "line": 16}, "start": {"column": 32, "line": 16}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "body", "range": {"end": {"column": 36, "line": 16}, "start": {"column": 32, "line": 16}}}, "range": {"end": {"column": 36, "line": 16}, "start": {"column": 31, "line": 16}}}}, "range": {"end": {"column": 36, "line": 16}, "start": {"column": 31, "line": 16}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 16}, "start": {"column": 19, "line": 16}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 16}, "start": {"column": 24, "line": 16}}}, "range": {"end": {"column": 30, "line": 16}, "start": {"column": 19, "line": 16}}}}, "range": {"end": {"column": 37, "line": 16}, "start": {"column": 19, "line": 16}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 16}, "start": {"column": 19, "line": 16}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 16}, "start": {"column": 24, "line": 16}}}, "range": {"end": {"column": 30, "line": 16}, "start": {"column": 19, "line": 16}}}, {"declName": {"baseName": "body", "range": {"end": {"column": 36, "line": 16}, "start": {"column": 32, "line": 16}}}, "range": {"end": {"column": 36, "line": 16}, "start": {"column": 31, "line": 16}}}]}

# Parser output for `Font.custom("Avenir", size: 17)` at 18:19.
custom_font_size_node := {"declReferenceExprs": [{"baseName": "Font", "range": {"end": {"column": 23, "line": 18}, "start": {"column": 19, "line": 18}}}, {"baseName": "custom", "range": {"end": {"column": 30, "line": 18}, "start": {"column": 24, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 18}, "start": {"column": 31, "line": 18}}, "segments": [{"stringSegment": {"content": "Avenir", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 32, "line": 18}}}}]}}, "range": {"end": {"column": 40, "line": 18}, "start": {"column": 31, "line": 18}}}, {"expression": {"integerLiteralExpr": {"literal": "17", "range": {"end": {"column": 49, "line": 18}, "start": {"column": 47, "line": 18}}}}, "label": "size", "range": {"end": {"column": 49, "line": 18}, "start": {"column": 41, "line": 18}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 18}, "start": {"column": 19, "line": 18}}}}, "declName": {"baseName": "custom", "range": {"end": {"column": 30, "line": 18}, "start": {"column": 24, "line": 18}}}, "range": {"end": {"column": 30, "line": 18}, "start": {"column": 19, "line": 18}}}}, "range": {"end": {"column": 50, "line": 18}, "start": {"column": 19, "line": 18}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 18}, "start": {"column": 19, "line": 18}}}}, "declName": {"baseName": "custom", "range": {"end": {"column": 30, "line": 18}, "start": {"column": 24, "line": 18}}}, "range": {"end": {"column": 30, "line": 18}, "start": {"column": 19, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 18}, "start": {"column": 31, "line": 18}}, "segments": [{"stringSegment": {"content": "Avenir", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 32, "line": 18}}}}]}]}
