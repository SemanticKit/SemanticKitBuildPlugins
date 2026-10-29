package apple.hig.presentation.unhelpful_alert_title

test_warns_for_generic_error_text_swift_syntax if {
  result := decision with input as warns_for_generic_error_text_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_unhelpful_alert_title"
  result.warn[0].message == "Review alert title; use direct, neutral, specific copy instead of generic error text."
  result.warn[0].line == 14
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_specific_route_unavailable_text_swift_syntax if {
  result := decision with input as does_not_warn_for_specific_route_unavailable_text_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Error")` at 14:13.
warns_for_generic_error_text_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 26}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 17}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 25}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 25}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 24}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 24}}, "token": {"kind": "stringSegment", "text": "Error"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 24}, "end": {"line": 14, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 25}, "end": {"line": 14, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 26}, "end": {"line": 14, "column": 26}}, "children": []},
]}

# Parser output for `Text("Route unavailable")` at 14:13.
does_not_warn_for_specific_route_unavailable_text_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 17}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 17}, "end": {"line": 14, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 37}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 18}, "end": {"line": 14, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 36}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 36}}, "token": {"kind": "stringSegment", "text": "Route unavailable"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 36}, "end": {"line": 14, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 37}, "end": {"line": 14, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 38}, "end": {"line": 14, "column": 38}}, "children": []},
]}
