package apple.hig.presentation.unhelpful_alert_title

test_warns_for_generic_error_text_swift_syntax if {
  result := decision with input as warns_for_generic_error_text_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_unhelpful_alert_title"
  result.warn[0].message == "Review alert title; use direct, neutral, specific copy instead of generic error text."
  result.warn[0].line == 14
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_specific_route_unavailable_text_swift_syntax if {
  result := decision with input as does_not_warn_for_specific_route_unavailable_text_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Error")` at 14:13.
warns_for_generic_error_text_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 17, "line": 14}, "start": {"column": 13, "line": 14}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 25, "line": 14}, "start": {"column": 18, "line": 14}}, "segments": [{"stringSegment": {"content": "Error", "range": {"end": {"column": 24, "line": 14}, "start": {"column": 19, "line": 14}}}}]}}, "range": {"end": {"column": 25, "line": 14}, "start": {"column": 18, "line": 14}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 17, "line": 14}, "start": {"column": 13, "line": 14}}}}, "range": {"end": {"column": 26, "line": 14}, "start": {"column": 13, "line": 14}}}], "stringLiteralExprs": [{"range": {"end": {"column": 25, "line": 14}, "start": {"column": 18, "line": 14}}, "segments": [{"stringSegment": {"content": "Error", "range": {"end": {"column": 24, "line": 14}, "start": {"column": 19, "line": 14}}}}]}]}

# Parser output for `Text("Route unavailable")` at 14:13.
does_not_warn_for_specific_route_unavailable_text_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 17, "line": 14}, "start": {"column": 13, "line": 14}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 14}, "start": {"column": 18, "line": 14}}, "segments": [{"stringSegment": {"content": "Route unavailable", "range": {"end": {"column": 36, "line": 14}, "start": {"column": 19, "line": 14}}}}]}}, "range": {"end": {"column": 37, "line": 14}, "start": {"column": 18, "line": 14}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 17, "line": 14}, "start": {"column": 13, "line": 14}}}}, "range": {"end": {"column": 38, "line": 14}, "start": {"column": 13, "line": 14}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 14}, "start": {"column": 18, "line": 14}}, "segments": [{"stringSegment": {"content": "Route unavailable", "range": {"end": {"column": 36, "line": 14}, "start": {"column": 19, "line": 14}}}}]}]}
