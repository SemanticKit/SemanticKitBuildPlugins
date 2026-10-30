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
interpolated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 54}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 54}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 54}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 4, "column": 9}, "end": {"line": 4, "column": 54}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 54}, "end": {"line": 4, "column": 54}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `IRI(string: namespace + name)` at 8:9.
concatenated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 38}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 38}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 38}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 8, "column": 9}, "end": {"line": 8, "column": 38}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 38}, "end": {"line": 8, "column": 38}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `IRI(rawValue: "http://xmlns.com/foaf/0.1/")` at 12:9.
boundary_literal_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 52}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 52}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 52}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 52}}, "children": [
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
                  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 50}}, "token": {"kind": "stringSegment", "text": "http://xmlns.com/foaf/0.1/"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 50}, "end": {"line": 12, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 51}, "end": {"line": 12, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 52}, "end": {"line": 12, "column": 52}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 52}, "end": {"line": 12, "column": 52}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `print("\(literal)")` at 16:9.
interpolated_description_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 9}, "end": {"line": 16, "column": 28}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 28}, "end": {"line": 16, "column": 28}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
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
init_interpolated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 50}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 50}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 50}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 50}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 50}, "end": {"line": 20, "column": 50}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `IRIKit.IRI(rawValue: "\(namespace)\(name)")` at 24:9.
qualified_interpolated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 52}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 52}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 52}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 52}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 52}, "end": {"line": 24, "column": 52}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `IRIKit.IRI.init(string: namespace + name)` at 28:9.
qualified_init_concatenated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 50}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 50}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 50}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 50}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 50}, "end": {"line": 28, "column": 50}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `IRI.init(string: namespace + name)` at 32:9.
init_concatenated_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 43}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 43}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 43}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 32, "column": 9}, "end": {"line": 32, "column": 43}}, "children": [
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 32, "column": 43}, "end": {"line": 32, "column": 43}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

test_denies_url_interpolated if {
  result := decision with input as url_interpolated_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 100
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_named_node_concatenated if {
  result := decision with input as named_node_concatenated_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 103
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_term_concatenated if {
  result := decision with input as term_concatenated_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 106
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_interpolated_namespace_binding if {
  result := decision with input as interpolated_namespace_binding_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 109
  result.deny[0].column == 17
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_concatenated_namespace_binding if {
  result := decision with input as concatenated_namespace_binding_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 112
  result.deny[0].column == 17
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_returned_iri if {
  result := decision with input as returned_iri_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 115
  result.deny[0].column == 16
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_greeting_binding if {
  result := decision with input as greeting_binding_node

  count(result.deny) == 0
}

test_allows_sum_binding if {
  result := decision with input as sum_binding_node

  count(result.deny) == 0
}

test_allows_path_binding if {
  result := decision with input as path_binding_node

  count(result.deny) == 0
}

# Parser output for `URL(string: "\(base)knows")` at 100:9.
url_interpolated_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 36}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 36}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 36}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 36}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 12}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 9}, "end": {"line": 100, "column": 12}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 12}, "end": {"line": 100, "column": 13}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 35}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 19}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 19}, "end": {"line": 100, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 100, "column": 21}, "end": {"line": 100, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 21}, "end": {"line": 100, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 34}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 22}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 22}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                ]},
                {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 29}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 22}, "end": {"line": 100, "column": 23}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 23}, "end": {"line": 100, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 28}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 28}}, "children": [
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 28}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 24}, "end": {"line": 100, "column": 28}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 28}, "end": {"line": 100, "column": 29}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                ]},
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 100, "column": 29}, "end": {"line": 100, "column": 34}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 29}, "end": {"line": 100, "column": 34}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 34}, "end": {"line": 100, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 35}, "end": {"line": 100, "column": 36}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 100, "column": 36}, "end": {"line": 100, "column": 36}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 36}, "end": {"line": 100, "column": 36}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `NamedNode("http://xmlns.com/foaf/0.1/" + name)` at 103:9.
named_node_concatenated_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 55}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 55}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 55}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 55}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 18}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 9}, "end": {"line": 103, "column": 18}}, "token": {"kind": "identifier", "text": "NamedNode"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 18}, "end": {"line": 103, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 54}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 54}}, "children": [
            {"type": "SequenceExprSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 54}}, "children": [
              {"type": "ExprListSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 54}}, "children": [
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 47}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 19}, "end": {"line": 103, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 103, "column": 20}, "end": {"line": 103, "column": 46}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 103, "column": 20}, "end": {"line": 103, "column": 46}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 20}, "end": {"line": 103, "column": 46}}, "token": {"kind": "stringSegment", "text": "http://xmlns.com/foaf/0.1/"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 46}, "end": {"line": 103, "column": 47}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
                {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 103, "column": 48}, "end": {"line": 103, "column": 49}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 48}, "end": {"line": 103, "column": 49}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                ]},
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 103, "column": 50}, "end": {"line": 103, "column": 54}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 50}, "end": {"line": 103, "column": 54}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 54}, "end": {"line": 103, "column": 55}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 103, "column": 55}, "end": {"line": 103, "column": 55}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 55}, "end": {"line": 103, "column": 55}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `Term("http://example.org/" + name)` at 106:9.
term_concatenated_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 43}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 43}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 43}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 43}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 13}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 9}, "end": {"line": 106, "column": 13}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 13}, "end": {"line": 106, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 42}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 42}}, "children": [
            {"type": "SequenceExprSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 42}}, "children": [
              {"type": "ExprListSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 42}}, "children": [
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 35}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 14}, "end": {"line": 106, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 106, "column": 15}, "end": {"line": 106, "column": 34}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 106, "column": 15}, "end": {"line": 106, "column": 34}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 15}, "end": {"line": 106, "column": 34}}, "token": {"kind": "stringSegment", "text": "http://example.org/"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 34}, "end": {"line": 106, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
                {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 106, "column": 36}, "end": {"line": 106, "column": 37}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 36}, "end": {"line": 106, "column": 37}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                ]},
                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 106, "column": 38}, "end": {"line": 106, "column": 42}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 38}, "end": {"line": 106, "column": 42}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 42}, "end": {"line": 106, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 43}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 43}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `let v = "\(namespace)knows"` at 109:9.
interpolated_namespace_binding_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 109, "column": 9}, "end": {"line": 109, "column": 36}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 109, "column": 9}, "end": {"line": 109, "column": 36}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 109, "column": 9}, "end": {"line": 109, "column": 36}}, "children": [
      {"type": "VariableDeclSyntax", "range": {"start": {"line": 109, "column": 9}, "end": {"line": 109, "column": 36}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 9}, "end": {"line": 109, "column": 12}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 109, "column": 13}, "end": {"line": 109, "column": 36}}, "children": [
          {"type": "PatternBindingSyntax", "range": {"start": {"line": 109, "column": 13}, "end": {"line": 109, "column": 36}}, "children": [
            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 109, "column": 13}, "end": {"line": 109, "column": 14}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 13}, "end": {"line": 109, "column": 14}}, "token": {"kind": "identifier", "text": "v"}, "children": []},
            ]},
            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 109, "column": 15}, "end": {"line": 109, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 15}, "end": {"line": 109, "column": 16}}, "token": {"kind": "equal", "text": "="}, "children": []},
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 109, "column": 17}, "end": {"line": 109, "column": 36}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 17}, "end": {"line": 109, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 109, "column": 18}, "end": {"line": 109, "column": 35}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 109, "column": 18}, "end": {"line": 109, "column": 18}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 18}, "end": {"line": 109, "column": 18}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                  ]},
                  {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 109, "column": 18}, "end": {"line": 109, "column": 30}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 18}, "end": {"line": 109, "column": 19}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 19}, "end": {"line": 109, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 29}}, "children": [
                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 29}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 29}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 29}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 29}, "end": {"line": 109, "column": 30}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 109, "column": 30}, "end": {"line": 109, "column": 35}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 30}, "end": {"line": 109, "column": 35}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 36}, "end": {"line": 109, "column": 36}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `var u = Foaf.namespace + name` at 112:9.
concatenated_namespace_binding_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 112, "column": 9}, "end": {"line": 112, "column": 38}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 112, "column": 9}, "end": {"line": 112, "column": 38}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 112, "column": 9}, "end": {"line": 112, "column": 38}}, "children": [
      {"type": "VariableDeclSyntax", "range": {"start": {"line": 112, "column": 9}, "end": {"line": 112, "column": 38}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 9}, "end": {"line": 112, "column": 12}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 112, "column": 13}, "end": {"line": 112, "column": 38}}, "children": [
          {"type": "PatternBindingSyntax", "range": {"start": {"line": 112, "column": 13}, "end": {"line": 112, "column": 38}}, "children": [
            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 112, "column": 13}, "end": {"line": 112, "column": 14}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 13}, "end": {"line": 112, "column": 14}}, "token": {"kind": "identifier", "text": "u"}, "children": []},
            ]},
            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 112, "column": 15}, "end": {"line": 112, "column": 38}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 15}, "end": {"line": 112, "column": 16}}, "token": {"kind": "equal", "text": "="}, "children": []},
              {"type": "SequenceExprSyntax", "range": {"start": {"line": 112, "column": 17}, "end": {"line": 112, "column": 38}}, "children": [
                {"type": "ExprListSyntax", "range": {"start": {"line": 112, "column": 17}, "end": {"line": 112, "column": 38}}, "children": [
                  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 112, "column": 17}, "end": {"line": 112, "column": 31}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 17}, "end": {"line": 112, "column": 21}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 17}, "end": {"line": 112, "column": 21}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 21}, "end": {"line": 112, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 22}, "end": {"line": 112, "column": 31}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 22}, "end": {"line": 112, "column": 31}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                    ]},
                  ]},
                  {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 33}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 33}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                  ]},
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 34}, "end": {"line": 112, "column": 38}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 34}, "end": {"line": 112, "column": 38}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 38}, "end": {"line": 112, "column": 38}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `return "http://example.org/\(name)"` at 115:9.
returned_iri_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 115, "column": 9}, "end": {"line": 115, "column": 44}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 115, "column": 9}, "end": {"line": 115, "column": 44}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 115, "column": 9}, "end": {"line": 115, "column": 44}}, "children": [
      {"type": "ReturnStmtSyntax", "range": {"start": {"line": 115, "column": 9}, "end": {"line": 115, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 9}, "end": {"line": 115, "column": 15}}, "token": {"kind": "keyword", "text": "return"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 44}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 16}, "end": {"line": 115, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 115, "column": 17}, "end": {"line": 115, "column": 43}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 115, "column": 17}, "end": {"line": 115, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 17}, "end": {"line": 115, "column": 36}}, "token": {"kind": "stringSegment", "text": "http://example.org/"}, "children": []},
            ]},
            {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 115, "column": 36}, "end": {"line": 115, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 36}, "end": {"line": 115, "column": 37}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 37}, "end": {"line": 115, "column": 38}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 115, "column": 38}, "end": {"line": 115, "column": 42}}, "children": [
                {"type": "LabeledExprSyntax", "range": {"start": {"line": 115, "column": 38}, "end": {"line": 115, "column": 42}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 115, "column": 38}, "end": {"line": 115, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 38}, "end": {"line": 115, "column": 42}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 42}, "end": {"line": 115, "column": 43}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 115, "column": 43}, "end": {"line": 115, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 43}, "end": {"line": 115, "column": 43}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 43}, "end": {"line": 115, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 44}, "end": {"line": 115, "column": 44}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `let greeting = "Hello, \(name)"` at 118:9.
greeting_binding_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 118, "column": 9}, "end": {"line": 118, "column": 40}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 118, "column": 9}, "end": {"line": 118, "column": 40}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 118, "column": 9}, "end": {"line": 118, "column": 40}}, "children": [
      {"type": "VariableDeclSyntax", "range": {"start": {"line": 118, "column": 9}, "end": {"line": 118, "column": 40}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 9}, "end": {"line": 118, "column": 12}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 118, "column": 13}, "end": {"line": 118, "column": 40}}, "children": [
          {"type": "PatternBindingSyntax", "range": {"start": {"line": 118, "column": 13}, "end": {"line": 118, "column": 40}}, "children": [
            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 118, "column": 13}, "end": {"line": 118, "column": 21}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 13}, "end": {"line": 118, "column": 21}}, "token": {"kind": "identifier", "text": "greeting"}, "children": []},
            ]},
            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 118, "column": 22}, "end": {"line": 118, "column": 40}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 22}, "end": {"line": 118, "column": 23}}, "token": {"kind": "equal", "text": "="}, "children": []},
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 118, "column": 24}, "end": {"line": 118, "column": 40}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 24}, "end": {"line": 118, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 39}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 32}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 25}, "end": {"line": 118, "column": 32}}, "token": {"kind": "stringSegment", "text": "Hello, "}, "children": []},
                  ]},
                  {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 118, "column": 32}, "end": {"line": 118, "column": 39}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 32}, "end": {"line": 118, "column": 33}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 33}, "end": {"line": 118, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 38}}, "children": [
                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 38}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 38}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 38}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 38}, "end": {"line": 118, "column": 39}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 118, "column": 39}, "end": {"line": 118, "column": 39}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 39}, "end": {"line": 118, "column": 39}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 39}, "end": {"line": 118, "column": 40}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 40}, "end": {"line": 118, "column": 40}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `let total = base + offset` at 121:9.
sum_binding_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 121, "column": 9}, "end": {"line": 121, "column": 34}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 121, "column": 9}, "end": {"line": 121, "column": 34}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 121, "column": 9}, "end": {"line": 121, "column": 34}}, "children": [
      {"type": "VariableDeclSyntax", "range": {"start": {"line": 121, "column": 9}, "end": {"line": 121, "column": 34}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 9}, "end": {"line": 121, "column": 12}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 121, "column": 13}, "end": {"line": 121, "column": 34}}, "children": [
          {"type": "PatternBindingSyntax", "range": {"start": {"line": 121, "column": 13}, "end": {"line": 121, "column": 34}}, "children": [
            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 121, "column": 13}, "end": {"line": 121, "column": 18}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 13}, "end": {"line": 121, "column": 18}}, "token": {"kind": "identifier", "text": "total"}, "children": []},
            ]},
            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 121, "column": 19}, "end": {"line": 121, "column": 34}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 19}, "end": {"line": 121, "column": 20}}, "token": {"kind": "equal", "text": "="}, "children": []},
              {"type": "SequenceExprSyntax", "range": {"start": {"line": 121, "column": 21}, "end": {"line": 121, "column": 34}}, "children": [
                {"type": "ExprListSyntax", "range": {"start": {"line": 121, "column": 21}, "end": {"line": 121, "column": 34}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 121, "column": 21}, "end": {"line": 121, "column": 25}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 21}, "end": {"line": 121, "column": 25}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
                  ]},
                  {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 121, "column": 26}, "end": {"line": 121, "column": 27}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 26}, "end": {"line": 121, "column": 27}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                  ]},
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 121, "column": 28}, "end": {"line": 121, "column": 34}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 28}, "end": {"line": 121, "column": 34}}, "token": {"kind": "identifier", "text": "offset"}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 34}, "end": {"line": 121, "column": 34}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `let path = directory + "/file.txt"` at 124:9.
path_binding_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 124, "column": 9}, "end": {"line": 124, "column": 43}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 124, "column": 9}, "end": {"line": 124, "column": 43}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 124, "column": 9}, "end": {"line": 124, "column": 43}}, "children": [
      {"type": "VariableDeclSyntax", "range": {"start": {"line": 124, "column": 9}, "end": {"line": 124, "column": 43}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 9}, "end": {"line": 124, "column": 12}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 124, "column": 13}, "end": {"line": 124, "column": 43}}, "children": [
          {"type": "PatternBindingSyntax", "range": {"start": {"line": 124, "column": 13}, "end": {"line": 124, "column": 43}}, "children": [
            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 124, "column": 13}, "end": {"line": 124, "column": 17}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 13}, "end": {"line": 124, "column": 17}}, "token": {"kind": "identifier", "text": "path"}, "children": []},
            ]},
            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 124, "column": 18}, "end": {"line": 124, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 18}, "end": {"line": 124, "column": 19}}, "token": {"kind": "equal", "text": "="}, "children": []},
              {"type": "SequenceExprSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 43}}, "children": [
                {"type": "ExprListSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 43}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 29}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 20}, "end": {"line": 124, "column": 29}}, "token": {"kind": "identifier", "text": "directory"}, "children": []},
                  ]},
                  {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 124, "column": 30}, "end": {"line": 124, "column": 31}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 30}, "end": {"line": 124, "column": 31}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                  ]},
                  {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 124, "column": 32}, "end": {"line": 124, "column": 43}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 32}, "end": {"line": 124, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                    {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 124, "column": 33}, "end": {"line": 124, "column": 42}}, "children": [
                      {"type": "StringSegmentSyntax", "range": {"start": {"line": 124, "column": 33}, "end": {"line": 124, "column": 42}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 33}, "end": {"line": 124, "column": 42}}, "token": {"kind": "stringSegment", "text": "/file.txt"}, "children": []},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 42}, "end": {"line": 124, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 43}, "end": {"line": 124, "column": 43}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# A term reference given a string is no_term_reference_by_name's, once.
test_leaves_concatenated_range_to_term_reference_rule if {
  result := decision with input as range_by_concatenated_string_node

  count(result.deny) == 0
}

# Parser output for `Range("http://www.w3.org/2001/XMLSchema#" + "nonNegativeInteger")` at 42:13.
range_by_concatenated_string_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 78}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 78}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 78}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 78}}, "children": [
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
                      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 20}, "end": {"line": 42, "column": 53}}, "token": {"kind": "stringSegment", "text": "http://www.w3.org/2001/XMLSchema#"}, "children": []},
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
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 78}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

test_allows_concatenation_in_decoder_type if {
  result := decision with input as turtle_decoder_concatenation_node

  count(result.deny) == 0
}

test_allows_interpolation_in_encoder_extension if {
  result := decision with input as coder_extension_interpolation_node

  count(result.deny) == 0
}

test_allows_concatenation_in_top_level_encoder if {
  result := decision with input as top_level_encoder_concatenation_node

  count(result.deny) == 0
}

test_allows_interpolation_in_encode_to if {
  result := decision with input as encode_to_interpolation_node

  count(result.deny) == 0
}

test_allows_interpolation_in_init_from if {
  result := decision with input as init_from_interpolation_node

  count(result.deny) == 0
}

test_denies_concatenation_in_parser_type if {
  result := decision with input as parser_concatenation_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 145
  result.deny[0].column == 63
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_interpolation_in_other_encode if {
  result := decision with input as encode_value_interpolation_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_interpolated_identity"
  result.deny[0].line == 148
  result.deny[0].column == 53
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

# Parser output for `struct TurtleDecoder { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }` at 130:1.
turtle_decoder_concatenation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 98}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 98}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 98}}, "children": [
      {"type": "StructDeclSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 98}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 8}, "end": {"line": 130, "column": 21}}, "token": {"kind": "identifier", "text": "TurtleDecoder"}, "children": []},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 130, "column": 22}, "end": {"line": 130, "column": 98}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 22}, "end": {"line": 130, "column": 23}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 96}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 96}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 96}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 24}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 24}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 24}, "end": {"line": 130, "column": 28}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 29}, "end": {"line": 130, "column": 36}}, "token": {"kind": "identifier", "text": "resolve"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 130, "column": 36}, "end": {"line": 130, "column": 61}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 130, "column": 36}, "end": {"line": 130, "column": 53}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 36}, "end": {"line": 130, "column": 37}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 52}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 52}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 37}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 37}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 38}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 39}, "end": {"line": 130, "column": 44}}, "token": {"kind": "identifier", "text": "local"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 44}, "end": {"line": 130, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 130, "column": 46}, "end": {"line": 130, "column": 52}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 46}, "end": {"line": 130, "column": 52}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 52}, "end": {"line": 130, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "ReturnClauseSyntax", "range": {"start": {"line": 130, "column": 54}, "end": {"line": 130, "column": 61}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 54}, "end": {"line": 130, "column": 56}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
                    {"type": "OptionalTypeSyntax", "range": {"start": {"line": 130, "column": 57}, "end": {"line": 130, "column": 61}}, "children": [
                      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 130, "column": 57}, "end": {"line": 130, "column": 60}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 57}, "end": {"line": 130, "column": 60}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 60}, "end": {"line": 130, "column": 61}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 130, "column": 62}, "end": {"line": 130, "column": 96}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 62}, "end": {"line": 130, "column": 63}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 130, "column": 64}, "end": {"line": 130, "column": 94}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 130, "column": 64}, "end": {"line": 130, "column": 94}}, "children": [
                      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 130, "column": 64}, "end": {"line": 130, "column": 94}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 130, "column": 64}, "end": {"line": 130, "column": 67}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 64}, "end": {"line": 130, "column": 67}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 67}, "end": {"line": 130, "column": 68}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 130, "column": 68}, "end": {"line": 130, "column": 93}}, "children": [
                          {"type": "LabeledExprSyntax", "range": {"start": {"line": 130, "column": 68}, "end": {"line": 130, "column": 93}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 68}, "end": {"line": 130, "column": 74}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                            {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 74}, "end": {"line": 130, "column": 75}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                            {"type": "SequenceExprSyntax", "range": {"start": {"line": 130, "column": 76}, "end": {"line": 130, "column": 93}}, "children": [
                              {"type": "ExprListSyntax", "range": {"start": {"line": 130, "column": 76}, "end": {"line": 130, "column": 93}}, "children": [
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 130, "column": 76}, "end": {"line": 130, "column": 85}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 76}, "end": {"line": 130, "column": 85}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                                ]},
                                {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 130, "column": 86}, "end": {"line": 130, "column": 87}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 86}, "end": {"line": 130, "column": 87}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                                ]},
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 130, "column": 88}, "end": {"line": 130, "column": 93}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 88}, "end": {"line": 130, "column": 93}}, "token": {"kind": "identifier", "text": "local"}, "children": []},
                                ]},
                              ]},
                            ]},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 93}, "end": {"line": 130, "column": 94}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 130, "column": 95}, "end": {"line": 130, "column": 95}}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 95}, "end": {"line": 130, "column": 96}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 97}, "end": {"line": 130, "column": 98}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 98}, "end": {"line": 130, "column": 98}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `extension NTriplesEncoder { func subject(_ name: String) -> String { return "\(ns)\(name)" } }` at 133:1.
coder_extension_interpolation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 95}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 95}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 95}}, "children": [
      {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 95}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 133, "column": 11}, "end": {"line": 133, "column": 26}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 11}, "end": {"line": 133, "column": 26}}, "token": {"kind": "identifier", "text": "NTriplesEncoder"}, "children": []},
        ]},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 133, "column": 27}, "end": {"line": 133, "column": 95}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 27}, "end": {"line": 133, "column": 28}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 93}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 93}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 93}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 29}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 29}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 29}, "end": {"line": 133, "column": 33}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 34}, "end": {"line": 133, "column": 41}}, "token": {"kind": "identifier", "text": "subject"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 133, "column": 41}, "end": {"line": 133, "column": 67}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 133, "column": 41}, "end": {"line": 133, "column": 57}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 41}, "end": {"line": 133, "column": 42}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 56}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 56}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 42}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 42}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 43}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 44}, "end": {"line": 133, "column": 48}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 48}, "end": {"line": 133, "column": 49}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 133, "column": 50}, "end": {"line": 133, "column": 56}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 50}, "end": {"line": 133, "column": 56}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 56}, "end": {"line": 133, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "ReturnClauseSyntax", "range": {"start": {"line": 133, "column": 58}, "end": {"line": 133, "column": 67}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 58}, "end": {"line": 133, "column": 60}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
                    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 133, "column": 61}, "end": {"line": 133, "column": 67}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 61}, "end": {"line": 133, "column": 67}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 133, "column": 68}, "end": {"line": 133, "column": 93}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 68}, "end": {"line": 133, "column": 69}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 133, "column": 70}, "end": {"line": 133, "column": 91}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 133, "column": 70}, "end": {"line": 133, "column": 91}}, "children": [
                      {"type": "ReturnStmtSyntax", "range": {"start": {"line": 133, "column": 70}, "end": {"line": 133, "column": 91}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 70}, "end": {"line": 133, "column": 76}}, "token": {"kind": "keyword", "text": "return"}, "children": []},
                        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 133, "column": 77}, "end": {"line": 133, "column": 91}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 77}, "end": {"line": 133, "column": 78}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 133, "column": 78}, "end": {"line": 133, "column": 90}}, "children": [
                            {"type": "StringSegmentSyntax", "range": {"start": {"line": 133, "column": 78}, "end": {"line": 133, "column": 78}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 78}, "end": {"line": 133, "column": 78}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                            ]},
                            {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 133, "column": 78}, "end": {"line": 133, "column": 83}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 78}, "end": {"line": 133, "column": 79}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 79}, "end": {"line": 133, "column": 80}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 133, "column": 80}, "end": {"line": 133, "column": 82}}, "children": [
                                {"type": "LabeledExprSyntax", "range": {"start": {"line": 133, "column": 80}, "end": {"line": 133, "column": 82}}, "children": [
                                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 133, "column": 80}, "end": {"line": 133, "column": 82}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 80}, "end": {"line": 133, "column": 82}}, "token": {"kind": "identifier", "text": "ns"}, "children": []},
                                  ]},
                                ]},
                              ]},
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 82}, "end": {"line": 133, "column": 83}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                            ]},
                            {"type": "StringSegmentSyntax", "range": {"start": {"line": 133, "column": 83}, "end": {"line": 133, "column": 83}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 83}, "end": {"line": 133, "column": 83}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                            ]},
                            {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 133, "column": 83}, "end": {"line": 133, "column": 90}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 83}, "end": {"line": 133, "column": 84}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 84}, "end": {"line": 133, "column": 85}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                              {"type": "LabeledExprListSyntax", "range": {"start": {"line": 133, "column": 85}, "end": {"line": 133, "column": 89}}, "children": [
                                {"type": "LabeledExprSyntax", "range": {"start": {"line": 133, "column": 85}, "end": {"line": 133, "column": 89}}, "children": [
                                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 133, "column": 85}, "end": {"line": 133, "column": 89}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 85}, "end": {"line": 133, "column": 89}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                                  ]},
                                ]},
                              ]},
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 89}, "end": {"line": 133, "column": 90}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                            ]},
                            {"type": "StringSegmentSyntax", "range": {"start": {"line": 133, "column": 90}, "end": {"line": 133, "column": 90}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 90}, "end": {"line": 133, "column": 90}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                            ]},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 90}, "end": {"line": 133, "column": 91}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        ]},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 92}, "end": {"line": 133, "column": 93}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 94}, "end": {"line": 133, "column": 95}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 95}, "end": {"line": 133, "column": 95}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `struct Writer: TopLevelEncoder { func iri(_ name: String) -> IRI? { IRI(string: ns + name) } }` at 136:1.
top_level_encoder_concatenation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 95}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 95}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 95}}, "children": [
      {"type": "StructDeclSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 95}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 8}, "end": {"line": 136, "column": 14}}, "token": {"kind": "identifier", "text": "Writer"}, "children": []},
        {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 136, "column": 14}, "end": {"line": 136, "column": 31}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 14}, "end": {"line": 136, "column": 15}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 31}}, "children": [
            {"type": "InheritedTypeSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 31}}, "children": [
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 31}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 16}, "end": {"line": 136, "column": 31}}, "token": {"kind": "identifier", "text": "TopLevelEncoder"}, "children": []},
              ]},
            ]},
          ]},
        ]},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 95}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 32}, "end": {"line": 136, "column": 33}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 93}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 93}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 93}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 34}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 34}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 34}, "end": {"line": 136, "column": 38}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 39}, "end": {"line": 136, "column": 42}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 136, "column": 42}, "end": {"line": 136, "column": 66}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 136, "column": 42}, "end": {"line": 136, "column": 58}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 42}, "end": {"line": 136, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 136, "column": 43}, "end": {"line": 136, "column": 57}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 136, "column": 43}, "end": {"line": 136, "column": 57}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 136, "column": 43}, "end": {"line": 136, "column": 43}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 136, "column": 43}, "end": {"line": 136, "column": 43}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 43}, "end": {"line": 136, "column": 44}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 45}, "end": {"line": 136, "column": 49}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 49}, "end": {"line": 136, "column": 50}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 51}, "end": {"line": 136, "column": 57}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 51}, "end": {"line": 136, "column": 57}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 57}, "end": {"line": 136, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "ReturnClauseSyntax", "range": {"start": {"line": 136, "column": 59}, "end": {"line": 136, "column": 66}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 59}, "end": {"line": 136, "column": 61}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
                    {"type": "OptionalTypeSyntax", "range": {"start": {"line": 136, "column": 62}, "end": {"line": 136, "column": 66}}, "children": [
                      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 62}, "end": {"line": 136, "column": 65}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 62}, "end": {"line": 136, "column": 65}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 65}, "end": {"line": 136, "column": 66}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 136, "column": 67}, "end": {"line": 136, "column": 93}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 67}, "end": {"line": 136, "column": 68}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 91}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 91}}, "children": [
                      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 91}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 72}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 69}, "end": {"line": 136, "column": 72}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 72}, "end": {"line": 136, "column": 73}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 136, "column": 73}, "end": {"line": 136, "column": 90}}, "children": [
                          {"type": "LabeledExprSyntax", "range": {"start": {"line": 136, "column": 73}, "end": {"line": 136, "column": 90}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 73}, "end": {"line": 136, "column": 79}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 79}, "end": {"line": 136, "column": 80}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                            {"type": "SequenceExprSyntax", "range": {"start": {"line": 136, "column": 81}, "end": {"line": 136, "column": 90}}, "children": [
                              {"type": "ExprListSyntax", "range": {"start": {"line": 136, "column": 81}, "end": {"line": 136, "column": 90}}, "children": [
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 81}, "end": {"line": 136, "column": 83}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 81}, "end": {"line": 136, "column": 83}}, "token": {"kind": "identifier", "text": "ns"}, "children": []},
                                ]},
                                {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 136, "column": 84}, "end": {"line": 136, "column": 85}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 84}, "end": {"line": 136, "column": 85}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                                ]},
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 86}, "end": {"line": 136, "column": 90}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 86}, "end": {"line": 136, "column": 90}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
                                ]},
                              ]},
                            ]},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 90}, "end": {"line": 136, "column": 91}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 136, "column": 92}, "end": {"line": 136, "column": 92}}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 92}, "end": {"line": 136, "column": 93}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 94}, "end": {"line": 136, "column": 95}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 95}, "end": {"line": 136, "column": 95}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `extension Person: Encodable { func encode(to encoder: Encoder) throws { let iri = "\(namespace)alice" } }` at 139:1.
encode_to_interpolation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 139, "column": 1}, "end": {"line": 139, "column": 106}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 139, "column": 1}, "end": {"line": 139, "column": 106}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 139, "column": 1}, "end": {"line": 139, "column": 106}}, "children": [
      {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 139, "column": 1}, "end": {"line": 139, "column": 106}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 1}, "end": {"line": 139, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 139, "column": 11}, "end": {"line": 139, "column": 17}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 11}, "end": {"line": 139, "column": 17}}, "token": {"kind": "identifier", "text": "Person"}, "children": []},
        ]},
        {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 139, "column": 17}, "end": {"line": 139, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 17}, "end": {"line": 139, "column": 18}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 28}}, "children": [
            {"type": "InheritedTypeSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 28}}, "children": [
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 28}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 19}, "end": {"line": 139, "column": 28}}, "token": {"kind": "identifier", "text": "Encodable"}, "children": []},
              ]},
            ]},
          ]},
        ]},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 139, "column": 29}, "end": {"line": 139, "column": 106}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 29}, "end": {"line": 139, "column": 30}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 104}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 104}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 104}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 31}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 31}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 31}, "end": {"line": 139, "column": 35}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 36}, "end": {"line": 139, "column": 42}}, "token": {"kind": "identifier", "text": "encode"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 139, "column": 42}, "end": {"line": 139, "column": 70}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 139, "column": 42}, "end": {"line": 139, "column": 63}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 42}, "end": {"line": 139, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 139, "column": 43}, "end": {"line": 139, "column": 62}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 139, "column": 43}, "end": {"line": 139, "column": 62}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 139, "column": 43}, "end": {"line": 139, "column": 43}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 139, "column": 43}, "end": {"line": 139, "column": 43}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 43}, "end": {"line": 139, "column": 45}}, "token": {"kind": "identifier", "text": "to"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 46}, "end": {"line": 139, "column": 53}}, "token": {"kind": "identifier", "text": "encoder"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 53}, "end": {"line": 139, "column": 54}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 139, "column": 55}, "end": {"line": 139, "column": 62}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 55}, "end": {"line": 139, "column": 62}}, "token": {"kind": "identifier", "text": "Encoder"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 62}, "end": {"line": 139, "column": 63}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 139, "column": 64}, "end": {"line": 139, "column": 70}}, "children": [
                    {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 139, "column": 64}, "end": {"line": 139, "column": 70}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 64}, "end": {"line": 139, "column": 70}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 139, "column": 71}, "end": {"line": 139, "column": 104}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 71}, "end": {"line": 139, "column": 72}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 102}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 102}}, "children": [
                      {"type": "VariableDeclSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 102}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 73}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 73}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 73}, "end": {"line": 139, "column": 76}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
                        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 139, "column": 77}, "end": {"line": 139, "column": 102}}, "children": [
                          {"type": "PatternBindingSyntax", "range": {"start": {"line": 139, "column": 77}, "end": {"line": 139, "column": 102}}, "children": [
                            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 139, "column": 77}, "end": {"line": 139, "column": 80}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 77}, "end": {"line": 139, "column": 80}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
                            ]},
                            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 139, "column": 81}, "end": {"line": 139, "column": 102}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 81}, "end": {"line": 139, "column": 82}}, "token": {"kind": "equal", "text": "="}, "children": []},
                              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 139, "column": 83}, "end": {"line": 139, "column": 102}}, "children": [
                                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 83}, "end": {"line": 139, "column": 84}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 139, "column": 84}, "end": {"line": 139, "column": 101}}, "children": [
                                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 139, "column": 84}, "end": {"line": 139, "column": 84}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 84}, "end": {"line": 139, "column": 84}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                                  ]},
                                  {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 139, "column": 84}, "end": {"line": 139, "column": 96}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 84}, "end": {"line": 139, "column": 85}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 85}, "end": {"line": 139, "column": 86}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 139, "column": 86}, "end": {"line": 139, "column": 95}}, "children": [
                                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 139, "column": 86}, "end": {"line": 139, "column": 95}}, "children": [
                                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 139, "column": 86}, "end": {"line": 139, "column": 95}}, "children": [
                                          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 86}, "end": {"line": 139, "column": 95}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                                        ]},
                                      ]},
                                    ]},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 95}, "end": {"line": 139, "column": 96}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                                  ]},
                                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 139, "column": 96}, "end": {"line": 139, "column": 101}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 96}, "end": {"line": 139, "column": 101}}, "token": {"kind": "stringSegment", "text": "alice"}, "children": []},
                                  ]},
                                ]},
                                {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 101}, "end": {"line": 139, "column": 102}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                              ]},
                            ]},
                          ]},
                        ]},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 103}, "end": {"line": 139, "column": 104}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 105}, "end": {"line": 139, "column": 106}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 139, "column": 106}, "end": {"line": 139, "column": 106}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `extension Person { init(from decoder: Decoder) throws { let iri = URL(string: "\(base)alice") } }` at 142:1.
init_from_interpolation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 142, "column": 1}, "end": {"line": 142, "column": 98}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 142, "column": 1}, "end": {"line": 142, "column": 98}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 142, "column": 1}, "end": {"line": 142, "column": 98}}, "children": [
      {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 142, "column": 1}, "end": {"line": 142, "column": 98}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 1}, "end": {"line": 142, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 142, "column": 11}, "end": {"line": 142, "column": 17}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 11}, "end": {"line": 142, "column": 17}}, "token": {"kind": "identifier", "text": "Person"}, "children": []},
        ]},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 142, "column": 18}, "end": {"line": 142, "column": 98}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 18}, "end": {"line": 142, "column": 19}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 96}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 96}}, "children": [
              {"type": "InitializerDeclSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 96}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 20}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 20}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 20}, "end": {"line": 142, "column": 24}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 142, "column": 24}, "end": {"line": 142, "column": 54}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 142, "column": 24}, "end": {"line": 142, "column": 47}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 24}, "end": {"line": 142, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 142, "column": 25}, "end": {"line": 142, "column": 46}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 142, "column": 25}, "end": {"line": 142, "column": 46}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 142, "column": 25}, "end": {"line": 142, "column": 25}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 142, "column": 25}, "end": {"line": 142, "column": 25}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 25}, "end": {"line": 142, "column": 29}}, "token": {"kind": "identifier", "text": "from"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 30}, "end": {"line": 142, "column": 37}}, "token": {"kind": "identifier", "text": "decoder"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 37}, "end": {"line": 142, "column": 38}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 142, "column": 39}, "end": {"line": 142, "column": 46}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 39}, "end": {"line": 142, "column": 46}}, "token": {"kind": "identifier", "text": "Decoder"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 46}, "end": {"line": 142, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 142, "column": 48}, "end": {"line": 142, "column": 54}}, "children": [
                    {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 142, "column": 48}, "end": {"line": 142, "column": 54}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 48}, "end": {"line": 142, "column": 54}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 142, "column": 55}, "end": {"line": 142, "column": 96}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 55}, "end": {"line": 142, "column": 56}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 94}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 94}}, "children": [
                      {"type": "VariableDeclSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 94}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 57}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 57}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 57}, "end": {"line": 142, "column": 60}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
                        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 142, "column": 61}, "end": {"line": 142, "column": 94}}, "children": [
                          {"type": "PatternBindingSyntax", "range": {"start": {"line": 142, "column": 61}, "end": {"line": 142, "column": 94}}, "children": [
                            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 142, "column": 61}, "end": {"line": 142, "column": 64}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 61}, "end": {"line": 142, "column": 64}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
                            ]},
                            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 142, "column": 65}, "end": {"line": 142, "column": 94}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 65}, "end": {"line": 142, "column": 66}}, "token": {"kind": "equal", "text": "="}, "children": []},
                              {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 142, "column": 67}, "end": {"line": 142, "column": 94}}, "children": [
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 142, "column": 67}, "end": {"line": 142, "column": 70}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 67}, "end": {"line": 142, "column": 70}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
                                ]},
                                {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 70}, "end": {"line": 142, "column": 71}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                                {"type": "LabeledExprListSyntax", "range": {"start": {"line": 142, "column": 71}, "end": {"line": 142, "column": 93}}, "children": [
                                  {"type": "LabeledExprSyntax", "range": {"start": {"line": 142, "column": 71}, "end": {"line": 142, "column": 93}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 71}, "end": {"line": 142, "column": 77}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 77}, "end": {"line": 142, "column": 78}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                                    {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 142, "column": 79}, "end": {"line": 142, "column": 93}}, "children": [
                                      {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 79}, "end": {"line": 142, "column": 80}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                      {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 142, "column": 80}, "end": {"line": 142, "column": 92}}, "children": [
                                        {"type": "StringSegmentSyntax", "range": {"start": {"line": 142, "column": 80}, "end": {"line": 142, "column": 80}}, "children": [
                                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 80}, "end": {"line": 142, "column": 80}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                                        ]},
                                        {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 142, "column": 80}, "end": {"line": 142, "column": 87}}, "children": [
                                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 80}, "end": {"line": 142, "column": 81}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 81}, "end": {"line": 142, "column": 82}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                                          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 142, "column": 82}, "end": {"line": 142, "column": 86}}, "children": [
                                            {"type": "LabeledExprSyntax", "range": {"start": {"line": 142, "column": 82}, "end": {"line": 142, "column": 86}}, "children": [
                                              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 142, "column": 82}, "end": {"line": 142, "column": 86}}, "children": [
                                                {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 82}, "end": {"line": 142, "column": 86}}, "token": {"kind": "identifier", "text": "base"}, "children": []},
                                              ]},
                                            ]},
                                          ]},
                                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 86}, "end": {"line": 142, "column": 87}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                                        ]},
                                        {"type": "StringSegmentSyntax", "range": {"start": {"line": 142, "column": 87}, "end": {"line": 142, "column": 92}}, "children": [
                                          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 87}, "end": {"line": 142, "column": 92}}, "token": {"kind": "stringSegment", "text": "alice"}, "children": []},
                                        ]},
                                      ]},
                                      {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 92}, "end": {"line": 142, "column": 93}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                    ]},
                                  ]},
                                ]},
                                {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 93}, "end": {"line": 142, "column": 94}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                                {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 142, "column": 95}, "end": {"line": 142, "column": 95}}, "children": []},
                              ]},
                            ]},
                          ]},
                        ]},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 95}, "end": {"line": 142, "column": 96}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 97}, "end": {"line": 142, "column": 98}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 142, "column": 98}, "end": {"line": 142, "column": 98}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `struct TurtleParser { func resolve(_ local: String) -> IRI? { IRI(string: namespace + local) } }` at 145:1.
parser_concatenation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 145, "column": 1}, "end": {"line": 145, "column": 97}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 145, "column": 1}, "end": {"line": 145, "column": 97}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 145, "column": 1}, "end": {"line": 145, "column": 97}}, "children": [
      {"type": "StructDeclSyntax", "range": {"start": {"line": 145, "column": 1}, "end": {"line": 145, "column": 97}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 1}, "end": {"line": 145, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 8}, "end": {"line": 145, "column": 20}}, "token": {"kind": "identifier", "text": "TurtleParser"}, "children": []},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 145, "column": 21}, "end": {"line": 145, "column": 97}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 21}, "end": {"line": 145, "column": 22}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 95}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 95}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 95}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 23}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 23}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 23}, "end": {"line": 145, "column": 27}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 28}, "end": {"line": 145, "column": 35}}, "token": {"kind": "identifier", "text": "resolve"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 145, "column": 35}, "end": {"line": 145, "column": 60}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 145, "column": 35}, "end": {"line": 145, "column": 52}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 35}, "end": {"line": 145, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 145, "column": 36}, "end": {"line": 145, "column": 51}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 145, "column": 36}, "end": {"line": 145, "column": 51}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 145, "column": 36}, "end": {"line": 145, "column": 36}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 145, "column": 36}, "end": {"line": 145, "column": 36}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 36}, "end": {"line": 145, "column": 37}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 38}, "end": {"line": 145, "column": 43}}, "token": {"kind": "identifier", "text": "local"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 43}, "end": {"line": 145, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 145, "column": 45}, "end": {"line": 145, "column": 51}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 45}, "end": {"line": 145, "column": 51}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 51}, "end": {"line": 145, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                  {"type": "ReturnClauseSyntax", "range": {"start": {"line": 145, "column": 53}, "end": {"line": 145, "column": 60}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 53}, "end": {"line": 145, "column": 55}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
                    {"type": "OptionalTypeSyntax", "range": {"start": {"line": 145, "column": 56}, "end": {"line": 145, "column": 60}}, "children": [
                      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 145, "column": 56}, "end": {"line": 145, "column": 59}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 56}, "end": {"line": 145, "column": 59}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 59}, "end": {"line": 145, "column": 60}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 145, "column": 61}, "end": {"line": 145, "column": 95}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 61}, "end": {"line": 145, "column": 62}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 145, "column": 63}, "end": {"line": 145, "column": 93}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 145, "column": 63}, "end": {"line": 145, "column": 93}}, "children": [
                      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 145, "column": 63}, "end": {"line": 145, "column": 93}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 145, "column": 63}, "end": {"line": 145, "column": 66}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 63}, "end": {"line": 145, "column": 66}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 66}, "end": {"line": 145, "column": 67}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 145, "column": 67}, "end": {"line": 145, "column": 92}}, "children": [
                          {"type": "LabeledExprSyntax", "range": {"start": {"line": 145, "column": 67}, "end": {"line": 145, "column": 92}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 67}, "end": {"line": 145, "column": 73}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                            {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 73}, "end": {"line": 145, "column": 74}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                            {"type": "SequenceExprSyntax", "range": {"start": {"line": 145, "column": 75}, "end": {"line": 145, "column": 92}}, "children": [
                              {"type": "ExprListSyntax", "range": {"start": {"line": 145, "column": 75}, "end": {"line": 145, "column": 92}}, "children": [
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 145, "column": 75}, "end": {"line": 145, "column": 84}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 75}, "end": {"line": 145, "column": 84}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                                ]},
                                {"type": "BinaryOperatorExprSyntax", "range": {"start": {"line": 145, "column": 85}, "end": {"line": 145, "column": 86}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 85}, "end": {"line": 145, "column": 86}}, "token": {"kind": "binaryOperator", "text": "+"}, "children": []},
                                ]},
                                {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 145, "column": 87}, "end": {"line": 145, "column": 92}}, "children": [
                                  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 87}, "end": {"line": 145, "column": 92}}, "token": {"kind": "identifier", "text": "local"}, "children": []},
                                ]},
                              ]},
                            ]},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 92}, "end": {"line": 145, "column": 93}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 145, "column": 94}, "end": {"line": 145, "column": 94}}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 94}, "end": {"line": 145, "column": 95}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 96}, "end": {"line": 145, "column": 97}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 145, "column": 97}, "end": {"line": 145, "column": 97}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}

# Parser output for `struct Person { func encode(_ value: Int) { let v = "\(namespace)knows" } }` at 148:1.
encode_value_interpolation_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 148, "column": 1}, "end": {"line": 148, "column": 76}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 148, "column": 1}, "end": {"line": 148, "column": 76}}, "children": [
    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 148, "column": 1}, "end": {"line": 148, "column": 76}}, "children": [
      {"type": "StructDeclSyntax", "range": {"start": {"line": 148, "column": 1}, "end": {"line": 148, "column": 76}}, "children": [
        {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 1}, "end": {"line": 148, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 8}, "end": {"line": 148, "column": 14}}, "token": {"kind": "identifier", "text": "Person"}, "children": []},
        {"type": "MemberBlockSyntax", "range": {"start": {"line": 148, "column": 15}, "end": {"line": 148, "column": 76}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 15}, "end": {"line": 148, "column": 16}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
          {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 74}}, "children": [
            {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 74}}, "children": [
              {"type": "FunctionDeclSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 74}}, "children": [
                {"type": "AttributeListSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 17}}, "children": []},
                {"type": "DeclModifierListSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 17}}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 17}, "end": {"line": 148, "column": 21}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
                {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 22}, "end": {"line": 148, "column": 28}}, "token": {"kind": "identifier", "text": "encode"}, "children": []},
                {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 148, "column": 28}, "end": {"line": 148, "column": 42}}, "children": [
                  {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 148, "column": 28}, "end": {"line": 148, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 28}, "end": {"line": 148, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 148, "column": 29}, "end": {"line": 148, "column": 41}}, "children": [
                      {"type": "FunctionParameterSyntax", "range": {"start": {"line": 148, "column": 29}, "end": {"line": 148, "column": 41}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 148, "column": 29}, "end": {"line": 148, "column": 29}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 148, "column": 29}, "end": {"line": 148, "column": 29}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 29}, "end": {"line": 148, "column": 30}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 31}, "end": {"line": 148, "column": 36}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 36}, "end": {"line": 148, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 148, "column": 38}, "end": {"line": 148, "column": 41}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 38}, "end": {"line": 148, "column": 41}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 41}, "end": {"line": 148, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  ]},
                ]},
                {"type": "CodeBlockSyntax", "range": {"start": {"line": 148, "column": 43}, "end": {"line": 148, "column": 74}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 43}, "end": {"line": 148, "column": 44}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 72}}, "children": [
                    {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 72}}, "children": [
                      {"type": "VariableDeclSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 72}}, "children": [
                        {"type": "AttributeListSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 45}}, "children": []},
                        {"type": "DeclModifierListSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 45}}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 45}, "end": {"line": 148, "column": 48}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
                        {"type": "PatternBindingListSyntax", "range": {"start": {"line": 148, "column": 49}, "end": {"line": 148, "column": 72}}, "children": [
                          {"type": "PatternBindingSyntax", "range": {"start": {"line": 148, "column": 49}, "end": {"line": 148, "column": 72}}, "children": [
                            {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 148, "column": 49}, "end": {"line": 148, "column": 50}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 49}, "end": {"line": 148, "column": 50}}, "token": {"kind": "identifier", "text": "v"}, "children": []},
                            ]},
                            {"type": "InitializerClauseSyntax", "range": {"start": {"line": 148, "column": 51}, "end": {"line": 148, "column": 72}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 51}, "end": {"line": 148, "column": 52}}, "token": {"kind": "equal", "text": "="}, "children": []},
                              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 148, "column": 53}, "end": {"line": 148, "column": 72}}, "children": [
                                {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 53}, "end": {"line": 148, "column": 54}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 148, "column": 54}, "end": {"line": 148, "column": 71}}, "children": [
                                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 148, "column": 54}, "end": {"line": 148, "column": 54}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 54}, "end": {"line": 148, "column": 54}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
                                  ]},
                                  {"type": "ExpressionSegmentSyntax", "range": {"start": {"line": 148, "column": 54}, "end": {"line": 148, "column": 66}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 54}, "end": {"line": 148, "column": 55}}, "token": {"kind": "backslash", "text": "\\"}, "children": []},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 55}, "end": {"line": 148, "column": 56}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 148, "column": 56}, "end": {"line": 148, "column": 65}}, "children": [
                                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 148, "column": 56}, "end": {"line": 148, "column": 65}}, "children": [
                                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 148, "column": 56}, "end": {"line": 148, "column": 65}}, "children": [
                                          {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 56}, "end": {"line": 148, "column": 65}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                                        ]},
                                      ]},
                                    ]},
                                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 65}, "end": {"line": 148, "column": 66}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                                  ]},
                                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 148, "column": 66}, "end": {"line": 148, "column": 71}}, "children": [
                                    {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 66}, "end": {"line": 148, "column": 71}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                                  ]},
                                ]},
                                {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 71}, "end": {"line": 148, "column": 72}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                              ]},
                            ]},
                          ]},
                        ]},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 73}, "end": {"line": 148, "column": 74}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
                ]},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 75}, "end": {"line": 148, "column": 76}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 148, "column": 76}, "end": {"line": 148, "column": 76}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}
