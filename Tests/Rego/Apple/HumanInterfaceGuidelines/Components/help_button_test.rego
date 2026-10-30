package apple.hig.components.help_button

test_warns_for_button_help_text if {
  result := decision with input as warns_for_button_help_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_custom_help_button"
  result.warn[0].message == "Review custom Help button; use the system help button for help documentation where appropriate."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_route_details_button_text if {
  result := decision with input as does_not_warn_for_route_details_button_text_node

  count(result.warn) == 0
}

# Parser output for `Button("Help", action: showHelp)` at 18:9.
warns_for_button_help_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}, {"baseName": "showHelp", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 32, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 22, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Help", "range": {"end": {"column": 21, "line": 18}, "start": {"column": 17, "line": 18}}}}]}}, "range": {"end": {"column": 23, "line": 18}, "start": {"column": 16, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "showHelp", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 32, "line": 18}}}}, "label": "action", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 24, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 41, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 22, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Help", "range": {"end": {"column": 21, "line": 18}, "start": {"column": 17, "line": 18}}}}]}]}

# Parser output for `Button("Route Details", action: showDetails)` at 24:9.
does_not_warn_for_route_details_button_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "showDetails", "range": {"end": {"column": 52, "line": 24}, "start": {"column": 41, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Route Details", "range": {"end": {"column": 30, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 32, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "showDetails", "range": {"end": {"column": 52, "line": 24}, "start": {"column": 41, "line": 24}}}}, "label": "action", "range": {"end": {"column": 52, "line": 24}, "start": {"column": 33, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 53, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Route Details", "range": {"end": {"column": 30, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]}
