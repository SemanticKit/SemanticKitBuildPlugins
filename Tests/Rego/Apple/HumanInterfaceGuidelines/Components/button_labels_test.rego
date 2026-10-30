package apple.hig.components.button_labels

test_warns_for_long_button_label_swift_syntax if {
  result := decision with input as warns_for_long_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_button_label_length"
  result.warn[0].message == "Review long button label; keep button text short and clear."
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_short_button_label_swift_syntax if {
  result := decision with input as does_not_warn_for_short_button_label_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Continue to the next section of onboarding", action: next)` at 22:9.
warns_for_long_button_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 9, "line": 22}}}, {"baseName": "next", "range": {"end": {"column": 74, "line": 22}, "start": {"column": 70, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 60, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Continue to the next section of onboarding", "range": {"end": {"column": 59, "line": 22}, "start": {"column": 17, "line": 22}}}}]}}, "range": {"end": {"column": 61, "line": 22}, "start": {"column": 16, "line": 22}}}, {"expression": {"declReferenceExpr": {"baseName": "next", "range": {"end": {"column": 74, "line": 22}, "start": {"column": 70, "line": 22}}}}, "label": "action", "range": {"end": {"column": 74, "line": 22}, "start": {"column": 62, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 9, "line": 22}}}}, "range": {"end": {"column": 75, "line": 22}, "start": {"column": 9, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 60, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Continue to the next section of onboarding", "range": {"end": {"column": 59, "line": 22}, "start": {"column": 17, "line": 22}}}}]}]}

# Parser output for `Button("Continue", action: next)` at 22:9.
does_not_warn_for_short_button_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 9, "line": 22}}}, {"baseName": "next", "range": {"end": {"column": 40, "line": 22}, "start": {"column": 36, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 26, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Continue", "range": {"end": {"column": 25, "line": 22}, "start": {"column": 17, "line": 22}}}}]}}, "range": {"end": {"column": 27, "line": 22}, "start": {"column": 16, "line": 22}}}, {"expression": {"declReferenceExpr": {"baseName": "next", "range": {"end": {"column": 40, "line": 22}, "start": {"column": 36, "line": 22}}}}, "label": "action", "range": {"end": {"column": 40, "line": 22}, "start": {"column": 28, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 22}, "start": {"column": 9, "line": 22}}}}, "range": {"end": {"column": 41, "line": 22}, "start": {"column": 9, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 26, "line": 22}, "start": {"column": 16, "line": 22}}, "segments": [{"stringSegment": {"content": "Continue", "range": {"end": {"column": 25, "line": 22}, "start": {"column": 17, "line": 22}}}}]}]}
