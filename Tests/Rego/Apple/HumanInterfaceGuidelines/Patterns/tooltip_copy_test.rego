package apple.hig.patterns.tooltip_copy

test_warns_for_help_base_name_with_long_tooltip_copy if {
  result := decision with input as warns_for_help_base_name_with_long_tooltip_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].message == "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters."
  result.warn[0].line == 31
  result.warn[0].column == 14
  result.warn[0].severity == "warning"
}

test_warns_for_help_member_name_with_long_tooltip_copy if {
  result := decision with input as warns_for_help_member_name_with_long_tooltip_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].line == 44
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_help_call_with_short_tooltip_copy if {
  result := decision with input as does_not_warn_for_help_call_with_short_tooltip_copy_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_help_call_with_long_copy if {
  result := decision with input as does_not_warn_for_non_help_call_with_long_copy_node

  count(result.warn) == 0
}

# Parser output for `help("Open route planning controls and show detailed guidance for every available route option")` at 31:14.
warns_for_help_base_name_with_long_tooltip_copy_node := {"declReferenceExprs": [{"baseName": "help", "range": {"end": {"column": 18, "line": 31}, "start": {"column": 14, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 109, "line": 31}, "start": {"column": 19, "line": 31}}, "segments": [{"stringSegment": {"content": "Open route planning controls and show detailed guidance for every available route option", "range": {"end": {"column": 108, "line": 31}, "start": {"column": 20, "line": 31}}}}]}}, "range": {"end": {"column": 109, "line": 31}, "start": {"column": 19, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "help", "range": {"end": {"column": 18, "line": 31}, "start": {"column": 14, "line": 31}}}}, "range": {"end": {"column": 110, "line": 31}, "start": {"column": 14, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 109, "line": 31}, "start": {"column": 19, "line": 31}}, "segments": [{"stringSegment": {"content": "Open route planning controls and show detailed guidance for every available route option", "range": {"end": {"column": 108, "line": 31}, "start": {"column": 20, "line": 31}}}}]}]}

# Parser output for `routeButton.help("Review all routing controls and choose the setting that best matches the selected trip")` at 44:10.
warns_for_help_member_name_with_long_tooltip_copy_node := {"declReferenceExprs": [{"baseName": "routeButton", "range": {"end": {"column": 21, "line": 44}, "start": {"column": 10, "line": 44}}}, {"baseName": "help", "range": {"end": {"column": 26, "line": 44}, "start": {"column": 22, "line": 44}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 115, "line": 44}, "start": {"column": 27, "line": 44}}, "segments": [{"stringSegment": {"content": "Review all routing controls and choose the setting that best matches the selected trip", "range": {"end": {"column": 114, "line": 44}, "start": {"column": 28, "line": 44}}}}]}}, "range": {"end": {"column": 115, "line": 44}, "start": {"column": 27, "line": 44}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "routeButton", "range": {"end": {"column": 21, "line": 44}, "start": {"column": 10, "line": 44}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 26, "line": 44}, "start": {"column": 22, "line": 44}}}, "range": {"end": {"column": 26, "line": 44}, "start": {"column": 10, "line": 44}}}}, "range": {"end": {"column": 116, "line": 44}, "start": {"column": 10, "line": 44}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "routeButton", "range": {"end": {"column": 21, "line": 44}, "start": {"column": 10, "line": 44}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 26, "line": 44}, "start": {"column": 22, "line": 44}}}, "range": {"end": {"column": 26, "line": 44}, "start": {"column": 10, "line": 44}}}], "stringLiteralExprs": [{"range": {"end": {"column": 115, "line": 44}, "start": {"column": 27, "line": 44}}, "segments": [{"stringSegment": {"content": "Review all routing controls and choose the setting that best matches the selected trip", "range": {"end": {"column": 114, "line": 44}, "start": {"column": 28, "line": 44}}}}]}]}

# Parser output for `routeButton.help("Show route options")` at 52:14.
does_not_warn_for_help_call_with_short_tooltip_copy_node := {"declReferenceExprs": [{"baseName": "routeButton", "range": {"end": {"column": 25, "line": 52}, "start": {"column": 14, "line": 52}}}, {"baseName": "help", "range": {"end": {"column": 30, "line": 52}, "start": {"column": 26, "line": 52}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 51, "line": 52}, "start": {"column": 31, "line": 52}}, "segments": [{"stringSegment": {"content": "Show route options", "range": {"end": {"column": 50, "line": 52}, "start": {"column": 32, "line": 52}}}}]}}, "range": {"end": {"column": 51, "line": 52}, "start": {"column": 31, "line": 52}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "routeButton", "range": {"end": {"column": 25, "line": 52}, "start": {"column": 14, "line": 52}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 30, "line": 52}, "start": {"column": 26, "line": 52}}}, "range": {"end": {"column": 30, "line": 52}, "start": {"column": 14, "line": 52}}}}, "range": {"end": {"column": 52, "line": 52}, "start": {"column": 14, "line": 52}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "routeButton", "range": {"end": {"column": 25, "line": 52}, "start": {"column": 14, "line": 52}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 30, "line": 52}, "start": {"column": 26, "line": 52}}}, "range": {"end": {"column": 30, "line": 52}, "start": {"column": 14, "line": 52}}}], "stringLiteralExprs": [{"range": {"end": {"column": 51, "line": 52}, "start": {"column": 31, "line": 52}}, "segments": [{"stringSegment": {"content": "Show route options", "range": {"end": {"column": 50, "line": 52}, "start": {"column": 32, "line": 52}}}}]}]}

# Parser output for `Text("Open route planning controls and show detailed guidance for every available route option")` at 60:12.
does_not_warn_for_non_help_call_with_long_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 16, "line": 60}, "start": {"column": 12, "line": 60}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 107, "line": 60}, "start": {"column": 17, "line": 60}}, "segments": [{"stringSegment": {"content": "Open route planning controls and show detailed guidance for every available route option", "range": {"end": {"column": 106, "line": 60}, "start": {"column": 18, "line": 60}}}}]}}, "range": {"end": {"column": 107, "line": 60}, "start": {"column": 17, "line": 60}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 16, "line": 60}, "start": {"column": 12, "line": 60}}}}, "range": {"end": {"column": 108, "line": 60}, "start": {"column": 12, "line": 60}}}], "stringLiteralExprs": [{"range": {"end": {"column": 107, "line": 60}, "start": {"column": 17, "line": 60}}, "segments": [{"stringSegment": {"content": "Open route planning controls and show detailed guidance for every available route option", "range": {"end": {"column": 106, "line": 60}, "start": {"column": 18, "line": 60}}}}]}]}
