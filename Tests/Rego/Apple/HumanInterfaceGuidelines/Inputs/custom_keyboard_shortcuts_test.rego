package apple.hig.inputs.custom_keyboard_shortcuts

test_warns_for_custom_keyboard_shortcut_swift_syntax if {
  result := decision with input as warns_for_custom_keyboard_shortcut_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_custom_keyboard_shortcut"
  result.warn[0].message == "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary."
  result.warn[0].line == 18
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_keyboard_shortcut_swift_syntax if {
  result := decision with input as does_not_warn_for_non_keyboard_shortcut_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `refreshButton.keyboardShortcut("R")` at 18:12.
warns_for_custom_keyboard_shortcut_swift_syntax_node := {"declReferenceExprs": [{"baseName": "refreshButton", "range": {"end": {"column": 25, "line": 18}, "start": {"column": 12, "line": 18}}}, {"baseName": "keyboardShortcut", "range": {"end": {"column": 42, "line": 18}, "start": {"column": 26, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 46, "line": 18}, "start": {"column": 43, "line": 18}}, "segments": [{"stringSegment": {"content": "R", "range": {"end": {"column": 45, "line": 18}, "start": {"column": 44, "line": 18}}}}]}}, "range": {"end": {"column": 46, "line": 18}, "start": {"column": 43, "line": 18}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "refreshButton", "range": {"end": {"column": 25, "line": 18}, "start": {"column": 12, "line": 18}}}}, "declName": {"baseName": "keyboardShortcut", "range": {"end": {"column": 42, "line": 18}, "start": {"column": 26, "line": 18}}}, "range": {"end": {"column": 42, "line": 18}, "start": {"column": 12, "line": 18}}}}, "range": {"end": {"column": 47, "line": 18}, "start": {"column": 12, "line": 18}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "refreshButton", "range": {"end": {"column": 25, "line": 18}, "start": {"column": 12, "line": 18}}}}, "declName": {"baseName": "keyboardShortcut", "range": {"end": {"column": 42, "line": 18}, "start": {"column": 26, "line": 18}}}, "range": {"end": {"column": 42, "line": 18}, "start": {"column": 12, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 46, "line": 18}, "start": {"column": 43, "line": 18}}, "segments": [{"stringSegment": {"content": "R", "range": {"end": {"column": 45, "line": 18}, "start": {"column": 44, "line": 18}}}}]}]}

# Parser output for `refreshButton.buttonStyle("R")` at 24:10.
does_not_warn_for_non_keyboard_shortcut_swift_syntax_node := {"declReferenceExprs": [{"baseName": "refreshButton", "range": {"end": {"column": 23, "line": 24}, "start": {"column": 10, "line": 24}}}, {"baseName": "buttonStyle", "range": {"end": {"column": 35, "line": 24}, "start": {"column": 24, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 24}, "start": {"column": 36, "line": 24}}, "segments": [{"stringSegment": {"content": "R", "range": {"end": {"column": 38, "line": 24}, "start": {"column": 37, "line": 24}}}}]}}, "range": {"end": {"column": 39, "line": 24}, "start": {"column": 36, "line": 24}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "refreshButton", "range": {"end": {"column": 23, "line": 24}, "start": {"column": 10, "line": 24}}}}, "declName": {"baseName": "buttonStyle", "range": {"end": {"column": 35, "line": 24}, "start": {"column": 24, "line": 24}}}, "range": {"end": {"column": 35, "line": 24}, "start": {"column": 10, "line": 24}}}}, "range": {"end": {"column": 40, "line": 24}, "start": {"column": 10, "line": 24}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "refreshButton", "range": {"end": {"column": 23, "line": 24}, "start": {"column": 10, "line": 24}}}}, "declName": {"baseName": "buttonStyle", "range": {"end": {"column": 35, "line": 24}, "start": {"column": 24, "line": 24}}}, "range": {"end": {"column": 35, "line": 24}, "start": {"column": 10, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 24}, "start": {"column": 36, "line": 24}}, "segments": [{"stringSegment": {"content": "R", "range": {"end": {"column": 38, "line": 24}, "start": {"column": 37, "line": 24}}}}]}]}
