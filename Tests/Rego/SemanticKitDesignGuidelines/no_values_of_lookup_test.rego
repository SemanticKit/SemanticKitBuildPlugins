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
values_of_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 35}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 24}}, "children": [
    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 17}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 13}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 13}}, "token": {"kind": "identifier", "text": "Cert"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 14}}, "token": {"kind": "period", "text": "."}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 14}, "end": {"line": 4, "column": 17}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 14}, "end": {"line": 4, "column": 17}}, "token": {"kind": "identifier", "text": "key"}, "children": []},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 17}, "end": {"line": 4, "column": 18}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 18}, "end": {"line": 4, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 18}, "end": {"line": 4, "column": 24}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 4, "column": 25}, "end": {"line": 4, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 4, "column": 25}, "end": {"line": 4, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 25}, "end": {"line": 4, "column": 27}}, "token": {"kind": "identifier", "text": "of"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 27}, "end": {"line": 4, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 29}, "end": {"line": 4, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 29}, "end": {"line": 4, "column": 34}}, "token": {"kind": "identifier", "text": "alice"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 34}, "end": {"line": 4, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 4, "column": 35}, "end": {"line": 4, "column": 35}}, "children": []},
]}

# Parser output for `Solid.oidcIssuer.values(of: profile)` at 7:9.
values_of_issuer_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 7, "column": 9}, "end": {"line": 7, "column": 45}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 7, "column": 9}, "end": {"line": 7, "column": 32}}, "children": [
    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 7, "column": 9}, "end": {"line": 7, "column": 25}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 9}, "end": {"line": 7, "column": 14}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 9}, "end": {"line": 7, "column": 14}}, "token": {"kind": "identifier", "text": "Solid"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 14}, "end": {"line": 7, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 15}, "end": {"line": 7, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 15}, "end": {"line": 7, "column": 25}}, "token": {"kind": "identifier", "text": "oidcIssuer"}, "children": []},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 25}, "end": {"line": 7, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 26}, "end": {"line": 7, "column": 32}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 26}, "end": {"line": 7, "column": 32}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 32}, "end": {"line": 7, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 7, "column": 33}, "end": {"line": 7, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 7, "column": 33}, "end": {"line": 7, "column": 44}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 33}, "end": {"line": 7, "column": 35}}, "token": {"kind": "identifier", "text": "of"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 35}, "end": {"line": 7, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 37}, "end": {"line": 7, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 37}, "end": {"line": 7, "column": 44}}, "token": {"kind": "identifier", "text": "profile"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 44}, "end": {"line": 7, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 7, "column": 45}, "end": {"line": 7, "column": 45}}, "children": []},
]}

# Parser output for `func values(of subject: Individual) -> [Node] {}` at 10:5.
values_of_declaration_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 10, "column": 5}, "end": {"line": 10, "column": 53}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 5}, "end": {"line": 10, "column": 9}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 10}, "end": {"line": 10, "column": 16}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 10, "column": 16}, "end": {"line": 10, "column": 50}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 10, "column": 16}, "end": {"line": 10, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 16}, "end": {"line": 10, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 10, "column": 17}, "end": {"line": 10, "column": 39}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 10, "column": 17}, "end": {"line": 10, "column": 39}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 10, "column": 17}, "end": {"line": 10, "column": 17}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 10, "column": 17}, "end": {"line": 10, "column": 17}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 17}, "end": {"line": 10, "column": 19}}, "token": {"kind": "identifier", "text": "of"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 20}, "end": {"line": 10, "column": 27}}, "token": {"kind": "identifier", "text": "subject"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 27}, "end": {"line": 10, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 10, "column": 29}, "end": {"line": 10, "column": 39}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 29}, "end": {"line": 10, "column": 39}}, "token": {"kind": "identifier", "text": "Individual"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 39}, "end": {"line": 10, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 10, "column": 41}, "end": {"line": 10, "column": 50}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 41}, "end": {"line": 10, "column": 43}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "ArrayTypeSyntax", "range": {"start": {"line": 10, "column": 44}, "end": {"line": 10, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 44}, "end": {"line": 10, "column": 45}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 10, "column": 45}, "end": {"line": 10, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 45}, "end": {"line": 10, "column": 49}}, "token": {"kind": "identifier", "text": "Node"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 49}, "end": {"line": 10, "column": 50}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 10, "column": 51}, "end": {"line": 10, "column": 53}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 51}, "end": {"line": 10, "column": 52}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 10, "column": 52}, "end": {"line": 10, "column": 52}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 10, "column": 52}, "end": {"line": 10, "column": 53}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `alice.key.contains(publicKey)` at 13:9.
property_on_individual_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 38}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 27}}, "children": [
    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 18}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 14}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 14}}, "token": {"kind": "identifier", "text": "alice"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 14}, "end": {"line": 13, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 15}, "end": {"line": 13, "column": 18}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 15}, "end": {"line": 13, "column": 18}}, "token": {"kind": "identifier", "text": "key"}, "children": []},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 18}, "end": {"line": 13, "column": 19}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 19}, "end": {"line": 13, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 19}, "end": {"line": 13, "column": 27}}, "token": {"kind": "identifier", "text": "contains"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 27}, "end": {"line": 13, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 13, "column": 28}, "end": {"line": 13, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 13, "column": 28}, "end": {"line": 13, "column": 37}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 28}, "end": {"line": 13, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 28}, "end": {"line": 13, "column": 37}}, "token": {"kind": "identifier", "text": "publicKey"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 37}, "end": {"line": 13, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 13, "column": 38}, "end": {"line": 13, "column": 38}}, "children": []},
]}

# Parser output for `measurements.values(alice)` at 16:9.
values_unlabeled_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 35}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 21}}, "token": {"kind": "identifier", "text": "measurements"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 21}, "end": {"line": 16, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 28}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 22}, "end": {"line": 16, "column": 28}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 28}, "end": {"line": 16, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 34}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 29}, "end": {"line": 16, "column": 34}}, "token": {"kind": "identifier", "text": "alice"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 34}, "end": {"line": 16, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 35}, "end": {"line": 16, "column": 35}}, "children": []},
]}

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
bare_values_of_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 26}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 15}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 15}, "end": {"line": 30, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 25}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 25}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 18}}, "token": {"kind": "identifier", "text": "of"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 18}, "end": {"line": 30, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 25}}, "token": {"kind": "identifier", "text": "alice"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 25}, "end": {"line": 30, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 26}, "end": {"line": 30, "column": 26}}, "children": []},
]}

# Parser output for `values(in: graph)` at 33:9.
bare_values_in_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 26}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 9}, "end": {"line": 33, "column": 15}}, "token": {"kind": "identifier", "text": "values"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 15}, "end": {"line": 33, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 25}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 25}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 18}}, "token": {"kind": "identifier", "text": "in"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 19}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 20}, "end": {"line": 33, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 20}, "end": {"line": 33, "column": 25}}, "token": {"kind": "identifier", "text": "graph"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 26}, "end": {"line": 33, "column": 26}}, "children": []},
]}
