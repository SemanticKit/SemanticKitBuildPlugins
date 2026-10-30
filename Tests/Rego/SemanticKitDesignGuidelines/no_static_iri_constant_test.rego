package semantickit.design_guidelines.no_static_iri_constant

test_denies_static_iri_initializer if {
  result := decision with input as static_iri_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 5
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_static_iri_annotation if {
  result := decision with input as static_iri_annotation_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 8
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_static_graph if {
  result := decision with input as static_graph_node

  count(result.deny) == 0
}

test_allows_instance_iri_projection if {
  result := decision with input as instance_iri_projection_node

  count(result.deny) == 0
}

# Parser output for `static let agentClass = IRI("http://xmlns.com/foaf/0.1/Agent")` at 5:5.
static_iri_initializer_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 5, "column": 5}, "end": {"line": 5, "column": 67}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 5, "column": 5}, "end": {"line": 5, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 5, "column": 5}, "end": {"line": 5, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 5}, "end": {"line": 5, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 12}, "end": {"line": 5, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 67}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 67}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 26}}, "token": {"kind": "identifier", "text": "agentClass"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 5, "column": 27}, "end": {"line": 5, "column": 67}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 27}, "end": {"line": 5, "column": 28}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 5, "column": 29}, "end": {"line": 5, "column": 67}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 5, "column": 29}, "end": {"line": 5, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 29}, "end": {"line": 5, "column": 32}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 32}, "end": {"line": 5, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 5, "column": 33}, "end": {"line": 5, "column": 66}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 5, "column": 33}, "end": {"line": 5, "column": 66}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 5, "column": 33}, "end": {"line": 5, "column": 66}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 33}, "end": {"line": 5, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 5, "column": 34}, "end": {"line": 5, "column": 65}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 5, "column": 34}, "end": {"line": 5, "column": 65}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 34}, "end": {"line": 5, "column": 65}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/Agent"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 65}, "end": {"line": 5, "column": 66}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 66}, "end": {"line": 5, "column": 67}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 5, "column": 67}, "end": {"line": 5, "column": 67}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let readClass: IRI = ACL.namespace.read` at 8:5.
static_iri_annotation_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 51}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 12}, "end": {"line": 8, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 8, "column": 16}, "end": {"line": 8, "column": 51}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 8, "column": 16}, "end": {"line": 8, "column": 51}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 8, "column": 16}, "end": {"line": 8, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 16}, "end": {"line": 8, "column": 25}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 8, "column": 25}, "end": {"line": 8, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 25}, "end": {"line": 8, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 8, "column": 27}, "end": {"line": 8, "column": 30}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 27}, "end": {"line": 8, "column": 30}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 8, "column": 31}, "end": {"line": 8, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 31}, "end": {"line": 8, "column": 32}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 51}}, "children": [
          {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 46}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 36}}, "token": {"kind": "identifier", "text": "ACL"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 36}, "end": {"line": 8, "column": 37}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 37}, "end": {"line": 8, "column": 46}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 37}, "end": {"line": 8, "column": 46}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 46}, "end": {"line": 8, "column": 47}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 47}, "end": {"line": 8, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 47}, "end": {"line": 8, "column": 51}}, "token": {"kind": "identifier", "text": "read"}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let shared = Graph()` at 12:5.
static_graph_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 32}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 5}, "end": {"line": 12, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 12}, "end": {"line": 12, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 32}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 32}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 22}}, "token": {"kind": "identifier", "text": "shared"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 12, "column": 23}, "end": {"line": 12, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 23}, "end": {"line": 12, "column": 24}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 25}, "end": {"line": 12, "column": 32}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 25}, "end": {"line": 12, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 25}, "end": {"line": 12, "column": 30}}, "token": {"kind": "identifier", "text": "Graph"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 30}, "end": {"line": 12, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 31}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 32}, "end": {"line": 12, "column": 32}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `var iri: IRI { Self.namespace.iri }` at 15:5.
instance_iri_projection_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 15, "column": 5}, "end": {"line": 15, "column": 40}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 5}, "end": {"line": 15, "column": 8}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 40}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 40}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 12}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 9}, "end": {"line": 15, "column": 12}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 15, "column": 12}, "end": {"line": 15, "column": 17}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 12}, "end": {"line": 15, "column": 13}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 14}, "end": {"line": 15, "column": 17}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 14}, "end": {"line": 15, "column": 17}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "AccessorBlockSyntax", "range": {"start": {"line": 15, "column": 18}, "end": {"line": 15, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 18}, "end": {"line": 15, "column": 19}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
        {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 38}}, "children": [
          {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 38}}, "children": [
            {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 38}}, "children": [
              {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 34}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 24}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 20}, "end": {"line": 15, "column": 24}}, "token": {"kind": "keyword", "text": "Self"}, "children": []},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 25}}, "token": {"kind": "period", "text": "."}, "children": []},
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 25}, "end": {"line": 15, "column": 34}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 25}, "end": {"line": 15, "column": 34}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 34}, "end": {"line": 15, "column": 35}}, "token": {"kind": "period", "text": "."}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 35}, "end": {"line": 15, "column": 38}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 35}, "end": {"line": 15, "column": 38}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
              ]},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 39}, "end": {"line": 15, "column": 40}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
      ]},
    ]},
  ]},
]}

test_denies_try_iri_initializer if {
  result := decision with input as try_iri_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 30
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_optional_iri_annotation if {
  result := decision with input as optional_iri_annotation_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 33
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_module_iri_annotation if {
  result := decision with input as module_iri_annotation_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 36
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_computed_term_iri if {
  result := decision with input as computed_term_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 39
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_iri_init_initializer if {
  result := decision with input as iri_init_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 42
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_static_iri_projection if {
  result := decision with input as static_iri_projection_node

  count(result.deny) == 0
}

# Parser output for `static let readClass = try! IRI(validating: "http://www.w3.org/ns/auth/acl#Read")` at 30:5.
try_iri_initializer_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 86}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 12}, "end": {"line": 30, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 86}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 86}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 25}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 30, "column": 26}, "end": {"line": 30, "column": 86}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 26}, "end": {"line": 30, "column": 27}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "TryExprSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 86}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 31}}, "token": {"kind": "keyword", "text": "try"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 31}, "end": {"line": 30, "column": 32}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
          {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 86}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 36}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 36}, "end": {"line": 30, "column": 37}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 85}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 85}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 47}}, "token": {"kind": "identifier", "text": "validating"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 47}, "end": {"line": 30, "column": 48}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 30, "column": 49}, "end": {"line": 30, "column": 85}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 49}, "end": {"line": 30, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 30, "column": 50}, "end": {"line": 30, "column": 84}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 30, "column": 50}, "end": {"line": 30, "column": 84}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 50}, "end": {"line": 30, "column": 84}}, "token": {"kind": "stringSegment", "text": "http:\/\/www.w3.org\/ns\/auth\/acl#Read"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 84}, "end": {"line": 30, "column": 85}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 85}, "end": {"line": 30, "column": 86}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 86}, "end": {"line": 30, "column": 86}}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let readClass: IRI? = nil` at 33:5.
optional_iri_annotation_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 33, "column": 5}, "end": {"line": 33, "column": 37}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 33, "column": 5}, "end": {"line": 33, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 33, "column": 5}, "end": {"line": 33, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 5}, "end": {"line": 33, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 12}, "end": {"line": 33, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 37}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 37}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 25}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "OptionalTypeSyntax", "range": {"start": {"line": 33, "column": 27}, "end": {"line": 33, "column": 31}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 33, "column": 27}, "end": {"line": 33, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 27}, "end": {"line": 33, "column": 30}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 30}, "end": {"line": 33, "column": 31}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
        ]},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 33, "column": 32}, "end": {"line": 33, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 32}, "end": {"line": 33, "column": 33}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "NilLiteralExprSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 37}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 37}}, "token": {"kind": "keyword", "text": "nil"}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let readClass: IRIKit.IRI = ACL.namespace.read` at 36:5.
module_iri_annotation_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 36, "column": 5}, "end": {"line": 36, "column": 58}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 36, "column": 5}, "end": {"line": 36, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 36, "column": 5}, "end": {"line": 36, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 5}, "end": {"line": 36, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 12}, "end": {"line": 36, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 58}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 58}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 25}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 36, "column": 25}, "end": {"line": 36, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 25}, "end": {"line": 36, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "MemberTypeSyntax", "range": {"start": {"line": 36, "column": 27}, "end": {"line": 36, "column": 37}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 36, "column": 27}, "end": {"line": 36, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 27}, "end": {"line": 36, "column": 33}}, "token": {"kind": "identifier", "text": "IRIKit"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 33}, "end": {"line": 36, "column": 34}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 37}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 36, "column": 38}, "end": {"line": 36, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 38}, "end": {"line": 36, "column": 39}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 58}}, "children": [
          {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 53}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 40}, "end": {"line": 36, "column": 43}}, "token": {"kind": "identifier", "text": "ACL"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 44}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 53}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 53}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 53}, "end": {"line": 36, "column": 54}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 54}, "end": {"line": 36, "column": 58}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 54}, "end": {"line": 36, "column": 58}}, "token": {"kind": "identifier", "text": "read"}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static var readClass: IRI { ACL.namespace.read }` at 39:5.
computed_term_iri_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 39, "column": 5}, "end": {"line": 39, "column": 53}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 39, "column": 5}, "end": {"line": 39, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 39, "column": 5}, "end": {"line": 39, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 5}, "end": {"line": 39, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 12}, "end": {"line": 39, "column": 15}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 53}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 53}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 25}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 39, "column": 25}, "end": {"line": 39, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 25}, "end": {"line": 39, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 39, "column": 27}, "end": {"line": 39, "column": 30}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 27}, "end": {"line": 39, "column": 30}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "AccessorBlockSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 53}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 32}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
        {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 51}}, "children": [
          {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 51}}, "children": [
            {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 51}}, "children": [
              {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 46}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 36}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 36}}, "token": {"kind": "identifier", "text": "ACL"}, "children": []},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 36}, "end": {"line": 39, "column": 37}}, "token": {"kind": "period", "text": "."}, "children": []},
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 37}, "end": {"line": 39, "column": 46}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 37}, "end": {"line": 39, "column": 46}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 46}, "end": {"line": 39, "column": 47}}, "token": {"kind": "period", "text": "."}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 39, "column": 47}, "end": {"line": 39, "column": 51}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 47}, "end": {"line": 39, "column": 51}}, "token": {"kind": "identifier", "text": "read"}, "children": []},
              ]},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 52}, "end": {"line": 39, "column": 53}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
      ]},
    ]},
  ]},
]}

# Parser output for `static let agentClass = IRIKit.IRI.init(rawValue: "http://xmlns.com/foaf/0.1/Agent")` at 42:5.
iri_init_initializer_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 42, "column": 5}, "end": {"line": 42, "column": 89}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 42, "column": 5}, "end": {"line": 42, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 42, "column": 5}, "end": {"line": 42, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 5}, "end": {"line": 42, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 12}, "end": {"line": 42, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 89}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 89}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 26}}, "token": {"kind": "identifier", "text": "agentClass"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 89}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 28}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 89}}, "children": [
          {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 44}}, "children": [
            {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 39}}, "children": [
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 35}}, "token": {"kind": "identifier", "text": "IRIKit"}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 35}, "end": {"line": 42, "column": 36}}, "token": {"kind": "period", "text": "."}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 39}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 39}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 39}, "end": {"line": 42, "column": 40}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 44}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 44}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 45}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 45}, "end": {"line": 42, "column": 88}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 45}, "end": {"line": 42, "column": 88}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 45}, "end": {"line": 42, "column": 53}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 53}, "end": {"line": 42, "column": 54}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 55}, "end": {"line": 42, "column": 88}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 55}, "end": {"line": 42, "column": 56}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 87}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 87}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 87}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/Agent"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 87}, "end": {"line": 42, "column": 88}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 88}, "end": {"line": 42, "column": 89}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 89}, "end": {"line": 42, "column": 89}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static var iri: IRI { Fauna.namespace.iri }` at 45:5.
static_iri_projection_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 45, "column": 5}, "end": {"line": 45, "column": 48}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 45, "column": 5}, "end": {"line": 45, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 45, "column": 5}, "end": {"line": 45, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 5}, "end": {"line": 45, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 12}, "end": {"line": 45, "column": 15}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 45, "column": 16}, "end": {"line": 45, "column": 48}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 45, "column": 16}, "end": {"line": 45, "column": 48}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 45, "column": 16}, "end": {"line": 45, "column": 19}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 16}, "end": {"line": 45, "column": 19}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 45, "column": 21}, "end": {"line": 45, "column": 24}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 21}, "end": {"line": 45, "column": 24}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "AccessorBlockSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 26}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
        {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 46}}, "children": [
          {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 46}}, "children": [
            {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 46}}, "children": [
              {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 42}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 32}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 27}, "end": {"line": 45, "column": 32}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 32}, "end": {"line": 45, "column": 33}}, "token": {"kind": "period", "text": "."}, "children": []},
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 33}, "end": {"line": 45, "column": 42}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 33}, "end": {"line": 45, "column": 42}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 42}, "end": {"line": 45, "column": 43}}, "token": {"kind": "period", "text": "."}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 46}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 46}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
              ]},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 47}, "end": {"line": 45, "column": 48}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
      ]},
    ]},
  ]},
]}

test_denies_url_static if {
  result := decision with input as url_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 100
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_interpolated_static if {
  result := decision with input as interpolated_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 103
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_concatenated_static if {
  result := decision with input as concatenated_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 106
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_named_node_static if {
  result := decision with input as named_node_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 109
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_interpolated_string_static if {
  result := decision with input as interpolated_string_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 112
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_iri_string_static if {
  result := decision with input as iri_string_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 115
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_prefixed_name_static if {
  result := decision with input as prefixed_name_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 118
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_namespace_static if {
  result := decision with input as namespace_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 121
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_prefix_static if {
  result := decision with input as prefix_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 124
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_term_iri_string_static if {
  result := decision with input as term_iri_string_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 127
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_url_typed_static if {
  result := decision with input as url_typed_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 130
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_computed_url_static if {
  result := decision with input as computed_url_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 133
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_closure_static if {
  result := decision with input as closure_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 136
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_projection_from_literal if {
  result := decision with input as projection_from_literal_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_iri_constant"
  result.deny[0].line == 139
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_media_type_static if {
  result := decision with input as media_type_static_node

  count(result.deny) == 0
}

test_allows_numeric_sum_static if {
  result := decision with input as numeric_sum_static_node

  count(result.deny) == 0
}

# Parser output for `static let knows = URL(string: "http://xmlns.com/foaf/0.1/knows")!` at 100:5.
url_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 100, "column": 5}, "end": {"line": 100, "column": 71}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 100, "column": 5}, "end": {"line": 100, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 100, "column": 5}, "end": {"line": 100, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 5}, "end": {"line": 100, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 12}, "end": {"line": 100, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 100, "column": 16}, "end": {"line": 100, "column": 71}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 100, "column": 16}, "end": {"line": 100, "column": 71}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 100, "column": 16}, "end": {"line": 100, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 16}, "end": {"line": 100, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 71}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "ForceUnwrapExprSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 71}}, "children": [
          {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 70}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 27}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 27}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 27}, "end": {"line": 100, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 100, "column": 28}, "end": {"line": 100, "column": 69}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 100, "column": 28}, "end": {"line": 100, "column": 69}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 28}, "end": {"line": 100, "column": 34}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 34}, "end": {"line": 100, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 100, "column": 36}, "end": {"line": 100, "column": 69}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 36}, "end": {"line": 100, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 100, "column": 37}, "end": {"line": 100, "column": 68}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 100, "column": 37}, "end": {"line": 100, "column": 68}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 37}, "end": {"line": 100, "column": 68}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 68}, "end": {"line": 100, "column": 69}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 69}, "end": {"line": 100, "column": 70}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 100, "column": 70}, "end": {"line": 100, "column": 70}}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 70}, "end": {"line": 100, "column": 71}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = IRIRef("\(ns)knows")` at 103:5.
interpolated_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 103, "column": 5}, "end": {"line": 103, "column": 44}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 103, "column": 5}, "end": {"line": 103, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 103, "column": 5}, "end": {"line": 103, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 5}, "end": {"line": 103, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 12}, "end": {"line": 103, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 103, "column": 16}, "end": {"line": 103, "column": 44}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 103, "column": 16}, "end": {"line": 103, "column": 44}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 103, "column": 16}, "end": {"line": 103, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 16}, "end": {"line": 103, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 103, "column": 22}, "end": {"line": 103, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 22}, "end": {"line": 103, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 103, "column": 24}, "end": {"line": 103, "column": 44}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 103, "column": 24}, "end": {"line": 103, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 24}, "end": {"line": 103, "column": 30}}, "token": {"kind": "identifier", "text": "IRIRef"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 30}, "end": {"line": 103, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 103, "column": 31}, "end": {"line": 103, "column": 43}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 103, "column": 31}, "end": {"line": 103, "column": 43}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 103, "column": 31}, "end": {"line": 103, "column": 43}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 31}, "end": {"line": 103, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 103, "column": 32}, "end": {"line": 103, "column": 42}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 103, "column": 32}, "end": {"line": 103, "column": 32}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 32}, "end": {"line": 103, "column": 32}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                  ]},
                  {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 103, "column": 32}, "end": {"line": 103, "column": 37}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 32}, "end": {"line": 103, "column": 33}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 33}, "end": {"line": 103, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 103, "column": 34}, "end": {"line": 103, "column": 36}}, "children": [
                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 103, "column": 34}, "end": {"line": 103, "column": 36}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 103, "column": 34}, "end": {"line": 103, "column": 36}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 34}, "end": {"line": 103, "column": 36}}, "token": {"kind": "identifier", "text": "ns"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 36}, "end": {"line": 103, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 103, "column": 37}, "end": {"line": 103, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 37}, "end": {"line": 103, "column": 42}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 42}, "end": {"line": 103, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 43}, "end": {"line": 103, "column": 44}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 103, "column": 44}, "end": {"line": 103, "column": 44}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = ns + "knows"` at 106:5.
concatenated_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 106, "column": 5}, "end": {"line": 106, "column": 36}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 106, "column": 5}, "end": {"line": 106, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 106, "column": 5}, "end": {"line": 106, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 5}, "end": {"line": 106, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 12}, "end": {"line": 106, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 106, "column": 16}, "end": {"line": 106, "column": 36}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 106, "column": 16}, "end": {"line": 106, "column": 36}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 106, "column": 16}, "end": {"line": 106, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 16}, "end": {"line": 106, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 106, "column": 22}, "end": {"line": 106, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 22}, "end": {"line": 106, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "SequenceExprSyntax", "range": {"start": {"line": 106, "column": 24}, "end": {"line": 106, "column": 36}}, "children": [
          {"type": "ExprListSyntax", "range": {"start": {"line": 106, "column": 24}, "end": {"line": 106, "column": 36}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 106, "column": 24}, "end": {"line": 106, "column": 26}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 24}, "end": {"line": 106, "column": 26}}, "token": {"kind": "identifier", "text": "ns"}, "children": []},
            ]},
            {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 106, "column": 27}, "end": {"line": 106, "column": 28}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 27}, "end": {"line": 106, "column": 28}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
            ]},
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 106, "column": 29}, "end": {"line": 106, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 29}, "end": {"line": 106, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 106, "column": 30}, "end": {"line": 106, "column": 35}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 106, "column": 30}, "end": {"line": 106, "column": 35}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 30}, "end": {"line": 106, "column": 35}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 35}, "end": {"line": 106, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = NamedNode("http://xmlns.com/foaf/0.1/knows")` at 109:5.
named_node_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 109, "column": 5}, "end": {"line": 109, "column": 68}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 109, "column": 5}, "end": {"line": 109, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 109, "column": 5}, "end": {"line": 109, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 5}, "end": {"line": 109, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 12}, "end": {"line": 109, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 109, "column": 16}, "end": {"line": 109, "column": 68}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 109, "column": 16}, "end": {"line": 109, "column": 68}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 109, "column": 16}, "end": {"line": 109, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 16}, "end": {"line": 109, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 68}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 109, "column": 24}, "end": {"line": 109, "column": 68}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 109, "column": 24}, "end": {"line": 109, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 24}, "end": {"line": 109, "column": 33}}, "token": {"kind": "identifier", "text": "NamedNode"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 33}, "end": {"line": 109, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 109, "column": 34}, "end": {"line": 109, "column": 67}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 109, "column": 34}, "end": {"line": 109, "column": 67}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 109, "column": 34}, "end": {"line": 109, "column": 67}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 34}, "end": {"line": 109, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 66}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 66}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 66}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 66}, "end": {"line": 109, "column": 67}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 67}, "end": {"line": 109, "column": 68}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 109, "column": 68}, "end": {"line": 109, "column": 68}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = "\(Foaf.base)knows"` at 112:5.
interpolated_string_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 112, "column": 5}, "end": {"line": 112, "column": 43}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 112, "column": 5}, "end": {"line": 112, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 112, "column": 5}, "end": {"line": 112, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 5}, "end": {"line": 112, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 12}, "end": {"line": 112, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 112, "column": 16}, "end": {"line": 112, "column": 43}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 112, "column": 16}, "end": {"line": 112, "column": 43}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 112, "column": 16}, "end": {"line": 112, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 16}, "end": {"line": 112, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 112, "column": 22}, "end": {"line": 112, "column": 43}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 22}, "end": {"line": 112, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 112, "column": 24}, "end": {"line": 112, "column": 43}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 24}, "end": {"line": 112, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 42}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 25}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 25}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
            ]},
            {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 37}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 26}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 26}, "end": {"line": 112, "column": 27}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 112, "column": 27}, "end": {"line": 112, "column": 36}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 112, "column": 27}, "end": {"line": 112, "column": 36}}, "children": [
                  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 112, "column": 27}, "end": {"line": 112, "column": 36}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 27}, "end": {"line": 112, "column": 31}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 27}, "end": {"line": 112, "column": 31}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 31}, "end": {"line": 112, "column": 32}}, "token": {"kind": "period", "text": "."}, "children": []},
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 36}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 36}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
                    ]},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 36}, "end": {"line": 112, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 112, "column": 37}, "end": {"line": 112, "column": 42}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 37}, "end": {"line": 112, "column": 42}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 42}, "end": {"line": 112, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knowsIRI = "http://xmlns.com/foaf/0.1/knows"` at 115:5.
iri_string_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 115, "column": 5}, "end": {"line": 115, "column": 60}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 115, "column": 5}, "end": {"line": 115, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 115, "column": 5}, "end": {"line": 115, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 5}, "end": {"line": 115, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 12}, "end": {"line": 115, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 60}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 60}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 24}}, "token": {"kind": "identifier", "text": "knowsIRI"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 115, "column": 25}, "end": {"line": 115, "column": 60}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 25}, "end": {"line": 115, "column": 26}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 115, "column": 27}, "end": {"line": 115, "column": 60}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 27}, "end": {"line": 115, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 115, "column": 28}, "end": {"line": 115, "column": 59}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 115, "column": 28}, "end": {"line": 115, "column": 59}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 28}, "end": {"line": 115, "column": 59}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 59}, "end": {"line": 115, "column": 60}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = "foaf:knows"` at 118:5.
prefixed_name_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 118, "column": 5}, "end": {"line": 118, "column": 36}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 118, "column": 5}, "end": {"line": 118, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 118, "column": 5}, "end": {"line": 118, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 5}, "end": {"line": 118, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 12}, "end": {"line": 118, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 36}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 36}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 118, "column": 22}, "end": {"line": 118, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 22}, "end": {"line": 118, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 118, "column": 24}, "end": {"line": 118, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 24}, "end": {"line": 118, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 35}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 35}}, "token": {"kind": "stringSegment", "text": "foaf:knows"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 35}, "end": {"line": 118, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let namespace = Namespace("http://example.org/fauna#")` at 121:5.
namespace_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 121, "column": 5}, "end": {"line": 121, "column": 66}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 121, "column": 5}, "end": {"line": 121, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 121, "column": 5}, "end": {"line": 121, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 5}, "end": {"line": 121, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 12}, "end": {"line": 121, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 66}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 66}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 25}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 121, "column": 26}, "end": {"line": 121, "column": 66}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 26}, "end": {"line": 121, "column": 27}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 121, "column": 28}, "end": {"line": 121, "column": 66}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 121, "column": 28}, "end": {"line": 121, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 28}, "end": {"line": 121, "column": 37}}, "token": {"kind": "identifier", "text": "Namespace"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 37}, "end": {"line": 121, "column": 38}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 121, "column": 38}, "end": {"line": 121, "column": 65}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 121, "column": 38}, "end": {"line": 121, "column": 65}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 121, "column": 38}, "end": {"line": 121, "column": 65}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 38}, "end": {"line": 121, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 121, "column": 39}, "end": {"line": 121, "column": 64}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 121, "column": 39}, "end": {"line": 121, "column": 64}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 39}, "end": {"line": 121, "column": 64}}, "token": {"kind": "stringSegment", "text": "http:\/\/example.org\/fauna#"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 64}, "end": {"line": 121, "column": 65}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 65}, "end": {"line": 121, "column": 66}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 121, "column": 66}, "end": {"line": 121, "column": 66}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let owl = Prefix("owl", "http://www.w3.org/2002/07/owl#")` at 124:5.
prefix_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 124, "column": 5}, "end": {"line": 124, "column": 69}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 124, "column": 5}, "end": {"line": 124, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 124, "column": 5}, "end": {"line": 124, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 5}, "end": {"line": 124, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 12}, "end": {"line": 124, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 124, "column": 16}, "end": {"line": 124, "column": 69}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 124, "column": 16}, "end": {"line": 124, "column": 69}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 124, "column": 16}, "end": {"line": 124, "column": 19}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 16}, "end": {"line": 124, "column": 19}}, "token": {"kind": "identifier", "text": "owl"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 69}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 21}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 124, "column": 22}, "end": {"line": 124, "column": 69}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 124, "column": 22}, "end": {"line": 124, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 22}, "end": {"line": 124, "column": 28}}, "token": {"kind": "identifier", "text": "Prefix"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 28}, "end": {"line": 124, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 124, "column": 29}, "end": {"line": 124, "column": 68}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 124, "column": 29}, "end": {"line": 124, "column": 35}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 124, "column": 29}, "end": {"line": 124, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 29}, "end": {"line": 124, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 124, "column": 30}, "end": {"line": 124, "column": 33}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 124, "column": 30}, "end": {"line": 124, "column": 33}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 30}, "end": {"line": 124, "column": 33}}, "token": {"kind": "stringSegment", "text": "owl"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 33}, "end": {"line": 124, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 34}, "end": {"line": 124, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 124, "column": 36}, "end": {"line": 124, "column": 68}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 124, "column": 36}, "end": {"line": 124, "column": 68}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 36}, "end": {"line": 124, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 124, "column": 37}, "end": {"line": 124, "column": 67}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 124, "column": 37}, "end": {"line": 124, "column": 67}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 37}, "end": {"line": 124, "column": 67}}, "token": {"kind": "stringSegment", "text": "http:\/\/www.w3.org\/2002\/07\/owl#"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 67}, "end": {"line": 124, "column": 68}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 68}, "end": {"line": 124, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 124, "column": 69}, "end": {"line": 124, "column": 69}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows = Term(iri: "http://xmlns.com/foaf/0.1/knows")` at 127:5.
term_iri_string_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 127, "column": 5}, "end": {"line": 127, "column": 68}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 127, "column": 5}, "end": {"line": 127, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 127, "column": 5}, "end": {"line": 127, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 5}, "end": {"line": 127, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 12}, "end": {"line": 127, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 127, "column": 16}, "end": {"line": 127, "column": 68}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 127, "column": 16}, "end": {"line": 127, "column": 68}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 127, "column": 16}, "end": {"line": 127, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 16}, "end": {"line": 127, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 127, "column": 22}, "end": {"line": 127, "column": 68}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 22}, "end": {"line": 127, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 127, "column": 24}, "end": {"line": 127, "column": 68}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 127, "column": 24}, "end": {"line": 127, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 24}, "end": {"line": 127, "column": 28}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 28}, "end": {"line": 127, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 127, "column": 29}, "end": {"line": 127, "column": 67}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 127, "column": 29}, "end": {"line": 127, "column": 67}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 29}, "end": {"line": 127, "column": 32}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 32}, "end": {"line": 127, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 127, "column": 34}, "end": {"line": 127, "column": 67}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 34}, "end": {"line": 127, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 127, "column": 35}, "end": {"line": 127, "column": 66}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 127, "column": 35}, "end": {"line": 127, "column": 66}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 35}, "end": {"line": 127, "column": 66}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 66}, "end": {"line": 127, "column": 67}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 67}, "end": {"line": 127, "column": 68}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 127, "column": 68}, "end": {"line": 127, "column": 68}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows: URL? = nil` at 130:5.
url_typed_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 130, "column": 5}, "end": {"line": 130, "column": 33}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 130, "column": 5}, "end": {"line": 130, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 130, "column": 5}, "end": {"line": 130, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 5}, "end": {"line": 130, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 12}, "end": {"line": 130, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 130, "column": 16}, "end": {"line": 130, "column": 33}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 130, "column": 16}, "end": {"line": 130, "column": 33}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 130, "column": 16}, "end": {"line": 130, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 16}, "end": {"line": 130, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 130, "column": 21}, "end": {"line": 130, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 21}, "end": {"line": 130, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "OptionalTypeSyntax", "range": {"start": {"line": 130, "column": 23}, "end": {"line": 130, "column": 27}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 130, "column": 23}, "end": {"line": 130, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 23}, "end": {"line": 130, "column": 26}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 26}, "end": {"line": 130, "column": 27}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
        ]},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 130, "column": 28}, "end": {"line": 130, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 28}, "end": {"line": 130, "column": 29}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "NilLiteralExprSyntax", "range": {"start": {"line": 130, "column": 30}, "end": {"line": 130, "column": 33}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 30}, "end": {"line": 130, "column": 33}}, "token": {"kind": "keyword", "text": "nil"}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static var knows: URL { URL(string: "http://xmlns.com/foaf/0.1/knows")! }` at 133:5.
computed_url_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 133, "column": 5}, "end": {"line": 133, "column": 78}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 133, "column": 5}, "end": {"line": 133, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 133, "column": 5}, "end": {"line": 133, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 5}, "end": {"line": 133, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 12}, "end": {"line": 133, "column": 15}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 133, "column": 16}, "end": {"line": 133, "column": 78}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 133, "column": 16}, "end": {"line": 133, "column": 78}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 133, "column": 16}, "end": {"line": 133, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 16}, "end": {"line": 133, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 133, "column": 21}, "end": {"line": 133, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 21}, "end": {"line": 133, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 133, "column": 23}, "end": {"line": 133, "column": 26}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 23}, "end": {"line": 133, "column": 26}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
        ]},
      ]},
      {"type": "AccessorBlockSyntax", "range": {"start": {"line": 133, "column": 27}, "end": {"line": 133, "column": 78}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 27}, "end": {"line": 133, "column": 28}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
        {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 76}}, "children": [
          {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 76}}, "children": [
            {"type": "ForceUnwrapExprSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 76}}, "children": [
              {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 75}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 32}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 32}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 32}, "end": {"line": 133, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                {"type": "LabeledExprListSyntax", "range": {"start": {"line": 133, "column": 33}, "end": {"line": 133, "column": 74}}, "children": [
                  {"type": "LabeledExprSyntax", "range": {"start": {"line": 133, "column": 33}, "end": {"line": 133, "column": 74}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 33}, "end": {"line": 133, "column": 39}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 39}, "end": {"line": 133, "column": 40}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                    {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 133, "column": 41}, "end": {"line": 133, "column": 74}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 41}, "end": {"line": 133, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 73}}, "children": [
                        {"type": "StringSegmentSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 73}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 73}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                        ]},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 73}, "end": {"line": 133, "column": 74}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 74}, "end": {"line": 133, "column": 75}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 133, "column": 75}, "end": {"line": 133, "column": 75}}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 75}, "end": {"line": 133, "column": 76}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 77}, "end": {"line": 133, "column": 78}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
      ]},
    ]},
  ]},
]}

# Parser output for `static let knows: Term = { Term(URL(string: base + "knows")!) }()` at 136:5.
closure_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 136, "column": 5}, "end": {"line": 136, "column": 70}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 136, "column": 5}, "end": {"line": 136, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 136, "column": 5}, "end": {"line": 136, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 5}, "end": {"line": 136, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 12}, "end": {"line": 136, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 70}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 70}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 21}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 136, "column": 21}, "end": {"line": 136, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 21}, "end": {"line": 136, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 23}, "end": {"line": 136, "column": 27}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 23}, "end": {"line": 136, "column": 27}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 136, "column": 28}, "end": {"line": 136, "column": 70}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 28}, "end": {"line": 136, "column": 29}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 136, "column": 30}, "end": {"line": 136, "column": 70}}, "children": [
          {"type": "ClosureExprSyntax", "range": {"start": {"line": 136, "column": 30}, "end": {"line": 136, "column": 68}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 30}, "end": {"line": 136, "column": 31}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 66}}, "children": [
              {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 66}}, "children": [
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 66}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 36}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 36}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 36}, "end": {"line": 136, "column": 37}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 65}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 65}}, "children": [
                      {"type": "ForceUnwrapExprSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 65}}, "children": [
                        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 64}}, "children": [
                          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 40}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 37}, "end": {"line": 136, "column": 40}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 40}, "end": {"line": 136, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 63}}, "children": [
                            {"type": "LabeledExprSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 63}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 47}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 47}, "end": {"line": 136, "column": 48}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                              {"type": "SequenceExprSyntax", "range": {"start": {"line": 136, "column": 49}, "end": {"line": 136, "column": 63}}, "children": [
                                {"type": "ExprListSyntax", "range": {"start": {"line": 136, "column": 49}, "end": {"line": 136, "column": 63}}, "children": [
                                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 49}, "end": {"line": 136, "column": 53}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 49}, "end": {"line": 136, "column": 53}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
                                  ]},
                                  {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 136, "column": 54}, "end": {"line": 136, "column": 55}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 54}, "end": {"line": 136, "column": 55}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                                  ]},
                                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 136, "column": 56}, "end": {"line": 136, "column": 63}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 56}, "end": {"line": 136, "column": 57}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 136, "column": 57}, "end": {"line": 136, "column": 62}}, "children": [
                                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 136, "column": 57}, "end": {"line": 136, "column": 62}}, "children": [
                                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 57}, "end": {"line": 136, "column": 62}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                                      ]},
                                    ]},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 62}, "end": {"line": 136, "column": 63}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                  ]},
                                ]},
                              ]},
                            ]},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 63}, "end": {"line": 136, "column": 64}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 136, "column": 64}, "end": {"line": 136, "column": 64}}, "children": []},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 64}, "end": {"line": 136, "column": 65}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 65}, "end": {"line": 136, "column": 66}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 136, "column": 67}, "end": {"line": 136, "column": 67}}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 67}, "end": {"line": 136, "column": 68}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 68}, "end": {"line": 136, "column": 69}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 69}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 70}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 136, "column": 70}, "end": {"line": 136, "column": 70}}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static var iri: IRI { IRI("http://example.org/fauna#Animal") }` at 139:5.
projection_from_literal_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 139, "column": 5}, "end": {"line": 139, "column": 67}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 139, "column": 5}, "end": {"line": 139, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 139, "column": 5}, "end": {"line": 139, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 5}, "end": {"line": 139, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 12}, "end": {"line": 139, "column": 15}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 139, "column": 16}, "end": {"line": 139, "column": 67}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 139, "column": 16}, "end": {"line": 139, "column": 67}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 139, "column": 16}, "end": {"line": 139, "column": 19}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 16}, "end": {"line": 139, "column": 19}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
      ]},
      {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 139, "column": 21}, "end": {"line": 139, "column": 24}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 21}, "end": {"line": 139, "column": 24}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
      ]},
      {"type": "AccessorBlockSyntax", "range": {"start": {"line": 139, "column": 25}, "end": {"line": 139, "column": 67}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 25}, "end": {"line": 139, "column": 26}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
        {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 139, "column": 27}, "end": {"line": 139, "column": 65}}, "children": [
          {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 139, "column": 27}, "end": {"line": 139, "column": 65}}, "children": [
            {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 139, "column": 27}, "end": {"line": 139, "column": 65}}, "children": [
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 139, "column": 27}, "end": {"line": 139, "column": 30}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 27}, "end": {"line": 139, "column": 30}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 30}, "end": {"line": 139, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 64}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 64}}, "children": [
                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 64}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 139, "column": 32}, "end": {"line": 139, "column": 63}}, "children": [
                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 139, "column": 32}, "end": {"line": 139, "column": 63}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 32}, "end": {"line": 139, "column": 63}}, "token": {"kind": "stringSegment", "text": "http:\/\/example.org\/fauna#Animal"}, "children": []},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 63}, "end": {"line": 139, "column": 64}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 64}, "end": {"line": 139, "column": 65}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
              {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 139, "column": 66}, "end": {"line": 139, "column": 66}}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 66}, "end": {"line": 139, "column": 67}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
      ]},
    ]},
  ]},
]}

# Parser output for `static let mediaType = "text/turtle"` at 142:5.
media_type_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 142, "column": 5}, "end": {"line": 142, "column": 41}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 142, "column": 5}, "end": {"line": 142, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 142, "column": 5}, "end": {"line": 142, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 5}, "end": {"line": 142, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 12}, "end": {"line": 142, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 142, "column": 16}, "end": {"line": 142, "column": 41}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 142, "column": 16}, "end": {"line": 142, "column": 41}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 142, "column": 16}, "end": {"line": 142, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 16}, "end": {"line": 142, "column": 25}}, "token": {"kind": "identifier", "text": "mediaType"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 142, "column": 26}, "end": {"line": 142, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 26}, "end": {"line": 142, "column": 27}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 142, "column": 28}, "end": {"line": 142, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 28}, "end": {"line": 142, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 142, "column": 29}, "end": {"line": 142, "column": 40}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 142, "column": 29}, "end": {"line": 142, "column": 40}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 29}, "end": {"line": 142, "column": 40}}, "token": {"kind": "stringSegment", "text": "text\/turtle"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 40}, "end": {"line": 142, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
  ]},
]}

# Parser output for `static let limit = base + 1` at 145:5.
numeric_sum_static_node := {"type": "VariableDeclSyntax", "range": {"start": {"line": 145, "column": 5}, "end": {"line": 145, "column": 32}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 145, "column": 5}, "end": {"line": 145, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 145, "column": 5}, "end": {"line": 145, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 5}, "end": {"line": 145, "column": 11}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 12}, "end": {"line": 145, "column": 15}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 145, "column": 16}, "end": {"line": 145, "column": 32}}, "children": [
    {"type": "PatternBindingSyntax", "range": {"start": {"line": 145, "column": 16}, "end": {"line": 145, "column": 32}}, "children": [
      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 145, "column": 16}, "end": {"line": 145, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 16}, "end": {"line": 145, "column": 21}}, "token": {"kind": "identifier", "text": "limit"}, "children": []},
      ]},
      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 145, "column": 22}, "end": {"line": 145, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 22}, "end": {"line": 145, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
        {"type": "SequenceExprSyntax", "range": {"start": {"line": 145, "column": 24}, "end": {"line": 145, "column": 32}}, "children": [
          {"type": "ExprListSyntax", "range": {"start": {"line": 145, "column": 24}, "end": {"line": 145, "column": 32}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 145, "column": 24}, "end": {"line": 145, "column": 28}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 24}, "end": {"line": 145, "column": 28}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
            ]},
            {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 145, "column": 29}, "end": {"line": 145, "column": 30}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 29}, "end": {"line": 145, "column": 30}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
            ]},
            {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 145, "column": 31}, "end": {"line": 145, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 31}, "end": {"line": 145, "column": 32}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
]}
