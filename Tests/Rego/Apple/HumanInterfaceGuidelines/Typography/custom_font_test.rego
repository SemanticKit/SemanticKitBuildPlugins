package apple.hig.typography.custom_font

test_warns_for_custom_font_swift_syntax if {
  result := decision with input as warns_for_custom_font_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_custom_font"
  result.warn[0].message == "Review custom font; prefer system fonts and verify legibility."
  result.warn[0].line == 28
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_system_font_swift_syntax if {
  result := decision with input as does_not_warn_for_system_font_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Font.custom("Avenir", size: 14)` at 28:19.
warns_for_custom_font_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}, {"baseName": "custom", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}, "segments": [{"stringSegment": {"content": "Avenir", "range": {"end": {"column": 38, "line": 28}, "start": {"column": 32, "line": 28}}}}]}}, "range": {"end": {"column": 40, "line": 28}, "start": {"column": 31, "line": 28}}}, {"expression": {"integerLiteralExpr": {"literal": "14", "range": {"end": {"column": 49, "line": 28}, "start": {"column": 47, "line": 28}}}}, "label": "size", "range": {"end": {"column": 49, "line": 28}, "start": {"column": 41, "line": 28}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "custom", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}, "range": {"end": {"column": 30, "line": 28}, "start": {"column": 19, "line": 28}}}}, "range": {"end": {"column": 50, "line": 28}, "start": {"column": 19, "line": 28}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "custom", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}, "range": {"end": {"column": 30, "line": 28}, "start": {"column": 19, "line": 28}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}, "segments": [{"stringSegment": {"content": "Avenir", "range": {"end": {"column": 38, "line": 28}, "start": {"column": 32, "line": 28}}}}]}]}

# Parser output for `Font.system(size: 14)` at 28:19.
does_not_warn_for_system_font_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}, {"baseName": "system", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "14", "range": {"end": {"column": 39, "line": 28}, "start": {"column": 37, "line": 28}}}}, "label": "size", "range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}, "range": {"end": {"column": 30, "line": 28}, "start": {"column": 19, "line": 28}}}}, "range": {"end": {"column": 40, "line": 28}, "start": {"column": 19, "line": 28}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Font", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "system", "range": {"end": {"column": 30, "line": 28}, "start": {"column": 24, "line": 28}}}, "range": {"end": {"column": 30, "line": 28}, "start": {"column": 19, "line": 28}}}]}
