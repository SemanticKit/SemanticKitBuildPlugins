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
warns_for_visible_nfc_technical_term_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 31}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "token": {"kind": "stringSegment", "text": "Start NFC scan"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 31}}, "children": []},
]}

# Parser output for `Text("Use Core NFC")` at 23:9.
# Parser output for `Button("Near-field communication scan", action: scan)` at 24:9.
# Parser output for `Label("Near field communication reader", systemImage: "wave.3.right")` at 25:9.
warns_for_visible_nfc_technical_term_variants_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 29}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 13}, "end": {"line": 23, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 28}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 28}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 27}}, "token": {"kind": "stringSegment", "text": "Use Core NFC"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 27}, "end": {"line": 23, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 28}, "end": {"line": 23, "column": 29}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 23, "column": 29}, "end": {"line": 23, "column": 29}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 62}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 61}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 48}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 47}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 46}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 46}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 46}}, "token": {"kind": "stringSegment", "text": "Near-field communication scan"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 46}, "end": {"line": 24, "column": 47}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 48}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 49}, "end": {"line": 24, "column": 61}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 49}, "end": {"line": 24, "column": 55}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 55}, "end": {"line": 24, "column": 56}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 57}, "end": {"line": 24, "column": 61}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 57}, "end": {"line": 24, "column": 61}}, "token": {"kind": "identifier", "text": "scan"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 61}, "end": {"line": 24, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 62}, "end": {"line": 24, "column": 62}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 78}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 14}, "end": {"line": 25, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 77}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 49}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 48}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 47}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 47}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 47}}, "token": {"kind": "stringSegment", "text": "Near field communication reader"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 47}, "end": {"line": 25, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 48}, "end": {"line": 25, "column": 49}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 50}, "end": {"line": 25, "column": 77}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 50}, "end": {"line": 25, "column": 61}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 61}, "end": {"line": 25, "column": 62}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 63}, "end": {"line": 25, "column": 77}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 63}, "end": {"line": 25, "column": 64}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 64}, "end": {"line": 25, "column": 76}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 64}, "end": {"line": 25, "column": 76}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 64}, "end": {"line": 25, "column": 76}}, "token": {"kind": "stringSegment", "text": "wave.3.right"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 76}, "end": {"line": 25, "column": 77}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 77}, "end": {"line": 25, "column": 78}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 25, "column": 78}, "end": {"line": 25, "column": 78}}, "children": []},
  ]},
]

# Parser output for `Label("Tap the NFC reader", systemImage: "wave.3.right")` at 27:9.
warns_for_contact_term_with_nfc_context_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 65}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 64}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 34}}, "token": {"kind": "stringSegment", "text": "Tap the NFC reader"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 34}, "end": {"line": 27, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 35}, "end": {"line": 27, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 37}, "end": {"line": 27, "column": 64}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 37}, "end": {"line": 27, "column": 48}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 48}, "end": {"line": 27, "column": 49}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 50}, "end": {"line": 27, "column": 64}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 50}, "end": {"line": 27, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 51}, "end": {"line": 27, "column": 63}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 51}, "end": {"line": 27, "column": 63}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 51}, "end": {"line": 27, "column": 63}}, "token": {"kind": "stringSegment", "text": "wave.3.right"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 63}, "end": {"line": 27, "column": 64}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 64}, "end": {"line": 27, "column": 65}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 65}, "end": {"line": 27, "column": 65}}, "children": []},
]}

# Parser output for `Button("Tag friends", action: tagFriends)` at 41:9.
# Parser output for `Text("Hashtag ideas")` at 42:9.
does_not_warn_for_unrelated_tag_copy_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 50}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 15}, "end": {"line": 41, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 41, "column": 16}, "end": {"line": 41, "column": 49}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 16}, "end": {"line": 41, "column": 30}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 41, "column": 16}, "end": {"line": 41, "column": 29}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 16}, "end": {"line": 41, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 41, "column": 17}, "end": {"line": 41, "column": 28}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 41, "column": 17}, "end": {"line": 41, "column": 28}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 17}, "end": {"line": 41, "column": 28}}, "token": {"kind": "stringSegment", "text": "Tag friends"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 28}, "end": {"line": 41, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 29}, "end": {"line": 41, "column": 30}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 31}, "end": {"line": 41, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 31}, "end": {"line": 41, "column": 37}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 37}, "end": {"line": 41, "column": 38}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 39}, "end": {"line": 41, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 39}, "end": {"line": 41, "column": 49}}, "token": {"kind": "identifier", "text": "tagFriends"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 49}, "end": {"line": 41, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 41, "column": 50}, "end": {"line": 41, "column": 50}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 9}, "end": {"line": 42, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 9}, "end": {"line": 42, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 9}, "end": {"line": 42, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 29}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 29}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 28}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 28}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 28}}, "token": {"kind": "stringSegment", "text": "Hashtag ideas"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 28}, "end": {"line": 42, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 30}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 30}, "end": {"line": 42, "column": 30}}, "children": []},
  ]},
]

# Parser output for `Label("Tap the reader", systemImage: "hand.tap")` at 47:9.
# Parser output for `Text("Touch the screen")` at 48:9.
does_not_warn_for_contact_terms_without_nfc_context_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 47, "column": 9}, "end": {"line": 47, "column": 57}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 47, "column": 9}, "end": {"line": 47, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 9}, "end": {"line": 47, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 14}, "end": {"line": 47, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 47, "column": 15}, "end": {"line": 47, "column": 56}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 15}, "end": {"line": 47, "column": 32}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 47, "column": 15}, "end": {"line": 47, "column": 31}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 15}, "end": {"line": 47, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 47, "column": 16}, "end": {"line": 47, "column": 30}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 47, "column": 16}, "end": {"line": 47, "column": 30}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 16}, "end": {"line": 47, "column": 30}}, "token": {"kind": "stringSegment", "text": "Tap the reader"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 30}, "end": {"line": 47, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 31}, "end": {"line": 47, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 33}, "end": {"line": 47, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 33}, "end": {"line": 47, "column": 44}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 44}, "end": {"line": 47, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 47, "column": 46}, "end": {"line": 47, "column": 56}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 46}, "end": {"line": 47, "column": 47}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 47, "column": 47}, "end": {"line": 47, "column": 55}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 47, "column": 47}, "end": {"line": 47, "column": 55}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 47}, "end": {"line": 47, "column": 55}}, "token": {"kind": "stringSegment", "text": "hand.tap"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 55}, "end": {"line": 47, "column": 56}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 56}, "end": {"line": 47, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 47, "column": 57}, "end": {"line": 47, "column": 57}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 13}, "end": {"line": 48, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 48, "column": 14}, "end": {"line": 48, "column": 32}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 48, "column": 14}, "end": {"line": 48, "column": 32}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 48, "column": 14}, "end": {"line": 48, "column": 32}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 14}, "end": {"line": 48, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 31}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 31}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 31}}, "token": {"kind": "stringSegment", "text": "Touch the screen"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 31}, "end": {"line": 48, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 32}, "end": {"line": 48, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 48, "column": 33}, "end": {"line": 48, "column": 33}}, "children": []},
  ]},
]

# Parser output for `Text("Hold near the pass")` at 34:9.
does_not_warn_for_preferred_nfc_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 35}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 13}, "end": {"line": 34, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 34}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 33}}, "token": {"kind": "stringSegment", "text": "Hold near the pass"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 33}, "end": {"line": 34, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 34}, "end": {"line": 34, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 35}, "end": {"line": 34, "column": 35}}, "children": []},
]}
