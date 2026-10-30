package apple.hig.presentation.destructive_action_labels

test_warns_for_button_delete_route_label if {
  result := decision with input as warns_for_button_delete_route_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_destructive_action_label"
  result.warn[0].message == "Review destructive action; use destructive styling and provide a clear cancel path."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_save_route_label if {
  result := decision with input as does_not_warn_for_button_save_route_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Delete Route", action: deleteRoute)` at 18:9.
warns_for_button_delete_route_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}, {"baseName": "deleteRoute", "range": {"end": {"column": 51, "line": 18}, "start": {"column": 40, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 30, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Delete Route", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 17, "line": 18}}}}]}}, "range": {"end": {"column": 31, "line": 18}, "start": {"column": 16, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "deleteRoute", "range": {"end": {"column": 51, "line": 18}, "start": {"column": 40, "line": 18}}}}, "label": "action", "range": {"end": {"column": 51, "line": 18}, "start": {"column": 32, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 52, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 30, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Delete Route", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 17, "line": 18}}}}]}]}

# Parser output for `Button("Save Route", action: saveRoute)` at 24:9.
does_not_warn_for_button_save_route_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "saveRoute", "range": {"end": {"column": 47, "line": 24}, "start": {"column": 38, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Save Route", "range": {"end": {"column": 27, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 29, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "saveRoute", "range": {"end": {"column": 47, "line": 24}, "start": {"column": 38, "line": 24}}}}, "label": "action", "range": {"end": {"column": 47, "line": 24}, "start": {"column": 30, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 48, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Save Route", "range": {"end": {"column": 27, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]}
