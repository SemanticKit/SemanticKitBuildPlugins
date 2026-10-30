package apple.hig.presentation.alert_ok_button

test_warns_for_ok_button_swift_syntax if {
  result := decision with input as warns_for_ok_button_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_alert_ok_button"
  result.warn[0].message == "Review OK button label; use a specific action title when the alert is not purely informational."
  result.warn[0].line == 28
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_dismiss_button_swift_syntax if {
  result := decision with input as does_not_warn_for_dismiss_button_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("OK", action: dismiss)` at 28:13.
warns_for_ok_button_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 28}, "start": {"column": 13, "line": 28}}}, {"baseName": "dismiss", "range": {"end": {"column": 41, "line": 28}, "start": {"column": 34, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 24, "line": 28}, "start": {"column": 20, "line": 28}}, "segments": [{"stringSegment": {"content": "OK", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 21, "line": 28}}}}]}}, "range": {"end": {"column": 25, "line": 28}, "start": {"column": 20, "line": 28}}}, {"expression": {"declReferenceExpr": {"baseName": "dismiss", "range": {"end": {"column": 41, "line": 28}, "start": {"column": 34, "line": 28}}}}, "label": "action", "range": {"end": {"column": 41, "line": 28}, "start": {"column": 26, "line": 28}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 28}, "start": {"column": 13, "line": 28}}}}, "range": {"end": {"column": 42, "line": 28}, "start": {"column": 13, "line": 28}}}], "stringLiteralExprs": [{"range": {"end": {"column": 24, "line": 28}, "start": {"column": 20, "line": 28}}, "segments": [{"stringSegment": {"content": "OK", "range": {"end": {"column": 23, "line": 28}, "start": {"column": 21, "line": 28}}}}]}]}

# Parser output for `Button("Dismiss", action: dismiss)` at 28:13.
does_not_warn_for_dismiss_button_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 28}, "start": {"column": 13, "line": 28}}}, {"baseName": "dismiss", "range": {"end": {"column": 46, "line": 28}, "start": {"column": 39, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 29, "line": 28}, "start": {"column": 20, "line": 28}}, "segments": [{"stringSegment": {"content": "Dismiss", "range": {"end": {"column": 28, "line": 28}, "start": {"column": 21, "line": 28}}}}]}}, "range": {"end": {"column": 30, "line": 28}, "start": {"column": 20, "line": 28}}}, {"expression": {"declReferenceExpr": {"baseName": "dismiss", "range": {"end": {"column": 46, "line": 28}, "start": {"column": 39, "line": 28}}}}, "label": "action", "range": {"end": {"column": 46, "line": 28}, "start": {"column": 31, "line": 28}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 28}, "start": {"column": 13, "line": 28}}}}, "range": {"end": {"column": 47, "line": 28}, "start": {"column": 13, "line": 28}}}], "stringLiteralExprs": [{"range": {"end": {"column": 29, "line": 28}, "start": {"column": 20, "line": 28}}, "segments": [{"stringSegment": {"content": "Dismiss", "range": {"end": {"column": 28, "line": 28}, "start": {"column": 21, "line": 28}}}}]}]}
