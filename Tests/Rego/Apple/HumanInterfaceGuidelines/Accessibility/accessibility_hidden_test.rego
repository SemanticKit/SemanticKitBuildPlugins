package apple.hig.accessibility.accessibility_hidden

test_warns_for_accessibility_hidden_swift_syntax if {
  result := decision with input as warns_for_accessibility_hidden_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_accessibility_hidden"
  result.warn[0].message == "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value."
  result.warn[0].line == 18
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_accessibility_label_swift_syntax if {
  result := decision with input as does_not_warn_for_accessibility_label_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `decoration.accessibilityHidden(true)` at 18:10.
warns_for_accessibility_hidden_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 10}, "end": {"line": 18, "column": 46}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 18, "column": 10}, "end": {"line": 18, "column": 40}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 10}, "end": {"line": 18, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 10}, "end": {"line": 18, "column": 20}}, "token": {"kind": "identifier", "text": "decoration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 21}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 40}}, "token": {"kind": "identifier", "text": "accessibilityHidden"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "children": [
      {"type": "BooleanLiteralExprSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "token": {"kind": "keyword", "text": "true"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 46}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 46}}, "children": []},
]}

# Parser output for `icon.accessibilityLabel("Route")` at 22:10.
does_not_warn_for_accessibility_label_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 10}, "end": {"line": 22, "column": 42}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 22, "column": 10}, "end": {"line": 22, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 10}, "end": {"line": 22, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 10}, "end": {"line": 22, "column": 14}}, "token": {"kind": "identifier", "text": "icon"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 14}, "end": {"line": 22, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 33}}, "token": {"kind": "identifier", "text": "accessibilityLabel"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 33}, "end": {"line": 22, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 41}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 40}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 40}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 40}}, "token": {"kind": "stringSegment", "text": "Route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 40}, "end": {"line": 22, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 41}, "end": {"line": 22, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 42}, "end": {"line": 22, "column": 42}}, "children": []},
]}
