package apple.hig.patterns.rating_prompt

test_warns_for_custom_button_with_rate_text if {
  result := decision with input as warns_for_custom_button_with_rate_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_rating_prompt"
  result.warn[0].message == "Review custom rating prompt; prefer the system rating prompt and ask only after engagement."
  result.warn[0].line == 42
  result.warn[0].column == 17
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_request_review_call if {
  result := decision with input as does_not_warn_for_request_review_call_node

  count(result.warn) == 0
}

# Parser output for `Button("Rate This App", action: rateApp)` at 42:17.
warns_for_custom_button_with_rate_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 23, "line": 42}, "start": {"column": 17, "line": 42}}}, {"baseName": "rateApp", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 49, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 42}, "start": {"column": 24, "line": 42}}, "segments": [{"stringSegment": {"content": "Rate This App", "range": {"end": {"column": 38, "line": 42}, "start": {"column": 25, "line": 42}}}}]}}, "range": {"end": {"column": 40, "line": 42}, "start": {"column": 24, "line": 42}}}, {"expression": {"declReferenceExpr": {"baseName": "rateApp", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 49, "line": 42}}}}, "label": "action", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 41, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 23, "line": 42}, "start": {"column": 17, "line": 42}}}}, "range": {"end": {"column": 57, "line": 42}, "start": {"column": 17, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 42}, "start": {"column": 24, "line": 42}}, "segments": [{"stringSegment": {"content": "Rate This App", "range": {"end": {"column": 38, "line": 42}, "start": {"column": 25, "line": 42}}}}]}]}

# Parser output for `requestReview("Review")` at 51:9.
does_not_warn_for_request_review_call_node := {"declReferenceExprs": [{"baseName": "requestReview", "range": {"end": {"column": 22, "line": 51}, "start": {"column": 9, "line": 51}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 51}, "start": {"column": 23, "line": 51}}, "segments": [{"stringSegment": {"content": "Review", "range": {"end": {"column": 30, "line": 51}, "start": {"column": 24, "line": 51}}}}]}}, "range": {"end": {"column": 31, "line": 51}, "start": {"column": 23, "line": 51}}}], "calledExpression": {"declReferenceExpr": {"baseName": "requestReview", "range": {"end": {"column": 22, "line": 51}, "start": {"column": 9, "line": 51}}}}, "range": {"end": {"column": 32, "line": 51}, "start": {"column": 9, "line": 51}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 51}, "start": {"column": 23, "line": 51}}, "segments": [{"stringSegment": {"content": "Review", "range": {"end": {"column": 30, "line": 51}, "start": {"column": 24, "line": 51}}}}]}]}
