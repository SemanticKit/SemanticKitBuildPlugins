package semantickit.design_guidelines.no_term_reference_by_name

test_denies_domain_by_string if {
  result := decision with input as domain_by_string_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 4
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_range_by_iri if {
  result := decision with input as range_by_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 7
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_subclass_by_metatype if {
  result := decision with input as subclass_by_metatype_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 10
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_domain_by_generic_argument if {
  result := decision with input as domain_by_generic_argument_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 13
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_domain_by_type if {
  result := decision with input as domain_by_type_node

  count(result.deny) == 0
}

test_allows_subclass_by_type if {
  result := decision with input as subclass_by_type_node

  count(result.deny) == 0
}

# Parser output for `Domain("Animal")` at 4:13.
domain_by_string_node := {"declReferenceExprs": [{"baseName": "Domain", "range": {"end": {"column": 19, "line": 4}, "start": {"column": 13, "line": 4}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 4}, "start": {"column": 20, "line": 4}}, "segments": [{"stringSegment": {"content": "Animal", "range": {"end": {"column": 27, "line": 4}, "start": {"column": 21, "line": 4}}}}]}}, "range": {"end": {"column": 28, "line": 4}, "start": {"column": 20, "line": 4}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 4}, "start": {"column": 13, "line": 4}}}}, "range": {"end": {"column": 29, "line": 4}, "start": {"column": 13, "line": 4}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 4}, "start": {"column": 20, "line": 4}}, "segments": [{"stringSegment": {"content": "Animal", "range": {"end": {"column": 27, "line": 4}, "start": {"column": 21, "line": 4}}}}]}]}

# Parser output for `Range(IRI("http://example.org/fauna#Habitat"))` at 7:13.
range_by_iri_node := {"declReferenceExprs": [{"baseName": "Range", "range": {"end": {"column": 18, "line": 7}, "start": {"column": 13, "line": 7}}}, {"baseName": "IRI", "range": {"end": {"column": 22, "line": 7}, "start": {"column": 19, "line": 7}}}], "functionCallExprs": [{"arguments": [{"expression": {"functionCallExpr": {"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 57, "line": 7}, "start": {"column": 23, "line": 7}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 56, "line": 7}, "start": {"column": 24, "line": 7}}}}]}}, "range": {"end": {"column": 57, "line": 7}, "start": {"column": 23, "line": 7}}}], "calledExpression": {"declReferenceExpr": {"baseName": "IRI", "range": {"end": {"column": 22, "line": 7}, "start": {"column": 19, "line": 7}}}}, "range": {"end": {"column": 58, "line": 7}, "start": {"column": 19, "line": 7}}}}, "range": {"end": {"column": 58, "line": 7}, "start": {"column": 19, "line": 7}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Range", "range": {"end": {"column": 18, "line": 7}, "start": {"column": 13, "line": 7}}}}, "range": {"end": {"column": 59, "line": 7}, "start": {"column": 13, "line": 7}}}, {"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 57, "line": 7}, "start": {"column": 23, "line": 7}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 56, "line": 7}, "start": {"column": 24, "line": 7}}}}]}}, "range": {"end": {"column": 57, "line": 7}, "start": {"column": 23, "line": 7}}}], "calledExpression": {"declReferenceExpr": {"baseName": "IRI", "range": {"end": {"column": 22, "line": 7}, "start": {"column": 19, "line": 7}}}}, "range": {"end": {"column": 58, "line": 7}, "start": {"column": 19, "line": 7}}}], "stringLiteralExprs": [{"range": {"end": {"column": 57, "line": 7}, "start": {"column": 23, "line": 7}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 56, "line": 7}, "start": {"column": 24, "line": 7}}}}]}]}

# Parser output for `SubClassOf(Fauna.Animal.self)` at 10:13.
subclass_by_metatype_node := {"declReferenceExprs": [{"baseName": "SubClassOf", "range": {"end": {"column": 23, "line": 10}, "start": {"column": 13, "line": 10}}}, {"baseName": "Fauna", "range": {"end": {"column": 29, "line": 10}, "start": {"column": 24, "line": 10}}}, {"baseName": "Animal", "range": {"end": {"column": 36, "line": 10}, "start": {"column": 30, "line": 10}}}, {"baseName": "self", "range": {"end": {"column": 41, "line": 10}, "start": {"column": 37, "line": 10}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 29, "line": 10}, "start": {"column": 24, "line": 10}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 36, "line": 10}, "start": {"column": 30, "line": 10}}}, "range": {"end": {"column": 36, "line": 10}, "start": {"column": 24, "line": 10}}}}, "declName": {"baseName": "self", "range": {"end": {"column": 41, "line": 10}, "start": {"column": 37, "line": 10}}}, "range": {"end": {"column": 41, "line": 10}, "start": {"column": 24, "line": 10}}}}, "range": {"end": {"column": 41, "line": 10}, "start": {"column": 24, "line": 10}}}], "calledExpression": {"declReferenceExpr": {"baseName": "SubClassOf", "range": {"end": {"column": 23, "line": 10}, "start": {"column": 13, "line": 10}}}}, "range": {"end": {"column": 42, "line": 10}, "start": {"column": 13, "line": 10}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 29, "line": 10}, "start": {"column": 24, "line": 10}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 36, "line": 10}, "start": {"column": 30, "line": 10}}}, "range": {"end": {"column": 36, "line": 10}, "start": {"column": 24, "line": 10}}}}, "declName": {"baseName": "self", "range": {"end": {"column": 41, "line": 10}, "start": {"column": 37, "line": 10}}}, "range": {"end": {"column": 41, "line": 10}, "start": {"column": 24, "line": 10}}}, {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 29, "line": 10}, "start": {"column": 24, "line": 10}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 36, "line": 10}, "start": {"column": 30, "line": 10}}}, "range": {"end": {"column": 36, "line": 10}, "start": {"column": 24, "line": 10}}}]}

# Parser output for `Domain<Fauna.Animal>()` at 13:13.
domain_by_generic_argument_node := {"declReferenceExprs": [{"baseName": "Domain", "range": {"end": {"column": 19, "line": 13}, "start": {"column": 13, "line": 13}}}], "functionCallExprs": [{"calledExpression": {"genericSpecializationExpr": {"expression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 13}, "start": {"column": 13, "line": 13}}}}, "genericArgumentClause": {"arguments": [{"argument": {"type": {"memberType": {"baseType": {"identifierType": {"name": "Fauna", "range": {"end": {"column": 25, "line": 13}, "start": {"column": 20, "line": 13}}}}, "name": "Animal", "range": {"end": {"column": 32, "line": 13}, "start": {"column": 20, "line": 13}}}}}, "range": {"end": {"column": 32, "line": 13}, "start": {"column": 20, "line": 13}}}], "range": {"end": {"column": 33, "line": 13}, "start": {"column": 19, "line": 13}}}, "range": {"end": {"column": 33, "line": 13}, "start": {"column": 13, "line": 13}}}}, "range": {"end": {"column": 35, "line": 13}, "start": {"column": 13, "line": 13}}}], "genericSpecializationExprs": [{"expression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 13}, "start": {"column": 13, "line": 13}}}}, "genericArgumentClause": {"arguments": [{"argument": {"type": {"memberType": {"baseType": {"identifierType": {"name": "Fauna", "range": {"end": {"column": 25, "line": 13}, "start": {"column": 20, "line": 13}}}}, "name": "Animal", "range": {"end": {"column": 32, "line": 13}, "start": {"column": 20, "line": 13}}}}}, "range": {"end": {"column": 32, "line": 13}, "start": {"column": 20, "line": 13}}}], "range": {"end": {"column": 33, "line": 13}, "start": {"column": 19, "line": 13}}}, "range": {"end": {"column": 33, "line": 13}, "start": {"column": 13, "line": 13}}}], "identifierTypes": [{"name": "Fauna", "range": {"end": {"column": 25, "line": 13}, "start": {"column": 20, "line": 13}}}], "memberTypes": [{"baseType": {"identifierType": {"name": "Fauna", "range": {"end": {"column": 25, "line": 13}, "start": {"column": 20, "line": 13}}}}, "name": "Animal", "range": {"end": {"column": 32, "line": 13}, "start": {"column": 20, "line": 13}}}]}

# Parser output for `Domain(Fauna.Animal)` at 16:13.
domain_by_type_node := {"declReferenceExprs": [{"baseName": "Domain", "range": {"end": {"column": 19, "line": 16}, "start": {"column": 13, "line": 16}}}, {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 16}, "start": {"column": 20, "line": 16}}}, {"baseName": "Animal", "range": {"end": {"column": 32, "line": 16}, "start": {"column": 26, "line": 16}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 16}, "start": {"column": 20, "line": 16}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 32, "line": 16}, "start": {"column": 26, "line": 16}}}, "range": {"end": {"column": 32, "line": 16}, "start": {"column": 20, "line": 16}}}}, "range": {"end": {"column": 32, "line": 16}, "start": {"column": 20, "line": 16}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 16}, "start": {"column": 13, "line": 16}}}}, "range": {"end": {"column": 33, "line": 16}, "start": {"column": 13, "line": 16}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 16}, "start": {"column": 20, "line": 16}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 32, "line": 16}, "start": {"column": 26, "line": 16}}}, "range": {"end": {"column": 32, "line": 16}, "start": {"column": 20, "line": 16}}}]}

# Parser output for `SubClassOf(RDFS.Resource)` at 19:13.
subclass_by_type_node := {"declReferenceExprs": [{"baseName": "SubClassOf", "range": {"end": {"column": 23, "line": 19}, "start": {"column": 13, "line": 19}}}, {"baseName": "RDFS", "range": {"end": {"column": 28, "line": 19}, "start": {"column": 24, "line": 19}}}, {"baseName": "Resource", "range": {"end": {"column": 37, "line": 19}, "start": {"column": 29, "line": 19}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "RDFS", "range": {"end": {"column": 28, "line": 19}, "start": {"column": 24, "line": 19}}}}, "declName": {"baseName": "Resource", "range": {"end": {"column": 37, "line": 19}, "start": {"column": 29, "line": 19}}}, "range": {"end": {"column": 37, "line": 19}, "start": {"column": 24, "line": 19}}}}, "range": {"end": {"column": 37, "line": 19}, "start": {"column": 24, "line": 19}}}], "calledExpression": {"declReferenceExpr": {"baseName": "SubClassOf", "range": {"end": {"column": 23, "line": 19}, "start": {"column": 13, "line": 19}}}}, "range": {"end": {"column": 38, "line": 19}, "start": {"column": 13, "line": 19}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "RDFS", "range": {"end": {"column": 28, "line": 19}, "start": {"column": 24, "line": 19}}}}, "declName": {"baseName": "Resource", "range": {"end": {"column": 37, "line": 19}, "start": {"column": 29, "line": 19}}}, "range": {"end": {"column": 37, "line": 19}, "start": {"column": 24, "line": 19}}}]}

test_denies_domain_by_iri_projection if {
  result := decision with input as domain_by_iri_projection_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 30
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_range_by_raw_value if {
  result := decision with input as range_by_raw_value_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 33
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_range_by_try_iri if {
  result := decision with input as range_by_try_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 36
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_domain_by_qualified_type if {
  result := decision with input as domain_by_qualified_type_node

  count(result.deny) == 0
}

# Parser output for `Domain(Fauna.Animal.iri)` at 30:13.
domain_by_iri_projection_node := {"declReferenceExprs": [{"baseName": "Domain", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 13, "line": 30}}}, {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}, {"baseName": "Animal", "range": {"end": {"column": 32, "line": 30}, "start": {"column": 26, "line": 30}}}, {"baseName": "iri", "range": {"end": {"column": 36, "line": 30}, "start": {"column": 33, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 32, "line": 30}, "start": {"column": 26, "line": 30}}}, "range": {"end": {"column": 32, "line": 30}, "start": {"column": 20, "line": 30}}}}, "declName": {"baseName": "iri", "range": {"end": {"column": 36, "line": 30}, "start": {"column": 33, "line": 30}}}, "range": {"end": {"column": 36, "line": 30}, "start": {"column": 20, "line": 30}}}}, "range": {"end": {"column": 36, "line": 30}, "start": {"column": 20, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 30}, "start": {"column": 13, "line": 30}}}}, "range": {"end": {"column": 37, "line": 30}, "start": {"column": 13, "line": 30}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 32, "line": 30}, "start": {"column": 26, "line": 30}}}, "range": {"end": {"column": 32, "line": 30}, "start": {"column": 20, "line": 30}}}}, "declName": {"baseName": "iri", "range": {"end": {"column": 36, "line": 30}, "start": {"column": 33, "line": 30}}}, "range": {"end": {"column": 36, "line": 30}, "start": {"column": 20, "line": 30}}}, {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 25, "line": 30}, "start": {"column": 20, "line": 30}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 32, "line": 30}, "start": {"column": 26, "line": 30}}}, "range": {"end": {"column": 32, "line": 30}, "start": {"column": 20, "line": 30}}}]}

# Parser output for `Range(Fauna.Habitat.rawValue)` at 33:13.
range_by_raw_value_node := {"declReferenceExprs": [{"baseName": "Range", "range": {"end": {"column": 18, "line": 33}, "start": {"column": 13, "line": 33}}}, {"baseName": "Fauna", "range": {"end": {"column": 24, "line": 33}, "start": {"column": 19, "line": 33}}}, {"baseName": "Habitat", "range": {"end": {"column": 32, "line": 33}, "start": {"column": 25, "line": 33}}}, {"baseName": "rawValue", "range": {"end": {"column": 41, "line": 33}, "start": {"column": 33, "line": 33}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 24, "line": 33}, "start": {"column": 19, "line": 33}}}}, "declName": {"baseName": "Habitat", "range": {"end": {"column": 32, "line": 33}, "start": {"column": 25, "line": 33}}}, "range": {"end": {"column": 32, "line": 33}, "start": {"column": 19, "line": 33}}}}, "declName": {"baseName": "rawValue", "range": {"end": {"column": 41, "line": 33}, "start": {"column": 33, "line": 33}}}, "range": {"end": {"column": 41, "line": 33}, "start": {"column": 19, "line": 33}}}}, "range": {"end": {"column": 41, "line": 33}, "start": {"column": 19, "line": 33}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Range", "range": {"end": {"column": 18, "line": 33}, "start": {"column": 13, "line": 33}}}}, "range": {"end": {"column": 42, "line": 33}, "start": {"column": 13, "line": 33}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 24, "line": 33}, "start": {"column": 19, "line": 33}}}}, "declName": {"baseName": "Habitat", "range": {"end": {"column": 32, "line": 33}, "start": {"column": 25, "line": 33}}}, "range": {"end": {"column": 32, "line": 33}, "start": {"column": 19, "line": 33}}}}, "declName": {"baseName": "rawValue", "range": {"end": {"column": 41, "line": 33}, "start": {"column": 33, "line": 33}}}, "range": {"end": {"column": 41, "line": 33}, "start": {"column": 19, "line": 33}}}, {"base": {"declReferenceExpr": {"baseName": "Fauna", "range": {"end": {"column": 24, "line": 33}, "start": {"column": 19, "line": 33}}}}, "declName": {"baseName": "Habitat", "range": {"end": {"column": 32, "line": 33}, "start": {"column": 25, "line": 33}}}, "range": {"end": {"column": 32, "line": 33}, "start": {"column": 19, "line": 33}}}]}

# Parser output for `Range(try! IRI(validating: "http://example.org/fauna#Habitat"))` at 36:13.
range_by_try_iri_node := {"declReferenceExprs": [{"baseName": "Range", "range": {"end": {"column": 18, "line": 36}, "start": {"column": 13, "line": 36}}}, {"baseName": "IRI", "range": {"end": {"column": 27, "line": 36}, "start": {"column": 24, "line": 36}}}], "functionCallExprs": [{"arguments": [{"expression": {"tryExpr": {"expression": {"functionCallExpr": {"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 74, "line": 36}, "start": {"column": 40, "line": 36}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 73, "line": 36}, "start": {"column": 41, "line": 36}}}}]}}, "label": "validating", "range": {"end": {"column": 74, "line": 36}, "start": {"column": 28, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "IRI", "range": {"end": {"column": 27, "line": 36}, "start": {"column": 24, "line": 36}}}}, "range": {"end": {"column": 75, "line": 36}, "start": {"column": 24, "line": 36}}}}, "questionOrExclamationMark": "!", "range": {"end": {"column": 75, "line": 36}, "start": {"column": 19, "line": 36}}}}, "range": {"end": {"column": 75, "line": 36}, "start": {"column": 19, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Range", "range": {"end": {"column": 18, "line": 36}, "start": {"column": 13, "line": 36}}}}, "range": {"end": {"column": 76, "line": 36}, "start": {"column": 13, "line": 36}}}, {"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 74, "line": 36}, "start": {"column": 40, "line": 36}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 73, "line": 36}, "start": {"column": 41, "line": 36}}}}]}}, "label": "validating", "range": {"end": {"column": 74, "line": 36}, "start": {"column": 28, "line": 36}}}], "calledExpression": {"declReferenceExpr": {"baseName": "IRI", "range": {"end": {"column": 27, "line": 36}, "start": {"column": 24, "line": 36}}}}, "range": {"end": {"column": 75, "line": 36}, "start": {"column": 24, "line": 36}}}], "stringLiteralExprs": [{"range": {"end": {"column": 74, "line": 36}, "start": {"column": 40, "line": 36}}, "segments": [{"stringSegment": {"content": "http://example.org/fauna#Habitat", "range": {"end": {"column": 73, "line": 36}, "start": {"column": 41, "line": 36}}}}]}]}

# Parser output for `Domain(Vocabularies.Fauna.Animal)` at 39:13.
domain_by_qualified_type_node := {"declReferenceExprs": [{"baseName": "Domain", "range": {"end": {"column": 19, "line": 39}, "start": {"column": 13, "line": 39}}}, {"baseName": "Vocabularies", "range": {"end": {"column": 32, "line": 39}, "start": {"column": 20, "line": 39}}}, {"baseName": "Fauna", "range": {"end": {"column": 38, "line": 39}, "start": {"column": 33, "line": 39}}}, {"baseName": "Animal", "range": {"end": {"column": 45, "line": 39}, "start": {"column": 39, "line": 39}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Vocabularies", "range": {"end": {"column": 32, "line": 39}, "start": {"column": 20, "line": 39}}}}, "declName": {"baseName": "Fauna", "range": {"end": {"column": 38, "line": 39}, "start": {"column": 33, "line": 39}}}, "range": {"end": {"column": 38, "line": 39}, "start": {"column": 20, "line": 39}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 45, "line": 39}, "start": {"column": 39, "line": 39}}}, "range": {"end": {"column": 45, "line": 39}, "start": {"column": 20, "line": 39}}}}, "range": {"end": {"column": 45, "line": 39}, "start": {"column": 20, "line": 39}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Domain", "range": {"end": {"column": 19, "line": 39}, "start": {"column": 13, "line": 39}}}}, "range": {"end": {"column": 46, "line": 39}, "start": {"column": 13, "line": 39}}}], "memberAccessExprs": [{"base": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "Vocabularies", "range": {"end": {"column": 32, "line": 39}, "start": {"column": 20, "line": 39}}}}, "declName": {"baseName": "Fauna", "range": {"end": {"column": 38, "line": 39}, "start": {"column": 33, "line": 39}}}, "range": {"end": {"column": 38, "line": 39}, "start": {"column": 20, "line": 39}}}}, "declName": {"baseName": "Animal", "range": {"end": {"column": 45, "line": 39}, "start": {"column": 39, "line": 39}}}, "range": {"end": {"column": 45, "line": 39}, "start": {"column": 20, "line": 39}}}, {"base": {"declReferenceExpr": {"baseName": "Vocabularies", "range": {"end": {"column": 32, "line": 39}, "start": {"column": 20, "line": 39}}}}, "declName": {"baseName": "Fauna", "range": {"end": {"column": 38, "line": 39}, "start": {"column": 33, "line": 39}}}, "range": {"end": {"column": 38, "line": 39}, "start": {"column": 20, "line": 39}}}]}

test_denies_range_by_concatenated_string if {
  result := decision with input as range_by_concatenated_string_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 42
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_range_by_interpolated_string if {
  result := decision with input as range_by_interpolated_string_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_reference_by_name"
  result.deny[0].line == 45
  result.deny[0].column == 13
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

# Parser output for `Range("http://www.w3.org/2001/XMLSchema#" + "nonNegativeInteger")` at 42:13.
range_by_concatenated_string_node := {"declReferenceExprs": [{"baseName": "Range", "range": {"end": {"column": 18, "line": 42}, "start": {"column": 13, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"infixOperatorExpr": {"leftOperand": {"stringLiteralExpr": {"range": {"end": {"column": 54, "line": 42}, "start": {"column": 19, "line": 42}}, "segments": [{"stringSegment": {"content": "http://www.w3.org/2001/XMLSchema#", "range": {"end": {"column": 53, "line": 42}, "start": {"column": 20, "line": 42}}}}]}}, "operator": {"binaryOperatorExpr": {"operator": "+", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 55, "line": 42}}}}, "range": {"end": {"column": 77, "line": 42}, "start": {"column": 19, "line": 42}}, "rightOperand": {"stringLiteralExpr": {"range": {"end": {"column": 77, "line": 42}, "start": {"column": 57, "line": 42}}, "segments": [{"stringSegment": {"content": "nonNegativeInteger", "range": {"end": {"column": 76, "line": 42}, "start": {"column": 58, "line": 42}}}}]}}}}, "range": {"end": {"column": 77, "line": 42}, "start": {"column": 19, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Range", "range": {"end": {"column": 18, "line": 42}, "start": {"column": 13, "line": 42}}}}, "range": {"end": {"column": 78, "line": 42}, "start": {"column": 13, "line": 42}}}], "infixOperatorExprs": [{"leftOperand": {"stringLiteralExpr": {"range": {"end": {"column": 54, "line": 42}, "start": {"column": 19, "line": 42}}, "segments": [{"stringSegment": {"content": "http://www.w3.org/2001/XMLSchema#", "range": {"end": {"column": 53, "line": 42}, "start": {"column": 20, "line": 42}}}}]}}, "operator": {"binaryOperatorExpr": {"operator": "+", "range": {"end": {"column": 56, "line": 42}, "start": {"column": 55, "line": 42}}}}, "range": {"end": {"column": 77, "line": 42}, "start": {"column": 19, "line": 42}}, "rightOperand": {"stringLiteralExpr": {"range": {"end": {"column": 77, "line": 42}, "start": {"column": 57, "line": 42}}, "segments": [{"stringSegment": {"content": "nonNegativeInteger", "range": {"end": {"column": 76, "line": 42}, "start": {"column": 58, "line": 42}}}}]}}}], "stringLiteralExprs": [{"range": {"end": {"column": 54, "line": 42}, "start": {"column": 19, "line": 42}}, "segments": [{"stringSegment": {"content": "http://www.w3.org/2001/XMLSchema#", "range": {"end": {"column": 53, "line": 42}, "start": {"column": 20, "line": 42}}}}]}, {"range": {"end": {"column": 77, "line": 42}, "start": {"column": 57, "line": 42}}, "segments": [{"stringSegment": {"content": "nonNegativeInteger", "range": {"end": {"column": 76, "line": 42}, "start": {"column": 58, "line": 42}}}}]}]}

# Parser output for `Range("\(xsd)nonNegativeInteger")` at 45:13.
range_by_interpolated_string_node := {"declReferenceExprs": [{"baseName": "Range", "range": {"end": {"column": 18, "line": 45}, "start": {"column": 13, "line": 45}}}, {"baseName": "xsd", "range": {"end": {"column": 25, "line": 45}, "start": {"column": 22, "line": 45}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 45, "line": 45}, "start": {"column": 19, "line": 45}}, "segments": [{"stringSegment": {"content": "", "range": {"end": {"column": 20, "line": 45}, "start": {"column": 20, "line": 45}}}}, {"expressionSegment": {"expressions": [{"expression": {"declReferenceExpr": {"baseName": "xsd", "range": {"end": {"column": 25, "line": 45}, "start": {"column": 22, "line": 45}}}}, "range": {"end": {"column": 25, "line": 45}, "start": {"column": 22, "line": 45}}}], "range": {"end": {"column": 26, "line": 45}, "start": {"column": 20, "line": 45}}}}, {"stringSegment": {"content": "nonNegativeInteger", "range": {"end": {"column": 44, "line": 45}, "start": {"column": 26, "line": 45}}}}]}}, "range": {"end": {"column": 45, "line": 45}, "start": {"column": 19, "line": 45}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Range", "range": {"end": {"column": 18, "line": 45}, "start": {"column": 13, "line": 45}}}}, "range": {"end": {"column": 46, "line": 45}, "start": {"column": 13, "line": 45}}}], "stringLiteralExprs": [{"range": {"end": {"column": 45, "line": 45}, "start": {"column": 19, "line": 45}}, "segments": [{"stringSegment": {"content": "", "range": {"end": {"column": 20, "line": 45}, "start": {"column": 20, "line": 45}}}}, {"expressionSegment": {"expressions": [{"expression": {"declReferenceExpr": {"baseName": "xsd", "range": {"end": {"column": 25, "line": 45}, "start": {"column": 22, "line": 45}}}}, "range": {"end": {"column": 25, "line": 45}, "start": {"column": 22, "line": 45}}}], "range": {"end": {"column": 26, "line": 45}, "start": {"column": 20, "line": 45}}}}, {"stringSegment": {"content": "nonNegativeInteger", "range": {"end": {"column": 44, "line": 45}, "start": {"column": 26, "line": 45}}}}]}]}
