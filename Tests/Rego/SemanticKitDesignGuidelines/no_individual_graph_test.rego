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
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_graph_use if {
  result := decision with input as graph_use_node

  count(result.deny) == 0
}

# Parser output for `let graph = IndividualGraph()` at 3:13.
individual_graph_use_node := {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 25}, "end": {"line": 3, "column": 40}}, "token": {"kind": "identifier", "text": "IndividualGraph"}, "children": []}

# Parser output for `final class IndividualGraph {}` at 6:1.
individual_graph_declaration_node := {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 13}, "end": {"line": 6, "column": 28}}, "token": {"kind": "identifier", "text": "IndividualGraph"}, "children": []}

# Parser output for `let graph = Graph()` at 9:13.
graph_use_node := {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 30}}, "token": {"kind": "identifier", "text": "Graph"}, "children": []}
