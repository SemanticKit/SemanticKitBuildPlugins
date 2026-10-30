package apple.hig.augmented_reality.technical_ar_terms

test_warns_for_exact_technical_ar_terms_in_visible_string_calls if {
  result := {"warn": [warning |
    node := warns_for_exact_technical_ar_terms_in_visible_string_calls_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 4
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_text_field_exact_technical_ar_term if {
  result := decision with input as warns_for_text_field_exact_technical_ar_term_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].line == 29
  result.warn[0].column == 9
}

test_does_not_warn_for_approachable_ar_instructional_text if {
  result := decision with input as does_not_warn_for_approachable_ar_instructional_text_node

  count(result.warn) == 0
}

test_warns_for_substring_and_case_different_terms if {
  result := {"warn": [warning |
    node := warns_for_substring_and_case_different_terms_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 2
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].line == 31
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
  result.warn[1].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[1].line == 32
  result.warn[1].column == 11
}

test_does_not_warn_for_exact_term_on_non_visible_call if {
  result := decision with input as does_not_warn_for_exact_term_on_non_visible_call_node

  count(result.warn) == 0
}

# Parser output for `Text("ARKit")` at 17:11.
# Parser output for `Label("World Detection", systemImage: "arkit")` at 18:11.
# Parser output for `Button("Tracking", action: startTracking)` at 19:11.
# Parser output for `help("World tracking")` at 20:11.
warns_for_exact_technical_ar_terms_in_visible_string_calls_nodes := [
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 17}, "start": {"column": 11, "line": 17}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 23, "line": 17}, "start": {"column": 16, "line": 17}}, "segments": [{"stringSegment": {"content": "ARKit", "range": {"end": {"column": 22, "line": 17}, "start": {"column": 17, "line": 17}}}}]}}, "range": {"end": {"column": 23, "line": 17}, "start": {"column": 16, "line": 17}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 17}, "start": {"column": 11, "line": 17}}}}, "range": {"end": {"column": 24, "line": 17}, "start": {"column": 11, "line": 17}}}], "stringLiteralExprs": [{"range": {"end": {"column": 23, "line": 17}, "start": {"column": 16, "line": 17}}, "segments": [{"stringSegment": {"content": "ARKit", "range": {"end": {"column": 22, "line": 17}, "start": {"column": 17, "line": 17}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 16, "line": 18}, "start": {"column": 11, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 18}, "start": {"column": 17, "line": 18}}, "segments": [{"stringSegment": {"content": "World Detection", "range": {"end": {"column": 33, "line": 18}, "start": {"column": 18, "line": 18}}}}]}}, "range": {"end": {"column": 35, "line": 18}, "start": {"column": 17, "line": 18}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 56, "line": 18}, "start": {"column": 49, "line": 18}}, "segments": [{"stringSegment": {"content": "arkit", "range": {"end": {"column": 55, "line": 18}, "start": {"column": 50, "line": 18}}}}]}}, "label": "systemImage", "range": {"end": {"column": 56, "line": 18}, "start": {"column": 36, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 16, "line": 18}, "start": {"column": 11, "line": 18}}}}, "range": {"end": {"column": 57, "line": 18}, "start": {"column": 11, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 18}, "start": {"column": 17, "line": 18}}, "segments": [{"stringSegment": {"content": "World Detection", "range": {"end": {"column": 33, "line": 18}, "start": {"column": 18, "line": 18}}}}]}, {"range": {"end": {"column": 56, "line": 18}, "start": {"column": 49, "line": 18}}, "segments": [{"stringSegment": {"content": "arkit", "range": {"end": {"column": 55, "line": 18}, "start": {"column": 50, "line": 18}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 19}, "start": {"column": 11, "line": 19}}}, {"baseName": "startTracking", "range": {"end": {"column": 51, "line": 19}, "start": {"column": 38, "line": 19}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 19}, "start": {"column": 18, "line": 19}}, "segments": [{"stringSegment": {"content": "Tracking", "range": {"end": {"column": 27, "line": 19}, "start": {"column": 19, "line": 19}}}}]}}, "range": {"end": {"column": 29, "line": 19}, "start": {"column": 18, "line": 19}}}, {"expression": {"declReferenceExpr": {"baseName": "startTracking", "range": {"end": {"column": 51, "line": 19}, "start": {"column": 38, "line": 19}}}}, "label": "action", "range": {"end": {"column": 51, "line": 19}, "start": {"column": 30, "line": 19}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 19}, "start": {"column": 11, "line": 19}}}}, "range": {"end": {"column": 52, "line": 19}, "start": {"column": 11, "line": 19}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 19}, "start": {"column": 18, "line": 19}}, "segments": [{"stringSegment": {"content": "Tracking", "range": {"end": {"column": 27, "line": 19}, "start": {"column": 19, "line": 19}}}}]}]},
  {"declReferenceExprs": [{"baseName": "help", "range": {"end": {"column": 15, "line": 20}, "start": {"column": 11, "line": 20}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 32, "line": 20}, "start": {"column": 16, "line": 20}}, "segments": [{"stringSegment": {"content": "World tracking", "range": {"end": {"column": 31, "line": 20}, "start": {"column": 17, "line": 20}}}}]}}, "range": {"end": {"column": 32, "line": 20}, "start": {"column": 16, "line": 20}}}], "calledExpression": {"declReferenceExpr": {"baseName": "help", "range": {"end": {"column": 15, "line": 20}, "start": {"column": 11, "line": 20}}}}, "range": {"end": {"column": 33, "line": 20}, "start": {"column": 11, "line": 20}}}], "stringLiteralExprs": [{"range": {"end": {"column": 32, "line": 20}, "start": {"column": 16, "line": 20}}, "segments": [{"stringSegment": {"content": "World tracking", "range": {"end": {"column": 31, "line": 20}, "start": {"column": 17, "line": 20}}}}]}]},
]

# Parser output for `TextField("Tracking", text: $tracking)` at 29:9.
warns_for_text_field_exact_technical_ar_term_node := {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 18, "line": 29}, "start": {"column": 9, "line": 29}}}, {"baseName": "$tracking", "range": {"end": {"column": 46, "line": 29}, "start": {"column": 37, "line": 29}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 29, "line": 29}, "start": {"column": 19, "line": 29}}, "segments": [{"stringSegment": {"content": "Tracking", "range": {"end": {"column": 28, "line": 29}, "start": {"column": 20, "line": 29}}}}]}}, "range": {"end": {"column": 30, "line": 29}, "start": {"column": 19, "line": 29}}}, {"expression": {"declReferenceExpr": {"baseName": "$tracking", "range": {"end": {"column": 46, "line": 29}, "start": {"column": 37, "line": 29}}}}, "label": "text", "range": {"end": {"column": 46, "line": 29}, "start": {"column": 31, "line": 29}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 18, "line": 29}, "start": {"column": 9, "line": 29}}}}, "range": {"end": {"column": 47, "line": 29}, "start": {"column": 9, "line": 29}}}], "stringLiteralExprs": [{"range": {"end": {"column": 29, "line": 29}, "start": {"column": 19, "line": 29}}, "segments": [{"stringSegment": {"content": "Tracking", "range": {"end": {"column": 28, "line": 29}, "start": {"column": 20, "line": 29}}}}]}]}

# Parser output for `Text("Move your device to find a surface")` at 24:11.
does_not_warn_for_approachable_ar_instructional_text_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 11, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 52, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Move your device to find a surface", "range": {"end": {"column": 51, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 52, "line": 24}, "start": {"column": 16, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 11, "line": 24}}}}, "range": {"end": {"column": 53, "line": 24}, "start": {"column": 11, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 52, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Move your device to find a surface", "range": {"end": {"column": 51, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]}

# Parser output for `Text("Use ARKit to scan the room")` at 31:11.
# Parser output for `Text("world detection")` at 32:11.
warns_for_substring_and_case_different_terms_nodes := [
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 31}, "start": {"column": 11, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 44, "line": 31}, "start": {"column": 16, "line": 31}}, "segments": [{"stringSegment": {"content": "Use ARKit to scan the room", "range": {"end": {"column": 43, "line": 31}, "start": {"column": 17, "line": 31}}}}]}}, "range": {"end": {"column": 44, "line": 31}, "start": {"column": 16, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 31}, "start": {"column": 11, "line": 31}}}}, "range": {"end": {"column": 45, "line": 31}, "start": {"column": 11, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 44, "line": 31}, "start": {"column": 16, "line": 31}}, "segments": [{"stringSegment": {"content": "Use ARKit to scan the room", "range": {"end": {"column": 43, "line": 31}, "start": {"column": 17, "line": 31}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 32}, "start": {"column": 11, "line": 32}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 32}, "start": {"column": 16, "line": 32}}, "segments": [{"stringSegment": {"content": "world detection", "range": {"end": {"column": 32, "line": 32}, "start": {"column": 17, "line": 32}}}}]}}, "range": {"end": {"column": 33, "line": 32}, "start": {"column": 16, "line": 32}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 32}, "start": {"column": 11, "line": 32}}}}, "range": {"end": {"column": 34, "line": 32}, "start": {"column": 11, "line": 32}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 32}, "start": {"column": 16, "line": 32}}, "segments": [{"stringSegment": {"content": "world detection", "range": {"end": {"column": 32, "line": 32}, "start": {"column": 17, "line": 32}}}}]}]},
]

# Parser output for `logEvent(name: "ARKit")` at 12:5.
does_not_warn_for_exact_term_on_non_visible_call_node := {"declReferenceExprs": [{"baseName": "logEvent", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 5, "line": 12}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 27, "line": 12}, "start": {"column": 20, "line": 12}}, "segments": [{"stringSegment": {"content": "ARKit", "range": {"end": {"column": 26, "line": 12}, "start": {"column": 21, "line": 12}}}}]}}, "label": "name", "range": {"end": {"column": 27, "line": 12}, "start": {"column": 14, "line": 12}}}], "calledExpression": {"declReferenceExpr": {"baseName": "logEvent", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 5, "line": 12}}}}, "range": {"end": {"column": 28, "line": 12}, "start": {"column": 5, "line": 12}}}], "stringLiteralExprs": [{"range": {"end": {"column": 27, "line": 12}, "start": {"column": 20, "line": 12}}, "segments": [{"stringSegment": {"content": "ARKit", "range": {"end": {"column": 26, "line": 12}, "start": {"column": 21, "line": 12}}}}]}]}
