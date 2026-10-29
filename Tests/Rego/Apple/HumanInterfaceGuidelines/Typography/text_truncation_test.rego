package apple.hig.typography.text_truncation

test_warns_for_tail_truncation_mode_swift_syntax if {
  result := decision with input as warns_for_tail_truncation_mode_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_text_truncation"
  result.warn[0].message == "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate."
  result.warn[0].line == 34
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_font_swift_syntax if {
  result := decision with input as does_not_warn_for_font_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `title.truncationMode(.tail)` at 34:15.
warns_for_tail_truncation_mode_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 42}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 35}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 20}}, "token": {"kind": "identifier", "text": "title"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 21}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 35}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 35}}, "token": {"kind": "identifier", "text": "truncationMode"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 35}, "end": {"line": 34, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 41}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 36}, "end": {"line": 34, "column": 37}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 37}, "end": {"line": 34, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 37}, "end": {"line": 34, "column": 41}}, "token": {"kind": "identifier", "text": "tail"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 41}, "end": {"line": 34, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 42}, "end": {"line": 34, "column": 42}}, "children": []},
]}

# Parser output for `title.font(.headline)` at 28:19.
does_not_warn_for_font_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 40}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 29}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 24}}, "token": {"kind": "identifier", "text": "title"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 25}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 25}, "end": {"line": 28, "column": 29}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 25}, "end": {"line": 28, "column": 29}}, "token": {"kind": "identifier", "text": "font"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 29}, "end": {"line": 28, "column": 30}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 39}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 31}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 39}}, "token": {"kind": "identifier", "text": "headline"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 39}, "end": {"line": 28, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 40}, "end": {"line": 28, "column": 40}}, "children": []},
]}
