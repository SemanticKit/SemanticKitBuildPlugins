package apple.hig.platform_services.apple_pay_term_casing

test_warns_for_lowercase_apple_pay_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible Apple Pay string literal; use the Apple Pay term casing."
  warnings[0].line == 22
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_unspaced_apple_pay_term_swift_syntax if {
  result := decision with input as warns_for_unspaced_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_apple_pay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_apple_pay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_apple_pay_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_apple_pay_string_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}

# Parser output for `Text("Pay with apple pay")` at 22:11.
warns_for_lowercase_apple_pay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 11}, "end": {"line": 22, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 11}, "end": {"line": 22, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 11}, "end": {"line": 22, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 35}}, "token": {"kind": "stringSegment", "text": "Pay with apple pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 37}, "end": {"line": 22, "column": 37}}, "children": []},
]}

# Parser output for `Button("Use ApplePay", action: pay)` at 30:13.
warns_for_unspaced_apple_pay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 48}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 47}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 33}}, "token": {"kind": "stringSegment", "text": "Use ApplePay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 34}, "end": {"line": 30, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 42}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 42}, "end": {"line": 30, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 44}, "end": {"line": 30, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 44}, "end": {"line": 30, "column": 47}}, "token": {"kind": "identifier", "text": "pay"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 47}, "end": {"line": 30, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 48}, "end": {"line": 30, "column": 48}}, "children": []},
]}

# Parser output for `Label("Pay with Apple Pay", systemImage: "creditcard")` at 38:9.
does_not_warn_for_correct_apple_pay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 38, "column": 9}, "end": {"line": 38, "column": 63}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 38, "column": 9}, "end": {"line": 38, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 9}, "end": {"line": 38, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 14}, "end": {"line": 38, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 38, "column": 15}, "end": {"line": 38, "column": 62}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 38, "column": 15}, "end": {"line": 38, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 38, "column": 15}, "end": {"line": 38, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 15}, "end": {"line": 38, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 38, "column": 16}, "end": {"line": 38, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 38, "column": 16}, "end": {"line": 38, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 16}, "end": {"line": 38, "column": 34}}, "token": {"kind": "stringSegment", "text": "Pay with Apple Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 34}, "end": {"line": 38, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 35}, "end": {"line": 38, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 38, "column": 37}, "end": {"line": 38, "column": 62}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 37}, "end": {"line": 38, "column": 48}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 48}, "end": {"line": 38, "column": 49}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 38, "column": 50}, "end": {"line": 38, "column": 62}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 50}, "end": {"line": 38, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 38, "column": 51}, "end": {"line": 38, "column": 61}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 38, "column": 51}, "end": {"line": 38, "column": 61}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 51}, "end": {"line": 38, "column": 61}}, "token": {"kind": "stringSegment", "text": "creditcard"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 61}, "end": {"line": 38, "column": 62}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 38, "column": 62}, "end": {"line": 38, "column": 63}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 38, "column": 63}, "end": {"line": 38, "column": 63}}, "children": []},
]}

# Parser output for `Logger(subsystem: "apple pay")` at 46:17.
does_not_warn_for_non_visible_apple_pay_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 46, "column": 17}, "end": {"line": 46, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 46, "column": 17}, "end": {"line": 46, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 17}, "end": {"line": 46, "column": 23}}, "token": {"kind": "identifier", "text": "Logger"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 23}, "end": {"line": 46, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 46, "column": 24}, "end": {"line": 46, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 46, "column": 24}, "end": {"line": 46, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 24}, "end": {"line": 46, "column": 33}}, "token": {"kind": "identifier", "text": "subsystem"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 33}, "end": {"line": 46, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 46, "column": 35}, "end": {"line": 46, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 35}, "end": {"line": 46, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 46, "column": 36}, "end": {"line": 46, "column": 45}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 46, "column": 36}, "end": {"line": 46, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 36}, "end": {"line": 46, "column": 45}}, "token": {"kind": "stringSegment", "text": "apple pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 45}, "end": {"line": 46, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 46, "column": 46}, "end": {"line": 46, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 46, "column": 47}, "end": {"line": 46, "column": 47}}, "children": []},
]}
