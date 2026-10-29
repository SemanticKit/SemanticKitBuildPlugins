package apple.hig.components.button_labels

test_warns_for_long_button_label_swift_syntax if {
  result := decision with input as warns_for_long_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_button_label_length"
  result.warn[0].message == "Review long button label; keep button text short and clear."
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_short_button_label_swift_syntax if {
  result := decision with input as does_not_warn_for_short_button_label_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Continue to the next section of onboarding", action: next)` at 22:9.
warns_for_long_button_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 75}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 74}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 61}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 60}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 59}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 59}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 59}}, "token": {"kind": "stringSegment", "text": "Continue to the next section of onboarding"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 59}, "end": {"line": 22, "column": 60}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 60}, "end": {"line": 22, "column": 61}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 62}, "end": {"line": 22, "column": 74}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 62}, "end": {"line": 22, "column": 68}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 68}, "end": {"line": 22, "column": 69}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 70}, "end": {"line": 22, "column": 74}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 70}, "end": {"line": 22, "column": 74}}, "token": {"kind": "identifier", "text": "next"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 74}, "end": {"line": 22, "column": 75}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 75}, "end": {"line": 22, "column": 75}}, "children": []},
]}

# Parser output for `Button("Continue", action: next)` at 22:9.
does_not_warn_for_short_button_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 41}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 40}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 27}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 16}, "end": {"line": 22, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 25}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 25}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 17}, "end": {"line": 22, "column": 25}}, "token": {"kind": "stringSegment", "text": "Continue"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 25}, "end": {"line": 22, "column": 26}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 26}, "end": {"line": 22, "column": 27}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 28}, "end": {"line": 22, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 28}, "end": {"line": 22, "column": 34}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 40}}, "token": {"kind": "identifier", "text": "next"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 40}, "end": {"line": 22, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 41}, "end": {"line": 22, "column": 41}}, "children": []},
]}
