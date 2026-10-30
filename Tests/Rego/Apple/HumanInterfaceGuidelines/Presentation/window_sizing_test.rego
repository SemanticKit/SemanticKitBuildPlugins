package apple.hig.presentation.window_sizing

test_warns_for_base_default_size_call if {
	result := decision with input as warns_for_base_default_size_call_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].message == "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable."
	result.warn[0].line == 16
	result.warn[0].column == 10
	result.warn[0].severity == "warning"
}

test_warns_for_member_window_resizability_call if {
	result := decision with input as warns_for_member_window_resizability_call_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].line == 22
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_unrelated_frame_call if {
	result := decision with input as does_not_warn_for_unrelated_frame_call_node

	count(result.warn) == 0
}

# Parser output for `defaultSize(width: 1280, height: 720)` at 16:10.
warns_for_base_default_size_call_node := {"declReferenceExprs": [{"baseName": "defaultSize", "range": {"end": {"column": 21, "line": 16}, "start": {"column": 10, "line": 16}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "1280", "range": {"end": {"column": 33, "line": 16}, "start": {"column": 29, "line": 16}}}}, "label": "width", "range": {"end": {"column": 34, "line": 16}, "start": {"column": 22, "line": 16}}}, {"expression": {"integerLiteralExpr": {"literal": "720", "range": {"end": {"column": 46, "line": 16}, "start": {"column": 43, "line": 16}}}}, "label": "height", "range": {"end": {"column": 46, "line": 16}, "start": {"column": 35, "line": 16}}}], "calledExpression": {"declReferenceExpr": {"baseName": "defaultSize", "range": {"end": {"column": 21, "line": 16}, "start": {"column": 10, "line": 16}}}}, "range": {"end": {"column": 47, "line": 16}, "start": {"column": 10, "line": 16}}}]}

# Parser output for `window.windowResizability(.contentSize)` at 22:8.
warns_for_member_window_resizability_call_node := {"declReferenceExprs": [{"baseName": "window", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 8, "line": 22}}}, {"baseName": "windowResizability", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}, {"baseName": "contentSize", "range": {"end": {"column": 46, "line": 22}, "start": {"column": 35, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "contentSize", "range": {"end": {"column": 46, "line": 22}, "start": {"column": 35, "line": 22}}}, "range": {"end": {"column": 46, "line": 22}, "start": {"column": 34, "line": 22}}}}, "range": {"end": {"column": 46, "line": 22}, "start": {"column": 34, "line": 22}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "window", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 8, "line": 22}}}}, "declName": {"baseName": "windowResizability", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 8, "line": 22}}}}, "range": {"end": {"column": 47, "line": 22}, "start": {"column": 8, "line": 22}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "window", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 8, "line": 22}}}}, "declName": {"baseName": "windowResizability", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 8, "line": 22}}}, {"declName": {"baseName": "contentSize", "range": {"end": {"column": 46, "line": 22}, "start": {"column": 35, "line": 22}}}, "range": {"end": {"column": 46, "line": 22}, "start": {"column": 34, "line": 22}}}]}

# Parser output for `content.frame(width: 320, height: 240)` at 44:12.
does_not_warn_for_unrelated_frame_call_node := {"declReferenceExprs": [{"baseName": "content", "range": {"end": {"column": 19, "line": 44}, "start": {"column": 12, "line": 44}}}, {"baseName": "frame", "range": {"end": {"column": 25, "line": 44}, "start": {"column": 20, "line": 44}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "320", "range": {"end": {"column": 36, "line": 44}, "start": {"column": 33, "line": 44}}}}, "label": "width", "range": {"end": {"column": 37, "line": 44}, "start": {"column": 26, "line": 44}}}, {"expression": {"integerLiteralExpr": {"literal": "240", "range": {"end": {"column": 49, "line": 44}, "start": {"column": 46, "line": 44}}}}, "label": "height", "range": {"end": {"column": 49, "line": 44}, "start": {"column": 38, "line": 44}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "content", "range": {"end": {"column": 19, "line": 44}, "start": {"column": 12, "line": 44}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 25, "line": 44}, "start": {"column": 20, "line": 44}}}, "range": {"end": {"column": 25, "line": 44}, "start": {"column": 12, "line": 44}}}}, "range": {"end": {"column": 50, "line": 44}, "start": {"column": 12, "line": 44}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "content", "range": {"end": {"column": 19, "line": 44}, "start": {"column": 12, "line": 44}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 25, "line": 44}, "start": {"column": 20, "line": 44}}}, "range": {"end": {"column": 25, "line": 44}, "start": {"column": 12, "line": 44}}}]}
