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
