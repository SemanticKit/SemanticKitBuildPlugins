package apple.hig.siri.siri_pronouns

test_warns_for_text_with_siri_pronoun_copy if {
  result := decision with input as warns_for_text_with_siri_pronoun_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_siri_pronoun_copy"
  result.warn[0].message == "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her."
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_names_with_siri_pronoun_copy if {
  result := {"warn": [warning |
    node := warns_for_visible_string_call_names_with_siri_pronoun_copy_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 4
}

test_does_not_warn_for_supported_call_with_siri_named_directly if {
  result := decision with input as does_not_warn_for_supported_call_with_siri_named_directly_node

  count(result.warn) == 0
}

test_does_not_warn_for_unsupported_call_with_siri_pronoun_copy if {
  result := decision with input as does_not_warn_for_unsupported_call_with_siri_pronoun_copy_node

  count(result.warn) == 0
}

test_warns_for_non_exact_siri_pronoun_copy if {
  result := decision with input as warns_for_non_exact_siri_pronoun_copy_node

  count(result.warn) == 1
}

# Parser output for `Text("Ask Siri what she can do")` at 24:13.
warns_for_text_with_siri_pronoun_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 17, "line": 24}, "start": {"column": 13, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 44, "line": 24}, "start": {"column": 18, "line": 24}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do", "range": {"end": {"column": 43, "line": 24}, "start": {"column": 19, "line": 24}}}}]}}, "range": {"end": {"column": 44, "line": 24}, "start": {"column": 18, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 17, "line": 24}, "start": {"column": 13, "line": 24}}}}, "range": {"end": {"column": 45, "line": 24}, "start": {"column": 13, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 44, "line": 24}, "start": {"column": 18, "line": 24}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do", "range": {"end": {"column": 43, "line": 24}, "start": {"column": 19, "line": 24}}}}]}]}

# Parser output for `Label("Siri will remind her", systemImage: "bell")` at 31:9.
# Parser output for `Button("Ask SIRI about HIM", action: ask)` at 32:9.
# Parser output for `TextField("Ask Siri what she can do", text: $question)` at 33:9.
# Parser output for `help("Siri will remind her")` at 34:10.
warns_for_visible_string_call_names_with_siri_pronoun_copy_nodes := [
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 31}, "start": {"column": 9, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 31}, "start": {"column": 15, "line": 31}}, "segments": [{"stringSegment": {"content": "Siri will remind her", "range": {"end": {"column": 36, "line": 31}, "start": {"column": 16, "line": 31}}}}]}}, "range": {"end": {"column": 38, "line": 31}, "start": {"column": 15, "line": 31}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 58, "line": 31}, "start": {"column": 52, "line": 31}}, "segments": [{"stringSegment": {"content": "bell", "range": {"end": {"column": 57, "line": 31}, "start": {"column": 53, "line": 31}}}}]}}, "label": "systemImage", "range": {"end": {"column": 58, "line": 31}, "start": {"column": 39, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 59, "line": 31}, "start": {"column": 9, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 31}, "start": {"column": 15, "line": 31}}, "segments": [{"stringSegment": {"content": "Siri will remind her", "range": {"end": {"column": 36, "line": 31}, "start": {"column": 16, "line": 31}}}}]}, {"range": {"end": {"column": 58, "line": 31}, "start": {"column": 52, "line": 31}}, "segments": [{"stringSegment": {"content": "bell", "range": {"end": {"column": 57, "line": 31}, "start": {"column": 53, "line": 31}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 32}, "start": {"column": 9, "line": 32}}}, {"baseName": "ask", "range": {"end": {"column": 49, "line": 32}, "start": {"column": 46, "line": 32}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 32}, "start": {"column": 16, "line": 32}}, "segments": [{"stringSegment": {"content": "Ask SIRI about HIM", "range": {"end": {"column": 35, "line": 32}, "start": {"column": 17, "line": 32}}}}]}}, "range": {"end": {"column": 37, "line": 32}, "start": {"column": 16, "line": 32}}}, {"expression": {"declReferenceExpr": {"baseName": "ask", "range": {"end": {"column": 49, "line": 32}, "start": {"column": 46, "line": 32}}}}, "label": "action", "range": {"end": {"column": 49, "line": 32}, "start": {"column": 38, "line": 32}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 32}, "start": {"column": 9, "line": 32}}}}, "range": {"end": {"column": 50, "line": 32}, "start": {"column": 9, "line": 32}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 32}, "start": {"column": 16, "line": 32}}, "segments": [{"stringSegment": {"content": "Ask SIRI about HIM", "range": {"end": {"column": 35, "line": 32}, "start": {"column": 17, "line": 32}}}}]}]},
  {"declReferenceExprs": [{"baseName": "TextField", "range": {"end": {"column": 18, "line": 33}, "start": {"column": 9, "line": 33}}}, {"baseName": "$question", "range": {"end": {"column": 62, "line": 33}, "start": {"column": 53, "line": 33}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 45, "line": 33}, "start": {"column": 19, "line": 33}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do", "range": {"end": {"column": 44, "line": 33}, "start": {"column": 20, "line": 33}}}}]}}, "range": {"end": {"column": 46, "line": 33}, "start": {"column": 19, "line": 33}}}, {"expression": {"declReferenceExpr": {"baseName": "$question", "range": {"end": {"column": 62, "line": 33}, "start": {"column": 53, "line": 33}}}}, "label": "text", "range": {"end": {"column": 62, "line": 33}, "start": {"column": 47, "line": 33}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TextField", "range": {"end": {"column": 18, "line": 33}, "start": {"column": 9, "line": 33}}}}, "range": {"end": {"column": 63, "line": 33}, "start": {"column": 9, "line": 33}}}], "stringLiteralExprs": [{"range": {"end": {"column": 45, "line": 33}, "start": {"column": 19, "line": 33}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do", "range": {"end": {"column": 44, "line": 33}, "start": {"column": 20, "line": 33}}}}]}]},
  {"declReferenceExprs": [{"baseName": "help", "range": {"end": {"column": 14, "line": 34}, "start": {"column": 10, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 34}, "start": {"column": 15, "line": 34}}, "segments": [{"stringSegment": {"content": "Siri will remind her", "range": {"end": {"column": 36, "line": 34}, "start": {"column": 16, "line": 34}}}}]}}, "range": {"end": {"column": 37, "line": 34}, "start": {"column": 15, "line": 34}}}], "calledExpression": {"declReferenceExpr": {"baseName": "help", "range": {"end": {"column": 14, "line": 34}, "start": {"column": 10, "line": 34}}}}, "range": {"end": {"column": 38, "line": 34}, "start": {"column": 10, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 34}, "start": {"column": 15, "line": 34}}, "segments": [{"stringSegment": {"content": "Siri will remind her", "range": {"end": {"column": 36, "line": 34}, "start": {"column": 16, "line": 34}}}}]}]},
]

# Parser output for `Text("Ask Siri what Siri can do")` at 42:13.
does_not_warn_for_supported_call_with_siri_named_directly_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 13, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 45, "line": 42}, "start": {"column": 18, "line": 42}}, "segments": [{"stringSegment": {"content": "Ask Siri what Siri can do", "range": {"end": {"column": 44, "line": 42}, "start": {"column": 19, "line": 42}}}}]}}, "range": {"end": {"column": 45, "line": 42}, "start": {"column": 18, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 13, "line": 42}}}}, "range": {"end": {"column": 46, "line": 42}, "start": {"column": 13, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 45, "line": 42}, "start": {"column": 18, "line": 42}}, "segments": [{"stringSegment": {"content": "Ask Siri what Siri can do", "range": {"end": {"column": 44, "line": 42}, "start": {"column": 19, "line": 42}}}}]}]}

# Parser output for `Image("Ask Siri to help him")` at 48:9.
does_not_warn_for_unsupported_call_with_siri_pronoun_copy_node := {"declReferenceExprs": [{"baseName": "Image", "range": {"end": {"column": 14, "line": 48}, "start": {"column": 9, "line": 48}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 48}, "start": {"column": 15, "line": 48}}, "segments": [{"stringSegment": {"content": "Ask Siri to help him", "range": {"end": {"column": 36, "line": 48}, "start": {"column": 16, "line": 48}}}}]}}, "range": {"end": {"column": 37, "line": 48}, "start": {"column": 15, "line": 48}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Image", "range": {"end": {"column": 14, "line": 48}, "start": {"column": 9, "line": 48}}}}, "range": {"end": {"column": 38, "line": 48}, "start": {"column": 9, "line": 48}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 48}, "start": {"column": 15, "line": 48}}, "segments": [{"stringSegment": {"content": "Ask Siri to help him", "range": {"end": {"column": 36, "line": 48}, "start": {"column": 16, "line": 48}}}}]}]}

# Parser output for `Text("Ask Siri what she can do today")` at 56:13.
warns_for_non_exact_siri_pronoun_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 17, "line": 56}, "start": {"column": 13, "line": 56}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 50, "line": 56}, "start": {"column": 18, "line": 56}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do today", "range": {"end": {"column": 49, "line": 56}, "start": {"column": 19, "line": 56}}}}]}}, "range": {"end": {"column": 50, "line": 56}, "start": {"column": 18, "line": 56}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 17, "line": 56}, "start": {"column": 13, "line": 56}}}}, "range": {"end": {"column": 51, "line": 56}, "start": {"column": 13, "line": 56}}}], "stringLiteralExprs": [{"range": {"end": {"column": 50, "line": 56}, "start": {"column": 18, "line": 56}}, "segments": [{"stringSegment": {"content": "Ask Siri what she can do today", "range": {"end": {"column": 49, "line": 56}, "start": {"column": 19, "line": 56}}}}]}]}
