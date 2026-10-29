package apple.hig.patterns.tooltip_copy

test_warns_for_help_base_name_with_long_tooltip_copy if {
  result := decision with input as warns_for_help_base_name_with_long_tooltip_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].message == "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters."
  result.warn[0].line == 31
  result.warn[0].column == 14
  result.warn[0].severity == "warning"
}

test_warns_for_help_member_name_with_long_tooltip_copy if {
  result := decision with input as warns_for_help_member_name_with_long_tooltip_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].line == 44
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_help_call_with_short_tooltip_copy if {
  result := decision with input as does_not_warn_for_help_call_with_short_tooltip_copy_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_help_call_with_long_copy if {
  result := decision with input as does_not_warn_for_non_help_call_with_long_copy_node

  count(result.warn) == 0
}

# Parser output for `help("Open route planning controls and show detailed guidance for every available route option")` at 31:14.
warns_for_help_base_name_with_long_tooltip_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 14}, "end": {"line": 31, "column": 110}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 14}, "end": {"line": 31, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 14}, "end": {"line": 31, "column": 18}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 18}, "end": {"line": 31, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 109}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 109}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 109}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 108}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 108}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 108}}, "token": {"kind": "stringSegment", "text": "Open route planning controls and show detailed guidance for every available route option"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 108}, "end": {"line": 31, "column": 109}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 109}, "end": {"line": 31, "column": 110}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 110}, "end": {"line": 31, "column": 110}}, "children": []},
]}

# Parser output for `routeButton.help("Review all routing controls and choose the setting that best matches the selected trip")` at 44:10.
warns_for_help_member_name_with_long_tooltip_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 10}, "end": {"line": 44, "column": 116}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 44, "column": 10}, "end": {"line": 44, "column": 26}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 10}, "end": {"line": 44, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 10}, "end": {"line": 44, "column": 21}}, "token": {"kind": "identifier", "text": "routeButton"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 21}, "end": {"line": 44, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 22}, "end": {"line": 44, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 22}, "end": {"line": 44, "column": 26}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 27}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 27}, "end": {"line": 44, "column": 115}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 27}, "end": {"line": 44, "column": 115}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 27}, "end": {"line": 44, "column": 115}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 27}, "end": {"line": 44, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 114}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 114}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 114}}, "token": {"kind": "stringSegment", "text": "Review all routing controls and choose the setting that best matches the selected trip"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 114}, "end": {"line": 44, "column": 115}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 115}, "end": {"line": 44, "column": 116}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 116}, "end": {"line": 44, "column": 116}}, "children": []},
]}

# Parser output for `routeButton.help("Show route options")` at 52:14.
does_not_warn_for_help_call_with_short_tooltip_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 52, "column": 14}, "end": {"line": 52, "column": 52}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 52, "column": 14}, "end": {"line": 52, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 52, "column": 14}, "end": {"line": 52, "column": 25}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 14}, "end": {"line": 52, "column": 25}}, "token": {"kind": "identifier", "text": "routeButton"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 25}, "end": {"line": 52, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 52, "column": 26}, "end": {"line": 52, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 26}, "end": {"line": 52, "column": 30}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 30}, "end": {"line": 52, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 52, "column": 31}, "end": {"line": 52, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 52, "column": 31}, "end": {"line": 52, "column": 51}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 52, "column": 31}, "end": {"line": 52, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 31}, "end": {"line": 52, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 52, "column": 32}, "end": {"line": 52, "column": 50}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 52, "column": 32}, "end": {"line": 52, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 32}, "end": {"line": 52, "column": 50}}, "token": {"kind": "stringSegment", "text": "Show route options"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 50}, "end": {"line": 52, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 51}, "end": {"line": 52, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 52, "column": 52}, "end": {"line": 52, "column": 52}}, "children": []},
]}

# Parser output for `Text("Open route planning controls and show detailed guidance for every available route option")` at 60:12.
does_not_warn_for_non_help_call_with_long_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 60, "column": 12}, "end": {"line": 60, "column": 108}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 60, "column": 12}, "end": {"line": 60, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 12}, "end": {"line": 60, "column": 16}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 16}, "end": {"line": 60, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 60, "column": 17}, "end": {"line": 60, "column": 107}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 60, "column": 17}, "end": {"line": 60, "column": 107}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 60, "column": 17}, "end": {"line": 60, "column": 107}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 17}, "end": {"line": 60, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 60, "column": 18}, "end": {"line": 60, "column": 106}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 60, "column": 18}, "end": {"line": 60, "column": 106}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 18}, "end": {"line": 60, "column": 106}}, "token": {"kind": "stringSegment", "text": "Open route planning controls and show detailed guidance for every available route option"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 106}, "end": {"line": 60, "column": 107}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 107}, "end": {"line": 60, "column": 108}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 60, "column": 108}, "end": {"line": 60, "column": 108}}, "children": []},
]}
