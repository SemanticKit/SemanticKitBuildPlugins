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
ignores_safe_area_node := {"declReferenceExprs": [{"baseName": "background", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 9, "line": 30}}}, {"baseName": "ignoresSafeArea", "range": {"end": {"column": 35, "line": 30}, "start": {"column": 20, "line": 30}}}], "functionCallExprs": [{"calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "background", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 9, "line": 30}}}}, "declName": {"baseName": "ignoresSafeArea", "range": {"end": {"column": 35, "line": 30}, "start": {"column": 20, "line": 30}}}, "range": {"end": {"column": 35, "line": 30}, "start": {"column": 9, "line": 30}}}}, "range": {"end": {"column": 37, "line": 30}, "start": {"column": 9, "line": 30}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "background", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 9, "line": 30}}}}, "declName": {"baseName": "ignoresSafeArea", "range": {"end": {"column": 35, "line": 30}, "start": {"column": 20, "line": 30}}}, "range": {"end": {"column": 35, "line": 30}, "start": {"column": 9, "line": 30}}}]}

# Parser output for `map.edgesIgnoringSafeArea(.all)` at 31:9.
edges_ignoring_safe_area_node := {"declReferenceExprs": [{"baseName": "map", "range": {"end": {"column": 12, "line": 31}, "start": {"column": 9, "line": 31}}}, {"baseName": "edgesIgnoringSafeArea", "range": {"end": {"column": 34, "line": 31}, "start": {"column": 13, "line": 31}}}, {"baseName": "all", "range": {"end": {"column": 39, "line": 31}, "start": {"column": 36, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "all", "range": {"end": {"column": 39, "line": 31}, "start": {"column": 36, "line": 31}}}, "range": {"end": {"column": 39, "line": 31}, "start": {"column": 35, "line": 31}}}}, "range": {"end": {"column": 39, "line": 31}, "start": {"column": 35, "line": 31}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "map", "range": {"end": {"column": 12, "line": 31}, "start": {"column": 9, "line": 31}}}}, "declName": {"baseName": "edgesIgnoringSafeArea", "range": {"end": {"column": 34, "line": 31}, "start": {"column": 13, "line": 31}}}, "range": {"end": {"column": 34, "line": 31}, "start": {"column": 9, "line": 31}}}}, "range": {"end": {"column": 40, "line": 31}, "start": {"column": 9, "line": 31}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "map", "range": {"end": {"column": 12, "line": 31}, "start": {"column": 9, "line": 31}}}}, "declName": {"baseName": "edgesIgnoringSafeArea", "range": {"end": {"column": 34, "line": 31}, "start": {"column": 13, "line": 31}}}, "range": {"end": {"column": 34, "line": 31}, "start": {"column": 9, "line": 31}}}, {"declName": {"baseName": "all", "range": {"end": {"column": 39, "line": 31}, "start": {"column": 36, "line": 31}}}, "range": {"end": {"column": 39, "line": 31}, "start": {"column": 35, "line": 31}}}]}

# Parser output for `list.safeAreaInset(edge: .bottom) { toolbar }` at 32:9.
safe_area_inset_node := {"declReferenceExprs": [{"baseName": "list", "range": {"end": {"column": 13, "line": 32}, "start": {"column": 9, "line": 32}}}, {"baseName": "safeAreaInset", "range": {"end": {"column": 27, "line": 32}, "start": {"column": 14, "line": 32}}}, {"baseName": "bottom", "range": {"end": {"column": 41, "line": 32}, "start": {"column": 35, "line": 32}}}, {"baseName": "toolbar", "range": {"end": {"column": 52, "line": 32}, "start": {"column": 45, "line": 32}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "bottom", "range": {"end": {"column": 41, "line": 32}, "start": {"column": 35, "line": 32}}}, "range": {"end": {"column": 41, "line": 32}, "start": {"column": 34, "line": 32}}}}, "label": "edge", "range": {"end": {"column": 41, "line": 32}, "start": {"column": 28, "line": 32}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "list", "range": {"end": {"column": 13, "line": 32}, "start": {"column": 9, "line": 32}}}}, "declName": {"baseName": "safeAreaInset", "range": {"end": {"column": 27, "line": 32}, "start": {"column": 14, "line": 32}}}, "range": {"end": {"column": 27, "line": 32}, "start": {"column": 9, "line": 32}}}}, "range": {"end": {"column": 54, "line": 32}, "start": {"column": 9, "line": 32}}, "trailingClosure": {"range": {"end": {"column": 54, "line": 32}, "start": {"column": 43, "line": 32}}, "statements": [{"item": {"expr": {"declReferenceExpr": {"baseName": "toolbar", "range": {"end": {"column": 52, "line": 32}, "start": {"column": 45, "line": 32}}}}}, "range": {"end": {"column": 52, "line": 32}, "start": {"column": 45, "line": 32}}}]}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "list", "range": {"end": {"column": 13, "line": 32}, "start": {"column": 9, "line": 32}}}}, "declName": {"baseName": "safeAreaInset", "range": {"end": {"column": 27, "line": 32}, "start": {"column": 14, "line": 32}}}, "range": {"end": {"column": 27, "line": 32}, "start": {"column": 9, "line": 32}}}, {"declName": {"baseName": "bottom", "range": {"end": {"column": 41, "line": 32}, "start": {"column": 35, "line": 32}}}, "range": {"end": {"column": 41, "line": 32}, "start": {"column": 34, "line": 32}}}]}
