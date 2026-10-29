package apple.hig.accessibility.symbol_accessibility

test_warns_for_system_symbol_image_swift_syntax if {
  result := decision with input as warns_for_system_symbol_image_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_symbol_accessibility_label"
  result.warn[0].message == "Review symbol image accessibility; provide alternative text for custom interface icons and symbols."
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asset_image_swift_syntax if {
  result := decision with input as does_not_warn_for_asset_image_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Image(systemName: "square.and.arrow.up")` at 24:13.
warns_for_system_symbol_image_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 18}}, "token": {"kind": "identifier", "text": "Image"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 29}}, "token": {"kind": "identifier", "text": "systemName"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 29}, "end": {"line": 24, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 32}, "end": {"line": 24, "column": 51}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 32}, "end": {"line": 24, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 32}, "end": {"line": 24, "column": 51}}, "token": {"kind": "stringSegment", "text": "square.and.arrow.up"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 51}, "end": {"line": 24, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 53}, "end": {"line": 24, "column": 53}}, "children": []},
]}

# Parser output for `Image("assetName")` at 31:13.
does_not_warn_for_asset_image_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 31}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 18}}, "token": {"kind": "identifier", "text": "Image"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 18}, "end": {"line": 31, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 30}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 29}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 29}}, "token": {"kind": "stringSegment", "text": "assetName"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 29}, "end": {"line": 31, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 31}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 31}, "end": {"line": 31, "column": 31}}, "children": []},
]}
