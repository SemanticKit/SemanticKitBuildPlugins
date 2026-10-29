package apple.hig.platform_services.apple_pay_button

test_warns_for_custom_button_with_apple_pay_text if {
  result := decision with input as warns_for_custom_button_with_apple_pay_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_apple_pay_button"
  result.warn[0].message == "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos."
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_pkpaymentbutton if {
  result := decision with input as does_not_warn_for_pkpaymentbutton_node

  count(result.warn) == 0
}

# Parser output for `Button("Apple Pay", action: pay)` at 24:13.
warns_for_custom_button_with_apple_pay_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 45}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 30}}, "token": {"kind": "stringSegment", "text": "Apple Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 44}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 39}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 41}, "end": {"line": 24, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 41}, "end": {"line": 24, "column": 44}}, "token": {"kind": "identifier", "text": "pay"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 45}}, "children": []},
]}

# Parser output for `PKPaymentButton("Apple Pay")` at 31:9.
does_not_warn_for_pkpaymentbutton_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 24}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 24}}, "token": {"kind": "identifier", "text": "PKPaymentButton"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 24}, "end": {"line": 31, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 25}, "end": {"line": 31, "column": 26}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 26}, "end": {"line": 31, "column": 35}}, "token": {"kind": "stringSegment", "text": "Apple Pay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 37}}, "children": []},
]}
