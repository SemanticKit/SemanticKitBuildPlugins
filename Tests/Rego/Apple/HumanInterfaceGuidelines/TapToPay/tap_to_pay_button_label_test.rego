package apple.hig.tap_to_pay.tap_to_pay_button_label

test_warns_for_nonstandard_tap_to_pay_button_label_swift_syntax if {
  result := decision with input as warns_for_nonstandard_tap_to_pay_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
  result.warn[0].line == 24
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_tap_to_pay_case_variant_swift_syntax if {
  result := decision with input as warns_for_tap_to_pay_case_variant_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
}

test_warns_for_apple_tap_to_pay_label_swift_syntax if {
  result := decision with input as warns_for_apple_tap_to_pay_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
}

test_does_not_warn_for_hig_tap_to_pay_button_labels if {
  result := {"warn": [warning |
    node := does_not_warn_for_hig_tap_to_pay_button_labels_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax if {
  result := decision with input as does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_unrelated_button_string_swift_syntax if {
  result := decision with input as does_not_warn_for_unrelated_button_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Start Tap to Pay", action: acceptPayment)` at 24:9.
warns_for_nonstandard_tap_to_pay_button_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "acceptPayment", "range": {"end": {"column": 57, "line": 24}, "start": {"column": 44, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Start Tap to Pay", "range": {"end": {"column": 33, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 35, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "acceptPayment", "range": {"end": {"column": 57, "line": 24}, "start": {"column": 44, "line": 24}}}}, "label": "action", "range": {"end": {"column": 57, "line": 24}, "start": {"column": 36, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 58, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Start Tap to Pay", "range": {"end": {"column": 33, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]}

# Parser output for `Button("Tap to pay on iPhone", action: acceptPayment)` at 31:9.
warns_for_tap_to_pay_case_variant_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 31}, "start": {"column": 9, "line": 31}}}, {"baseName": "acceptPayment", "range": {"end": {"column": 61, "line": 31}, "start": {"column": 48, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 38, "line": 31}, "start": {"column": 16, "line": 31}}, "segments": [{"stringSegment": {"content": "Tap to pay on iPhone", "range": {"end": {"column": 37, "line": 31}, "start": {"column": 17, "line": 31}}}}]}}, "range": {"end": {"column": 39, "line": 31}, "start": {"column": 16, "line": 31}}}, {"expression": {"declReferenceExpr": {"baseName": "acceptPayment", "range": {"end": {"column": 61, "line": 31}, "start": {"column": 48, "line": 31}}}}, "label": "action", "range": {"end": {"column": 61, "line": 31}, "start": {"column": 40, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 62, "line": 31}, "start": {"column": 9, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 38, "line": 31}, "start": {"column": 16, "line": 31}}, "segments": [{"stringSegment": {"content": "Tap to pay on iPhone", "range": {"end": {"column": 37, "line": 31}, "start": {"column": 17, "line": 31}}}}]}]}

# Parser output for `Button("Apple Tap to Pay", action: acceptPayment)` at 36:9.
warns_for_apple_tap_to_pay_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 36}, "start": {"column": 9, "line": 36}}}, {"baseName": "acceptPayment", "range": {"end": {"column": 57, "line": 36}, "start": {"column": 44, "line": 36}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 36}, "start": {"column": 16, "line": 36}}, "segments": [{"stringSegment": {"content": "Apple Tap to Pay", "range": {"end": {"column": 33, "line": 36}, "start": {"column": 17, "line": 36}}}}]}}, "range": {"end": {"column": 35, "line": 36}, "start": {"column": 16, "line": 36}}}, {"expression": {"declReferenceExpr": {"baseName": "acceptPayment", "range": {"end": {"column": 57, "line": 36}, "start": {"column": 44, "line": 36}}}}, "label": "action", "range": {"end": {"column": 57, "line": 36}, "start": {"column": 36, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 36}, "start": {"column": 9, "line": 36}}}}, "range": {"end": {"column": 58, "line": 36}, "start": {"column": 9, "line": 36}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 36}, "start": {"column": 16, "line": 36}}, "segments": [{"stringSegment": {"content": "Apple Tap to Pay", "range": {"end": {"column": 33, "line": 36}, "start": {"column": 17, "line": 36}}}}]}]}

# Parser output for `Button("Tap to Pay", action: acceptPayment)` at 39:9.
# Parser output for `Button("Tap to Pay on iPhone", action: acceptPayment)` at 40:9.
does_not_warn_for_hig_tap_to_pay_button_labels_nodes := [
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 39}, "start": {"column": 9, "line": 39}}}, {"baseName": "acceptPayment", "range": {"end": {"column": 51, "line": 39}, "start": {"column": 38, "line": 39}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 39}, "start": {"column": 16, "line": 39}}, "segments": [{"stringSegment": {"content": "Tap to Pay", "range": {"end": {"column": 27, "line": 39}, "start": {"column": 17, "line": 39}}}}]}}, "range": {"end": {"column": 29, "line": 39}, "start": {"column": 16, "line": 39}}}, {"expression": {"declReferenceExpr": {"baseName": "acceptPayment", "range": {"end": {"column": 51, "line": 39}, "start": {"column": 38, "line": 39}}}}, "label": "action", "range": {"end": {"column": 51, "line": 39}, "start": {"column": 30, "line": 39}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 39}, "start": {"column": 9, "line": 39}}}}, "range": {"end": {"column": 52, "line": 39}, "start": {"column": 9, "line": 39}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 39}, "start": {"column": 16, "line": 39}}, "segments": [{"stringSegment": {"content": "Tap to Pay", "range": {"end": {"column": 27, "line": 39}, "start": {"column": 17, "line": 39}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 40}, "start": {"column": 9, "line": 40}}}, {"baseName": "acceptPayment", "range": {"end": {"column": 61, "line": 40}, "start": {"column": 48, "line": 40}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 38, "line": 40}, "start": {"column": 16, "line": 40}}, "segments": [{"stringSegment": {"content": "Tap to Pay on iPhone", "range": {"end": {"column": 37, "line": 40}, "start": {"column": 17, "line": 40}}}}]}}, "range": {"end": {"column": 39, "line": 40}, "start": {"column": 16, "line": 40}}}, {"expression": {"declReferenceExpr": {"baseName": "acceptPayment", "range": {"end": {"column": 61, "line": 40}, "start": {"column": 48, "line": 40}}}}, "label": "action", "range": {"end": {"column": 61, "line": 40}, "start": {"column": 40, "line": 40}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 40}, "start": {"column": 9, "line": 40}}}}, "range": {"end": {"column": 62, "line": 40}, "start": {"column": 9, "line": 40}}}], "stringLiteralExprs": [{"range": {"end": {"column": 38, "line": 40}, "start": {"column": 16, "line": 40}}, "segments": [{"stringSegment": {"content": "Tap to Pay on iPhone", "range": {"end": {"column": 37, "line": 40}, "start": {"column": 17, "line": 40}}}}]}]},
]

# Parser output for `Text("Start Tap to Pay")` at 49:9.
does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 49}, "start": {"column": 9, "line": 49}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 32, "line": 49}, "start": {"column": 14, "line": 49}}, "segments": [{"stringSegment": {"content": "Start Tap to Pay", "range": {"end": {"column": 31, "line": 49}, "start": {"column": 15, "line": 49}}}}]}}, "range": {"end": {"column": 32, "line": 49}, "start": {"column": 14, "line": 49}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 49}, "start": {"column": 9, "line": 49}}}}, "range": {"end": {"column": 33, "line": 49}, "start": {"column": 9, "line": 49}}}], "stringLiteralExprs": [{"range": {"end": {"column": 32, "line": 49}, "start": {"column": 14, "line": 49}}, "segments": [{"stringSegment": {"content": "Start Tap to Pay", "range": {"end": {"column": 31, "line": 49}, "start": {"column": 15, "line": 49}}}}]}]}

# Parser output for `Button("Pay with card", action: payWithCard)` at 58:9.
does_not_warn_for_unrelated_button_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 58}, "start": {"column": 9, "line": 58}}}, {"baseName": "payWithCard", "range": {"end": {"column": 52, "line": 58}, "start": {"column": 41, "line": 58}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 58}, "start": {"column": 16, "line": 58}}, "segments": [{"stringSegment": {"content": "Pay with card", "range": {"end": {"column": 30, "line": 58}, "start": {"column": 17, "line": 58}}}}]}}, "range": {"end": {"column": 32, "line": 58}, "start": {"column": 16, "line": 58}}}, {"expression": {"declReferenceExpr": {"baseName": "payWithCard", "range": {"end": {"column": 52, "line": 58}, "start": {"column": 41, "line": 58}}}}, "label": "action", "range": {"end": {"column": 52, "line": 58}, "start": {"column": 33, "line": 58}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 58}, "start": {"column": 9, "line": 58}}}}, "range": {"end": {"column": 53, "line": 58}, "start": {"column": 9, "line": 58}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 58}, "start": {"column": 16, "line": 58}}, "segments": [{"stringSegment": {"content": "Pay with card", "range": {"end": {"column": 30, "line": 58}, "start": {"column": 17, "line": 58}}}}]}]}
