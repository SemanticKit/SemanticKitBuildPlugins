package semantickit.design_guidelines.no_static_term_enum

test_denies_static_constant_enum if {
  result := decision with input as static_constant_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 3
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_computed_static_enum if {
  result := decision with input as computed_static_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 7
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_string_raw_value_enum if {
  result := decision with input as string_raw_value_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 11
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_implicit_raw_value_enum if {
  result := decision with input as implicit_raw_value_enum_node

  count(result.deny) == 0
}

test_allows_result_builder_enum if {
  result := decision with input as result_builder_enum_node

  count(result.deny) == 0
}

test_allows_nested_static_struct if {
  result := decision with input as nested_static_struct_node

  count(result.deny) == 0
}

# Parser output for `enum Foaf { static let knows = Term("knows") }` at 3:1.
static_constant_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 3, "column": 1}, "end": {"line": 3, "column": 47}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 1}, "end": {"line": 3, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 6}, "end": {"line": 3, "column": 10}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 3, "column": 11}, "end": {"line": 3, "column": 47}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 11}, "end": {"line": 3, "column": 12}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 45}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 45}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 45}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 13}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 19}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 19}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 19}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 20}, "end": {"line": 3, "column": 23}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 45}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 45}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 29}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 29}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 3, "column": 30}, "end": {"line": 3, "column": 45}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 30}, "end": {"line": 3, "column": 31}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 3, "column": 32}, "end": {"line": 3, "column": 45}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 3, "column": 32}, "end": {"line": 3, "column": 36}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 32}, "end": {"line": 3, "column": 36}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 36}, "end": {"line": 3, "column": 37}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 3, "column": 37}, "end": {"line": 3, "column": 44}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 3, "column": 37}, "end": {"line": 3, "column": 44}}, "children": [
                      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 3, "column": 37}, "end": {"line": 3, "column": 44}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 37}, "end": {"line": 3, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 3, "column": 38}, "end": {"line": 3, "column": 43}}, "children": [
                          {"type": "StringSegmentSyntax", "range": {"start": {"line": 3, "column": 38}, "end": {"line": 3, "column": 43}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 38}, "end": {"line": 3, "column": 43}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 43}, "end": {"line": 3, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 44}, "end": {"line": 3, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 46}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 47}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum ACL { static var readClass: IRI { namespace.read } }` at 7:1.
computed_static_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 7, "column": 1}, "end": {"line": 7, "column": 58}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 1}, "end": {"line": 7, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 6}, "end": {"line": 7, "column": 9}}, "token": {"kind": "identifier", "text": "ACL"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 7, "column": 10}, "end": {"line": 7, "column": 58}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 10}, "end": {"line": 7, "column": 11}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 56}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 56}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 56}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 12}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 18}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 18}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 12}, "end": {"line": 7, "column": 18}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 19}, "end": {"line": 7, "column": 22}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 56}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 56}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 32}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 23}, "end": {"line": 7, "column": 32}}, "token": {"kind": "identifier", "text": "readClass"}, "children": []},
              ]},
              {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 7, "column": 32}, "end": {"line": 7, "column": 37}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 32}, "end": {"line": 7, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 7, "column": 34}, "end": {"line": 7, "column": 37}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 34}, "end": {"line": 7, "column": 37}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                ]},
              ]},
              {"type": "AccessorBlockSyntax", "range": {"start": {"line": 7, "column": 38}, "end": {"line": 7, "column": 56}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 38}, "end": {"line": 7, "column": 39}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 7, "column": 40}, "end": {"line": 7, "column": 54}}, "children": [
                  {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 7, "column": 40}, "end": {"line": 7, "column": 54}}, "children": [
                    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 7, "column": 40}, "end": {"line": 7, "column": 54}}, "children": [
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 40}, "end": {"line": 7, "column": 49}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 40}, "end": {"line": 7, "column": 49}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 49}, "end": {"line": 7, "column": 50}}, "token": {"kind": "period", "text": "."}, "children": []},
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 7, "column": 50}, "end": {"line": 7, "column": 54}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 50}, "end": {"line": 7, "column": 54}}, "token": {"kind": "identifier", "text": "read"}, "children": []},
                      ]},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 55}, "end": {"line": 7, "column": 56}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 7, "column": 57}, "end": {"line": 7, "column": 58}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Fauna: String { case animal = "Animal" }` at 11:5.
string_raw_value_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 11, "column": 5}, "end": {"line": 11, "column": 50}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 5}, "end": {"line": 11, "column": 9}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 10}, "end": {"line": 11, "column": 15}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 11, "column": 15}, "end": {"line": 11, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 15}, "end": {"line": 11, "column": 16}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 11, "column": 17}, "end": {"line": 11, "column": 23}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 11, "column": 17}, "end": {"line": 11, "column": 23}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 11, "column": 17}, "end": {"line": 11, "column": 23}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 17}, "end": {"line": 11, "column": 23}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 11, "column": 24}, "end": {"line": 11, "column": 50}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 24}, "end": {"line": 11, "column": 25}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 48}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 48}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 48}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 26}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 26}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 26}, "end": {"line": 11, "column": 30}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 11, "column": 31}, "end": {"line": 11, "column": 48}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 11, "column": 31}, "end": {"line": 11, "column": 48}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 31}, "end": {"line": 11, "column": 37}}, "token": {"kind": "identifier", "text": "animal"}, "children": []},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 11, "column": 38}, "end": {"line": 11, "column": 48}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 38}, "end": {"line": 11, "column": 39}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 11, "column": 40}, "end": {"line": 11, "column": 48}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 40}, "end": {"line": 11, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 11, "column": 41}, "end": {"line": 11, "column": 47}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 11, "column": 41}, "end": {"line": 11, "column": 47}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 41}, "end": {"line": 11, "column": 47}}, "token": {"kind": "stringSegment", "text": "Animal"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 47}, "end": {"line": 11, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 11, "column": 49}, "end": {"line": 11, "column": 50}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum TextDirection: String { case ltr, rtl }` at 4:1.
implicit_raw_value_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 4, "column": 1}, "end": {"line": 4, "column": 45}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 1}, "end": {"line": 4, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 6}, "end": {"line": 4, "column": 19}}, "token": {"kind": "identifier", "text": "TextDirection"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 4, "column": 19}, "end": {"line": 4, "column": 27}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 19}, "end": {"line": 4, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 21}, "end": {"line": 4, "column": 27}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 4, "column": 28}, "end": {"line": 4, "column": 45}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 28}, "end": {"line": 4, "column": 29}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 43}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 43}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 43}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 30}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 30}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 30}, "end": {"line": 4, "column": 34}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 4, "column": 35}, "end": {"line": 4, "column": 43}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 4, "column": 35}, "end": {"line": 4, "column": 39}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 35}, "end": {"line": 4, "column": 38}}, "token": {"kind": "identifier", "text": "ltr"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 38}, "end": {"line": 4, "column": 39}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 4, "column": 40}, "end": {"line": 4, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 40}, "end": {"line": 4, "column": 43}}, "token": {"kind": "identifier", "text": "rtl"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 4, "column": 44}, "end": {"line": 4, "column": 45}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum ContentBuilder { static func buildBlock() {} }` at 9:1.
result_builder_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 9, "column": 1}, "end": {"line": 9, "column": 52}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 1}, "end": {"line": 9, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 6}, "end": {"line": 9, "column": 20}}, "token": {"kind": "identifier", "text": "ContentBuilder"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 9, "column": 21}, "end": {"line": 9, "column": 52}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 21}, "end": {"line": 9, "column": 22}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 50}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 50}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 50}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 23}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 29}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 29}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 23}, "end": {"line": 9, "column": 29}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 30}, "end": {"line": 9, "column": 34}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 35}, "end": {"line": 9, "column": 45}}, "token": {"kind": "identifier", "text": "buildBlock"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 9, "column": 45}, "end": {"line": 9, "column": 47}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 9, "column": 45}, "end": {"line": 9, "column": 47}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 45}, "end": {"line": 9, "column": 46}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 9, "column": 46}, "end": {"line": 9, "column": 46}}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 46}, "end": {"line": 9, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 9, "column": 48}, "end": {"line": 9, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 48}, "end": {"line": 9, "column": 49}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 9, "column": 49}, "end": {"line": 9, "column": 49}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 49}, "end": {"line": 9, "column": 50}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 51}, "end": {"line": 9, "column": 52}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Errors { struct Box { static let shared = Box() } }` at 14:1.
nested_static_struct_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 14, "column": 1}, "end": {"line": 14, "column": 57}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 1}, "end": {"line": 14, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 6}, "end": {"line": 14, "column": 12}}, "token": {"kind": "identifier", "text": "Errors"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 57}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 13}, "end": {"line": 14, "column": 14}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 55}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 55}}, "children": [
        {"type": "StructDeclSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 55}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 15}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 15}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 15}, "end": {"line": 14, "column": 21}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 22}, "end": {"line": 14, "column": 25}}, "token": {"kind": "identifier", "text": "Box"}, "children": []},
          {"type": "MemberBlockSyntax", "range": {"start": {"line": 14, "column": 26}, "end": {"line": 14, "column": 55}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 26}, "end": {"line": 14, "column": 27}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 53}}, "children": [
              {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 53}}, "children": [
                {"type": "VariableDeclSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 53}}, "children": [
                  {"type": "AttributeListSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 28}}, "children": []},
                  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 34}}, "children": [
                    {"type": "DeclModifierSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 34}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 28}, "end": {"line": 14, "column": 34}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 35}, "end": {"line": 14, "column": 38}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
                  {"type": "PatternBindingListSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 53}}, "children": [
                    {"type": "PatternBindingSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 53}}, "children": [
                      {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 45}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 45}}, "token": {"kind": "identifier", "text": "shared"}, "children": []},
                      ]},
                      {"type": "InitializerClauseSyntax", "range": {"start": {"line": 14, "column": 46}, "end": {"line": 14, "column": 53}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 46}, "end": {"line": 14, "column": 47}}, "token": {"kind": "equal", "text": "="}, "children": []},
                        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 48}, "end": {"line": 14, "column": 53}}, "children": [
                          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 48}, "end": {"line": 14, "column": 51}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 48}, "end": {"line": 14, "column": 51}}, "token": {"kind": "identifier", "text": "Box"}, "children": []},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 51}, "end": {"line": 14, "column": 52}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 52}, "end": {"line": 14, "column": 52}}, "children": []},
                          {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 52}, "end": {"line": 14, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 54}, "end": {"line": 14, "column": 54}}, "children": []},
                        ]},
                      ]},
                    ]},
                  ]},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 54}, "end": {"line": 14, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 56}, "end": {"line": 14, "column": 57}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}
