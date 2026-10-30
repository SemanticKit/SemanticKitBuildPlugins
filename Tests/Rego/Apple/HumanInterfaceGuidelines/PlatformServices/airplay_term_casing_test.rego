package apple.hig.platform_services.airplay_term_casing

test_warns_for_lowercase_airplay_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use the AirPlay term casing."
  warnings[0].line == 18
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_spaced_airplay_term_swift_syntax if {
  result := decision with input as warns_for_spaced_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_airplay_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_airplay_string_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}

# Parser output for `Text("Open airplay settings")` at 18:11.
warns_for_lowercase_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 11, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Open airplay settings", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 17, "line": 18}}}}]}}, "range": {"end": {"column": 39, "line": 18}, "start": {"column": 16, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 11, "line": 18}}}}, "range": {"end": {"column": 40, "line": 18}, "start": {"column": 11, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Open airplay settings", "range": {"end": {"column": 38, "line": 18}, "start": {"column": 17, "line": 18}}}}]}]}

# Parser output for `Button("Choose Air Play", action: chooseRoute)` at 24:13.
warns_for_spaced_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 19, "line": 24}, "start": {"column": 13, "line": 24}}}, {"baseName": "chooseRoute", "range": {"end": {"column": 58, "line": 24}, "start": {"column": 47, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 24}, "start": {"column": 20, "line": 24}}, "segments": [{"stringSegment": {"content": "Choose Air Play", "range": {"end": {"column": 36, "line": 24}, "start": {"column": 21, "line": 24}}}}]}}, "range": {"end": {"column": 38, "line": 24}, "start": {"column": 20, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "chooseRoute", "range": {"end": {"column": 58, "line": 24}, "start": {"column": 47, "line": 24}}}}, "label": "action", "range": {"end": {"column": 58, "line": 24}, "start": {"column": 39, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 19, "line": 24}, "start": {"column": 13, "line": 24}}}}, "range": {"end": {"column": 59, "line": 24}, "start": {"column": 13, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 24}, "start": {"column": 20, "line": 24}}, "segments": [{"stringSegment": {"content": "Choose Air Play", "range": {"end": {"column": 36, "line": 24}, "start": {"column": 21, "line": 24}}}}]}]}

# Parser output for `Label("Use AirPlay", systemImage: "tv")` at 31:9.
does_not_warn_for_correct_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 31}, "start": {"column": 9, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 31}, "start": {"column": 15, "line": 31}}, "segments": [{"stringSegment": {"content": "Use AirPlay", "range": {"end": {"column": 27, "line": 31}, "start": {"column": 16, "line": 31}}}}]}}, "range": {"end": {"column": 29, "line": 31}, "start": {"column": 15, "line": 31}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 47, "line": 31}, "start": {"column": 43, "line": 31}}, "segments": [{"stringSegment": {"content": "tv", "range": {"end": {"column": 46, "line": 31}, "start": {"column": 44, "line": 31}}}}]}}, "label": "systemImage", "range": {"end": {"column": 47, "line": 31}, "start": {"column": 30, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 48, "line": 31}, "start": {"column": 9, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 31}, "start": {"column": 15, "line": 31}}, "segments": [{"stringSegment": {"content": "Use AirPlay", "range": {"end": {"column": 27, "line": 31}, "start": {"column": 16, "line": 31}}}}]}, {"range": {"end": {"column": 47, "line": 31}, "start": {"column": 43, "line": 31}}, "segments": [{"stringSegment": {"content": "tv", "range": {"end": {"column": 46, "line": 31}, "start": {"column": 44, "line": 31}}}}]}]}

# Parser output for `Logger(subsystem: "airplay")` at 44:17.
does_not_warn_for_non_visible_airplay_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Logger", "range": {"end": {"column": 23, "line": 44}, "start": {"column": 17, "line": 44}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 44, "line": 44}, "start": {"column": 35, "line": 44}}, "segments": [{"stringSegment": {"content": "airplay", "range": {"end": {"column": 43, "line": 44}, "start": {"column": 36, "line": 44}}}}]}}, "label": "subsystem", "range": {"end": {"column": 44, "line": 44}, "start": {"column": 24, "line": 44}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Logger", "range": {"end": {"column": 23, "line": 44}, "start": {"column": 17, "line": 44}}}}, "range": {"end": {"column": 45, "line": 44}, "start": {"column": 17, "line": 44}}}], "stringLiteralExprs": [{"range": {"end": {"column": 44, "line": 44}, "start": {"column": 35, "line": 44}}, "segments": [{"stringSegment": {"content": "airplay", "range": {"end": {"column": 43, "line": 44}, "start": {"column": 36, "line": 44}}}}]}]}
