package apple.hig.in_app_purchase.refund_labels

test_warns_for_complex_refund_button_label if {
  result := decision with input as warns_for_complex_refund_button_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.in_app_purchase.review_refund_action_label"
  result.warn[0].message == "Review refund action label; use simple labels such as Refund or Request a Refund."
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_simple_refund_button_label if {
  result := decision with input as does_not_warn_for_simple_refund_button_label_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_refund_button_label if {
  result := decision with input as does_not_warn_for_non_refund_button_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Start a refund claim", action: requestRefund)` at 42:11.
warns_for_complex_refund_button_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 11, "line": 42}}}, {"baseName": "requestRefund", "range": {"end": {"column": 63, "line": 42}, "start": {"column": 50, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 40, "line": 42}, "start": {"column": 18, "line": 42}}, "segments": [{"stringSegment": {"content": "Start a refund claim", "range": {"end": {"column": 39, "line": 42}, "start": {"column": 19, "line": 42}}}}]}}, "range": {"end": {"column": 41, "line": 42}, "start": {"column": 18, "line": 42}}}, {"expression": {"declReferenceExpr": {"baseName": "requestRefund", "range": {"end": {"column": 63, "line": 42}, "start": {"column": 50, "line": 42}}}}, "label": "action", "range": {"end": {"column": 63, "line": 42}, "start": {"column": 42, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 11, "line": 42}}}}, "range": {"end": {"column": 64, "line": 42}, "start": {"column": 11, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 40, "line": 42}, "start": {"column": 18, "line": 42}}, "segments": [{"stringSegment": {"content": "Start a refund claim", "range": {"end": {"column": 39, "line": 42}, "start": {"column": 19, "line": 42}}}}]}]}

# Parser output for `Button("Request a Refund", action: requestRefund)` at 47:11.
does_not_warn_for_simple_refund_button_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 47}, "start": {"column": 11, "line": 47}}}, {"baseName": "requestRefund", "range": {"end": {"column": 59, "line": 47}, "start": {"column": 46, "line": 47}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 47}, "start": {"column": 18, "line": 47}}, "segments": [{"stringSegment": {"content": "Request a Refund", "range": {"end": {"column": 35, "line": 47}, "start": {"column": 19, "line": 47}}}}]}}, "range": {"end": {"column": 37, "line": 47}, "start": {"column": 18, "line": 47}}}, {"expression": {"declReferenceExpr": {"baseName": "requestRefund", "range": {"end": {"column": 59, "line": 47}, "start": {"column": 46, "line": 47}}}}, "label": "action", "range": {"end": {"column": 59, "line": 47}, "start": {"column": 38, "line": 47}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 47}, "start": {"column": 11, "line": 47}}}}, "range": {"end": {"column": 60, "line": 47}, "start": {"column": 11, "line": 47}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 47}, "start": {"column": 18, "line": 47}}, "segments": [{"stringSegment": {"content": "Request a Refund", "range": {"end": {"column": 35, "line": 47}, "start": {"column": 19, "line": 47}}}}]}]}

# Parser output for `Button("Purchase Help", action: showHelp)` at 52:11.
does_not_warn_for_non_refund_button_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 52}, "start": {"column": 11, "line": 52}}}, {"baseName": "showHelp", "range": {"end": {"column": 51, "line": 52}, "start": {"column": 43, "line": 52}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 52}, "start": {"column": 18, "line": 52}}, "segments": [{"stringSegment": {"content": "Purchase Help", "range": {"end": {"column": 32, "line": 52}, "start": {"column": 19, "line": 52}}}}]}}, "range": {"end": {"column": 34, "line": 52}, "start": {"column": 18, "line": 52}}}, {"expression": {"declReferenceExpr": {"baseName": "showHelp", "range": {"end": {"column": 51, "line": 52}, "start": {"column": 43, "line": 52}}}}, "label": "action", "range": {"end": {"column": 51, "line": 52}, "start": {"column": 35, "line": 52}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 52}, "start": {"column": 11, "line": 52}}}}, "range": {"end": {"column": 52, "line": 52}, "start": {"column": 11, "line": 52}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 52}, "start": {"column": 18, "line": 52}}, "segments": [{"stringSegment": {"content": "Purchase Help", "range": {"end": {"column": 32, "line": 52}, "start": {"column": 19, "line": 52}}}}]}]}
