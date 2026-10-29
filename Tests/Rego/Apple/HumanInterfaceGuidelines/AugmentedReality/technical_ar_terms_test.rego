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
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 24}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 15}, "end": {"line": 17, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 23}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 23}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 23}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 17, "column": 17}, "end": {"line": 17, "column": 22}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 17, "column": 17}, "end": {"line": 17, "column": 22}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 17}, "end": {"line": 17, "column": 22}}, "token": {"kind": "stringSegment", "text": "ARKit"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 22}, "end": {"line": 17, "column": 23}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 23}, "end": {"line": 17, "column": 24}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 17, "column": 24}, "end": {"line": 17, "column": 24}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 57}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 16}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 56}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 35}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 34}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 33}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 33}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringSegment", "text": "World Detection"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 47}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 48}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 49}, "end": {"line": 18, "column": 56}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 49}, "end": {"line": 18, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 55}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 55}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 55}}, "token": {"kind": "stringSegment", "text": "arkit"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 55}, "end": {"line": 18, "column": 56}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 56}, "end": {"line": 18, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 57}, "end": {"line": 18, "column": 57}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 52}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 17}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 11}, "end": {"line": 19, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 17}, "end": {"line": 19, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 51}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 18}, "end": {"line": 19, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 19, "column": 19}, "end": {"line": 19, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 19, "column": 19}, "end": {"line": 19, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 19}, "end": {"line": 19, "column": 27}}, "token": {"kind": "stringSegment", "text": "Tracking"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 27}, "end": {"line": 19, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 28}, "end": {"line": 19, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 30}, "end": {"line": 19, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 30}, "end": {"line": 19, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 36}, "end": {"line": 19, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 38}, "end": {"line": 19, "column": 51}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 38}, "end": {"line": 19, "column": 51}}, "token": {"kind": "identifier", "text": "startTracking"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 51}, "end": {"line": 19, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 19, "column": 52}, "end": {"line": 19, "column": 52}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 11}, "end": {"line": 20, "column": 15}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 15}, "end": {"line": 20, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 16}, "end": {"line": 20, "column": 32}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 16}, "end": {"line": 20, "column": 32}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 20, "column": 16}, "end": {"line": 20, "column": 32}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 16}, "end": {"line": 20, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 20, "column": 17}, "end": {"line": 20, "column": 31}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 17}, "end": {"line": 20, "column": 31}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 17}, "end": {"line": 20, "column": 31}}, "token": {"kind": "stringSegment", "text": "World tracking"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 31}, "end": {"line": 20, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 32}, "end": {"line": 20, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 20, "column": 33}, "end": {"line": 20, "column": 33}}, "children": []},
  ]},
]

# Parser output for `TextField("Tracking", text: $tracking)` at 29:9.
warns_for_text_field_exact_technical_ar_term_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 18}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 18}, "end": {"line": 29, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 29, "column": 19}, "end": {"line": 29, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 29, "column": 19}, "end": {"line": 29, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 29, "column": 19}, "end": {"line": 29, "column": 29}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 19}, "end": {"line": 29, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 29, "column": 20}, "end": {"line": 29, "column": 28}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 29, "column": 20}, "end": {"line": 29, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 20}, "end": {"line": 29, "column": 28}}, "token": {"kind": "stringSegment", "text": "Tracking"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 28}, "end": {"line": 29, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 29}, "end": {"line": 29, "column": 30}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 29, "column": 31}, "end": {"line": 29, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 31}, "end": {"line": 29, "column": 35}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 35}, "end": {"line": 29, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 29, "column": 37}, "end": {"line": 29, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 37}, "end": {"line": 29, "column": 46}}, "token": {"kind": "identifier", "text": "$tracking"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 46}, "end": {"line": 29, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 29, "column": 47}, "end": {"line": 29, "column": 47}}, "children": []},
]}

# Parser output for `Text("Move your device to find a surface")` at 24:11.
does_not_warn_for_approachable_ar_instructional_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 11}, "end": {"line": 24, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 11}, "end": {"line": 24, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 11}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 52}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 51}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 51}}, "token": {"kind": "stringSegment", "text": "Move your device to find a surface"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 51}, "end": {"line": 24, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 53}, "end": {"line": 24, "column": 53}}, "children": []},
]}

# Parser output for `Text("Use ARKit to scan the room")` at 31:11.
# Parser output for `Text("world detection")` at 32:11.
warns_for_substring_and_case_different_terms_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 11}, "end": {"line": 31, "column": 45}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 11}, "end": {"line": 31, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 11}, "end": {"line": 31, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 44}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 44}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 44}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 43}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 43}}, "token": {"kind": "stringSegment", "text": "Use ARKit to scan the room"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 43}, "end": {"line": 31, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 45}, "end": {"line": 31, "column": 45}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 32, "column": 11}, "end": {"line": 32, "column": 34}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 11}, "end": {"line": 32, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 11}, "end": {"line": 32, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 15}, "end": {"line": 32, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 33}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 33}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 33}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 32}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 32}}, "token": {"kind": "stringSegment", "text": "world detection"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 32}, "end": {"line": 32, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 33}, "end": {"line": 32, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 32, "column": 34}, "end": {"line": 32, "column": 34}}, "children": []},
  ]},
]

# Parser output for `logEvent(name: "ARKit")` at 12:5.
does_not_warn_for_exact_term_on_non_visible_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 28}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 13}}, "token": {"kind": "identifier", "text": "logEvent"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 27}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 18}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 18}, "end": {"line": 12, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 12, "column": 21}, "end": {"line": 12, "column": 26}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 12, "column": 21}, "end": {"line": 12, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 21}, "end": {"line": 12, "column": 26}}, "token": {"kind": "stringSegment", "text": "ARKit"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 27}, "end": {"line": 12, "column": 28}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 28}, "end": {"line": 12, "column": 28}}, "children": []},
]}
