package semantickit.design_guidelines.no_content_function

test_denies_content_function if {
  result := decision with input as content_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_content_function"
  result.deny[0].line == 3
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_opaque_content_function if {
  result := decision with input as opaque_content_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_content_function"
  result.deny[0].line == 6
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_ontology_content_function if {
  result := decision with input as ontology_content_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_content_function"
  result.deny[0].line == 9
  result.deny[0].column == 26
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_macro_ontology_content_function if {
  result := decision with input as macro_ontology_content_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_content_function"
  result.deny[0].line == 12
  result.deny[0].column == 26
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_ontology_body if {
  result := decision with input as ontology_body_node

  count(result.deny) == 0
}

test_allows_unrelated_content_function if {
  result := decision with input as unrelated_content_function_node

  count(result.deny) == 0
}

# Parser output for `func content() -> Content { Namespace("https://fauna.example.org/ontology#") }` at 3:5.
content_function_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 83}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 9}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 10}, "end": {"line": 3, "column": 17}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 3, "column": 17}, "end": {"line": 3, "column": 30}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 3, "column": 17}, "end": {"line": 3, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 17}, "end": {"line": 3, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 3, "column": 18}, "end": {"line": 3, "column": 18}}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 18}, "end": {"line": 3, "column": 19}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 3, "column": 20}, "end": {"line": 3, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 20}, "end": {"line": 3, "column": 22}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 23}, "end": {"line": 3, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 23}, "end": {"line": 3, "column": 30}}, "token": {"kind": "identifier", "text": "Content"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 3, "column": 31}, "end": {"line": 3, "column": 83}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 31}, "end": {"line": 3, "column": 32}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 81}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 81}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 81}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 42}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 42}}, "token": {"kind": "identifier", "text": "Namespace"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 42}, "end": {"line": 3, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 3, "column": 43}, "end": {"line": 3, "column": 80}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 3, "column": 43}, "end": {"line": 3, "column": 80}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 3, "column": 43}, "end": {"line": 3, "column": 80}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 43}, "end": {"line": 3, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 3, "column": 44}, "end": {"line": 3, "column": 79}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 3, "column": 44}, "end": {"line": 3, "column": 79}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 44}, "end": {"line": 3, "column": 79}}, "token": {"kind": "stringSegment", "text": "https:\/\/fauna.example.org\/ontology#"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 79}, "end": {"line": 3, "column": 80}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 80}, "end": {"line": 3, "column": 81}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 3, "column": 82}, "end": {"line": 3, "column": 82}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 82}, "end": {"line": 3, "column": 83}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `public func content() -> some Content { EmptyContent() }` at 6:5.
opaque_content_function_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 6, "column": 5}, "end": {"line": 6, "column": 61}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 6, "column": 5}, "end": {"line": 6, "column": 11}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 6, "column": 5}, "end": {"line": 6, "column": 11}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 5}, "end": {"line": 6, "column": 11}}, "token": {"kind": "keyword", "text": "public"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 12}, "end": {"line": 6, "column": 16}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 17}, "end": {"line": 6, "column": 24}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 6, "column": 24}, "end": {"line": 6, "column": 42}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 6, "column": 24}, "end": {"line": 6, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 24}, "end": {"line": 6, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 6, "column": 25}, "end": {"line": 6, "column": 25}}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 25}, "end": {"line": 6, "column": 26}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 6, "column": 27}, "end": {"line": 6, "column": 42}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 27}, "end": {"line": 6, "column": 29}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "SomeOrAnyTypeSyntax", "range": {"start": {"line": 6, "column": 30}, "end": {"line": 6, "column": 42}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 30}, "end": {"line": 6, "column": 34}}, "token": {"kind": "keyword", "text": "some"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 42}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 42}}, "token": {"kind": "identifier", "text": "Content"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 6, "column": 43}, "end": {"line": 6, "column": 61}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 43}, "end": {"line": 6, "column": 44}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 6, "column": 45}, "end": {"line": 6, "column": 59}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 6, "column": 45}, "end": {"line": 6, "column": 59}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 6, "column": 45}, "end": {"line": 6, "column": 59}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 6, "column": 45}, "end": {"line": 6, "column": 57}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 45}, "end": {"line": 6, "column": 57}}, "token": {"kind": "identifier", "text": "EmptyContent"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 57}, "end": {"line": 6, "column": 58}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 6, "column": 58}, "end": {"line": 6, "column": 58}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 58}, "end": {"line": 6, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 6, "column": 60}, "end": {"line": 6, "column": 60}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 60}, "end": {"line": 6, "column": 61}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Fauna: Ontology { func content() {} }` at 9:1.
ontology_content_function_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 9, "column": 1}, "end": {"line": 9, "column": 45}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 1}, "end": {"line": 9, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 8}, "end": {"line": 9, "column": 13}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 9, "column": 13}, "end": {"line": 9, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 13}, "end": {"line": 9, "column": 14}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 23}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 23}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 23}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 23}}, "token": {"kind": "identifier", "text": "Ontology"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 9, "column": 24}, "end": {"line": 9, "column": 45}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 24}, "end": {"line": 9, "column": 25}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 43}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 43}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 43}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 26}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 26}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 26}, "end": {"line": 9, "column": 30}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 31}, "end": {"line": 9, "column": 38}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 9, "column": 38}, "end": {"line": 9, "column": 40}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 9, "column": 38}, "end": {"line": 9, "column": 40}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 38}, "end": {"line": 9, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 39}}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 39}, "end": {"line": 9, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 9, "column": 41}, "end": {"line": 9, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 41}, "end": {"line": 9, "column": 42}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 9, "column": 42}, "end": {"line": 9, "column": 42}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 42}, "end": {"line": 9, "column": 43}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 44}, "end": {"line": 9, "column": 45}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `@Ontology struct Fauna { func content() -> ContentGroup { ContentGroup() } }` at 12:1.
macro_ontology_content_function_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 77}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 10}}, "children": [
    {"type": "AttributeSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 10}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 2}}, "token": {"kind": "atSign", "text": "@"}, "children": []},
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 12, "column": 2}, "end": {"line": 12, "column": 10}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 2}, "end": {"line": 12, "column": 10}}, "token": {"kind": "identifier", "text": "Ontology"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 11}, "end": {"line": 12, "column": 11}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 11}, "end": {"line": 12, "column": 17}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 18}, "end": {"line": 12, "column": 23}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 77}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 25}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 75}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 75}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 75}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 26}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 26}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 30}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 38}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 56}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 40}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 39}}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "ReturnClauseSyntax", "range": {"start": {"line": 12, "column": 41}, "end": {"line": 12, "column": 56}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 41}, "end": {"line": 12, "column": 43}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 12, "column": 44}, "end": {"line": 12, "column": 56}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 44}, "end": {"line": 12, "column": 56}}, "token": {"kind": "identifier", "text": "ContentGroup"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 12, "column": 57}, "end": {"line": 12, "column": 75}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 57}, "end": {"line": 12, "column": 58}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 12, "column": 59}, "end": {"line": 12, "column": 73}}, "children": [
              {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 12, "column": 59}, "end": {"line": 12, "column": 73}}, "children": [
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 59}, "end": {"line": 12, "column": 73}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 59}, "end": {"line": 12, "column": 71}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 59}, "end": {"line": 12, "column": 71}}, "token": {"kind": "identifier", "text": "ContentGroup"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 71}, "end": {"line": 12, "column": 72}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 72}, "end": {"line": 12, "column": 72}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 72}, "end": {"line": 12, "column": 73}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 74}, "end": {"line": 12, "column": 74}}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 74}, "end": {"line": 12, "column": 75}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 76}, "end": {"line": 12, "column": 77}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Fauna: Ontology { var body: some Content { Namespace("https://fauna.example.org/ontology#") } }` at 15:1.
ontology_body_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 15, "column": 1}, "end": {"line": 15, "column": 103}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 1}, "end": {"line": 15, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 8}, "end": {"line": 15, "column": 13}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 15, "column": 13}, "end": {"line": 15, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 13}, "end": {"line": 15, "column": 14}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 15, "column": 15}, "end": {"line": 15, "column": 23}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 15, "column": 15}, "end": {"line": 15, "column": 23}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 15}, "end": {"line": 15, "column": 23}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 15}, "end": {"line": 15, "column": 23}}, "token": {"kind": "identifier", "text": "Ontology"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 103}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 25}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 101}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 101}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 101}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 26}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 26}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 26}, "end": {"line": 15, "column": 29}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 15, "column": 30}, "end": {"line": 15, "column": 101}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 15, "column": 30}, "end": {"line": 15, "column": 101}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 15, "column": 30}, "end": {"line": 15, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 30}, "end": {"line": 15, "column": 34}}, "token": {"kind": "identifier", "text": "body"}, "children": []},
              ]},
              {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 15, "column": 34}, "end": {"line": 15, "column": 48}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 34}, "end": {"line": 15, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "SomeOrAnyTypeSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 48}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 40}}, "token": {"kind": "keyword", "text": "some"}, "children": []},
                  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 41}, "end": {"line": 15, "column": 48}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 41}, "end": {"line": 15, "column": 48}}, "token": {"kind": "identifier", "text": "Content"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "AccessorBlockSyntax", "range": {"start": {"line": 15, "column": 49}, "end": {"line": 15, "column": 101}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 49}, "end": {"line": 15, "column": 50}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 15, "column": 51}, "end": {"line": 15, "column": 99}}, "children": [
                  {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 15, "column": 51}, "end": {"line": 15, "column": 99}}, "children": [
                    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 15, "column": 51}, "end": {"line": 15, "column": 99}}, "children": [
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 15, "column": 51}, "end": {"line": 15, "column": 60}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 51}, "end": {"line": 15, "column": 60}}, "token": {"kind": "identifier", "text": "Namespace"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 60}, "end": {"line": 15, "column": 61}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 15, "column": 61}, "end": {"line": 15, "column": 98}}, "children": [
                        {"type": "LabeledExprSyntax", "range": {"start": {"line": 15, "column": 61}, "end": {"line": 15, "column": 98}}, "children": [
                          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 15, "column": 61}, "end": {"line": 15, "column": 98}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 61}, "end": {"line": 15, "column": 62}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 15, "column": 62}, "end": {"line": 15, "column": 97}}, "children": [
                              {"type": "StringSegmentSyntax", "range": {"start": {"line": 15, "column": 62}, "end": {"line": 15, "column": 97}}, "children": [
                                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 62}, "end": {"line": 15, "column": 97}}, "token": {"kind": "stringSegment", "text": "https:\/\/fauna.example.org\/ontology#"}, "children": []},
                              ]},
                            ]},
                            {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 97}, "end": {"line": 15, "column": 98}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                          ]},
                        ]},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 98}, "end": {"line": 15, "column": 99}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 15, "column": 100}, "end": {"line": 15, "column": 100}}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 100}, "end": {"line": 15, "column": 101}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 102}, "end": {"line": 15, "column": 103}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `func content(of url: URL) -> Data { Data() }` at 18:5.
unrelated_content_function_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 18, "column": 5}, "end": {"line": 18, "column": 49}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 5}, "end": {"line": 18, "column": 9}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 10}, "end": {"line": 18, "column": 17}}, "token": {"kind": "identifier", "text": "content"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 38}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 29}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 29}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 18}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 18}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 20}}, "token": {"kind": "identifier", "text": "of"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 24}}, "token": {"kind": "identifier", "text": "url"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 25}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 29}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 30}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 33}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 38}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 38}}, "token": {"kind": "identifier", "text": "Data"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 49}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 40}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 47}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 47}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 47}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "token": {"kind": "identifier", "text": "Data"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 46}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 46}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 48}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 49}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}
