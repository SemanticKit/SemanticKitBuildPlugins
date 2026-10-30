package apple.hig.platform_services.airplay_term_noun

test_warns_for_modified_airplay_term_swift_syntax if {
  result := decision with input as warns_for_modified_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term."
  warnings[0].line == 20
  warnings[0].column == 9
  warnings[0].severity == "warning"
}

test_does_not_warn_for_noun_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_noun_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_modified_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_modified_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}

# Parser output for `Text("AirPlaying to living room")` at 20:9.
warns_for_modified_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 20}, "start": {"column": 9, "line": 20}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 41, "line": 20}, "start": {"column": 14, "line": 20}}, "segments": [{"stringSegment": {"content": "AirPlaying to living room", "range": {"end": {"column": 40, "line": 20}, "start": {"column": 15, "line": 20}}}}]}}, "range": {"end": {"column": 41, "line": 20}, "start": {"column": 14, "line": 20}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 20}, "start": {"column": 9, "line": 20}}}}, "range": {"end": {"column": 42, "line": 20}, "start": {"column": 9, "line": 20}}}], "stringLiteralExprs": [{"range": {"end": {"column": 41, "line": 20}, "start": {"column": 14, "line": 20}}, "segments": [{"stringSegment": {"content": "AirPlaying to living room", "range": {"end": {"column": 40, "line": 20}, "start": {"column": 15, "line": 20}}}}]}]}

# Parser output for `Text("Use AirPlay with speakers")` at 27:9.
does_not_warn_for_noun_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 27}, "start": {"column": 9, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 41, "line": 27}, "start": {"column": 14, "line": 27}}, "segments": [{"stringSegment": {"content": "Use AirPlay with speakers", "range": {"end": {"column": 40, "line": 27}, "start": {"column": 15, "line": 27}}}}]}}, "range": {"end": {"column": 41, "line": 27}, "start": {"column": 14, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 27}, "start": {"column": 9, "line": 27}}}}, "range": {"end": {"column": 42, "line": 27}, "start": {"column": 9, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 41, "line": 27}, "start": {"column": 14, "line": 27}}, "segments": [{"stringSegment": {"content": "Use AirPlay with speakers", "range": {"end": {"column": 40, "line": 27}, "start": {"column": 15, "line": 27}}}}]}]}

# Parser output for `Logger(subsystem: "airplaying")` at 35:13.
does_not_warn_for_non_visible_modified_airplay_term_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Logger", "range": {"end": {"column": 19, "line": 35}, "start": {"column": 13, "line": 35}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 43, "line": 35}, "start": {"column": 31, "line": 35}}, "segments": [{"stringSegment": {"content": "airplaying", "range": {"end": {"column": 42, "line": 35}, "start": {"column": 32, "line": 35}}}}]}}, "label": "subsystem", "range": {"end": {"column": 43, "line": 35}, "start": {"column": 20, "line": 35}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Logger", "range": {"end": {"column": 19, "line": 35}, "start": {"column": 13, "line": 35}}}}, "range": {"end": {"column": 44, "line": 35}, "start": {"column": 13, "line": 35}}}], "stringLiteralExprs": [{"range": {"end": {"column": 43, "line": 35}, "start": {"column": 31, "line": 35}}, "segments": [{"stringSegment": {"content": "airplaying", "range": {"end": {"column": 42, "line": 35}, "start": {"column": 32, "line": 35}}}}]}]}
