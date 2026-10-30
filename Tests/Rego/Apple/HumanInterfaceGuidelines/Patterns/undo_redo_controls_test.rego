package apple.hig.patterns.undo_redo_controls

test_warns_for_custom_button_with_undo_text if {
  result := decision with input as warns_for_custom_button_with_undo_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_undo_redo_control"
  result.warn[0].message == "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols."
  result.warn[0].line == 12
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_restore_route_button if {
  result := decision with input as does_not_warn_for_restore_route_button_node

  count(result.warn) == 0
}

# Parser output for `Button("Undo", action: undo)` at 12:9.
warns_for_custom_button_with_undo_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 12}, "start": {"column": 9, "line": 12}}}, {"baseName": "undo", "range": {"end": {"column": 36, "line": 12}, "start": {"column": 32, "line": 12}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 22, "line": 12}, "start": {"column": 16, "line": 12}}, "segments": [{"stringSegment": {"content": "Undo", "range": {"end": {"column": 21, "line": 12}, "start": {"column": 17, "line": 12}}}}]}}, "range": {"end": {"column": 23, "line": 12}, "start": {"column": 16, "line": 12}}}, {"expression": {"declReferenceExpr": {"baseName": "undo", "range": {"end": {"column": 36, "line": 12}, "start": {"column": 32, "line": 12}}}}, "label": "action", "range": {"end": {"column": 36, "line": 12}, "start": {"column": 24, "line": 12}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 12}, "start": {"column": 9, "line": 12}}}}, "range": {"end": {"column": 37, "line": 12}, "start": {"column": 9, "line": 12}}}], "stringLiteralExprs": [{"range": {"end": {"column": 22, "line": 12}, "start": {"column": 16, "line": 12}}, "segments": [{"stringSegment": {"content": "Undo", "range": {"end": {"column": 21, "line": 12}, "start": {"column": 17, "line": 12}}}}]}]}

# Parser output for `Button("Restore Route", action: restoreRoute)` at 22:13.
does_not_warn_for_restore_route_button_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 22}, "start": {"column": 13, "line": 22}}}, {"baseName": "restoreRoute", "range": {"end": {"column": 57, "line": 22}, "start": {"column": 45, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 22}, "start": {"column": 20, "line": 22}}, "segments": [{"stringSegment": {"content": "Restore Route", "range": {"end": {"column": 34, "line": 22}, "start": {"column": 21, "line": 22}}}}]}}, "range": {"end": {"column": 36, "line": 22}, "start": {"column": 20, "line": 22}}}, {"expression": {"declReferenceExpr": {"baseName": "restoreRoute", "range": {"end": {"column": 57, "line": 22}, "start": {"column": 45, "line": 22}}}}, "label": "action", "range": {"end": {"column": 57, "line": 22}, "start": {"column": 37, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 22}, "start": {"column": 13, "line": 22}}}}, "range": {"end": {"column": 58, "line": 22}, "start": {"column": 13, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 22}, "start": {"column": 20, "line": 22}}, "segments": [{"stringSegment": {"content": "Restore Route", "range": {"end": {"column": 34, "line": 22}, "start": {"column": 21, "line": 22}}}}]}]}
