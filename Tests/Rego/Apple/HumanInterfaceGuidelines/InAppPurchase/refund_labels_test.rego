package apple.hig.in_app_purchase.refund_labels

test_warns_for_complex_refund_button_label if {
  result := decision with input as warns_for_complex_refund_button_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.in_app_purchase.review_refund_action_label"
  result.warn[0].message == "Review refund action label; use simple labels such as Refund or Request a Refund."
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_simple_refund_button_label if {
  result := decision with input as does_not_warn_for_simple_refund_button_label_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_refund_button_label if {
  result := decision with input as does_not_warn_for_non_refund_button_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Start a refund claim", action: requestRefund)` at 42:11.
warns_for_complex_refund_button_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 64}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 63}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 41}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 39}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 39}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 39}}, "token": {"kind": "stringSegment", "text": "Start a refund claim"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 39}, "end": {"line": 42, "column": 40}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 41}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 63}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 48}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 48}, "end": {"line": 42, "column": 49}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 63}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 63}}, "token": {"kind": "identifier", "text": "requestRefund"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 63}, "end": {"line": 42, "column": 64}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 64}, "end": {"line": 42, "column": 64}}, "children": []},
]}

# Parser output for `Button("Request a Refund", action: requestRefund)` at 47:11.
does_not_warn_for_simple_refund_button_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 47, "column": 11}, "end": {"line": 47, "column": 60}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 47, "column": 11}, "end": {"line": 47, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 11}, "end": {"line": 47, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 17}, "end": {"line": 47, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 47, "column": 18}, "end": {"line": 47, "column": 59}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 18}, "end": {"line": 47, "column": 37}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 47, "column": 18}, "end": {"line": 47, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 18}, "end": {"line": 47, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 35}}, "token": {"kind": "stringSegment", "text": "Request a Refund"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 35}, "end": {"line": 47, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 36}, "end": {"line": 47, "column": 37}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 38}, "end": {"line": 47, "column": 59}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 38}, "end": {"line": 47, "column": 44}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 44}, "end": {"line": 47, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 47, "column": 46}, "end": {"line": 47, "column": 59}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 46}, "end": {"line": 47, "column": 59}}, "token": {"kind": "identifier", "text": "requestRefund"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 59}, "end": {"line": 47, "column": 60}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 47, "column": 60}, "end": {"line": 47, "column": 60}}, "children": []},
]}

# Parser output for `Button("Purchase Help", action: showHelp)` at 52:11.
does_not_warn_for_non_refund_button_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 52, "column": 11}, "end": {"line": 52, "column": 52}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 52, "column": 11}, "end": {"line": 52, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 11}, "end": {"line": 52, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 17}, "end": {"line": 52, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 52, "column": 18}, "end": {"line": 52, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 52, "column": 18}, "end": {"line": 52, "column": 34}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 52, "column": 18}, "end": {"line": 52, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 18}, "end": {"line": 52, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 52, "column": 19}, "end": {"line": 52, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 52, "column": 19}, "end": {"line": 52, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 19}, "end": {"line": 52, "column": 32}}, "token": {"kind": "stringSegment", "text": "Purchase Help"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 32}, "end": {"line": 52, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 33}, "end": {"line": 52, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 52, "column": 35}, "end": {"line": 52, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 35}, "end": {"line": 52, "column": 41}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 41}, "end": {"line": 52, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 52, "column": 43}, "end": {"line": 52, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 43}, "end": {"line": 52, "column": 51}}, "token": {"kind": "identifier", "text": "showHelp"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 51}, "end": {"line": 52, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 52, "column": 52}, "end": {"line": 52, "column": 52}}, "children": []},
]}
