package apple.hig.platform_services.airplay_custom_controls

test_warns_for_custom_button_with_airplay_text if {
  result := decision with input as warns_for_custom_button_with_airplay_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_airplay_control"
  result.warn[0].message == "Review custom AirPlay control; use Apple-provided AirPlay affordances."
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_avroutepickerview if {
  result := decision with input as does_not_warn_for_avroutepickerview_node

  count(result.warn) == 0
}

# Parser output for `Button("AirPlay", action: showRoutes)` at 18:11.
warns_for_custom_button_with_airplay_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 48}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 47}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 28}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 26}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 26}}, "token": {"kind": "stringSegment", "text": "AirPlay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 28}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 35}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 47}}, "token": {"kind": "identifier", "text": "showRoutes"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 48}}, "children": []},
]}

# Parser output for `AVRoutePickerView("AirPlay")` at 27:9.
does_not_warn_for_avroutepickerview_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 26}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 26}}, "token": {"kind": "identifier", "text": "AVRoutePickerView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 26}, "end": {"line": 27, "column": 27}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 27}, "end": {"line": 27, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 27}, "end": {"line": 27, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 27}, "end": {"line": 27, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 27}, "end": {"line": 27, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 28}, "end": {"line": 27, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 28}, "end": {"line": 27, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 28}, "end": {"line": 27, "column": 35}}, "token": {"kind": "stringSegment", "text": "AirPlay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 35}, "end": {"line": 27, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 36}, "end": {"line": 27, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 37}, "end": {"line": 27, "column": 37}}, "children": []},
]}
