package semantickit.design_guidelines.no_individual_graph

test_denies_individual_graph_use if {
  result := decision with input as individual_graph_use_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_individual_graph"
  result.deny[0].line == 3
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_individual_graph_declaration if {
  result := decision with input as individual_graph_declaration_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_individual_graph"
  result.deny[0].line == 6
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_graph_use if {
  result := decision with input as graph_use_node

  count(result.deny) == 0
}

# Parser output for `let graph = IndividualGraph()` at 3:13.
individual_graph_use_node := {"declReferenceExprs": [{"baseName": "IndividualGraph", "context": [{"variableDecl": {"bindingSpecifier": "let", "bindings": [{"pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 3}, "start": {"column": 17, "line": 3}}}}, "range": {"end": {"column": 42, "line": 3}, "start": {"column": 17, "line": 3}}}], "range": {"end": {"column": 42, "line": 3}, "start": {"column": 13, "line": 3}}}}], "range": {"end": {"column": 40, "line": 3}, "start": {"column": 25, "line": 3}}}], "functionCallExprs": [{"calledExpression": {"declReferenceExpr": {"baseName": "IndividualGraph", "range": {"end": {"column": 40, "line": 3}, "start": {"column": 25, "line": 3}}}}, "context": [{"variableDecl": {"bindingSpecifier": "let", "bindings": [{"pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 3}, "start": {"column": 17, "line": 3}}}}, "range": {"end": {"column": 42, "line": 3}, "start": {"column": 17, "line": 3}}}], "range": {"end": {"column": 42, "line": 3}, "start": {"column": 13, "line": 3}}}}], "range": {"end": {"column": 42, "line": 3}, "start": {"column": 25, "line": 3}}}], "variableDecls": [{"bindingSpecifier": "let", "bindings": [{"initializer": {"range": {"end": {"column": 42, "line": 3}, "start": {"column": 23, "line": 3}}, "value": {"functionCallExpr": {"calledExpression": {"declReferenceExpr": {"baseName": "IndividualGraph", "range": {"end": {"column": 40, "line": 3}, "start": {"column": 25, "line": 3}}}}, "range": {"end": {"column": 42, "line": 3}, "start": {"column": 25, "line": 3}}}}}, "pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 3}, "start": {"column": 17, "line": 3}}}}, "range": {"end": {"column": 42, "line": 3}, "start": {"column": 17, "line": 3}}}], "range": {"end": {"column": 42, "line": 3}, "start": {"column": 13, "line": 3}}}]}

# Parser output for `final class IndividualGraph {}` at 6:1.
individual_graph_declaration_node := {"classDecls": [{"memberBlock": {"range": {"end": {"column": 31, "line": 6}, "start": {"column": 29, "line": 6}}}, "modifiers": [{"name": "final", "range": {"end": {"column": 6, "line": 6}, "start": {"column": 1, "line": 6}}}], "name": "IndividualGraph", "range": {"end": {"column": 31, "line": 6}, "start": {"column": 1, "line": 6}}}]}

# Parser output for `let graph = Graph()` at 9:13.
graph_use_node := {"declReferenceExprs": [{"baseName": "Graph", "context": [{"variableDecl": {"bindingSpecifier": "let", "bindings": [{"pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 9}, "start": {"column": 17, "line": 9}}}}, "range": {"end": {"column": 32, "line": 9}, "start": {"column": 17, "line": 9}}}], "range": {"end": {"column": 32, "line": 9}, "start": {"column": 13, "line": 9}}}}], "range": {"end": {"column": 30, "line": 9}, "start": {"column": 25, "line": 9}}}], "functionCallExprs": [{"calledExpression": {"declReferenceExpr": {"baseName": "Graph", "range": {"end": {"column": 30, "line": 9}, "start": {"column": 25, "line": 9}}}}, "context": [{"variableDecl": {"bindingSpecifier": "let", "bindings": [{"pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 9}, "start": {"column": 17, "line": 9}}}}, "range": {"end": {"column": 32, "line": 9}, "start": {"column": 17, "line": 9}}}], "range": {"end": {"column": 32, "line": 9}, "start": {"column": 13, "line": 9}}}}], "range": {"end": {"column": 32, "line": 9}, "start": {"column": 25, "line": 9}}}], "variableDecls": [{"bindingSpecifier": "let", "bindings": [{"initializer": {"range": {"end": {"column": 32, "line": 9}, "start": {"column": 23, "line": 9}}, "value": {"functionCallExpr": {"calledExpression": {"declReferenceExpr": {"baseName": "Graph", "range": {"end": {"column": 30, "line": 9}, "start": {"column": 25, "line": 9}}}}, "range": {"end": {"column": 32, "line": 9}, "start": {"column": 25, "line": 9}}}}}, "pattern": {"identifierPattern": {"identifier": "graph", "range": {"end": {"column": 22, "line": 9}, "start": {"column": 17, "line": 9}}}}, "range": {"end": {"column": 32, "line": 9}, "start": {"column": 17, "line": 9}}}], "range": {"end": {"column": 32, "line": 9}, "start": {"column": 13, "line": 9}}}]}
