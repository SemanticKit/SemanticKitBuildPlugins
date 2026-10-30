package apple.hig.sharing.shareplay_term

test_warns_for_shareplaying_text_swift_syntax if {
  result := decision with input as warns_for_shareplaying_text_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.sharing.review_shareplay_term"
  result.warn[0].message == "Review visible SharePlay terminology; use SharePlay as a noun or direct-action verb without modifying the term."
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_modified_shareplay_variants if {
  result := {"warn": [warning |
    node := warns_for_modified_shareplay_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.sharing.review_shareplay_term"
}

test_does_not_warn_for_normal_shareplay_text_swift_syntax if {
  result := decision with input as does_not_warn_for_normal_shareplay_text_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_shareplay_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_shareplay_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Start SharePlaying now")` at 22:9.
warns_for_shareplaying_text_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 22}, "start": {"column": 9, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 38, "line": 22}, "start": {"column": 14, "line": 22}}, "segments": [{"stringSegment": {"content": "Start SharePlaying now", "range": {"end": {"column": 37, "line": 22}, "start": {"column": 15, "line": 22}}}}]}}, "range": {"end": {"column": 38, "line": 22}, "start": {"column": 14, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 22}, "start": {"column": 9, "line": 22}}}}, "range": {"end": {"column": 39, "line": 22}, "start": {"column": 9, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 38, "line": 22}, "start": {"column": 14, "line": 22}}, "segments": [{"stringSegment": {"content": "Start SharePlaying now", "range": {"end": {"column": 37, "line": 22}, "start": {"column": 15, "line": 22}}}}]}]}

# Parser output for `Button("Share-play", action: startActivity)` at 25:9.
# Parser output for `Label("SharePlay session", systemImage: "shareplay")` at 26:9.
# Parser output for `Text("Share play with friends")` at 27:9.
warns_for_modified_shareplay_variants_nodes := [
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 25}, "start": {"column": 9, "line": 25}}}, {"baseName": "startActivity", "range": {"end": {"column": 51, "line": 25}, "start": {"column": 38, "line": 25}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 25}, "start": {"column": 16, "line": 25}}, "segments": [{"stringSegment": {"content": "Share-play", "range": {"end": {"column": 27, "line": 25}, "start": {"column": 17, "line": 25}}}}]}}, "range": {"end": {"column": 29, "line": 25}, "start": {"column": 16, "line": 25}}}, {"expression": {"declReferenceExpr": {"baseName": "startActivity", "range": {"end": {"column": 51, "line": 25}, "start": {"column": 38, "line": 25}}}}, "label": "action", "range": {"end": {"column": 51, "line": 25}, "start": {"column": 30, "line": 25}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 25}, "start": {"column": 9, "line": 25}}}}, "range": {"end": {"column": 52, "line": 25}, "start": {"column": 9, "line": 25}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 25}, "start": {"column": 16, "line": 25}}, "segments": [{"stringSegment": {"content": "Share-play", "range": {"end": {"column": 27, "line": 25}, "start": {"column": 17, "line": 25}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 26}, "start": {"column": 9, "line": 26}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 26}, "start": {"column": 15, "line": 26}}, "segments": [{"stringSegment": {"content": "SharePlay session", "range": {"end": {"column": 33, "line": 26}, "start": {"column": 16, "line": 26}}}}]}}, "range": {"end": {"column": 35, "line": 26}, "start": {"column": 15, "line": 26}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 60, "line": 26}, "start": {"column": 49, "line": 26}}, "segments": [{"stringSegment": {"content": "shareplay", "range": {"end": {"column": 59, "line": 26}, "start": {"column": 50, "line": 26}}}}]}}, "label": "systemImage", "range": {"end": {"column": 60, "line": 26}, "start": {"column": 36, "line": 26}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 26}, "start": {"column": 9, "line": 26}}}}, "range": {"end": {"column": 61, "line": 26}, "start": {"column": 9, "line": 26}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 26}, "start": {"column": 15, "line": 26}}, "segments": [{"stringSegment": {"content": "SharePlay session", "range": {"end": {"column": 33, "line": 26}, "start": {"column": 16, "line": 26}}}}]}, {"range": {"end": {"column": 60, "line": 26}, "start": {"column": 49, "line": 26}}, "segments": [{"stringSegment": {"content": "shareplay", "range": {"end": {"column": 59, "line": 26}, "start": {"column": 50, "line": 26}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 27}, "start": {"column": 9, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 27}, "start": {"column": 14, "line": 27}}, "segments": [{"stringSegment": {"content": "Share play with friends", "range": {"end": {"column": 38, "line": 27}, "start": {"column": 15, "line": 27}}}}]}}, "range": {"end": {"column": 39, "line": 27}, "start": {"column": 14, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 27}, "start": {"column": 9, "line": 27}}}}, "range": {"end": {"column": 40, "line": 27}, "start": {"column": 9, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 27}, "start": {"column": 14, "line": 27}}, "segments": [{"stringSegment": {"content": "Share play with friends", "range": {"end": {"column": 38, "line": 27}, "start": {"column": 15, "line": 27}}}}]}]},
]

# Parser output for `Text("Start SharePlay")` at 36:9.
does_not_warn_for_normal_shareplay_text_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 36}, "start": {"column": 9, "line": 36}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 36}, "start": {"column": 14, "line": 36}}, "segments": [{"stringSegment": {"content": "Start SharePlay", "range": {"end": {"column": 30, "line": 36}, "start": {"column": 15, "line": 36}}}}]}}, "range": {"end": {"column": 31, "line": 36}, "start": {"column": 14, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 36}, "start": {"column": 9, "line": 36}}}}, "range": {"end": {"column": 32, "line": 36}, "start": {"column": 9, "line": 36}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 36}, "start": {"column": 14, "line": 36}}, "segments": [{"stringSegment": {"content": "Start SharePlay", "range": {"end": {"column": 30, "line": 36}, "start": {"column": 15, "line": 36}}}}]}]}

# Parser output for `ActivityMetadata("shareplaying")` at 44:11.
does_not_warn_for_non_visible_shareplay_swift_syntax_node := {"declReferenceExprs": [{"baseName": "ActivityMetadata", "range": {"end": {"column": 27, "line": 44}, "start": {"column": 11, "line": 44}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 42, "line": 44}, "start": {"column": 28, "line": 44}}, "segments": [{"stringSegment": {"content": "shareplaying", "range": {"end": {"column": 41, "line": 44}, "start": {"column": 29, "line": 44}}}}]}}, "range": {"end": {"column": 42, "line": 44}, "start": {"column": 28, "line": 44}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ActivityMetadata", "range": {"end": {"column": 27, "line": 44}, "start": {"column": 11, "line": 44}}}}, "range": {"end": {"column": 43, "line": 44}, "start": {"column": 11, "line": 44}}}], "stringLiteralExprs": [{"range": {"end": {"column": 42, "line": 44}, "start": {"column": 28, "line": 44}}, "segments": [{"stringSegment": {"content": "shareplaying", "range": {"end": {"column": 41, "line": 44}, "start": {"column": 29, "line": 44}}}}]}]}
