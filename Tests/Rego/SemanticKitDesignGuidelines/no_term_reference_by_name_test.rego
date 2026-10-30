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
domain_by_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 29}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 19}}, "token": {"kind": "identifier", "text": "Domain"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 19}, "end": {"line": 4, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 4, "column": 20}, "end": {"line": 4, "column": 28}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 4, "column": 20}, "end": {"line": 4, "column": 28}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 4, "column": 20}, "end": {"line": 4, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 20}, "end": {"line": 4, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "token": {"kind": "stringSegment", "text": "Animal"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 27}, "end": {"line": 4, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 28}, "end": {"line": 4, "column": 29}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 4, "column": 29}, "end": {"line": 4, "column": 29}}, "children": []},
]}

# Parser output for `Range(IRI("http://example.org/fauna#Habitat"))` at 7:13.
range_by_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 7, "column": 13}, "end": {"line": 7, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 13}, "end": {"line": 7, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 13}, "end": {"line": 7, "column": 18}}, "token": {"kind": "identifier", "text": "Range"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 18}, "end": {"line": 7, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 58}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 58}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 22}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 22}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 22}, "end": {"line": 7, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 57}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 57}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 57}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 7, "column": 24}, "end": {"line": 7, "column": 56}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 7, "column": 24}, "end": {"line": 7, "column": 56}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 24}, "end": {"line": 7, "column": 56}}, "token": {"kind": "stringSegment", "text": "http:\/\/example.org\/fauna#Habitat"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 56}, "end": {"line": 7, "column": 57}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 57}, "end": {"line": 7, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 7, "column": 58}, "end": {"line": 7, "column": 58}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 58}, "end": {"line": 7, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 7, "column": 59}, "end": {"line": 7, "column": 59}}, "children": []},
]}

# Parser output for `SubClassOf(Fauna.Animal.self)` at 10:13.
subclass_by_metatype_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 10, "column": 13}, "end": {"line": 10, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 10, "column": 13}, "end": {"line": 10, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 13}, "end": {"line": 10, "column": 23}}, "token": {"kind": "identifier", "text": "SubClassOf"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 23}, "end": {"line": 10, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 41}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 41}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 36}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 24}, "end": {"line": 10, "column": 29}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 29}, "end": {"line": 10, "column": 30}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 10, "column": 30}, "end": {"line": 10, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 30}, "end": {"line": 10, "column": 36}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 36}, "end": {"line": 10, "column": 37}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 10, "column": 37}, "end": {"line": 10, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 37}, "end": {"line": 10, "column": 41}}, "token": {"kind": "keyword", "text": "self"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 41}, "end": {"line": 10, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 10, "column": 42}, "end": {"line": 10, "column": 42}}, "children": []},
]}

# Parser output for `Domain<Fauna.Animal>()` at 13:13.
domain_by_generic_argument_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 13, "column": 13}, "end": {"line": 13, "column": 35}}, "children": [
  {"type": "GenericSpecializationExprSyntax", "range": {"start": {"line": 13, "column": 13}, "end": {"line": 13, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 13}, "end": {"line": 13, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 13}, "end": {"line": 13, "column": 19}}, "token": {"kind": "identifier", "text": "Domain"}, "children": []},
    ]},
    {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 13, "column": 19}, "end": {"line": 13, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 19}, "end": {"line": 13, "column": 20}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
      {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 13, "column": 20}, "end": {"line": 13, "column": 32}}, "children": [
        {"type": "GenericArgumentSyntax", "range": {"start": {"line": 13, "column": 20}, "end": {"line": 13, "column": 32}}, "children": [
          {"type": "MemberTypeSyntax", "range": {"start": {"line": 13, "column": 20}, "end": {"line": 13, "column": 32}}, "children": [
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 13, "column": 20}, "end": {"line": 13, "column": 25}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 20}, "end": {"line": 13, "column": 25}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 25}, "end": {"line": 13, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 26}, "end": {"line": 13, "column": 32}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 32}, "end": {"line": 13, "column": 33}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 33}, "end": {"line": 13, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 13, "column": 34}, "end": {"line": 13, "column": 34}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 34}, "end": {"line": 13, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 13, "column": 35}, "end": {"line": 13, "column": 35}}, "children": []},
]}

# Parser output for `Domain(Fauna.Animal)` at 16:13.
domain_by_type_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 13}, "end": {"line": 16, "column": 33}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 13}, "end": {"line": 16, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 13}, "end": {"line": 16, "column": 19}}, "token": {"kind": "identifier", "text": "Domain"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 19}, "end": {"line": 16, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 32}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 32}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 32}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 25}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 20}, "end": {"line": 16, "column": 25}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 25}, "end": {"line": 16, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 26}, "end": {"line": 16, "column": 32}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 26}, "end": {"line": 16, "column": 32}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 32}, "end": {"line": 16, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 33}, "end": {"line": 16, "column": 33}}, "children": []},
]}

# Parser output for `SubClassOf(RDFS.Resource)` at 19:13.
subclass_by_type_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 19, "column": 13}, "end": {"line": 19, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 13}, "end": {"line": 19, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 13}, "end": {"line": 19, "column": 23}}, "token": {"kind": "identifier", "text": "SubClassOf"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 23}, "end": {"line": 19, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 37}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 37}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 28}}, "token": {"kind": "identifier", "text": "RDFS"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 28}, "end": {"line": 19, "column": 29}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 29}, "end": {"line": 19, "column": 37}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 29}, "end": {"line": 19, "column": 37}}, "token": {"kind": "identifier", "text": "Resource"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 37}, "end": {"line": 19, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 19, "column": 38}, "end": {"line": 19, "column": 38}}, "children": []},
]}

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
domain_by_iri_projection_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 19}}, "token": {"kind": "identifier", "text": "Domain"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 19}, "end": {"line": 30, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 36}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 36}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 32}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 25}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 25}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 25}, "end": {"line": 30, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 26}, "end": {"line": 30, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 26}, "end": {"line": 30, "column": 32}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 32}, "end": {"line": 30, "column": 33}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 36}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 37}}, "children": []},
]}

# Parser output for `Range(Fauna.Habitat.rawValue)` at 33:13.
range_by_raw_value_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 13}, "end": {"line": 33, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 13}, "end": {"line": 33, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 13}, "end": {"line": 33, "column": 18}}, "token": {"kind": "identifier", "text": "Range"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 41}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 41}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 32}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 19}, "end": {"line": 33, "column": 24}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 24}, "end": {"line": 33, "column": 25}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 32}}, "token": {"kind": "identifier", "text": "Habitat"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 32}, "end": {"line": 33, "column": 33}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 33}, "end": {"line": 33, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 33}, "end": {"line": 33, "column": 41}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 41}, "end": {"line": 33, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 42}, "end": {"line": 33, "column": 42}}, "children": []},
]}

# Parser output for `Range(try! IRI(validating: "http://example.org/fauna#Habitat"))` at 36:13.
range_by_try_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 76}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 18}}, "token": {"kind": "identifier", "text": "Range"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 18}, "end": {"line": 36, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 19}, "end": {"line": 36, "column": 75}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 19}, "end": {"line": 36, "column": 75}}, "children": [
      {"type": "TryExprSyntax", "range": {"start": {"line": 36, "column": 19}, "end": {"line": 36, "column": 75}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 19}, "end": {"line": 36, "column": 22}}, "token": {"kind": "keyword", "text": "try"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 22}, "end": {"line": 36, "column": 23}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 75}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 24}, "end": {"line": 36, "column": 27}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 27}, "end": {"line": 36, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 28}, "end": {"line": 36, "column": 74}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 28}, "end": {"line": 36, "column": 74}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 28}, "end": {"line": 36, "column": 38}}, "token": {"kind": "identifier", "text": "validating"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 38}, "end": {"line": 36, "column": 39}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 74}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 41}, "end": {"line": 36, "column": 73}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 41}, "end": {"line": 36, "column": 73}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 41}, "end": {"line": 36, "column": 73}}, "token": {"kind": "stringSegment", "text": "http:\/\/example.org\/fauna#Habitat"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 73}, "end": {"line": 36, "column": 74}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 74}, "end": {"line": 36, "column": 75}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 75}, "end": {"line": 36, "column": 75}}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 75}, "end": {"line": 36, "column": 76}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 76}, "end": {"line": 36, "column": 76}}, "children": []},
]}

# Parser output for `Domain(Vocabularies.Fauna.Animal)` at 39:13.
domain_by_qualified_type_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 39, "column": 13}, "end": {"line": 39, "column": 46}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 13}, "end": {"line": 39, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 13}, "end": {"line": 39, "column": 19}}, "token": {"kind": "identifier", "text": "Domain"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 19}, "end": {"line": 39, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 45}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 45}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 45}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 38}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 32}}, "token": {"kind": "identifier", "text": "Vocabularies"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 32}, "end": {"line": 39, "column": 33}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 38}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 38}, "end": {"line": 39, "column": 39}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 39}, "end": {"line": 39, "column": 45}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 39}, "end": {"line": 39, "column": 45}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 45}, "end": {"line": 39, "column": 46}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 39, "column": 46}, "end": {"line": 39, "column": 46}}, "children": []},
]}

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
range_by_concatenated_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 78}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 18}}, "token": {"kind": "identifier", "text": "Range"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 77}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 77}}, "children": [
      {"type": "SequenceExprSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 77}}, "children": [
        {"type": "ExprListSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 77}}, "children": [
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 54}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 19}, "end": {"line": 42, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 53}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 53}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 53}}, "token": {"kind": "stringSegment", "text": "http:\/\/www.w3.org\/2001\/XMLSchema#"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 53}, "end": {"line": 42, "column": 54}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
          {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 42, "column": 55}, "end": {"line": 42, "column": 56}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 55}, "end": {"line": 42, "column": 56}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
          ]},
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 77}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 58}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 76}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 76}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 76}}, "token": {"kind": "stringSegment", "text": "nonNegativeInteger"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 76}, "end": {"line": 42, "column": 77}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 77}, "end": {"line": 42, "column": 78}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 78}}, "children": []},
]}

# Parser output for `Range("\(xsd)nonNegativeInteger")` at 45:13.
range_by_interpolated_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 46}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 18}}, "token": {"kind": "identifier", "text": "Range"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 18}, "end": {"line": 45, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 45}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 45}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 45}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 44}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 20}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 20}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 21}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 21}, "end": {"line": 45, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 45, "column": 22}, "end": {"line": 45, "column": 25}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 45, "column": 22}, "end": {"line": 45, "column": 25}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 22}, "end": {"line": 45, "column": 25}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 22}, "end": {"line": 45, "column": 25}}, "token": {"kind": "identifier", "text": "xsd"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 45, "column": 26}, "end": {"line": 45, "column": 44}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 26}, "end": {"line": 45, "column": 44}}, "token": {"kind": "stringSegment", "text": "nonNegativeInteger"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 44}, "end": {"line": 45, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 45}, "end": {"line": 45, "column": 46}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 45, "column": 46}, "end": {"line": 45, "column": 46}}, "children": []},
]}
