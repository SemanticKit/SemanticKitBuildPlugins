package apple.hig.layout.safe_area

test_warns_for_ignores_safe_area if {
  result := decision with input as ignores_safe_area_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.layout.review_safe_area_opt_out"
  result.warn[0].message == "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides."
  result.warn[0].line == 30
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_edges_ignoring_safe_area if {
  result := decision with input as edges_ignoring_safe_area_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.layout.review_safe_area_opt_out"
  result.warn[0].message == "Review this visible safe-area opt-out against Apple HIG layout guidance: respect safe areas, margins, and guides."
  result.warn[0].line == 31
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_safe_area_inset if {
  result := decision with input as safe_area_inset_node

  count(result.warn) == 0
}

# Parser output for `background.ignoresSafeArea()` at 30:9.
ignores_safe_area_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 37}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 35}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 19}}, "token": {"kind": "identifier", "text": "background"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 20}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 35}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 35}}, "token": {"kind": "identifier", "text": "ignoresSafeArea"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 35}, "end": {"line": 30, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 36}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 37}}, "children": []},
]}

# Parser output for `map.edgesIgnoringSafeArea(.all)` at 31:9.
edges_ignoring_safe_area_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 40}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 34}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 12}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 12}}, "token": {"kind": "identifier", "text": "map"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 12}, "end": {"line": 31, "column": 13}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 34}}, "token": {"kind": "identifier", "text": "edgesIgnoringSafeArea"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 34}, "end": {"line": 31, "column": 35}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 39}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 36}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 39}}, "token": {"kind": "identifier", "text": "all"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 39}, "end": {"line": 31, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 40}, "end": {"line": 31, "column": 40}}, "children": []},
]}

# Parser output for `list.safeAreaInset(edge: .bottom) { toolbar }` at 32:9.
safe_area_inset_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 54}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 27}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 13}}, "token": {"kind": "identifier", "text": "list"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 13}, "end": {"line": 32, "column": 14}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 14}, "end": {"line": 32, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 14}, "end": {"line": 32, "column": 27}}, "token": {"kind": "identifier", "text": "safeAreaInset"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 27}, "end": {"line": 32, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 32, "column": 28}, "end": {"line": 32, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 32, "column": 28}, "end": {"line": 32, "column": 41}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 28}, "end": {"line": 32, "column": 32}}, "token": {"kind": "identifier", "text": "edge"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 32}, "end": {"line": 32, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 32, "column": 34}, "end": {"line": 32, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 34}, "end": {"line": 32, "column": 35}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 35}, "end": {"line": 32, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 35}, "end": {"line": 32, "column": 41}}, "token": {"kind": "identifier", "text": "bottom"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 41}, "end": {"line": 32, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 32, "column": 43}, "end": {"line": 32, "column": 54}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 43}, "end": {"line": 32, "column": 44}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 32, "column": 45}, "end": {"line": 32, "column": 52}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 32, "column": 45}, "end": {"line": 32, "column": 52}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 45}, "end": {"line": 32, "column": 52}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 45}, "end": {"line": 32, "column": 52}}, "token": {"kind": "identifier", "text": "toolbar"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 53}, "end": {"line": 32, "column": 54}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 32, "column": 54}, "end": {"line": 32, "column": 54}}, "children": []},
]}
