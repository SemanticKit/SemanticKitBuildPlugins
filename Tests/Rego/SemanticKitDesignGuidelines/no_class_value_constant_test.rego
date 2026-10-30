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
agent_class_value_node := {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 3, "column": 9}, "end": {"line": 3, "column": 24}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 3, "column": 9}, "end": {"line": 3, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 9}, "end": {"line": 3, "column": 13}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 14}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 3, "column": 14}, "end": {"line": 3, "column": 24}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 14}, "end": {"line": 3, "column": 24}}, "token": {"kind": "identifier", "text": "agentClass"}, "children": []},
  ]},
]}

# Parser output for `ACL.readClass` at 6:9.
read_class_value_node := {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 6, "column": 9}, "end": {"line": 6, "column": 22}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 6, "column": 9}, "end": {"line": 6, "column": 12}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 9}, "end": {"line": 6, "column": 12}}, "token": {"kind": "identifier", "text": "ACL"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 12}, "end": {"line": 6, "column": 13}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 6, "column": 13}, "end": {"line": 6, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 13}, "end": {"line": 6, "column": 22}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
  ]},
]}

# Parser output for `Vocabularies.Foaf.personClass` at 9:9.
qualified_class_value_node := {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 38}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 26}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 21}}, "token": {"kind": "identifier", "text": "Vocabularies"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 21}, "end": {"line": 9, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 22}, "end": {"line": 9, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 22}, "end": {"line": 9, "column": 26}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 27}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 38}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 38}}, "token": {"kind": "identifier", "text": "personClass"}, "children": []},
  ]},
]}

# Parser output for `Foaf.Agent` at 12:9.
class_type_node := {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 19}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 13}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 14}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 19}}, "token": {"kind": "identifier", "text": "Agent"}, "children": []},
  ]},
]}

# Parser output for `authorization.agentClass` at 15:9.
property_on_individual_node := {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 33}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 22}}, "token": {"kind": "identifier", "text": "authorization"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 22}, "end": {"line": 15, "column": 23}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 23}, "end": {"line": 15, "column": 33}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 23}, "end": {"line": 15, "column": 33}}, "token": {"kind": "identifier", "text": "agentClass"}, "children": []},
  ]},
]}
