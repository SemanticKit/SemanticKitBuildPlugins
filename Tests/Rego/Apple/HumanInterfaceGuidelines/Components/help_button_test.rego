package apple.hig.components.help_button

test_warns_for_button_help_text if {
  result := decision with input as warns_for_button_help_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_custom_help_button"
  result.warn[0].message == "Review custom Help button; use the system help button for help documentation where appropriate."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_route_details_button_text if {
  result := decision with input as does_not_warn_for_route_details_button_text_node

  count(result.warn) == 0
}

# Parser output for `Button("Help", action: showHelp)` at 18:9.
warns_for_button_help_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 41}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 40}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 23}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 21}}, "token": {"kind": "stringSegment", "text": "Help"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 22}, "end": {"line": 18, "column": 23}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 30}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 40}}, "token": {"kind": "identifier", "text": "showHelp"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 41}}, "children": []},
]}

# Parser output for `Button("Route Details", action: showDetails)` at 24:9.
does_not_warn_for_route_details_button_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 30}}, "token": {"kind": "stringSegment", "text": "Route Details"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 39}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 41}, "end": {"line": 24, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 41}, "end": {"line": 24, "column": 52}}, "token": {"kind": "identifier", "text": "showDetails"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 53}, "end": {"line": 24, "column": 53}}, "children": []},
]}
