package apple.hig.presentation.alert_ok_button

test_warns_for_ok_button_swift_syntax if {
  result := decision with input as warns_for_ok_button_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_alert_ok_button"
  result.warn[0].message == "Review OK button label; use a specific action title when the alert is not purely informational."
  result.warn[0].line == 28
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_dismiss_button_swift_syntax if {
  result := decision with input as does_not_warn_for_dismiss_button_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("OK", action: dismiss)` at 28:13.
warns_for_ok_button_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 25}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 23}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 23}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 23}}, "token": {"kind": "stringSegment", "text": "OK"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 23}, "end": {"line": 28, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 25}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 26}, "end": {"line": 28, "column": 41}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 26}, "end": {"line": 28, "column": 32}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 32}, "end": {"line": 28, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 41}}, "token": {"kind": "identifier", "text": "dismiss"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 41}, "end": {"line": 28, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 42}, "end": {"line": 28, "column": 42}}, "children": []},
]}

# Parser output for `Button("Dismiss", action: dismiss)` at 28:13.
does_not_warn_for_dismiss_button_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 47}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 13}, "end": {"line": 28, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 29}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 28}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 28}}, "token": {"kind": "stringSegment", "text": "Dismiss"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 28}, "end": {"line": 28, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 29}, "end": {"line": 28, "column": 30}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 37}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 37}, "end": {"line": 28, "column": 38}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 39}, "end": {"line": 28, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 39}, "end": {"line": 28, "column": 46}}, "token": {"kind": "identifier", "text": "dismiss"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 46}, "end": {"line": 28, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 47}, "end": {"line": 28, "column": 47}}, "children": []},
]}
