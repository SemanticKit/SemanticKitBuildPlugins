package apple.hig.typography.custom_font

test_warns_for_custom_font_swift_syntax if {
  result := decision with input as warns_for_custom_font_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_custom_font"
  result.warn[0].message == "Review custom font; prefer system fonts and verify legibility."
  result.warn[0].line == 28
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_system_font_swift_syntax if {
  result := decision with input as does_not_warn_for_system_font_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Font.custom("Avenir", size: 14)` at 28:19.
warns_for_custom_font_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 23}}, "token": {"kind": "identifier", "text": "Font"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 23}, "end": {"line": 28, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 30}}, "token": {"kind": "identifier", "text": "custom"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 40}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 32}, "end": {"line": 28, "column": 38}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 32}, "end": {"line": 28, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 32}, "end": {"line": 28, "column": 38}}, "token": {"kind": "stringSegment", "text": "Avenir"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 38}, "end": {"line": 28, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 39}, "end": {"line": 28, "column": 40}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 41}, "end": {"line": 28, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 41}, "end": {"line": 28, "column": 45}}, "token": {"kind": "identifier", "text": "size"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 45}, "end": {"line": 28, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 28, "column": 47}, "end": {"line": 28, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 47}, "end": {"line": 28, "column": 49}}, "token": {"kind": "integerLiteral", "text": "14"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 49}, "end": {"line": 28, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 50}, "end": {"line": 28, "column": 50}}, "children": []},
]}

# Parser output for `Font.system(size: 14)` at 28:19.
does_not_warn_for_system_font_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 40}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 23}}, "token": {"kind": "identifier", "text": "Font"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 23}, "end": {"line": 28, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 30}}, "token": {"kind": "identifier", "text": "system"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 39}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 35}}, "token": {"kind": "identifier", "text": "size"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 35}, "end": {"line": 28, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 28, "column": 37}, "end": {"line": 28, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 37}, "end": {"line": 28, "column": 39}}, "token": {"kind": "integerLiteral", "text": "14"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 39}, "end": {"line": 28, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 40}, "end": {"line": 28, "column": 40}}, "children": []},
]}
