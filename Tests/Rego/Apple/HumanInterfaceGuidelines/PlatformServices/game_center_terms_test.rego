package apple.hig.platform_services.game_center_terms

test_warns_for_lowercase_game_center_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_game_center_term_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
  result.warn[0].message == "Review visible Game Center string literal; use the Game Center term casing in custom UI."
  result.warn[0].line == 21
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_gamecenter_without_space_swift_syntax if {
  result := decision with input as warns_for_gamecenter_without_space_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
}

test_does_not_warn_for_correct_game_center_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_game_center_term_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_game_center_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_game_center_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Open game center")` at 21:9.
warns_for_lowercase_game_center_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 21}, "start": {"column": 9, "line": 21}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 32, "line": 21}, "start": {"column": 14, "line": 21}}, "segments": [{"stringSegment": {"content": "Open game center", "range": {"end": {"column": 31, "line": 21}, "start": {"column": 15, "line": 21}}}}]}}, "range": {"end": {"column": 32, "line": 21}, "start": {"column": 14, "line": 21}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 21}, "start": {"column": 9, "line": 21}}}}, "range": {"end": {"column": 33, "line": 21}, "start": {"column": 9, "line": 21}}}], "stringLiteralExprs": [{"range": {"end": {"column": 32, "line": 21}, "start": {"column": 14, "line": 21}}, "segments": [{"stringSegment": {"content": "Open game center", "range": {"end": {"column": 31, "line": 21}, "start": {"column": 15, "line": 21}}}}]}]}

# Parser output for `Label("Open GameCenter", systemImage: "gamecontroller")` at 28:9.
warns_for_gamecenter_without_space_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 28}, "start": {"column": 9, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 32, "line": 28}, "start": {"column": 15, "line": 28}}, "segments": [{"stringSegment": {"content": "Open GameCenter", "range": {"end": {"column": 31, "line": 28}, "start": {"column": 16, "line": 28}}}}]}}, "range": {"end": {"column": 33, "line": 28}, "start": {"column": 15, "line": 28}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 63, "line": 28}, "start": {"column": 47, "line": 28}}, "segments": [{"stringSegment": {"content": "gamecontroller", "range": {"end": {"column": 62, "line": 28}, "start": {"column": 48, "line": 28}}}}]}}, "label": "systemImage", "range": {"end": {"column": 63, "line": 28}, "start": {"column": 34, "line": 28}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 28}, "start": {"column": 9, "line": 28}}}}, "range": {"end": {"column": 64, "line": 28}, "start": {"column": 9, "line": 28}}}], "stringLiteralExprs": [{"range": {"end": {"column": 32, "line": 28}, "start": {"column": 15, "line": 28}}, "segments": [{"stringSegment": {"content": "Open GameCenter", "range": {"end": {"column": 31, "line": 28}, "start": {"column": 16, "line": 28}}}}]}, {"range": {"end": {"column": 63, "line": 28}, "start": {"column": 47, "line": 28}}, "segments": [{"stringSegment": {"content": "gamecontroller", "range": {"end": {"column": 62, "line": 28}, "start": {"column": 48, "line": 28}}}}]}]}

# Parser output for `Button("Open Game Center", action: openGameCenter)` at 36:9.
does_not_warn_for_correct_game_center_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 36}, "start": {"column": 9, "line": 36}}}, {"baseName": "openGameCenter", "range": {"end": {"column": 58, "line": 36}, "start": {"column": 44, "line": 36}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 36}, "start": {"column": 16, "line": 36}}, "segments": [{"stringSegment": {"content": "Open Game Center", "range": {"end": {"column": 33, "line": 36}, "start": {"column": 17, "line": 36}}}}]}}, "range": {"end": {"column": 35, "line": 36}, "start": {"column": 16, "line": 36}}}, {"expression": {"declReferenceExpr": {"baseName": "openGameCenter", "range": {"end": {"column": 58, "line": 36}, "start": {"column": 44, "line": 36}}}}, "label": "action", "range": {"end": {"column": 58, "line": 36}, "start": {"column": 36, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 36}, "start": {"column": 9, "line": 36}}}}, "range": {"end": {"column": 59, "line": 36}, "start": {"column": 9, "line": 36}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 36}, "start": {"column": 16, "line": 36}}, "segments": [{"stringSegment": {"content": "Open Game Center", "range": {"end": {"column": 33, "line": 36}, "start": {"column": 17, "line": 36}}}}]}]}

# Parser output for `Logger(subsystem: "game center")` at 44:17.
does_not_warn_for_non_visible_game_center_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Logger", "range": {"end": {"column": 23, "line": 44}, "start": {"column": 17, "line": 44}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 48, "line": 44}, "start": {"column": 35, "line": 44}}, "segments": [{"stringSegment": {"content": "game center", "range": {"end": {"column": 47, "line": 44}, "start": {"column": 36, "line": 44}}}}]}}, "label": "subsystem", "range": {"end": {"column": 48, "line": 44}, "start": {"column": 24, "line": 44}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Logger", "range": {"end": {"column": 23, "line": 44}, "start": {"column": 17, "line": 44}}}}, "range": {"end": {"column": 49, "line": 44}, "start": {"column": 17, "line": 44}}}], "stringLiteralExprs": [{"range": {"end": {"column": 48, "line": 44}, "start": {"column": 35, "line": 44}}, "segments": [{"stringSegment": {"content": "game center", "range": {"end": {"column": 47, "line": 44}, "start": {"column": 36, "line": 44}}}}]}]}
