package apple.hig.writing.click_here_label

test_warns_for_click_here_button_label_swift_syntax if {
  result := decision with input as warns_for_click_here_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
  result.warn[0].message == "Review visible string literal containing Click here; use action-oriented button or link label copy."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_click_here_link_label_swift_syntax if {
  result := decision with input as warns_for_click_here_link_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
}

test_does_not_warn_for_action_oriented_visible_label_swift_syntax if {
  result := {"warn": [warning |
    node := does_not_warn_for_action_oriented_visible_label_swift_syntax_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_text_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_text_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_label_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_label_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Click here", action: learnMore)` at 18:9.
warns_for_click_here_button_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 48}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 47}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 29}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 27}}, "token": {"kind": "stringSegment", "text": "Click here"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 47}}, "token": {"kind": "identifier", "text": "learnMore"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 48}}, "children": []},
]}

# Parser output for `Link("Click here to learn more", destination: helpURL)` at 27:11.
warns_for_click_here_link_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 65}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 11}, "end": {"line": 27, "column": 15}}, "token": {"kind": "identifier", "text": "Link"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 64}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 43}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 16}, "end": {"line": 27, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 17}, "end": {"line": 27, "column": 41}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 17}, "end": {"line": 27, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 17}, "end": {"line": 27, "column": 41}}, "token": {"kind": "stringSegment", "text": "Click here to learn more"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 41}, "end": {"line": 27, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 42}, "end": {"line": 27, "column": 43}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 44}, "end": {"line": 27, "column": 64}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 44}, "end": {"line": 27, "column": 55}}, "token": {"kind": "identifier", "text": "destination"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 55}, "end": {"line": 27, "column": 56}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 57}, "end": {"line": 27, "column": 64}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 57}, "end": {"line": 27, "column": 64}}, "token": {"kind": "identifier", "text": "helpURL"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 64}, "end": {"line": 27, "column": 65}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 65}, "end": {"line": 27, "column": 65}}, "children": []},
]}

# Parser output for `Button("Learn More", action: learnMore)` at 34:9.
# Parser output for `Link("View Details", destination: detailsURL)` at 35:9.
does_not_warn_for_action_oriented_visible_label_swift_syntax_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 48}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 9}, "end": {"line": 34, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 47}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 17}, "end": {"line": 34, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 17}, "end": {"line": 34, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 17}, "end": {"line": 34, "column": 27}}, "token": {"kind": "stringSegment", "text": "Learn More"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 27}, "end": {"line": 34, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 28}, "end": {"line": 34, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 30}, "end": {"line": 34, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 30}, "end": {"line": 34, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 38}, "end": {"line": 34, "column": 47}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 38}, "end": {"line": 34, "column": 47}}, "token": {"kind": "identifier", "text": "learnMore"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 47}, "end": {"line": 34, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 48}, "end": {"line": 34, "column": 48}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 35, "column": 9}, "end": {"line": 35, "column": 54}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 9}, "end": {"line": 35, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 9}, "end": {"line": 35, "column": 13}}, "token": {"kind": "identifier", "text": "Link"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 35, "column": 14}, "end": {"line": 35, "column": 53}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 14}, "end": {"line": 35, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 35, "column": 14}, "end": {"line": 35, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 14}, "end": {"line": 35, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 35, "column": 15}, "end": {"line": 35, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 35, "column": 15}, "end": {"line": 35, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 15}, "end": {"line": 35, "column": 27}}, "token": {"kind": "stringSegment", "text": "View Details"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 27}, "end": {"line": 35, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 28}, "end": {"line": 35, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 30}, "end": {"line": 35, "column": 53}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 30}, "end": {"line": 35, "column": 41}}, "token": {"kind": "identifier", "text": "destination"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 41}, "end": {"line": 35, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 43}, "end": {"line": 35, "column": 53}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 43}, "end": {"line": 35, "column": 53}}, "token": {"kind": "identifier", "text": "detailsURL"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 53}, "end": {"line": 35, "column": 54}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 35, "column": 54}, "end": {"line": 35, "column": 54}}, "children": []},
  ]},
]

# Parser output for `URL(string: "https://example.com/click here")` at 42:14.
does_not_warn_for_non_visible_click_here_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 17}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 58}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 24}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 25}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 26}, "end": {"line": 42, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 26}, "end": {"line": 42, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 57}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 57}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 57}}, "token": {"kind": "stringSegment", "text": "https://example.com/click here"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 58}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 59}}, "children": []},
]}

# Parser output for `Text("Click here")` at 51:9.
does_not_warn_for_text_click_here_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 27}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 13}, "end": {"line": 51, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 26}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 26}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 25}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 25}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 25}}, "token": {"kind": "stringSegment", "text": "Click here"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 25}, "end": {"line": 51, "column": 26}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 26}, "end": {"line": 51, "column": 27}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 51, "column": 27}, "end": {"line": 51, "column": 27}}, "children": []},
]}

# Parser output for `Label("Click here", systemImage: "info.circle")` at 59:9.
does_not_warn_for_label_click_here_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 59, "column": 9}, "end": {"line": 59, "column": 56}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 59, "column": 9}, "end": {"line": 59, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 9}, "end": {"line": 59, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 14}, "end": {"line": 59, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 59, "column": 15}, "end": {"line": 59, "column": 55}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 59, "column": 15}, "end": {"line": 59, "column": 28}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 59, "column": 15}, "end": {"line": 59, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 15}, "end": {"line": 59, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 59, "column": 16}, "end": {"line": 59, "column": 26}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 59, "column": 16}, "end": {"line": 59, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 16}, "end": {"line": 59, "column": 26}}, "token": {"kind": "stringSegment", "text": "Click here"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 26}, "end": {"line": 59, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 27}, "end": {"line": 59, "column": 28}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 59, "column": 29}, "end": {"line": 59, "column": 55}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 29}, "end": {"line": 59, "column": 40}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 40}, "end": {"line": 59, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 59, "column": 42}, "end": {"line": 59, "column": 55}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 42}, "end": {"line": 59, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 59, "column": 43}, "end": {"line": 59, "column": 54}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 59, "column": 43}, "end": {"line": 59, "column": 54}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 43}, "end": {"line": 59, "column": 54}}, "token": {"kind": "stringSegment", "text": "info.circle"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 54}, "end": {"line": 59, "column": 55}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 59, "column": 55}, "end": {"line": 59, "column": 56}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 59, "column": 56}, "end": {"line": 59, "column": 56}}, "children": []},
]}
