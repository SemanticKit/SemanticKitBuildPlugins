package apple.hig.tap_to_pay.tap_to_pay_button_label

test_warns_for_nonstandard_tap_to_pay_button_label_swift_syntax if {
  result := decision with input as warns_for_nonstandard_tap_to_pay_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
  result.warn[0].line == 24
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_tap_to_pay_case_variant_swift_syntax if {
  result := decision with input as warns_for_tap_to_pay_case_variant_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
}

test_warns_for_apple_tap_to_pay_label_swift_syntax if {
  result := decision with input as warns_for_apple_tap_to_pay_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
}

test_does_not_warn_for_hig_tap_to_pay_button_labels if {
  result := {"warn": [warning |
    node := does_not_warn_for_hig_tap_to_pay_button_labels_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax if {
  result := decision with input as does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_unrelated_button_string_swift_syntax if {
  result := decision with input as does_not_warn_for_unrelated_button_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Start Tap to Pay", action: acceptPayment)` at 24:9.
warns_for_nonstandard_tap_to_pay_button_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 33}}, "token": {"kind": "stringSegment", "text": "Start Tap to Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 34}, "end": {"line": 24, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 57}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 42}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 42}, "end": {"line": 24, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 57}}, "token": {"kind": "identifier", "text": "acceptPayment"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 57}, "end": {"line": 24, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 58}}, "children": []},
]}

# Parser output for `Button("Tap to pay on iPhone", action: acceptPayment)` at 31:9.
warns_for_tap_to_pay_case_variant_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 62}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 61}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 39}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 38}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 37}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 37}}, "token": {"kind": "stringSegment", "text": "Tap to pay on iPhone"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 38}, "end": {"line": 31, "column": 39}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 40}, "end": {"line": 31, "column": 61}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 40}, "end": {"line": 31, "column": 46}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 46}, "end": {"line": 31, "column": 47}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 48}, "end": {"line": 31, "column": 61}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 48}, "end": {"line": 31, "column": 61}}, "token": {"kind": "identifier", "text": "acceptPayment"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 61}, "end": {"line": 31, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 62}, "end": {"line": 31, "column": 62}}, "children": []},
]}

# Parser output for `Button("Apple Tap to Pay", action: acceptPayment)` at 36:9.
warns_for_apple_tap_to_pay_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "token": {"kind": "stringSegment", "text": "Apple Tap to Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 33}, "end": {"line": 36, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 36}, "end": {"line": 36, "column": 57}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 36}, "end": {"line": 36, "column": 42}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 42}, "end": {"line": 36, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 57}}, "token": {"kind": "identifier", "text": "acceptPayment"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 57}, "end": {"line": 36, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 58}, "end": {"line": 36, "column": 58}}, "children": []},
]}

# Parser output for `Button("Tap to Pay", action: acceptPayment)` at 39:9.
# Parser output for `Button("Tap to Pay on iPhone", action: acceptPayment)` at 40:9.
does_not_warn_for_hig_tap_to_pay_button_labels_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 39, "column": 9}, "end": {"line": 39, "column": 52}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 9}, "end": {"line": 39, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 9}, "end": {"line": 39, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 15}, "end": {"line": 39, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 51}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 29}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 39, "column": 17}, "end": {"line": 39, "column": 27}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 39, "column": 17}, "end": {"line": 39, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 17}, "end": {"line": 39, "column": 27}}, "token": {"kind": "stringSegment", "text": "Tap to Pay"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 27}, "end": {"line": 39, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 28}, "end": {"line": 39, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 39, "column": 30}, "end": {"line": 39, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 30}, "end": {"line": 39, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 36}, "end": {"line": 39, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 38}, "end": {"line": 39, "column": 51}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 38}, "end": {"line": 39, "column": 51}}, "token": {"kind": "identifier", "text": "acceptPayment"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 51}, "end": {"line": 39, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 39, "column": 52}, "end": {"line": 39, "column": 52}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 40, "column": 9}, "end": {"line": 40, "column": 62}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 40, "column": 9}, "end": {"line": 40, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 9}, "end": {"line": 40, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 15}, "end": {"line": 40, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 40, "column": 16}, "end": {"line": 40, "column": 61}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 40, "column": 16}, "end": {"line": 40, "column": 39}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 40, "column": 16}, "end": {"line": 40, "column": 38}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 16}, "end": {"line": 40, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 40, "column": 17}, "end": {"line": 40, "column": 37}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 40, "column": 17}, "end": {"line": 40, "column": 37}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 17}, "end": {"line": 40, "column": 37}}, "token": {"kind": "stringSegment", "text": "Tap to Pay on iPhone"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 37}, "end": {"line": 40, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 38}, "end": {"line": 40, "column": 39}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 40, "column": 40}, "end": {"line": 40, "column": 61}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 40}, "end": {"line": 40, "column": 46}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 46}, "end": {"line": 40, "column": 47}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 40, "column": 48}, "end": {"line": 40, "column": 61}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 48}, "end": {"line": 40, "column": 61}}, "token": {"kind": "identifier", "text": "acceptPayment"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 40, "column": 61}, "end": {"line": 40, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 40, "column": 62}, "end": {"line": 40, "column": 62}}, "children": []},
  ]},
]

# Parser output for `Text("Start Tap to Pay")` at 49:9.
does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 49, "column": 9}, "end": {"line": 49, "column": 33}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 49, "column": 9}, "end": {"line": 49, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 9}, "end": {"line": 49, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 13}, "end": {"line": 49, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 49, "column": 14}, "end": {"line": 49, "column": 32}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 49, "column": 14}, "end": {"line": 49, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 49, "column": 14}, "end": {"line": 49, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 14}, "end": {"line": 49, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 49, "column": 15}, "end": {"line": 49, "column": 31}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 49, "column": 15}, "end": {"line": 49, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 15}, "end": {"line": 49, "column": 31}}, "token": {"kind": "stringSegment", "text": "Start Tap to Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 31}, "end": {"line": 49, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 32}, "end": {"line": 49, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 49, "column": 33}, "end": {"line": 49, "column": 33}}, "children": []},
]}

# Parser output for `Button("Pay with card", action: payWithCard)` at 58:9.
does_not_warn_for_unrelated_button_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 58, "column": 9}, "end": {"line": 58, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 58, "column": 9}, "end": {"line": 58, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 9}, "end": {"line": 58, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 15}, "end": {"line": 58, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 58, "column": 16}, "end": {"line": 58, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 58, "column": 16}, "end": {"line": 58, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 58, "column": 16}, "end": {"line": 58, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 16}, "end": {"line": 58, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 58, "column": 17}, "end": {"line": 58, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 58, "column": 17}, "end": {"line": 58, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 17}, "end": {"line": 58, "column": 30}}, "token": {"kind": "stringSegment", "text": "Pay with card"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 30}, "end": {"line": 58, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 31}, "end": {"line": 58, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 58, "column": 33}, "end": {"line": 58, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 33}, "end": {"line": 58, "column": 39}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 39}, "end": {"line": 58, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 58, "column": 41}, "end": {"line": 58, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 41}, "end": {"line": 58, "column": 52}}, "token": {"kind": "identifier", "text": "payWithCard"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 52}, "end": {"line": 58, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 58, "column": 53}, "end": {"line": 58, "column": 53}}, "children": []},
]}
