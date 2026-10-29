package apple.hig.widgets.widget_margins

test_warns_for_content_margins_disabled_swift_syntax if {
  result := decision with input as warns_for_content_margins_disabled_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.widgets.review_content_margins_disabled"
  result.warn[0].message == "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing."
  result.warn[0].line == 55
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_warns_for_member_only_content_margins_disabled_swift_syntax if {
  result := decision with input as warns_for_member_only_content_margins_disabled_swift_syntax_node

  count(result.warn) == 1
}

test_does_not_warn_for_other_spacing_call if {
  result := decision with input as does_not_warn_for_other_spacing_call_node

  count(result.warn) == 0
}

# Parser output for `contentMarginsDisabled()` at 55:8.
warns_for_content_margins_disabled_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 55, "column": 8}, "end": {"line": 55, "column": 32}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 55, "column": 8}, "end": {"line": 55, "column": 30}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 8}, "end": {"line": 55, "column": 30}}, "token": {"kind": "identifier", "text": "contentMarginsDisabled"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 30}, "end": {"line": 55, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 55, "column": 31}, "end": {"line": 55, "column": 31}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 55, "column": 31}, "end": {"line": 55, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 55, "column": 32}, "end": {"line": 55, "column": 32}}, "children": []},
]}

# Parser output for `configuration.contentMarginsDisabled()` at 64:10.
warns_for_member_only_content_margins_disabled_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 64, "column": 10}, "end": {"line": 64, "column": 48}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 64, "column": 10}, "end": {"line": 64, "column": 46}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 64, "column": 10}, "end": {"line": 64, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 64, "column": 10}, "end": {"line": 64, "column": 23}}, "token": {"kind": "identifier", "text": "configuration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 64, "column": 23}, "end": {"line": 64, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 64, "column": 24}, "end": {"line": 64, "column": 46}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 64, "column": 24}, "end": {"line": 64, "column": 46}}, "token": {"kind": "identifier", "text": "contentMarginsDisabled"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 64, "column": 46}, "end": {"line": 64, "column": 47}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 64, "column": 47}, "end": {"line": 64, "column": 47}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 64, "column": 47}, "end": {"line": 64, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 64, "column": 48}, "end": {"line": 64, "column": 48}}, "children": []},
]}

# Parser output for `content.padding(16)` at 70:8.
does_not_warn_for_other_spacing_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 70, "column": 8}, "end": {"line": 70, "column": 27}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 70, "column": 8}, "end": {"line": 70, "column": 23}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 70, "column": 8}, "end": {"line": 70, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 8}, "end": {"line": 70, "column": 15}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 15}, "end": {"line": 70, "column": 16}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 70, "column": 16}, "end": {"line": 70, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 16}, "end": {"line": 70, "column": 23}}, "token": {"kind": "identifier", "text": "padding"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 23}, "end": {"line": 70, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 70, "column": 24}, "end": {"line": 70, "column": 26}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 70, "column": 24}, "end": {"line": 70, "column": 26}}, "children": [
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 70, "column": 24}, "end": {"line": 70, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 24}, "end": {"line": 70, "column": 26}}, "token": {"kind": "integerLiteral", "text": "16"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 70, "column": 26}, "end": {"line": 70, "column": 27}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 70, "column": 27}, "end": {"line": 70, "column": 27}}, "children": []},
]}
