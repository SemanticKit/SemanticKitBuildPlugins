package apple.hig.components.standard_navigation_labels

test_warns_for_button_back_text_label if {
  result := decision with input as warns_for_button_back_text_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_text_navigation_label"
  result.warn[0].message == "Review text navigation label; prefer standard Back or Close controls and symbols."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_start_route_text_label if {
  result := decision with input as does_not_warn_for_button_start_route_text_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Back", action: goBack)` at 18:9.
warns_for_button_back_text_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 39}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 38}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 23}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "token": {"kind": "stringSegment", "text": "Back"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 22}, "end": {"line": 18, "column": 23}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 30}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "token": {"kind": "identifier", "text": "goBack"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 39}}, "children": []},
]}

# Parser output for `Button("Start Route", action: startRoute)` at 24:9.
does_not_warn_for_button_start_route_text_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 50}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 29}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 28}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 28}}, "token": {"kind": "stringSegment", "text": "Start Route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 28}, "end": {"line": 24, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 29}, "end": {"line": 24, "column": 30}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 37}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 38}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 49}}, "token": {"kind": "identifier", "text": "startRoute"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 49}, "end": {"line": 24, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 50}, "end": {"line": 24, "column": 50}}, "children": []},
]}
