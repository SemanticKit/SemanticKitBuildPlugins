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
