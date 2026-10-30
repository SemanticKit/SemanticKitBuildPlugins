package semantickit.design_guidelines.no_interpolated_identity

test_denies_interpolated_iri if {
  result := decision with input as interpolated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 4
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_concatenated_iri if {
  result := decision with input as concatenated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 8
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_boundary_literal_iri if {
  result := decision with input as boundary_literal_iri_node

  count(result.deny) == 0
}

test_allows_interpolated_description if {
  result := decision with input as interpolated_description_node

  count(result.deny) == 0
}

# Parser output for `IRI(rawValue: "\(Self.metadata.type)\(name)")` at 4:9.
interpolated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 54}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 12}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 12}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 12}, "end": {"line": 4, "column": 13}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 53}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 53}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 13}, "end": {"line": 4, "column": 21}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 4, "column": 23}, "end": {"line": 4, "column": 53}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 23}, "end": {"line": 4, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 52}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 24}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 24}, "end": {"line": 4, "column": 25}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 25}, "end": {"line": 4, "column": 26}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 44}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 44}}, "children": [
                {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 44}}, "children": [
                  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 39}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 30}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 26}, "end": {"line": 4, "column": 30}}, "token": {"kind": "keyword", "text": "Self"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 31}}, "token": {"kind": "period", "text": "."}, "children": []},
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 31}, "end": {"line": 4, "column": 39}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 31}, "end": {"line": 4, "column": 39}}, "token": {"kind": "identifier", "text": "metadata"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 39}, "end": {"line": 4, "column": 40}}, "token": {"kind": "period", "text": "."}, "children": []},
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 40}, "end": {"line": 4, "column": 44}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 40}, "end": {"line": 4, "column": 44}}, "token": {"kind": "identifier", "text": "type"}, "children": []},
                  ]},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 44}, "end": {"line": 4, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 4, "column": 45}, "end": {"line": 4, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 45}, "end": {"line": 4, "column": 45}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 4, "column": 45}, "end": {"line": 4, "column": 52}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 45}, "end": {"line": 4, "column": 46}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 46}, "end": {"line": 4, "column": 47}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 4, "column": 47}, "end": {"line": 4, "column": 51}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 4, "column": 47}, "end": {"line": 4, "column": 51}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 4, "column": 47}, "end": {"line": 4, "column": 51}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 47}, "end": {"line": 4, "column": 51}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 51}, "end": {"line": 4, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 4, "column": 52}, "end": {"line": 4, "column": 52}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 52}, "end": {"line": 4, "column": 52}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 52}, "end": {"line": 4, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 53}, "end": {"line": 4, "column": 54}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 4, "column": 54}, "end": {"line": 4, "column": 54}}, "children": []},
]}

# Parser output for `IRI(string: namespace + name)` at 8:9.
concatenated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 12}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 12}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 12}, "end": {"line": 8, "column": 13}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 8, "column": 13}, "end": {"line": 8, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 8, "column": 13}, "end": {"line": 8, "column": 37}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 13}, "end": {"line": 8, "column": 19}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 19}, "end": {"line": 8, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "SequenceExprSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 37}}, "children": [
        {"type": "ExprListSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 37}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 30}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
          ]},
          {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 8, "column": 31}, "end": {"line": 8, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 31}, "end": {"line": 8, "column": 32}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
          ]},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 33}, "end": {"line": 8, "column": 37}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 37}, "end": {"line": 8, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 8, "column": 38}, "end": {"line": 8, "column": 38}}, "children": []},
]}

# Parser output for `IRI(rawValue: "http://xmlns.com/foaf/0.1/")` at 12:9.
boundary_literal_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 52}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 12}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 12}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 12}, "end": {"line": 12, "column": 13}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 21}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 21}, "end": {"line": 12, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 12, "column": 23}, "end": {"line": 12, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 23}, "end": {"line": 12, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 50}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 50}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 50}, "end": {"line": 12, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 51}, "end": {"line": 12, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 52}, "end": {"line": 12, "column": 52}}, "children": []},
]}

# Parser output for `print("\(literal)")` at 16:9.
interpolated_description_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 14}}, "token": {"kind": "identifier", "text": "print"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 14}, "end": {"line": 16, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 15}, "end": {"line": 16, "column": 27}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 15}, "end": {"line": 16, "column": 27}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 16, "column": 15}, "end": {"line": 16, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 15}, "end": {"line": 16, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 16, "column": 16}, "end": {"line": 16, "column": 26}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 16, "column": 16}, "end": {"line": 16, "column": 16}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 16}, "end": {"line": 16, "column": 16}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 16, "column": 16}, "end": {"line": 16, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 16}, "end": {"line": 16, "column": 17}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 17}, "end": {"line": 16, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 18}, "end": {"line": 16, "column": 25}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 18}, "end": {"line": 16, "column": 25}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 18}, "end": {"line": 16, "column": 25}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 18}, "end": {"line": 16, "column": 25}}, "token": {"kind": "identifier", "text": "literal"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 25}, "end": {"line": 16, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 16, "column": 26}, "end": {"line": 16, "column": 26}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 26}, "end": {"line": 16, "column": 26}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 26}, "end": {"line": 16, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 27}, "end": {"line": 16, "column": 28}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 28}, "end": {"line": 16, "column": 28}}, "children": []},
]}

test_denies_init_interpolated_iri if {
  result := decision with input as init_interpolated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 20
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_interpolated_iri if {
  result := decision with input as qualified_interpolated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 24
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_init_concatenated_iri if {
  result := decision with input as qualified_init_concatenated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 28
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_init_concatenated_iri if {
  result := decision with input as init_concatenated_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 32
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

# Parser output for `IRI.init(rawValue: "\(namespace)\(name)")` at 20:9.
init_interpolated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 17}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 12}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 12}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 12}, "end": {"line": 20, "column": 13}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 13}, "end": {"line": 20, "column": 17}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 13}, "end": {"line": 20, "column": 17}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 17}, "end": {"line": 20, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 18}, "end": {"line": 20, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 18}, "end": {"line": 20, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 18}, "end": {"line": 20, "column": 26}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 26}, "end": {"line": 20, "column": 27}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 20, "column": 28}, "end": {"line": 20, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 28}, "end": {"line": 20, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 20, "column": 29}, "end": {"line": 20, "column": 48}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 29}, "end": {"line": 20, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 29}, "end": {"line": 20, "column": 29}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 20, "column": 29}, "end": {"line": 20, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 29}, "end": {"line": 20, "column": 30}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 30}, "end": {"line": 20, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 31}, "end": {"line": 20, "column": 40}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 31}, "end": {"line": 20, "column": 40}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 31}, "end": {"line": 20, "column": 40}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 31}, "end": {"line": 20, "column": 40}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 40}, "end": {"line": 20, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 41}, "end": {"line": 20, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 41}, "end": {"line": 20, "column": 41}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 20, "column": 41}, "end": {"line": 20, "column": 48}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 41}, "end": {"line": 20, "column": 42}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 42}, "end": {"line": 20, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 43}, "end": {"line": 20, "column": 47}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 43}, "end": {"line": 20, "column": 47}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 43}, "end": {"line": 20, "column": 47}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 43}, "end": {"line": 20, "column": 47}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 47}, "end": {"line": 20, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 48}, "end": {"line": 20, "column": 48}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 48}, "end": {"line": 20, "column": 48}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 48}, "end": {"line": 20, "column": 49}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 49}, "end": {"line": 20, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 20, "column": 50}, "end": {"line": 20, "column": 50}}, "children": []},
]}

# Parser output for `IRIKit.IRI(rawValue: "\(namespace)\(name)")` at 24:9.
qualified_interpolated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 52}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 19}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "IRIKit"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 19}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 28}}, "token": {"kind": "identifier", "text": "rawValue"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 28}, "end": {"line": 24, "column": 29}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 50}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 31}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 31}, "end": {"line": 24, "column": 32}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 32}, "end": {"line": 24, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 42}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 42}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 42}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 33}, "end": {"line": 24, "column": 42}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 42}, "end": {"line": 24, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 43}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
          {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 44}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 45}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 49}}, "children": [
              {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 49}}, "children": [
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 49}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 49}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 49}, "end": {"line": 24, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          ]},
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 50}, "end": {"line": 24, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 50}, "end": {"line": 24, "column": 50}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 50}, "end": {"line": 24, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 51}, "end": {"line": 24, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 52}}, "children": []},
]}

# Parser output for `IRIKit.IRI.init(string: namespace + name)` at 28:9.
qualified_init_concatenated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 24}}, "children": [
    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 19}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 15}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 15}}, "token": {"kind": "identifier", "text": "IRIKit"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 16}}, "token": {"kind": "period", "text": "."}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 19}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 19}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 20}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 24}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 24}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 24}, "end": {"line": 28, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 25}, "end": {"line": 28, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 25}, "end": {"line": 28, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 25}, "end": {"line": 28, "column": 31}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "SequenceExprSyntax", "range": {"start": {"line": 28, "column": 33}, "end": {"line": 28, "column": 49}}, "children": [
        {"type": "ExprListSyntax", "range": {"start": {"line": 28, "column": 33}, "end": {"line": 28, "column": 49}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 33}, "end": {"line": 28, "column": 42}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 33}, "end": {"line": 28, "column": 42}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
          ]},
          {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 28, "column": 43}, "end": {"line": 28, "column": 44}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 43}, "end": {"line": 28, "column": 44}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
          ]},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 45}, "end": {"line": 28, "column": 49}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 45}, "end": {"line": 28, "column": 49}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 49}, "end": {"line": 28, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 50}, "end": {"line": 28, "column": 50}}, "children": []},
]}

# Parser output for `IRI.init(string: namespace + name)` at 32:9.
init_concatenated_iri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 43}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 17}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 12}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 12}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 12}, "end": {"line": 32, "column": 13}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 13}, "end": {"line": 32, "column": 17}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 13}, "end": {"line": 32, "column": 17}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 17}, "end": {"line": 32, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 32, "column": 18}, "end": {"line": 32, "column": 42}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 32, "column": 18}, "end": {"line": 32, "column": 42}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 18}, "end": {"line": 32, "column": 24}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 24}, "end": {"line": 32, "column": 25}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "SequenceExprSyntax", "range": {"start": {"line": 32, "column": 26}, "end": {"line": 32, "column": 42}}, "children": [
        {"type": "ExprListSyntax", "range": {"start": {"line": 32, "column": 26}, "end": {"line": 32, "column": 42}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 26}, "end": {"line": 32, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 26}, "end": {"line": 32, "column": 35}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
          ]},
          {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 32, "column": 36}, "end": {"line": 32, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 36}, "end": {"line": 32, "column": 37}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
          ]},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 32, "column": 38}, "end": {"line": 32, "column": 42}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 38}, "end": {"line": 32, "column": 42}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 42}, "end": {"line": 32, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 32, "column": 43}, "end": {"line": 32, "column": 43}}, "children": []},
]}
