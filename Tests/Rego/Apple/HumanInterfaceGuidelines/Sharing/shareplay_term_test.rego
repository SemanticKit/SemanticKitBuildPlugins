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
warns_for_shareplaying_text_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 39}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 13}, "end": {"line": 22, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 38}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 38}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 38}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 37}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 37}}, "token": {"kind": "stringSegment", "text": "Start SharePlaying now"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 37}, "end": {"line": 22, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 38}, "end": {"line": 22, "column": 39}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 39}, "end": {"line": 22, "column": 39}}, "children": []},
]}

# Parser output for `Button("Share-play", action: startActivity)` at 25:9.
# Parser output for `Label("SharePlay session", systemImage: "shareplay")` at 26:9.
# Parser output for `Text("Share play with friends")` at 27:9.
warns_for_modified_shareplay_variants_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 52}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 51}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 17}, "end": {"line": 25, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 17}, "end": {"line": 25, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 17}, "end": {"line": 25, "column": 27}}, "token": {"kind": "stringSegment", "text": "Share-play"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 27}, "end": {"line": 25, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 30}, "end": {"line": 25, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 30}, "end": {"line": 25, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 36}, "end": {"line": 25, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 38}, "end": {"line": 25, "column": 51}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 38}, "end": {"line": 25, "column": 51}}, "token": {"kind": "identifier", "text": "startActivity"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 51}, "end": {"line": 25, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 25, "column": 52}, "end": {"line": 25, "column": 52}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 61}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 14}, "end": {"line": 26, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 60}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 35}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 34}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 15}, "end": {"line": 26, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 26, "column": 16}, "end": {"line": 26, "column": 33}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 26, "column": 16}, "end": {"line": 26, "column": 33}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 16}, "end": {"line": 26, "column": 33}}, "token": {"kind": "stringSegment", "text": "SharePlay session"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 33}, "end": {"line": 26, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 34}, "end": {"line": 26, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 36}, "end": {"line": 26, "column": 60}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 36}, "end": {"line": 26, "column": 47}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 47}, "end": {"line": 26, "column": 48}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 26, "column": 49}, "end": {"line": 26, "column": 60}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 49}, "end": {"line": 26, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 26, "column": 50}, "end": {"line": 26, "column": 59}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 26, "column": 50}, "end": {"line": 26, "column": 59}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 50}, "end": {"line": 26, "column": 59}}, "token": {"kind": "stringSegment", "text": "shareplay"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 59}, "end": {"line": 26, "column": 60}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 60}, "end": {"line": 26, "column": 61}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 26, "column": 61}, "end": {"line": 26, "column": 61}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 40}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 39}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 39}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 38}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 38}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 38}}, "token": {"kind": "stringSegment", "text": "Share play with friends"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 38}, "end": {"line": 27, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 39}, "end": {"line": 27, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 40}, "end": {"line": 27, "column": 40}}, "children": []},
  ]},
]

# Parser output for `Text("Start SharePlay")` at 36:9.
does_not_warn_for_normal_shareplay_text_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 32}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 14}, "end": {"line": 36, "column": 31}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 14}, "end": {"line": 36, "column": 31}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 14}, "end": {"line": 36, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 14}, "end": {"line": 36, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 30}}, "token": {"kind": "stringSegment", "text": "Start SharePlay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 30}, "end": {"line": 36, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 31}, "end": {"line": 36, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 32}, "end": {"line": 36, "column": 32}}, "children": []},
]}

# Parser output for `ActivityMetadata("shareplaying")` at 44:11.
does_not_warn_for_non_visible_shareplay_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 43}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 27}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 27}}, "token": {"kind": "identifier", "text": "ActivityMetadata"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 27}, "end": {"line": 44, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 42}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 42}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 29}, "end": {"line": 44, "column": 41}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 29}, "end": {"line": 44, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 29}, "end": {"line": 44, "column": 41}}, "token": {"kind": "stringSegment", "text": "shareplaying"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 41}, "end": {"line": 44, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 42}, "end": {"line": 44, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 43}}, "children": []},
]}
