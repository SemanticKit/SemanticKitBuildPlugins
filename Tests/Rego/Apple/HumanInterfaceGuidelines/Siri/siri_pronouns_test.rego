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
warns_for_text_with_siri_pronoun_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 45}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 17}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 44}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 43}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 43}}, "token": {"kind": "stringSegment", "text": "Ask Siri what she can do"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 45}}, "children": []},
]}

# Parser output for `Label("Siri will remind her", systemImage: "bell")` at 31:9.
# Parser output for `Button("Ask SIRI about HIM", action: ask)` at 32:9.
# Parser output for `TextField("Ask Siri what she can do", text: $question)` at 33:9.
# Parser output for `help("Siri will remind her")` at 34:10.
warns_for_visible_string_call_names_with_siri_pronoun_copy_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 59}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 14}, "end": {"line": 31, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 58}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 38}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 37}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 36}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 36}}, "token": {"kind": "stringSegment", "text": "Siri will remind her"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 39}, "end": {"line": 31, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 39}, "end": {"line": 31, "column": 50}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 50}, "end": {"line": 31, "column": 51}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 52}, "end": {"line": 31, "column": 58}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 52}, "end": {"line": 31, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 53}, "end": {"line": 31, "column": 57}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 53}, "end": {"line": 31, "column": 57}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 53}, "end": {"line": 31, "column": 57}}, "token": {"kind": "stringSegment", "text": "bell"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 57}, "end": {"line": 31, "column": 58}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 58}, "end": {"line": 31, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 59}, "end": {"line": 31, "column": 59}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 50}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 15}, "end": {"line": 32, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 49}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 37}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 16}, "end": {"line": 32, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 35}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 35}}, "token": {"kind": "stringSegment", "text": "Ask SIRI about HIM"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 35}, "end": {"line": 32, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 36}, "end": {"line": 32, "column": 37}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 32, "column": 38}, "end": {"line": 32, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 38}, "end": {"line": 32, "column": 44}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 44}, "end": {"line": 32, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 46}, "end": {"line": 32, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 46}, "end": {"line": 32, "column": 49}}, "token": {"kind": "identifier", "text": "ask"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 49}, "end": {"line": 32, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 32, "column": 50}, "end": {"line": 32, "column": 50}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 63}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 18}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 18}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 62}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 46}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 45}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 33, "column": 20}, "end": {"line": 33, "column": 44}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 33, "column": 20}, "end": {"line": 33, "column": 44}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 20}, "end": {"line": 33, "column": 44}}, "token": {"kind": "stringSegment", "text": "Ask Siri what she can do"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 44}, "end": {"line": 33, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 45}, "end": {"line": 33, "column": 46}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 47}, "end": {"line": 33, "column": 62}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 47}, "end": {"line": 33, "column": 51}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 51}, "end": {"line": 33, "column": 52}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 53}, "end": {"line": 33, "column": 62}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 53}, "end": {"line": 33, "column": 62}}, "token": {"kind": "identifier", "text": "$question"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 62}, "end": {"line": 33, "column": 63}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 63}, "end": {"line": 33, "column": 63}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 10}, "end": {"line": 34, "column": 38}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 10}, "end": {"line": 34, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 10}, "end": {"line": 34, "column": 14}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 37}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 37}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 37}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 36}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 36}}, "token": {"kind": "stringSegment", "text": "Siri will remind her"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 37}, "end": {"line": 34, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 38}, "end": {"line": 34, "column": 38}}, "children": []},
  ]},
]

# Parser output for `Text("Ask Siri what Siri can do")` at 42:13.
does_not_warn_for_supported_call_with_siri_named_directly_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 46}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 17}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 45}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 45}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 45}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 44}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 44}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 44}}, "token": {"kind": "stringSegment", "text": "Ask Siri what Siri can do"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 45}, "end": {"line": 42, "column": 46}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 46}, "end": {"line": 42, "column": 46}}, "children": []},
]}

# Parser output for `Image("Ask Siri to help him")` at 48:9.
does_not_warn_for_unsupported_call_with_siri_pronoun_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 9}, "end": {"line": 48, "column": 14}}, "token": {"kind": "identifier", "text": "Image"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 14}, "end": {"line": 48, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 37}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 15}, "end": {"line": 48, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 36}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 36}}, "token": {"kind": "stringSegment", "text": "Ask Siri to help him"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 36}, "end": {"line": 48, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 37}, "end": {"line": 48, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 48, "column": 38}, "end": {"line": 48, "column": 38}}, "children": []},
]}

# Parser output for `Text("Ask Siri what she can do today")` at 56:13.
warns_for_non_exact_siri_pronoun_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 56, "column": 13}, "end": {"line": 56, "column": 51}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 56, "column": 13}, "end": {"line": 56, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 13}, "end": {"line": 56, "column": 17}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 17}, "end": {"line": 56, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 56, "column": 18}, "end": {"line": 56, "column": 50}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 56, "column": 18}, "end": {"line": 56, "column": 50}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 56, "column": 18}, "end": {"line": 56, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 18}, "end": {"line": 56, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 56, "column": 19}, "end": {"line": 56, "column": 49}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 56, "column": 19}, "end": {"line": 56, "column": 49}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 19}, "end": {"line": 56, "column": 49}}, "token": {"kind": "stringSegment", "text": "Ask Siri what she can do today"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 49}, "end": {"line": 56, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 56, "column": 50}, "end": {"line": 56, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 56, "column": 51}, "end": {"line": 56, "column": 51}}, "children": []},
]}
