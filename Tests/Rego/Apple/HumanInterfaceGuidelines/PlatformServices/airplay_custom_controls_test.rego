package apple.hig.platform_services.airplay_custom_controls

test_warns_for_custom_button_with_airplay_text if {
  result := decision with input as warns_for_custom_button_with_airplay_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_airplay_control"
  result.warn[0].message == "Review custom AirPlay control; use Apple-provided AirPlay affordances."
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_avroutepickerview if {
  result := decision with input as does_not_warn_for_avroutepickerview_node

  count(result.warn) == 0
}

# Parser output for `Button("AirPlay", action: showRoutes)` at 18:11.
warns_for_custom_button_with_airplay_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 18}, "start": {"column": 11, "line": 18}}}, {"baseName": "showRoutes", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 37, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 27, "line": 18}, "start": {"column": 18, "line": 18}}, "segments": [{"stringSegment": {"content": "AirPlay", "range": {"end": {"column": 26, "line": 18}, "start": {"column": 19, "line": 18}}}}]}}, "range": {"end": {"column": 28, "line": 18}, "start": {"column": 18, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "showRoutes", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 37, "line": 18}}}}, "label": "action", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 29, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 18}, "start": {"column": 11, "line": 18}}}}, "range": {"end": {"column": 48, "line": 18}, "start": {"column": 11, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 27, "line": 18}, "start": {"column": 18, "line": 18}}, "segments": [{"stringSegment": {"content": "AirPlay", "range": {"end": {"column": 26, "line": 18}, "start": {"column": 19, "line": 18}}}}]}]}

# Parser output for `AVRoutePickerView("AirPlay")` at 27:9.
does_not_warn_for_avroutepickerview_node := {"declReferenceExprs": [{"baseName": "AVRoutePickerView", "range": {"end": {"column": 26, "line": 27}, "start": {"column": 9, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 27}, "start": {"column": 27, "line": 27}}, "segments": [{"stringSegment": {"content": "AirPlay", "range": {"end": {"column": 35, "line": 27}, "start": {"column": 28, "line": 27}}}}]}}, "range": {"end": {"column": 36, "line": 27}, "start": {"column": 27, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "AVRoutePickerView", "range": {"end": {"column": 26, "line": 27}, "start": {"column": 9, "line": 27}}}}, "range": {"end": {"column": 37, "line": 27}, "start": {"column": 9, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 27}, "start": {"column": 27, "line": 27}}, "segments": [{"stringSegment": {"content": "AirPlay", "range": {"end": {"column": 35, "line": 27}, "start": {"column": 28, "line": 27}}}}]}]}
