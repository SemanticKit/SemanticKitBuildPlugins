package apple.hig.nfc.nfc_terms

test_warns_for_visible_nfc_technical_term if {
  result := decision with input as warns_for_visible_nfc_technical_term_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.nfc.review_user_instruction_terms"
  result.warn[0].message == "Review visible NFC instruction copy; prefer scan or hold near and avoid technical or contact terms."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_visible_nfc_technical_term_variants if {
  result := {"warn": [warning |
    node := warns_for_visible_nfc_technical_term_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.nfc.review_user_instruction_terms"
}

test_warns_for_contact_term_with_nfc_context if {
  result := decision with input as warns_for_contact_term_with_nfc_context_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.nfc.review_user_instruction_terms"
}

test_does_not_warn_for_unrelated_tag_copy if {
  result := {"warn": [warning |
    node := does_not_warn_for_unrelated_tag_copy_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_contact_terms_without_nfc_context if {
  result := {"warn": [warning |
    node := does_not_warn_for_contact_terms_without_nfc_context_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_preferred_nfc_copy if {
  result := decision with input as does_not_warn_for_preferred_nfc_copy_node

  count(result.warn) == 0
}

# Parser output for `Text("Start NFC scan")` at 18:9.
warns_for_visible_nfc_technical_term_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Start NFC scan", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 15, "line": 18}}}}]}}, "range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 31, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 30, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Start NFC scan", "range": {"end": {"column": 29, "line": 18}, "start": {"column": 15, "line": 18}}}}]}]}

# Parser output for `Text("Use Core NFC")` at 23:9.
# Parser output for `Button("Near-field communication scan", action: scan)` at 24:9.
# Parser output for `Label("Near field communication reader", systemImage: "wave.3.right")` at 25:9.
warns_for_visible_nfc_technical_term_variants_nodes := [
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 23}, "start": {"column": 9, "line": 23}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 23}, "start": {"column": 14, "line": 23}}, "segments": [{"stringSegment": {"content": "Use Core NFC", "range": {"end": {"column": 27, "line": 23}, "start": {"column": 15, "line": 23}}}}]}}, "range": {"end": {"column": 28, "line": 23}, "start": {"column": 14, "line": 23}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 23}, "start": {"column": 9, "line": 23}}}}, "range": {"end": {"column": 29, "line": 23}, "start": {"column": 9, "line": 23}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 23}, "start": {"column": 14, "line": 23}}, "segments": [{"stringSegment": {"content": "Use Core NFC", "range": {"end": {"column": 27, "line": 23}, "start": {"column": 15, "line": 23}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "scan", "range": {"end": {"column": 61, "line": 24}, "start": {"column": 57, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 47, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Near-field communication scan", "range": {"end": {"column": 46, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 48, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "scan", "range": {"end": {"column": 61, "line": 24}, "start": {"column": 57, "line": 24}}}}, "label": "action", "range": {"end": {"column": 61, "line": 24}, "start": {"column": 49, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 62, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 47, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Near-field communication scan", "range": {"end": {"column": 46, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 48, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "Near field communication reader", "range": {"end": {"column": 47, "line": 25}, "start": {"column": 16, "line": 25}}}}]}}, "range": {"end": {"column": 49, "line": 25}, "start": {"column": 15, "line": 25}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 77, "line": 25}, "start": {"column": 63, "line": 25}}, "segments": [{"stringSegment": {"content": "wave.3.right", "range": {"end": {"column": 76, "line": 25}, "start": {"column": 64, "line": 25}}}}]}}, "label": "systemImage", "range": {"end": {"column": 77, "line": 25}, "start": {"column": 50, "line": 25}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}}, "range": {"end": {"column": 78, "line": 25}, "start": {"column": 9, "line": 25}}}], "stringLiteralExprs": [{"range": {"end": {"column": 48, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "Near field communication reader", "range": {"end": {"column": 47, "line": 25}, "start": {"column": 16, "line": 25}}}}]}, {"range": {"end": {"column": 77, "line": 25}, "start": {"column": 63, "line": 25}}, "segments": [{"stringSegment": {"content": "wave.3.right", "range": {"end": {"column": 76, "line": 25}, "start": {"column": 64, "line": 25}}}}]}]},
]

# Parser output for `Label("Tap the NFC reader", systemImage: "wave.3.right")` at 27:9.
warns_for_contact_term_with_nfc_context_node := {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 27}, "start": {"column": 9, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 27}, "start": {"column": 15, "line": 27}}, "segments": [{"stringSegment": {"content": "Tap the NFC reader", "range": {"end": {"column": 34, "line": 27}, "start": {"column": 16, "line": 27}}}}]}}, "range": {"end": {"column": 36, "line": 27}, "start": {"column": 15, "line": 27}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 64, "line": 27}, "start": {"column": 50, "line": 27}}, "segments": [{"stringSegment": {"content": "wave.3.right", "range": {"end": {"column": 63, "line": 27}, "start": {"column": 51, "line": 27}}}}]}}, "label": "systemImage", "range": {"end": {"column": 64, "line": 27}, "start": {"column": 37, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 27}, "start": {"column": 9, "line": 27}}}}, "range": {"end": {"column": 65, "line": 27}, "start": {"column": 9, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 27}, "start": {"column": 15, "line": 27}}, "segments": [{"stringSegment": {"content": "Tap the NFC reader", "range": {"end": {"column": 34, "line": 27}, "start": {"column": 16, "line": 27}}}}]}, {"range": {"end": {"column": 64, "line": 27}, "start": {"column": 50, "line": 27}}, "segments": [{"stringSegment": {"content": "wave.3.right", "range": {"end": {"column": 63, "line": 27}, "start": {"column": 51, "line": 27}}}}]}]}

# Parser output for `Button("Tag friends", action: tagFriends)` at 41:9.
# Parser output for `Text("Hashtag ideas")` at 42:9.
does_not_warn_for_unrelated_tag_copy_nodes := [
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 41}, "start": {"column": 9, "line": 41}}}, {"baseName": "tagFriends", "range": {"end": {"column": 49, "line": 41}, "start": {"column": 39, "line": 41}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 29, "line": 41}, "start": {"column": 16, "line": 41}}, "segments": [{"stringSegment": {"content": "Tag friends", "range": {"end": {"column": 28, "line": 41}, "start": {"column": 17, "line": 41}}}}]}}, "range": {"end": {"column": 30, "line": 41}, "start": {"column": 16, "line": 41}}}, {"expression": {"declReferenceExpr": {"baseName": "tagFriends", "range": {"end": {"column": 49, "line": 41}, "start": {"column": 39, "line": 41}}}}, "label": "action", "range": {"end": {"column": 49, "line": 41}, "start": {"column": 31, "line": 41}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 41}, "start": {"column": 9, "line": 41}}}}, "range": {"end": {"column": 50, "line": 41}, "start": {"column": 9, "line": 41}}}], "stringLiteralExprs": [{"range": {"end": {"column": 29, "line": 41}, "start": {"column": 16, "line": 41}}, "segments": [{"stringSegment": {"content": "Tag friends", "range": {"end": {"column": 28, "line": 41}, "start": {"column": 17, "line": 41}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 42}, "start": {"column": 9, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 29, "line": 42}, "start": {"column": 14, "line": 42}}, "segments": [{"stringSegment": {"content": "Hashtag ideas", "range": {"end": {"column": 28, "line": 42}, "start": {"column": 15, "line": 42}}}}]}}, "range": {"end": {"column": 29, "line": 42}, "start": {"column": 14, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 42}, "start": {"column": 9, "line": 42}}}}, "range": {"end": {"column": 30, "line": 42}, "start": {"column": 9, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 29, "line": 42}, "start": {"column": 14, "line": 42}}, "segments": [{"stringSegment": {"content": "Hashtag ideas", "range": {"end": {"column": 28, "line": 42}, "start": {"column": 15, "line": 42}}}}]}]},
]

# Parser output for `Label("Tap the reader", systemImage: "hand.tap")` at 47:9.
# Parser output for `Text("Touch the screen")` at 48:9.
does_not_warn_for_contact_terms_without_nfc_context_nodes := [
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 47}, "start": {"column": 9, "line": 47}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 31, "line": 47}, "start": {"column": 15, "line": 47}}, "segments": [{"stringSegment": {"content": "Tap the reader", "range": {"end": {"column": 30, "line": 47}, "start": {"column": 16, "line": 47}}}}]}}, "range": {"end": {"column": 32, "line": 47}, "start": {"column": 15, "line": 47}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 56, "line": 47}, "start": {"column": 46, "line": 47}}, "segments": [{"stringSegment": {"content": "hand.tap", "range": {"end": {"column": 55, "line": 47}, "start": {"column": 47, "line": 47}}}}]}}, "label": "systemImage", "range": {"end": {"column": 56, "line": 47}, "start": {"column": 33, "line": 47}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 47}, "start": {"column": 9, "line": 47}}}}, "range": {"end": {"column": 57, "line": 47}, "start": {"column": 9, "line": 47}}}], "stringLiteralExprs": [{"range": {"end": {"column": 31, "line": 47}, "start": {"column": 15, "line": 47}}, "segments": [{"stringSegment": {"content": "Tap the reader", "range": {"end": {"column": 30, "line": 47}, "start": {"column": 16, "line": 47}}}}]}, {"range": {"end": {"column": 56, "line": 47}, "start": {"column": 46, "line": 47}}, "segments": [{"stringSegment": {"content": "hand.tap", "range": {"end": {"column": 55, "line": 47}, "start": {"column": 47, "line": 47}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 48}, "start": {"column": 9, "line": 48}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 32, "line": 48}, "start": {"column": 14, "line": 48}}, "segments": [{"stringSegment": {"content": "Touch the screen", "range": {"end": {"column": 31, "line": 48}, "start": {"column": 15, "line": 48}}}}]}}, "range": {"end": {"column": 32, "line": 48}, "start": {"column": 14, "line": 48}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 48}, "start": {"column": 9, "line": 48}}}}, "range": {"end": {"column": 33, "line": 48}, "start": {"column": 9, "line": 48}}}], "stringLiteralExprs": [{"range": {"end": {"column": 32, "line": 48}, "start": {"column": 14, "line": 48}}, "segments": [{"stringSegment": {"content": "Touch the screen", "range": {"end": {"column": 31, "line": 48}, "start": {"column": 15, "line": 48}}}}]}]},
]

# Parser output for `Text("Hold near the pass")` at 34:9.
does_not_warn_for_preferred_nfc_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 34}, "start": {"column": 9, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 34}, "start": {"column": 14, "line": 34}}, "segments": [{"stringSegment": {"content": "Hold near the pass", "range": {"end": {"column": 33, "line": 34}, "start": {"column": 15, "line": 34}}}}]}}, "range": {"end": {"column": 34, "line": 34}, "start": {"column": 14, "line": 34}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 34}, "start": {"column": 9, "line": 34}}}}, "range": {"end": {"column": 35, "line": 34}, "start": {"column": 9, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 34}, "start": {"column": 14, "line": 34}}, "segments": [{"stringSegment": {"content": "Hold near the pass", "range": {"end": {"column": 33, "line": 34}, "start": {"column": 15, "line": 34}}}}]}]}
