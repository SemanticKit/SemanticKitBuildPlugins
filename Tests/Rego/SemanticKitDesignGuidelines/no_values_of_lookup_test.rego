package semantickit.design_guidelines.no_values_of_lookup

test_denies_values_of_call if {
  result := decision with input as values_of_call_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_values_of_lookup"
  result.deny[0].line == 4
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_values_of_issuer_call if {
  result := decision with input as values_of_issuer_call_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_values_of_lookup"
  result.deny[0].line == 7
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_values_of_declaration if {
  result := decision with input as values_of_declaration_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_values_of_lookup"
  result.deny[0].line == 10
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_property_on_individual if {
  result := decision with input as property_on_individual_node

  count(result.deny) == 0
}

test_allows_values_unlabeled_call if {
  result := decision with input as values_unlabeled_call_node

  count(result.deny) == 0
}

# Parser output for `Cert.key.values(of: alice)` at 4:9.
values_of_call_node := {"declReferenceExprs": [{"baseName": "Cert", "range": {"end": {"column": 13, "line": 4}, "start": {"column": 9, "line": 4}}}, {"baseName": "key", "range": {"end": {"column": 17, "line": 4}, "start": {"column": 14, "line": 4}}}, {"baseName": "values", "range": {"end": {"column": 24, "line": 4}, "start": {"column": 18, "line": 4}}}, {"baseName": "alice", "range": {"end": {"column": 34, "line": 4}, "start": {"column": 29, "line": 4}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 34, "line": 4}, "start": {"column": 29, "line": 4}}}}, "label": "of", "range": {"end": {"column": 34, "line": 4}, "start": {"column": 25, "line": 4}}}], "calledExpression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Cert", "range": {"end": {"column": 13, "line": 4}, "start": {"column": 9, "line": 4}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 17, "line": 4}, "start": {"column": 14, "line": 4}}}, "range": {"end": {"column": 17, "line": 4}, "start": {"column": 9, "line": 4}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 24, "line": 4}, "start": {"column": 18, "line": 4}}}, "range": {"end": {"column": 24, "line": 4}, "start": {"column": 9, "line": 4}}}}, "range": {"end": {"column": 35, "line": 4}, "start": {"column": 9, "line": 4}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Cert", "range": {"end": {"column": 13, "line": 4}, "start": {"column": 9, "line": 4}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 17, "line": 4}, "start": {"column": 14, "line": 4}}}, "range": {"end": {"column": 17, "line": 4}, "start": {"column": 9, "line": 4}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 24, "line": 4}, "start": {"column": 18, "line": 4}}}, "range": {"end": {"column": 24, "line": 4}, "start": {"column": 9, "line": 4}}}, {"base": {"declReferenceExpr": {"baseName": "Cert", "range": {"end": {"column": 13, "line": 4}, "start": {"column": 9, "line": 4}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 17, "line": 4}, "start": {"column": 14, "line": 4}}}, "range": {"end": {"column": 17, "line": 4}, "start": {"column": 9, "line": 4}}}]}

# Parser output for `Solid.oidcIssuer.values(of: profile)` at 7:9.
values_of_issuer_call_node := {"declReferenceExprs": [{"baseName": "Solid", "range": {"end": {"column": 14, "line": 7}, "start": {"column": 9, "line": 7}}}, {"baseName": "oidcIssuer", "range": {"end": {"column": 25, "line": 7}, "start": {"column": 15, "line": 7}}}, {"baseName": "values", "range": {"end": {"column": 32, "line": 7}, "start": {"column": 26, "line": 7}}}, {"baseName": "profile", "range": {"end": {"column": 44, "line": 7}, "start": {"column": 37, "line": 7}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "profile", "range": {"end": {"column": 44, "line": 7}, "start": {"column": 37, "line": 7}}}}, "label": "of", "range": {"end": {"column": 44, "line": 7}, "start": {"column": 33, "line": 7}}}], "calledExpression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Solid", "range": {"end": {"column": 14, "line": 7}, "start": {"column": 9, "line": 7}}}}, "declName": {"baseName": "oidcIssuer", "range": {"end": {"column": 25, "line": 7}, "start": {"column": 15, "line": 7}}}, "range": {"end": {"column": 25, "line": 7}, "start": {"column": 9, "line": 7}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 32, "line": 7}, "start": {"column": 26, "line": 7}}}, "range": {"end": {"column": 32, "line": 7}, "start": {"column": 9, "line": 7}}}}, "range": {"end": {"column": 45, "line": 7}, "start": {"column": 9, "line": 7}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Solid", "range": {"end": {"column": 14, "line": 7}, "start": {"column": 9, "line": 7}}}}, "declName": {"baseName": "oidcIssuer", "range": {"end": {"column": 25, "line": 7}, "start": {"column": 15, "line": 7}}}, "range": {"end": {"column": 25, "line": 7}, "start": {"column": 9, "line": 7}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 32, "line": 7}, "start": {"column": 26, "line": 7}}}, "range": {"end": {"column": 32, "line": 7}, "start": {"column": 9, "line": 7}}}, {"base": {"declReferenceExpr": {"baseName": "Solid", "range": {"end": {"column": 14, "line": 7}, "start": {"column": 9, "line": 7}}}}, "declName": {"baseName": "oidcIssuer", "range": {"end": {"column": 25, "line": 7}, "start": {"column": 15, "line": 7}}}, "range": {"end": {"column": 25, "line": 7}, "start": {"column": 9, "line": 7}}}]}

# Parser output for `func values(of subject: Individual) -> [Node] {}` at 10:5.
values_of_declaration_node := {"functionDecls": [{"body": {"range": {"end": {"column": 53, "line": 10}, "start": {"column": 51, "line": 10}}}, "name": "values", "range": {"end": {"column": 53, "line": 10}, "start": {"column": 5, "line": 10}}, "signature": {"parameterClause": {"parameters": [{"firstName": "of", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 17, "line": 10}}, "secondName": "subject", "type": {"identifierType": {"name": "Individual", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 29, "line": 10}}}}}], "range": {"end": {"column": 40, "line": 10}, "start": {"column": 16, "line": 10}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 16, "line": 10}}, "returnClause": {"range": {"end": {"column": 50, "line": 10}, "start": {"column": 41, "line": 10}}, "type": {"arrayType": {"element": {"identifierType": {"name": "Node", "range": {"end": {"column": 49, "line": 10}, "start": {"column": 45, "line": 10}}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 44, "line": 10}}}}}}}], "identifierTypes": [{"context": [{"functionDecl": {"name": "values", "range": {"end": {"column": 53, "line": 10}, "start": {"column": 5, "line": 10}}, "signature": {"parameterClause": {"parameters": [{"firstName": "of", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 17, "line": 10}}, "secondName": "subject", "type": {"identifierType": {"name": "Individual", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 29, "line": 10}}}}}], "range": {"end": {"column": 40, "line": 10}, "start": {"column": 16, "line": 10}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 16, "line": 10}}, "returnClause": {"range": {"end": {"column": 50, "line": 10}, "start": {"column": 41, "line": 10}}, "type": {"arrayType": {"element": {"identifierType": {"name": "Node", "range": {"end": {"column": 49, "line": 10}, "start": {"column": 45, "line": 10}}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 44, "line": 10}}}}}}}}], "name": "Individual", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 29, "line": 10}}}, {"context": [{"functionDecl": {"name": "values", "range": {"end": {"column": 53, "line": 10}, "start": {"column": 5, "line": 10}}, "signature": {"parameterClause": {"parameters": [{"firstName": "of", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 17, "line": 10}}, "secondName": "subject", "type": {"identifierType": {"name": "Individual", "range": {"end": {"column": 39, "line": 10}, "start": {"column": 29, "line": 10}}}}}], "range": {"end": {"column": 40, "line": 10}, "start": {"column": 16, "line": 10}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 16, "line": 10}}, "returnClause": {"range": {"end": {"column": 50, "line": 10}, "start": {"column": 41, "line": 10}}, "type": {"arrayType": {"element": {"identifierType": {"name": "Node", "range": {"end": {"column": 49, "line": 10}, "start": {"column": 45, "line": 10}}}}, "range": {"end": {"column": 50, "line": 10}, "start": {"column": 44, "line": 10}}}}}}}}], "name": "Node", "range": {"end": {"column": 49, "line": 10}, "start": {"column": 45, "line": 10}}}]}

# Parser output for `alice.key.contains(publicKey)` at 13:9.
property_on_individual_node := {"declReferenceExprs": [{"baseName": "alice", "range": {"end": {"column": 14, "line": 13}, "start": {"column": 9, "line": 13}}}, {"baseName": "key", "range": {"end": {"column": 18, "line": 13}, "start": {"column": 15, "line": 13}}}, {"baseName": "contains", "range": {"end": {"column": 27, "line": 13}, "start": {"column": 19, "line": 13}}}, {"baseName": "publicKey", "range": {"end": {"column": 37, "line": 13}, "start": {"column": 28, "line": 13}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "publicKey", "range": {"end": {"column": 37, "line": 13}, "start": {"column": 28, "line": 13}}}}, "range": {"end": {"column": 37, "line": 13}, "start": {"column": 28, "line": 13}}}], "calledExpression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 14, "line": 13}, "start": {"column": 9, "line": 13}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 18, "line": 13}, "start": {"column": 15, "line": 13}}}, "range": {"end": {"column": 18, "line": 13}, "start": {"column": 9, "line": 13}}}}, "declName": {"baseName": "contains", "range": {"end": {"column": 27, "line": 13}, "start": {"column": 19, "line": 13}}}, "range": {"end": {"column": 27, "line": 13}, "start": {"column": 9, "line": 13}}}}, "range": {"end": {"column": 38, "line": 13}, "start": {"column": 9, "line": 13}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 14, "line": 13}, "start": {"column": 9, "line": 13}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 18, "line": 13}, "start": {"column": 15, "line": 13}}}, "range": {"end": {"column": 18, "line": 13}, "start": {"column": 9, "line": 13}}}}, "declName": {"baseName": "contains", "range": {"end": {"column": 27, "line": 13}, "start": {"column": 19, "line": 13}}}, "range": {"end": {"column": 27, "line": 13}, "start": {"column": 9, "line": 13}}}, {"base": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 14, "line": 13}, "start": {"column": 9, "line": 13}}}}, "declName": {"baseName": "key", "range": {"end": {"column": 18, "line": 13}, "start": {"column": 15, "line": 13}}}, "range": {"end": {"column": 18, "line": 13}, "start": {"column": 9, "line": 13}}}]}

# Parser output for `measurements.values(alice)` at 16:9.
values_unlabeled_call_node := {"declReferenceExprs": [{"baseName": "measurements", "range": {"end": {"column": 21, "line": 16}, "start": {"column": 9, "line": 16}}}, {"baseName": "values", "range": {"end": {"column": 28, "line": 16}, "start": {"column": 22, "line": 16}}}, {"baseName": "alice", "range": {"end": {"column": 34, "line": 16}, "start": {"column": 29, "line": 16}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 34, "line": 16}, "start": {"column": 29, "line": 16}}}}, "range": {"end": {"column": 34, "line": 16}, "start": {"column": 29, "line": 16}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "measurements", "range": {"end": {"column": 21, "line": 16}, "start": {"column": 9, "line": 16}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 28, "line": 16}, "start": {"column": 22, "line": 16}}}, "range": {"end": {"column": 28, "line": 16}, "start": {"column": 9, "line": 16}}}}, "range": {"end": {"column": 35, "line": 16}, "start": {"column": 9, "line": 16}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "measurements", "range": {"end": {"column": 21, "line": 16}, "start": {"column": 9, "line": 16}}}}, "declName": {"baseName": "values", "range": {"end": {"column": 28, "line": 16}, "start": {"column": 22, "line": 16}}}, "range": {"end": {"column": 28, "line": 16}, "start": {"column": 9, "line": 16}}}]}

test_denies_bare_values_of_call if {
  result := decision with input as bare_values_of_call_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_values_of_lookup"
  result.deny[0].line == 30
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_bare_values_in_call if {
  result := decision with input as bare_values_in_call_node

  count(result.deny) == 0
}

# Parser output for `values(of: alice)` at 30:9.
bare_values_of_call_node := {"declReferenceExprs": [{"baseName": "values", "range": {"end": {"column": 15, "line": 30}, "start": {"column": 9, "line": 30}}}, {"baseName": "alice", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "alice", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}}, "label": "of", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 16, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "values", "range": {"end": {"column": 15, "line": 30}, "start": {"column": 9, "line": 30}}}}, "range": {"end": {"column": 26, "line": 30}, "start": {"column": 9, "line": 30}}}]}

# Parser output for `values(in: graph)` at 33:9.
bare_values_in_call_node := {"declReferenceExprs": [{"baseName": "values", "range": {"end": {"column": 15, "line": 33}, "start": {"column": 9, "line": 33}}}, {"baseName": "graph", "range": {"end": {"column": 25, "line": 33}, "start": {"column": 20, "line": 33}}}], "functionCallExprs": [{"arguments": [{"expression": {"declReferenceExpr": {"baseName": "graph", "range": {"end": {"column": 25, "line": 33}, "start": {"column": 20, "line": 33}}}}, "label": "in", "range": {"end": {"column": 25, "line": 33}, "start": {"column": 16, "line": 33}}}], "calledExpression": {"declReferenceExpr": {"baseName": "values", "range": {"end": {"column": 15, "line": 33}, "start": {"column": 9, "line": 33}}}}, "range": {"end": {"column": 26, "line": 33}, "start": {"column": 9, "line": 33}}}]}
