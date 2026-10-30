package apple.hig.presentation.open_window_action

test_reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].message == "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate."
  result.warn[0].line == 19
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].line == 42
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_review_open_url_swift_syntax if {
  result := decision with input as does_not_review_open_url_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_review_open_window_action_without_open_window_swift_syntax if {
  result := decision with input as does_not_review_open_window_action_without_open_window_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `openWindow(id: "document")` at 19:9.
reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate_node := {"declReferenceExprs": [{"baseName": "openWindow", "range": {"end": {"column": 19, "line": 19}, "start": {"column": 9, "line": 19}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 19}, "start": {"column": 24, "line": 19}}, "segments": [{"stringSegment": {"content": "document", "range": {"end": {"column": 33, "line": 19}, "start": {"column": 25, "line": 19}}}}]}}, "label": "id", "range": {"end": {"column": 34, "line": 19}, "start": {"column": 20, "line": 19}}}], "calledExpression": {"declReferenceExpr": {"baseName": "openWindow", "range": {"end": {"column": 19, "line": 19}, "start": {"column": 9, "line": 19}}}}, "range": {"end": {"column": 35, "line": 19}, "start": {"column": 9, "line": 19}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 19}, "start": {"column": 24, "line": 19}}, "segments": [{"stringSegment": {"content": "document", "range": {"end": {"column": 33, "line": 19}, "start": {"column": 25, "line": 19}}}}]}]}

# Parser output for `environment.openWindow(id: "detail", value: detail.id)` at 42:15.
reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate_node := {"declReferenceExprs": [{"baseName": "environment", "range": {"end": {"column": 26, "line": 42}, "start": {"column": 15, "line": 42}}}, {"baseName": "openWindow", "range": {"end": {"column": 37, "line": 42}, "start": {"column": 27, "line": 42}}}, {"baseName": "detail", "range": {"end": {"column": 65, "line": 42}, "start": {"column": 59, "line": 42}}}, {"baseName": "id", "range": {"end": {"column": 68, "line": 42}, "start": {"column": 66, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 50, "line": 42}, "start": {"column": 42, "line": 42}}, "segments": [{"stringSegment": {"content": "detail", "range": {"end": {"column": 49, "line": 42}, "start": {"column": 43, "line": 42}}}}]}}, "label": "id", "range": {"end": {"column": 51, "line": 42}, "start": {"column": 38, "line": 42}}}, {"expression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "detail", "range": {"end": {"column": 65, "line": 42}, "start": {"column": 59, "line": 42}}}}, "declName": {"baseName": "id", "range": {"end": {"column": 68, "line": 42}, "start": {"column": 66, "line": 42}}}, "range": {"end": {"column": 68, "line": 42}, "start": {"column": 59, "line": 42}}}}, "label": "value", "range": {"end": {"column": 68, "line": 42}, "start": {"column": 52, "line": 42}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "environment", "range": {"end": {"column": 26, "line": 42}, "start": {"column": 15, "line": 42}}}}, "declName": {"baseName": "openWindow", "range": {"end": {"column": 37, "line": 42}, "start": {"column": 27, "line": 42}}}, "range": {"end": {"column": 37, "line": 42}, "start": {"column": 15, "line": 42}}}}, "range": {"end": {"column": 69, "line": 42}, "start": {"column": 15, "line": 42}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "environment", "range": {"end": {"column": 26, "line": 42}, "start": {"column": 15, "line": 42}}}}, "declName": {"baseName": "openWindow", "range": {"end": {"column": 37, "line": 42}, "start": {"column": 27, "line": 42}}}, "range": {"end": {"column": 37, "line": 42}, "start": {"column": 15, "line": 42}}}, {"base": {"declReferenceExpr": {"baseName": "detail", "range": {"end": {"column": 65, "line": 42}, "start": {"column": 59, "line": 42}}}}, "declName": {"baseName": "id", "range": {"end": {"column": 68, "line": 42}, "start": {"column": 66, "line": 42}}}, "range": {"end": {"column": 68, "line": 42}, "start": {"column": 59, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 50, "line": 42}, "start": {"column": 42, "line": 42}}, "segments": [{"stringSegment": {"content": "detail", "range": {"end": {"column": 49, "line": 42}, "start": {"column": 43, "line": 42}}}}]}]}

# Parser output for `openURL(documentURL)` at 31:9.
does_not_review_open_url_swift_syntax_node := {"declReferenceExprs": [{"baseName": "openURL", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 9, "line": 31}}}, {"baseName": "documentURL", "range": {"end": {"column": 28, "line": 31}, "start": {"column": 17, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "documentURL", "range": {"end": {"column": 28, "line": 31}, "start": {"column": 17, "line": 31}}}}, "range": {"end": {"column": 28, "line": 31}, "start": {"column": 17, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "openURL", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 29, "line": 31}, "start": {"column": 9, "line": 31}}}]}

# Parser output for `OpenWindowAction()` at 52:13.
does_not_review_open_window_action_without_open_window_swift_syntax_node := {"declReferenceExprs": [{"baseName": "OpenWindowAction", "range": {"end": {"column": 29, "line": 52}, "start": {"column": 13, "line": 52}}}], "functionCallExprs": [{"calledExpression": {"declReferenceExpr": {"baseName": "OpenWindowAction", "range": {"end": {"column": 29, "line": 52}, "start": {"column": 13, "line": 52}}}}, "range": {"end": {"column": 31, "line": 52}, "start": {"column": 13, "line": 52}}}]}
