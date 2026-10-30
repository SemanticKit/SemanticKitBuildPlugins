package apple.hig.platform_services.apple_pay_button

test_warns_for_custom_button_with_apple_pay_text if {
  result := decision with input as warns_for_custom_button_with_apple_pay_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_apple_pay_button"
  result.warn[0].message == "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos."
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_pkpaymentbutton if {
  result := decision with input as does_not_warn_for_pkpaymentbutton_node

  count(result.warn) == 0
}

# Parser output for `Button("Apple Pay", action: pay)` at 24:13.
warns_for_custom_button_with_apple_pay_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 24}, "start": {"column": 13, "line": 24}}}, {"baseName": "pay", "range": {"end": {"column": 44, "line": 24}, "start": {"column": 41, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 24}, "start": {"column": 20, "line": 24}}, "segments": [{"stringSegment": {"content": "Apple Pay", "range": {"end": {"column": 30, "line": 24}, "start": {"column": 21, "line": 24}}}}]}}, "range": {"end": {"column": 32, "line": 24}, "start": {"column": 20, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "pay", "range": {"end": {"column": 44, "line": 24}, "start": {"column": 41, "line": 24}}}}, "label": "action", "range": {"end": {"column": 44, "line": 24}, "start": {"column": 33, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 24}, "start": {"column": 13, "line": 24}}}}, "range": {"end": {"column": 45, "line": 24}, "start": {"column": 13, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 24}, "start": {"column": 20, "line": 24}}, "segments": [{"stringSegment": {"content": "Apple Pay", "range": {"end": {"column": 30, "line": 24}, "start": {"column": 21, "line": 24}}}}]}]}

# Parser output for `PKPaymentButton("Apple Pay")` at 31:9.
does_not_warn_for_pkpaymentbutton_node := {"declReferenceExprs": [{"baseName": "PKPaymentButton", "range": {"end": {"column": 24, "line": 31}, "start": {"column": 9, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 31}, "start": {"column": 25, "line": 31}}, "segments": [{"stringSegment": {"content": "Apple Pay", "range": {"end": {"column": 35, "line": 31}, "start": {"column": 26, "line": 31}}}}]}}, "range": {"end": {"column": 36, "line": 31}, "start": {"column": 25, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "PKPaymentButton", "range": {"end": {"column": 24, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 37, "line": 31}, "start": {"column": 9, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 31}, "start": {"column": 25, "line": 31}}, "segments": [{"stringSegment": {"content": "Apple Pay", "range": {"end": {"column": 35, "line": 31}, "start": {"column": 26, "line": 31}}}}]}]}
