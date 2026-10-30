package apple.hig.platform_services.apple_pay_term_casing

test_warns_for_lowercase_apple_pay_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible Apple Pay string literal; use the Apple Pay term casing."
  warnings[0].line == 22
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_unspaced_apple_pay_term_swift_syntax if {
  result := decision with input as warns_for_unspaced_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_apple_pay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_apple_pay_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_apple_pay_string_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}

# Parser output for `Text("Pay with apple pay")` at 22:11.
warns_for_lowercase_apple_pay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 11, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Pay with apple pay", "range": {"end": {"column": 35, "line": 22}, "start": {"column": 17, "line": 22}}}}]}}, "range": {"end": {"column": 36, "line": 22}, "start": {"column": 16, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 11, "line": 22}}}}, "range": {"end": {"column": 37, "line": 22}, "start": {"column": 11, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Pay with apple pay", "range": {"end": {"column": 35, "line": 22}, "start": {"column": 17, "line": 22}}}}]}]}

# Parser output for `Button("Use ApplePay", action: pay)` at 30:13.
warns_for_unspaced_apple_pay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 13, "line": 30}}}, {"baseName": "pay", "range": {"end": {"column": 47, "line": 30}, "start": {"column": 44, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 30}, "start": {"column": 20, "line": 30}}, "segments": [{"stringSegment": {"content": "Use ApplePay", "range": {"end": {"column": 33, "line": 30}, "start": {"column": 21, "line": 30}}}}]}}, "range": {"end": {"column": 35, "line": 30}, "start": {"column": 20, "line": 30}}}, {"expression": {"declReferenceExpr": {"baseName": "pay", "range": {"end": {"column": 47, "line": 30}, "start": {"column": 44, "line": 30}}}}, "label": "action", "range": {"end": {"column": 47, "line": 30}, "start": {"column": 36, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 13, "line": 30}}}}, "range": {"end": {"column": 48, "line": 30}, "start": {"column": 13, "line": 30}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 30}, "start": {"column": 20, "line": 30}}, "segments": [{"stringSegment": {"content": "Use ApplePay", "range": {"end": {"column": 33, "line": 30}, "start": {"column": 21, "line": 30}}}}]}]}

# Parser output for `Label("Pay with Apple Pay", systemImage: "creditcard")` at 38:9.
does_not_warn_for_correct_apple_pay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 38}, "start": {"column": 9, "line": 38}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 38}, "start": {"column": 15, "line": 38}}, "segments": [{"stringSegment": {"content": "Pay with Apple Pay", "range": {"end": {"column": 34, "line": 38}, "start": {"column": 16, "line": 38}}}}]}}, "range": {"end": {"column": 36, "line": 38}, "start": {"column": 15, "line": 38}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 62, "line": 38}, "start": {"column": 50, "line": 38}}, "segments": [{"stringSegment": {"content": "creditcard", "range": {"end": {"column": 61, "line": 38}, "start": {"column": 51, "line": 38}}}}]}}, "label": "systemImage", "range": {"end": {"column": 62, "line": 38}, "start": {"column": 37, "line": 38}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 38}, "start": {"column": 9, "line": 38}}}}, "range": {"end": {"column": 63, "line": 38}, "start": {"column": 9, "line": 38}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 38}, "start": {"column": 15, "line": 38}}, "segments": [{"stringSegment": {"content": "Pay with Apple Pay", "range": {"end": {"column": 34, "line": 38}, "start": {"column": 16, "line": 38}}}}]}, {"range": {"end": {"column": 62, "line": 38}, "start": {"column": 50, "line": 38}}, "segments": [{"stringSegment": {"content": "creditcard", "range": {"end": {"column": 61, "line": 38}, "start": {"column": 51, "line": 38}}}}]}]}

# Parser output for `Logger(subsystem: "apple pay")` at 46:17.
does_not_warn_for_non_visible_apple_pay_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Logger", "range": {"end": {"column": 23, "line": 46}, "start": {"column": 17, "line": 46}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 46, "line": 46}, "start": {"column": 35, "line": 46}}, "segments": [{"stringSegment": {"content": "apple pay", "range": {"end": {"column": 45, "line": 46}, "start": {"column": 36, "line": 46}}}}]}}, "label": "subsystem", "range": {"end": {"column": 46, "line": 46}, "start": {"column": 24, "line": 46}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Logger", "range": {"end": {"column": 23, "line": 46}, "start": {"column": 17, "line": 46}}}}, "range": {"end": {"column": 47, "line": 46}, "start": {"column": 17, "line": 46}}}], "stringLiteralExprs": [{"range": {"end": {"column": 46, "line": 46}, "start": {"column": 35, "line": 46}}, "segments": [{"stringSegment": {"content": "apple pay", "range": {"end": {"column": 45, "line": 46}, "start": {"column": 36, "line": 46}}}}]}]}
