package apple.hig.content.image_tap_gesture

test_warns_for_on_tap_gesture if {
  result := decision with input as warns_for_on_tap_gesture_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.content.review_tap_gesture_action"
  result.warn[0].message == "Review tap gesture action; use a Button when visible content initiates an action."
  result.warn[0].line == 22
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_open if {
  result := decision with input as does_not_warn_for_button_open_node

  count(result.warn) == 0
}

# Parser output for `photo.onTapGesture { openPhoto() }` at 22:15.
warns_for_on_tap_gesture_node := {"declReferenceExprs": [{"baseName": "photo", "range": {"end": {"column": 20, "line": 22}, "start": {"column": 15, "line": 22}}}, {"baseName": "onTapGesture", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 21, "line": 22}}}, {"baseName": "openPhoto", "range": {"end": {"column": 45, "line": 22}, "start": {"column": 36, "line": 22}}}], "functionCallExprs": [{"calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "photo", "range": {"end": {"column": 20, "line": 22}, "start": {"column": 15, "line": 22}}}}, "declName": {"baseName": "onTapGesture", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 21, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}}, "range": {"end": {"column": 49, "line": 22}, "start": {"column": 15, "line": 22}}, "trailingClosure": {"range": {"end": {"column": 49, "line": 22}, "start": {"column": 34, "line": 22}}, "statements": [{"item": {"expr": {"functionCallExpr": {"calledExpression": {"declReferenceExpr": {"baseName": "openPhoto", "range": {"end": {"column": 45, "line": 22}, "start": {"column": 36, "line": 22}}}}, "range": {"end": {"column": 47, "line": 22}, "start": {"column": 36, "line": 22}}}}}, "range": {"end": {"column": 47, "line": 22}, "start": {"column": 36, "line": 22}}}]}}, {"calledExpression": {"declReferenceExpr": {"baseName": "openPhoto", "range": {"end": {"column": 45, "line": 22}, "start": {"column": 36, "line": 22}}}}, "range": {"end": {"column": 47, "line": 22}, "start": {"column": 36, "line": 22}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "photo", "range": {"end": {"column": 20, "line": 22}, "start": {"column": 15, "line": 22}}}}, "declName": {"baseName": "onTapGesture", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 21, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}]}

# Parser output for `Button("Open", action: openPhoto)` at 30:9.
does_not_warn_for_button_open_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 30}, "start": {"column": 9, "line": 30}}}, {"baseName": "openPhoto", "range": {"end": {"column": 41, "line": 30}, "start": {"column": 32, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 22, "line": 30}, "start": {"column": 16, "line": 30}}, "segments": [{"stringSegment": {"content": "Open", "range": {"end": {"column": 21, "line": 30}, "start": {"column": 17, "line": 30}}}}]}}, "range": {"end": {"column": 23, "line": 30}, "start": {"column": 16, "line": 30}}}, {"expression": {"declReferenceExpr": {"baseName": "openPhoto", "range": {"end": {"column": 41, "line": 30}, "start": {"column": 32, "line": 30}}}}, "label": "action", "range": {"end": {"column": 41, "line": 30}, "start": {"column": 24, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 30}, "start": {"column": 9, "line": 30}}}}, "range": {"end": {"column": 42, "line": 30}, "start": {"column": 9, "line": 30}}}], "stringLiteralExprs": [{"range": {"end": {"column": 22, "line": 30}, "start": {"column": 16, "line": 30}}, "segments": [{"stringSegment": {"content": "Open", "range": {"end": {"column": 21, "line": 30}, "start": {"column": 17, "line": 30}}}}]}]}
