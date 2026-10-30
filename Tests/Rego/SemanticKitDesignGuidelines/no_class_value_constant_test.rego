package semantickit.design_guidelines.no_class_value_constant

test_denies_agent_class_value if {
  result := decision with input as agent_class_value_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_class_value_constant"
  result.deny[0].line == 3
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_read_class_value if {
  result := decision with input as read_class_value_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_class_value_constant"
  result.deny[0].line == 6
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_class_value if {
  result := decision with input as qualified_class_value_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_class_value_constant"
  result.deny[0].line == 9
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_class_type if {
  result := decision with input as class_type_node

  count(result.deny) == 0
}

test_allows_property_on_individual if {
  result := decision with input as property_on_individual_node

  count(result.deny) == 0
}

# Parser output for `Foaf.agentClass` at 3:9.
agent_class_value_node := {"declReferenceExprs": [{"baseName": "Foaf", "range": {"end": {"column": 13, "line": 3}, "start": {"column": 9, "line": 3}}}, {"baseName": "agentClass", "range": {"end": {"column": 24, "line": 3}, "start": {"column": 14, "line": 3}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Foaf", "range": {"end": {"column": 13, "line": 3}, "start": {"column": 9, "line": 3}}}}, "declName": {"baseName": "agentClass", "range": {"end": {"column": 24, "line": 3}, "start": {"column": 14, "line": 3}}}, "range": {"end": {"column": 24, "line": 3}, "start": {"column": 9, "line": 3}}}]}

# Parser output for `ACL.readClass` at 6:9.
read_class_value_node := {"declReferenceExprs": [{"baseName": "ACL", "range": {"end": {"column": 12, "line": 6}, "start": {"column": 9, "line": 6}}}, {"baseName": "readClass", "range": {"end": {"column": 22, "line": 6}, "start": {"column": 13, "line": 6}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "ACL", "range": {"end": {"column": 12, "line": 6}, "start": {"column": 9, "line": 6}}}}, "declName": {"baseName": "readClass", "range": {"end": {"column": 22, "line": 6}, "start": {"column": 13, "line": 6}}}, "range": {"end": {"column": 22, "line": 6}, "start": {"column": 9, "line": 6}}}]}

# Parser output for `Vocabularies.Foaf.personClass` at 9:9.
qualified_class_value_node := {"declReferenceExprs": [{"baseName": "Vocabularies", "range": {"end": {"column": 21, "line": 9}, "start": {"column": 9, "line": 9}}}, {"baseName": "Foaf", "range": {"end": {"column": 26, "line": 9}, "start": {"column": 22, "line": 9}}}, {"baseName": "personClass", "range": {"end": {"column": 38, "line": 9}, "start": {"column": 27, "line": 9}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Vocabularies", "range": {"end": {"column": 21, "line": 9}, "start": {"column": 9, "line": 9}}}}, "declName": {"baseName": "Foaf", "range": {"end": {"column": 26, "line": 9}, "start": {"column": 22, "line": 9}}}, "range": {"end": {"column": 26, "line": 9}, "start": {"column": 9, "line": 9}}}}, "declName": {"baseName": "personClass", "range": {"end": {"column": 38, "line": 9}, "start": {"column": 27, "line": 9}}}, "range": {"end": {"column": 38, "line": 9}, "start": {"column": 9, "line": 9}}}, {"base": {"declReferenceExpr": {"baseName": "Vocabularies", "range": {"end": {"column": 21, "line": 9}, "start": {"column": 9, "line": 9}}}}, "declName": {"baseName": "Foaf", "range": {"end": {"column": 26, "line": 9}, "start": {"column": 22, "line": 9}}}, "range": {"end": {"column": 26, "line": 9}, "start": {"column": 9, "line": 9}}}]}

# Parser output for `Foaf.Agent` at 12:9.
class_type_node := {"declReferenceExprs": [{"baseName": "Foaf", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 9, "line": 12}}}, {"baseName": "Agent", "range": {"end": {"column": 19, "line": 12}, "start": {"column": 14, "line": 12}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Foaf", "range": {"end": {"column": 13, "line": 12}, "start": {"column": 9, "line": 12}}}}, "declName": {"baseName": "Agent", "range": {"end": {"column": 19, "line": 12}, "start": {"column": 14, "line": 12}}}, "range": {"end": {"column": 19, "line": 12}, "start": {"column": 9, "line": 12}}}]}

# Parser output for `authorization.agentClass` at 15:9.
property_on_individual_node := {"declReferenceExprs": [{"baseName": "authorization", "range": {"end": {"column": 22, "line": 15}, "start": {"column": 9, "line": 15}}}, {"baseName": "agentClass", "range": {"end": {"column": 33, "line": 15}, "start": {"column": 23, "line": 15}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "authorization", "range": {"end": {"column": 22, "line": 15}, "start": {"column": 9, "line": 15}}}}, "declName": {"baseName": "agentClass", "range": {"end": {"column": 33, "line": 15}, "start": {"column": 23, "line": 15}}}, "range": {"end": {"column": 33, "line": 15}, "start": {"column": 9, "line": 15}}}]}
