package apple.hig.components.standard_navigation_labels

test_warns_for_button_back_text_label if {
  result := decision with input as warns_for_button_back_text_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_text_navigation_label"
  result.warn[0].message == "Review text navigation label; prefer standard Back or Close controls and symbols."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_start_route_text_label if {
  result := decision with input as does_not_warn_for_button_start_route_text_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Back", action: goBack)` at 18:9.
warns_for_button_back_text_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}, {"baseName": "goBack", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 32, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 22, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Back", "range": {"end": {"column": 21, "line": 18}, "start": {"column": 17, "line": 18}}}}]}}, "range": {"end": {"column": 23, "line": 18}, "start": {"column": 16, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "goBack", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 32, "line": 18}}}}, "label": "action", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 24, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 39, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 22, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Back", "range": {"end": {"column": 21, "line": 18}, "start": {"column": 17, "line": 18}}}}]}]}

# Parser output for `Button("Start Route", action: startRoute)` at 24:9.
does_not_warn_for_button_start_route_text_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "startRoute", "range": {"end": {"column": 49, "line": 24}, "start": {"column": 39, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 29, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Start Route", "range": {"end": {"column": 28, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 30, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "startRoute", "range": {"end": {"column": 49, "line": 24}, "start": {"column": 39, "line": 24}}}}, "label": "action", "range": {"end": {"column": 49, "line": 24}, "start": {"column": 31, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 50, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 29, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Start Route", "range": {"end": {"column": 28, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]}
