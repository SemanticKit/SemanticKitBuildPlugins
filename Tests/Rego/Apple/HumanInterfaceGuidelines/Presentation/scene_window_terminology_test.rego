package apple.hig.presentation.scene_window_terminology

test_warns_for_scene_term_in_visible_text_copy if {
	result := decision with input as warns_for_scene_term_in_visible_text_copy_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].message == "Review visible copy that says scene; use window when referring to app windows."
	result.warn[0].line == 12
	result.warn[0].column == 9
	result.warn[0].severity == "warning"
}

test_warns_for_scene_term_in_action_label if {
	result := decision with input as warns_for_scene_term_in_action_label_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_action_label"
	result.warn[0].message == "Review action label that says scene; use window for commands that open or manage windows."
	result.warn[0].line == 27
	result.warn[0].column == 13
	result.warn[0].severity == "warning"
}

test_warns_for_member_help_scene_term if {
	result := decision with input as warns_for_member_help_scene_term_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_window_copy if {
	result := decision with input as does_not_warn_for_window_copy_node

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_scene_identifier if {
	result := decision with input as does_not_warn_for_non_visible_scene_identifier_node

	count(result.warn) == 0
}

test_does_not_warn_for_scenery_word_boundary if {
	result := decision with input as does_not_warn_for_scenery_word_boundary_node

	count(result.warn) == 0
}

# Parser output for `Text("Open this scene from the Window menu")` at 12:9.
warns_for_scene_term_in_visible_text_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 9, "line": 12}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 52, "line": 12}, "start": {"column": 14, "line": 12}}, "segments": [{"stringSegment": {"content": "Open this scene from the Window menu", "range": {"end": {"column": 51, "line": 12}, "start": {"column": 15, "line": 12}}}}]}}, "range": {"end": {"column": 52, "line": 12}, "start": {"column": 14, "line": 12}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 9, "line": 12}}}}, "range": {"end": {"column": 53, "line": 12}, "start": {"column": 9, "line": 12}}}], "stringLiteralExprs": [{"range": {"end": {"column": 52, "line": 12}, "start": {"column": 14, "line": 12}}, "segments": [{"stringSegment": {"content": "Open this scene from the Window menu", "range": {"end": {"column": 51, "line": 12}, "start": {"column": 15, "line": 12}}}}]}]}

# Parser output for `Button("Open New Scene", action: openScene)` at 27:13.
warns_for_scene_term_in_action_label_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 27}, "start": {"column": 13, "line": 27}}}, {"baseName": "openScene", "range": {"end": {"column": 55, "line": 27}, "start": {"column": 46, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 27}, "start": {"column": 20, "line": 27}}, "segments": [{"stringSegment": {"content": "Open New Scene", "range": {"end": {"column": 35, "line": 27}, "start": {"column": 21, "line": 27}}}}]}}, "range": {"end": {"column": 37, "line": 27}, "start": {"column": 20, "line": 27}}}, {"expression": {"declReferenceExpr": {"baseName": "openScene", "range": {"end": {"column": 55, "line": 27}, "start": {"column": 46, "line": 27}}}}, "label": "action", "range": {"end": {"column": 55, "line": 27}, "start": {"column": 38, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 27}, "start": {"column": 13, "line": 27}}}}, "range": {"end": {"column": 56, "line": 27}, "start": {"column": 13, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 27}, "start": {"column": 20, "line": 27}}, "segments": [{"stringSegment": {"content": "Open New Scene", "range": {"end": {"column": 35, "line": 27}, "start": {"column": 21, "line": 27}}}}]}]}

# Parser output for `status.help("Shows the active scene")` at 34:8.
warns_for_member_help_scene_term_node := {"declReferenceExprs": [{"baseName": "status", "range": {"end": {"column": 14, "line": 34}, "start": {"column": 8, "line": 34}}}, {"baseName": "help", "range": {"end": {"column": 19, "line": 34}, "start": {"column": 15, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 44, "line": 34}, "start": {"column": 20, "line": 34}}, "segments": [{"stringSegment": {"content": "Shows the active scene", "range": {"end": {"column": 43, "line": 34}, "start": {"column": 21, "line": 34}}}}]}}, "range": {"end": {"column": 44, "line": 34}, "start": {"column": 20, "line": 34}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "status", "range": {"end": {"column": 14, "line": 34}, "start": {"column": 8, "line": 34}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 19, "line": 34}, "start": {"column": 15, "line": 34}}}, "range": {"end": {"column": 19, "line": 34}, "start": {"column": 8, "line": 34}}}}, "range": {"end": {"column": 45, "line": 34}, "start": {"column": 8, "line": 34}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "status", "range": {"end": {"column": 14, "line": 34}, "start": {"column": 8, "line": 34}}}}, "declName": {"baseName": "help", "range": {"end": {"column": 19, "line": 34}, "start": {"column": 15, "line": 34}}}, "range": {"end": {"column": 19, "line": 34}, "start": {"column": 8, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 44, "line": 34}, "start": {"column": 20, "line": 34}}, "segments": [{"stringSegment": {"content": "Shows the active scene", "range": {"end": {"column": 43, "line": 34}, "start": {"column": 21, "line": 34}}}}]}]}

# Parser output for `Text("Open this window from the Window menu")` at 41:9.
does_not_warn_for_window_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 41}, "start": {"column": 9, "line": 41}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 53, "line": 41}, "start": {"column": 14, "line": 41}}, "segments": [{"stringSegment": {"content": "Open this window from the Window menu", "range": {"end": {"column": 52, "line": 41}, "start": {"column": 15, "line": 41}}}}]}}, "range": {"end": {"column": 53, "line": 41}, "start": {"column": 14, "line": 41}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 41}, "start": {"column": 9, "line": 41}}}}, "range": {"end": {"column": 54, "line": 41}, "start": {"column": 9, "line": 41}}}], "stringLiteralExprs": [{"range": {"end": {"column": 53, "line": 41}, "start": {"column": 14, "line": 41}}, "segments": [{"stringSegment": {"content": "Open this window from the Window menu", "range": {"end": {"column": 52, "line": 41}, "start": {"column": 15, "line": 41}}}}]}]}

# Parser output for `WindowGroup(id: "primary-scene") { ContentView() }` at 8:5.
does_not_warn_for_non_visible_scene_identifier_node := {"declReferenceExprs": [{"baseName": "WindowGroup", "range": {"end": {"column": 16, "line": 8}, "start": {"column": 5, "line": 8}}}, {"baseName": "ContentView", "range": {"end": {"column": 51, "line": 8}, "start": {"column": 40, "line": 8}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 8}, "start": {"column": 21, "line": 8}}, "segments": [{"stringSegment": {"content": "primary-scene", "range": {"end": {"column": 35, "line": 8}, "start": {"column": 22, "line": 8}}}}]}}, "label": "id", "range": {"end": {"column": 36, "line": 8}, "start": {"column": 17, "line": 8}}}], "calledExpression": {"declReferenceExpr": {"baseName": "WindowGroup", "range": {"end": {"column": 16, "line": 8}, "start": {"column": 5, "line": 8}}}}, "range": {"end": {"column": 55, "line": 8}, "start": {"column": 5, "line": 8}}, "trailingClosure": {"range": {"end": {"column": 55, "line": 8}, "start": {"column": 38, "line": 8}}, "statements": [{"item": {"expr": {"functionCallExpr": {"calledExpression": {"declReferenceExpr": {"baseName": "ContentView", "range": {"end": {"column": 51, "line": 8}, "start": {"column": 40, "line": 8}}}}, "range": {"end": {"column": 53, "line": 8}, "start": {"column": 40, "line": 8}}}}}, "range": {"end": {"column": 53, "line": 8}, "start": {"column": 40, "line": 8}}}]}}, {"calledExpression": {"declReferenceExpr": {"baseName": "ContentView", "range": {"end": {"column": 51, "line": 8}, "start": {"column": 40, "line": 8}}}}, "range": {"end": {"column": 53, "line": 8}, "start": {"column": 40, "line": 8}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 8}, "start": {"column": 21, "line": 8}}, "segments": [{"stringSegment": {"content": "primary-scene", "range": {"end": {"column": 35, "line": 8}, "start": {"column": 22, "line": 8}}}}]}]}

# Parser output for `Text("Choose scenery")` at 18:9.
does_not_warn_for_scenery_word_boundary_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Choose scenery", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 15, "line": 18}}}}]}}, "range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 31, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Choose scenery", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 15, "line": 18}}}}]}]}
