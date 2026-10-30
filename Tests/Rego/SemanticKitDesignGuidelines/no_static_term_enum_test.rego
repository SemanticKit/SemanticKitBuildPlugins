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

# A static typed IRI: no_static_iri_constant reports it, once.
test_leaves_computed_iri_static_enum_to_iri_rule if {
  result := decision with input as computed_static_enum_node

  count(result.deny) == 0
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

test_denies_qualified_string_raw_enum if {
  result := decision with input as qualified_string_raw_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 30
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_extension_term_constant if {
  result := decision with input as extension_term_constant_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 33
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_struct_term_constant if {
  result := decision with input as struct_term_constant_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 36
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_class_string_constant if {
  result := decision with input as class_string_constant_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 39
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_extension_try_term if {
  result := decision with input as extension_try_term_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 42
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_enum_term_function if {
  result := decision with input as enum_term_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 45
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_extension_term_function if {
  result := decision with input as extension_term_function_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 48
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_plain_case_enum if {
  result := decision with input as plain_case_enum_node

  count(result.deny) == 0
}

test_allows_extension_unrelated_static if {
  result := decision with input as extension_unrelated_static_node

  count(result.deny) == 0
}

test_allows_struct_iri_projection if {
  result := decision with input as struct_iri_projection_node

  count(result.deny) == 0
}

# Parser output for `enum FoafTerm: Swift.String, Sendable { case knows }` at 30:1.
qualified_string_raw_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 30, "column": 1}, "end": {"line": 30, "column": 53}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 1}, "end": {"line": 30, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 6}, "end": {"line": 30, "column": 14}}, "token": {"kind": "identifier", "text": "FoafTerm"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 38}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 15}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 38}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 29}}, "children": [
        {"type": "MemberTypeSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 28}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 21}}, "token": {"kind": "identifier", "text": "Swift"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 22}, "end": {"line": 30, "column": 28}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 30, "column": 30}, "end": {"line": 30, "column": 38}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 30}, "end": {"line": 30, "column": 38}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 30}, "end": {"line": 30, "column": 38}}, "token": {"kind": "identifier", "text": "Sendable"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 30, "column": 39}, "end": {"line": 30, "column": 53}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 39}, "end": {"line": 30, "column": 40}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 51}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 51}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 51}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 41}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 41}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 45}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 30, "column": 46}, "end": {"line": 30, "column": 51}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 30, "column": 46}, "end": {"line": 30, "column": 51}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 46}, "end": {"line": 30, "column": 51}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 52}, "end": {"line": 30, "column": 53}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Foaf { static let knows = Term("knows") }` at 33:1.
extension_term_constant_node := {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 33, "column": 1}, "end": {"line": 33, "column": 52}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 1}, "end": {"line": 33, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 33, "column": 11}, "end": {"line": 33, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 11}, "end": {"line": 33, "column": 15}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 52}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 16}, "end": {"line": 33, "column": 17}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 50}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 50}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 50}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 18}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 24}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 24}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 25}, "end": {"line": 33, "column": 28}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 50}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 50}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 34}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 50}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 36}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 37}, "end": {"line": 33, "column": 50}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 37}, "end": {"line": 33, "column": 41}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 37}, "end": {"line": 33, "column": 41}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 41}, "end": {"line": 33, "column": 42}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 42}, "end": {"line": 33, "column": 49}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 42}, "end": {"line": 33, "column": 49}}, "children": [
                      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 33, "column": 42}, "end": {"line": 33, "column": 49}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 42}, "end": {"line": 33, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 33, "column": 43}, "end": {"line": 33, "column": 48}}, "children": [
                          {"type": "StringSegmentSyntax", "range": {"start": {"line": 33, "column": 43}, "end": {"line": 33, "column": 48}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 43}, "end": {"line": 33, "column": 48}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 48}, "end": {"line": 33, "column": 49}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 49}, "end": {"line": 33, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 51}, "end": {"line": 33, "column": 51}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 51}, "end": {"line": 33, "column": 52}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Foaf { static let knows = Property("knows") }` at 36:1.
struct_term_constant_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 36, "column": 1}, "end": {"line": 36, "column": 53}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 1}, "end": {"line": 36, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 8}, "end": {"line": 36, "column": 12}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 53}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 13}, "end": {"line": 36, "column": 14}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 51}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 51}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 51}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 15}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 21}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 21}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 21}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 22}, "end": {"line": 36, "column": 25}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 36, "column": 26}, "end": {"line": 36, "column": 51}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 36, "column": 26}, "end": {"line": 36, "column": 51}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 36, "column": 26}, "end": {"line": 36, "column": 31}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 26}, "end": {"line": 36, "column": 31}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 36, "column": 32}, "end": {"line": 36, "column": 51}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 32}, "end": {"line": 36, "column": 33}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 51}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 42}}, "token": {"kind": "identifier", "text": "Property"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 42}, "end": {"line": 36, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 50}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 50}}, "children": [
                      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 50}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 43}, "end": {"line": 36, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 49}}, "children": [
                          {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 49}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 49}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 49}, "end": {"line": 36, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 50}, "end": {"line": 36, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 52}, "end": {"line": 36, "column": 52}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 52}, "end": {"line": 36, "column": 53}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `final class Foaf { static let knows = "knows" }` at 39:1.
class_string_constant_node := {"type": "ClassDeclSyntax", "range": {"start": {"line": 39, "column": 1}, "end": {"line": 39, "column": 48}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 39, "column": 1}, "end": {"line": 39, "column": 6}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 39, "column": 1}, "end": {"line": 39, "column": 6}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 1}, "end": {"line": 39, "column": 6}}, "token": {"kind": "keyword", "text": "final"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 7}, "end": {"line": 39, "column": 12}}, "token": {"kind": "keyword", "text": "class"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 13}, "end": {"line": 39, "column": 17}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 39, "column": 18}, "end": {"line": 39, "column": 48}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 18}, "end": {"line": 39, "column": 19}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 46}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 46}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 46}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 20}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 26}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 26}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 20}, "end": {"line": 39, "column": 26}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 27}, "end": {"line": 39, "column": 30}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 46}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 46}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 36}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 31}, "end": {"line": 39, "column": 36}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 39, "column": 37}, "end": {"line": 39, "column": 46}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 37}, "end": {"line": 39, "column": 38}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 39, "column": 39}, "end": {"line": 39, "column": 46}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 39}, "end": {"line": 39, "column": 40}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 39, "column": 40}, "end": {"line": 39, "column": 45}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 39, "column": 40}, "end": {"line": 39, "column": 45}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 40}, "end": {"line": 39, "column": 45}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 45}, "end": {"line": 39, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 47}, "end": {"line": 39, "column": 48}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Foaf { static let knows = try! ObjectProperty(validating: "knows") }` at 42:1.
extension_try_term_node := {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 42, "column": 1}, "end": {"line": 42, "column": 79}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 1}, "end": {"line": 42, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 15}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 79}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 16}, "end": {"line": 42, "column": 17}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 77}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 77}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 77}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 18}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 24}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 24}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 28}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 77}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 77}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 34}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 42, "column": 35}, "end": {"line": 42, "column": 77}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 35}, "end": {"line": 42, "column": 36}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "TryExprSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 77}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 40}}, "token": {"kind": "keyword", "text": "try"}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 41}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
                  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 77}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 56}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 56}}, "token": {"kind": "identifier", "text": "ObjectProperty"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 57}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 76}}, "children": [
                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 76}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 67}}, "token": {"kind": "identifier", "text": "validating"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 67}, "end": {"line": 42, "column": 68}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 76}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 70}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 75}}, "children": [
                            {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 75}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 70}, "end": {"line": 42, "column": 75}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                            ]},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 75}, "end": {"line": 42, "column": 76}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 76}, "end": {"line": 42, "column": 77}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 78}}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 79}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Foaf { static func knows() -> Term { Term() } }` at 45:1.
enum_term_function_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 45, "column": 1}, "end": {"line": 45, "column": 53}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 1}, "end": {"line": 45, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 6}, "end": {"line": 45, "column": 10}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 45, "column": 11}, "end": {"line": 45, "column": 53}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 11}, "end": {"line": 45, "column": 12}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 51}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 51}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 51}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 13}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 19}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 19}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 13}, "end": {"line": 45, "column": 19}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 20}, "end": {"line": 45, "column": 24}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 30}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 45, "column": 30}, "end": {"line": 45, "column": 40}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 45, "column": 30}, "end": {"line": 45, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 30}, "end": {"line": 45, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 45, "column": 31}, "end": {"line": 45, "column": 31}}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 31}, "end": {"line": 45, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "ReturnClauseSyntax", "range": {"start": {"line": 45, "column": 33}, "end": {"line": 45, "column": 40}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 33}, "end": {"line": 45, "column": 35}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 45, "column": 36}, "end": {"line": 45, "column": 40}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 36}, "end": {"line": 45, "column": 40}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 45, "column": 41}, "end": {"line": 45, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 41}, "end": {"line": 45, "column": 42}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 49}}, "children": [
              {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 49}}, "children": [
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 49}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 47}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 43}, "end": {"line": 45, "column": 47}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 47}, "end": {"line": 45, "column": 48}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 45, "column": 48}, "end": {"line": 45, "column": 48}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 48}, "end": {"line": 45, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 45, "column": 50}, "end": {"line": 45, "column": 50}}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 50}, "end": {"line": 45, "column": 51}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 52}, "end": {"line": 45, "column": 53}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Foaf { static func knows() -> Property { Property() } }` at 48:1.
extension_term_function_node := {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 48, "column": 1}, "end": {"line": 48, "column": 66}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 1}, "end": {"line": 48, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 48, "column": 11}, "end": {"line": 48, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 11}, "end": {"line": 48, "column": 15}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 66}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 17}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 64}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 64}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 64}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 18}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 24}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 18}, "end": {"line": 48, "column": 24}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 25}, "end": {"line": 48, "column": 29}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 30}, "end": {"line": 48, "column": 35}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 48, "column": 35}, "end": {"line": 48, "column": 49}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 48, "column": 35}, "end": {"line": 48, "column": 37}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 35}, "end": {"line": 48, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 48, "column": 36}, "end": {"line": 48, "column": 36}}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 36}, "end": {"line": 48, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "ReturnClauseSyntax", "range": {"start": {"line": 48, "column": 38}, "end": {"line": 48, "column": 49}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 38}, "end": {"line": 48, "column": 40}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 48, "column": 41}, "end": {"line": 48, "column": 49}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 41}, "end": {"line": 48, "column": 49}}, "token": {"kind": "identifier", "text": "Property"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 48, "column": 50}, "end": {"line": 48, "column": 64}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 50}, "end": {"line": 48, "column": 51}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 48, "column": 52}, "end": {"line": 48, "column": 62}}, "children": [
              {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 48, "column": 52}, "end": {"line": 48, "column": 62}}, "children": [
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 48, "column": 52}, "end": {"line": 48, "column": 62}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 48, "column": 52}, "end": {"line": 48, "column": 60}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 52}, "end": {"line": 48, "column": 60}}, "token": {"kind": "identifier", "text": "Property"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 60}, "end": {"line": 48, "column": 61}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 48, "column": 61}, "end": {"line": 48, "column": 61}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 61}, "end": {"line": 48, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 48, "column": 63}, "end": {"line": 48, "column": 63}}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 63}, "end": {"line": 48, "column": 64}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 65}, "end": {"line": 48, "column": 66}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum TextDirection { case ltr, rtl }` at 51:1.
plain_case_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 51, "column": 1}, "end": {"line": 51, "column": 37}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 1}, "end": {"line": 51, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 6}, "end": {"line": 51, "column": 19}}, "token": {"kind": "identifier", "text": "TextDirection"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 37}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 21}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 35}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 35}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 35}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 22}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 22}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 26}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 51, "column": 27}, "end": {"line": 51, "column": 35}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 51, "column": 27}, "end": {"line": 51, "column": 31}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 27}, "end": {"line": 51, "column": 30}}, "token": {"kind": "identifier", "text": "ltr"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 30}, "end": {"line": 51, "column": 31}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 51, "column": 32}, "end": {"line": 51, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 32}, "end": {"line": 51, "column": 35}}, "token": {"kind": "identifier", "text": "rtl"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 36}, "end": {"line": 51, "column": 37}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Graph { static let empty = Graph() }` at 54:1.
extension_unrelated_static_node := {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 54, "column": 1}, "end": {"line": 54, "column": 47}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 1}, "end": {"line": 54, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 54, "column": 11}, "end": {"line": 54, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 11}, "end": {"line": 54, "column": 16}}, "token": {"kind": "identifier", "text": "Graph"}, "children": []},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 54, "column": 17}, "end": {"line": 54, "column": 47}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 17}, "end": {"line": 54, "column": 18}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 45}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 45}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 45}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 19}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 25}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 25}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 19}, "end": {"line": 54, "column": 25}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 26}, "end": {"line": 54, "column": 29}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 54, "column": 30}, "end": {"line": 54, "column": 45}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 54, "column": 30}, "end": {"line": 54, "column": 45}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 54, "column": 30}, "end": {"line": 54, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 30}, "end": {"line": 54, "column": 35}}, "token": {"kind": "identifier", "text": "empty"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 54, "column": 36}, "end": {"line": 54, "column": 45}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 36}, "end": {"line": 54, "column": 37}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 54, "column": 38}, "end": {"line": 54, "column": 45}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 54, "column": 38}, "end": {"line": 54, "column": 43}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 38}, "end": {"line": 54, "column": 43}}, "token": {"kind": "identifier", "text": "Graph"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 43}, "end": {"line": 54, "column": 44}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 54, "column": 44}, "end": {"line": 54, "column": 44}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 44}, "end": {"line": 54, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 54, "column": 46}, "end": {"line": 54, "column": 46}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 46}, "end": {"line": 54, "column": 47}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Animal { static var iri: IRI { Fauna.namespace.iri } }` at 57:1.
struct_iri_projection_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 57, "column": 1}, "end": {"line": 57, "column": 62}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 1}, "end": {"line": 57, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 8}, "end": {"line": 57, "column": 14}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 57, "column": 15}, "end": {"line": 57, "column": 62}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 15}, "end": {"line": 57, "column": 16}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 60}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 60}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 60}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 17}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 23}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 23}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 17}, "end": {"line": 57, "column": 23}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 24}, "end": {"line": 57, "column": 27}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 57, "column": 28}, "end": {"line": 57, "column": 60}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 57, "column": 28}, "end": {"line": 57, "column": 60}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 57, "column": 28}, "end": {"line": 57, "column": 31}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 28}, "end": {"line": 57, "column": 31}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
              ]},
              {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 57, "column": 31}, "end": {"line": 57, "column": 36}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 31}, "end": {"line": 57, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 57, "column": 33}, "end": {"line": 57, "column": 36}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 33}, "end": {"line": 57, "column": 36}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
                ]},
              ]},
              {"type": "AccessorBlockSyntax", "range": {"start": {"line": 57, "column": 37}, "end": {"line": 57, "column": 60}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 37}, "end": {"line": 57, "column": 38}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 58}}, "children": [
                  {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 58}}, "children": [
                    {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 58}}, "children": [
                      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 54}}, "children": [
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 44}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 39}, "end": {"line": 57, "column": 44}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 44}, "end": {"line": 57, "column": 45}}, "token": {"kind": "period", "text": "."}, "children": []},
                        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 57, "column": 45}, "end": {"line": 57, "column": 54}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 45}, "end": {"line": 57, "column": 54}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
                        ]},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 54}, "end": {"line": 57, "column": 55}}, "token": {"kind": "period", "text": "."}, "children": []},
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 57, "column": 55}, "end": {"line": 57, "column": 58}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 55}, "end": {"line": 57, "column": 58}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
                      ]},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 59}, "end": {"line": 57, "column": 60}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 61}, "end": {"line": 57, "column": 62}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

test_denies_term_container_enum if {
  result := decision with input as term_container_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 60
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_iri_raw_value_enum if {
  result := decision with input as iri_raw_value_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 63
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

# A prefixed-name string is an IRI: no_static_iri_constant reports it, once.
test_leaves_struct_prefixed_name_constant_to_iri_rule if {
  result := decision with input as struct_prefixed_name_constant_node

  count(result.deny) == 0
}

test_allows_coding_keys_enum if {
  result := decision with input as coding_keys_enum_node

  count(result.deny) == 0
}

test_allows_capitalized_coding_keys_enum if {
  result := decision with input as capitalized_coding_keys_enum_node

  count(result.deny) == 0
}

test_allows_base_direction_enum if {
  result := decision with input as base_direction_enum_node

  count(result.deny) == 0
}

test_allows_media_type_constant if {
  result := decision with input as media_type_constant_node

  count(result.deny) == 0
}

# A static namespace holds an IRI: no_static_iri_constant reports it, once.
test_leaves_namespace_enum_to_iri_rule if {
  result := decision with input as namespace_enum_node

  count(result.deny) == 0
}

# Parser output for `enum FoafTerm: String { case knows, person }` at 60:1.
term_container_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 60, "column": 1}, "end": {"line": 60, "column": 45}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 1}, "end": {"line": 60, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 6}, "end": {"line": 60, "column": 14}}, "token": {"kind": "identifier", "text": "FoafTerm"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 60, "column": 14}, "end": {"line": 60, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 14}, "end": {"line": 60, "column": 15}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 60, "column": 16}, "end": {"line": 60, "column": 22}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 60, "column": 16}, "end": {"line": 60, "column": 22}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 60, "column": 16}, "end": {"line": 60, "column": 22}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 16}, "end": {"line": 60, "column": 22}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 60, "column": 23}, "end": {"line": 60, "column": 45}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 23}, "end": {"line": 60, "column": 24}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 43}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 43}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 43}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 25}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 25}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 29}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 43}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 36}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 35}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 35}, "end": {"line": 60, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 60, "column": 37}, "end": {"line": 60, "column": 43}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 37}, "end": {"line": 60, "column": 43}}, "token": {"kind": "identifier", "text": "person"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 44}, "end": {"line": 60, "column": 45}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Foaf: String { case knows = "http://xmlns.com/foaf/0.1/knows" }` at 63:1.
iri_raw_value_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 63, "column": 1}, "end": {"line": 63, "column": 69}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 1}, "end": {"line": 63, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 6}, "end": {"line": 63, "column": 10}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 63, "column": 10}, "end": {"line": 63, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 10}, "end": {"line": 63, "column": 11}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 63, "column": 12}, "end": {"line": 63, "column": 18}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 63, "column": 12}, "end": {"line": 63, "column": 18}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 63, "column": 12}, "end": {"line": 63, "column": 18}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 12}, "end": {"line": 63, "column": 18}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 63, "column": 19}, "end": {"line": 63, "column": 69}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 19}, "end": {"line": 63, "column": 20}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 67}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 67}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 67}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 21}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 21}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 21}, "end": {"line": 63, "column": 25}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 67}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 67}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 31}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 63, "column": 32}, "end": {"line": 63, "column": 67}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 32}, "end": {"line": 63, "column": 33}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 63, "column": 34}, "end": {"line": 63, "column": 67}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 34}, "end": {"line": 63, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 63, "column": 35}, "end": {"line": 63, "column": 66}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 63, "column": 35}, "end": {"line": 63, "column": 66}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 35}, "end": {"line": 63, "column": 66}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 66}, "end": {"line": 63, "column": 67}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 68}, "end": {"line": 63, "column": 69}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Foaf { static let knows = "foaf:knows" }` at 66:1.
struct_prefixed_name_constant_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 66, "column": 1}, "end": {"line": 66, "column": 48}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 1}, "end": {"line": 66, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 8}, "end": {"line": 66, "column": 12}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 66, "column": 13}, "end": {"line": 66, "column": 48}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 13}, "end": {"line": 66, "column": 14}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 46}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 46}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 46}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 15}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 21}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 21}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 15}, "end": {"line": 66, "column": 21}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 22}, "end": {"line": 66, "column": 25}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 46}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 46}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 31}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 31}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 66, "column": 32}, "end": {"line": 66, "column": 46}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 32}, "end": {"line": 66, "column": 33}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 66, "column": 34}, "end": {"line": 66, "column": 46}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 34}, "end": {"line": 66, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 66, "column": 35}, "end": {"line": 66, "column": 45}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 66, "column": 35}, "end": {"line": 66, "column": 45}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 35}, "end": {"line": 66, "column": 45}}, "token": {"kind": "stringSegment", "text": "foaf:knows"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 45}, "end": {"line": 66, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 47}, "end": {"line": 66, "column": 48}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum CodingKeys: String, CodingKey { case name = "foaf_name" }` at 69:5.
coding_keys_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 69, "column": 5}, "end": {"line": 69, "column": 67}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 5}, "end": {"line": 69, "column": 9}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 10}, "end": {"line": 69, "column": 20}}, "token": {"kind": "identifier", "text": "CodingKeys"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 69, "column": 20}, "end": {"line": 69, "column": 39}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 20}, "end": {"line": 69, "column": 21}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 69, "column": 22}, "end": {"line": 69, "column": 39}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 69, "column": 22}, "end": {"line": 69, "column": 29}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 69, "column": 22}, "end": {"line": 69, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 22}, "end": {"line": 69, "column": 28}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 28}, "end": {"line": 69, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 69, "column": 30}, "end": {"line": 69, "column": 39}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 69, "column": 30}, "end": {"line": 69, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 30}, "end": {"line": 69, "column": 39}}, "token": {"kind": "identifier", "text": "CodingKey"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 69, "column": 40}, "end": {"line": 69, "column": 67}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 40}, "end": {"line": 69, "column": 41}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 65}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 65}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 65}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 42}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 42}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 42}, "end": {"line": 69, "column": 46}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 69, "column": 47}, "end": {"line": 69, "column": 65}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 69, "column": 47}, "end": {"line": 69, "column": 65}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 47}, "end": {"line": 69, "column": 51}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 69, "column": 52}, "end": {"line": 69, "column": 65}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 52}, "end": {"line": 69, "column": 53}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 69, "column": 54}, "end": {"line": 69, "column": 65}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 54}, "end": {"line": 69, "column": 55}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 69, "column": 55}, "end": {"line": 69, "column": 64}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 69, "column": 55}, "end": {"line": 69, "column": 64}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 55}, "end": {"line": 69, "column": 64}}, "token": {"kind": "stringSegment", "text": "foaf_name"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 64}, "end": {"line": 69, "column": 65}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 66}, "end": {"line": 69, "column": 67}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum CodingKeys: String, CodingKey { case name = "Name" }` at 72:5.
capitalized_coding_keys_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 72, "column": 5}, "end": {"line": 72, "column": 62}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 5}, "end": {"line": 72, "column": 9}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 10}, "end": {"line": 72, "column": 20}}, "token": {"kind": "identifier", "text": "CodingKeys"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 72, "column": 20}, "end": {"line": 72, "column": 39}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 20}, "end": {"line": 72, "column": 21}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 72, "column": 22}, "end": {"line": 72, "column": 39}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 72, "column": 22}, "end": {"line": 72, "column": 29}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 72, "column": 22}, "end": {"line": 72, "column": 28}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 22}, "end": {"line": 72, "column": 28}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 28}, "end": {"line": 72, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 72, "column": 30}, "end": {"line": 72, "column": 39}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 72, "column": 30}, "end": {"line": 72, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 30}, "end": {"line": 72, "column": 39}}, "token": {"kind": "identifier", "text": "CodingKey"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 72, "column": 40}, "end": {"line": 72, "column": 62}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 40}, "end": {"line": 72, "column": 41}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 60}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 60}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 60}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 42}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 42}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 42}, "end": {"line": 72, "column": 46}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 72, "column": 47}, "end": {"line": 72, "column": 60}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 72, "column": 47}, "end": {"line": 72, "column": 60}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 47}, "end": {"line": 72, "column": 51}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 72, "column": 52}, "end": {"line": 72, "column": 60}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 52}, "end": {"line": 72, "column": 53}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 72, "column": 54}, "end": {"line": 72, "column": 60}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 54}, "end": {"line": 72, "column": 55}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 72, "column": 55}, "end": {"line": 72, "column": 59}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 72, "column": 55}, "end": {"line": 72, "column": 59}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 55}, "end": {"line": 72, "column": 59}}, "token": {"kind": "stringSegment", "text": "Name"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 59}, "end": {"line": 72, "column": 60}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 61}, "end": {"line": 72, "column": 62}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `public enum TextDirection: String, Sendable, Codable { case ltr, rtl }` at 75:1.
base_direction_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 75, "column": 1}, "end": {"line": 75, "column": 71}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 75, "column": 1}, "end": {"line": 75, "column": 7}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 75, "column": 1}, "end": {"line": 75, "column": 7}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 1}, "end": {"line": 75, "column": 7}}, "token": {"kind": "keyword", "text": "public"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 8}, "end": {"line": 75, "column": 12}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 13}, "end": {"line": 75, "column": 26}}, "token": {"kind": "identifier", "text": "TextDirection"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 75, "column": 26}, "end": {"line": 75, "column": 53}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 26}, "end": {"line": 75, "column": 27}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 75, "column": 28}, "end": {"line": 75, "column": 53}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 75, "column": 28}, "end": {"line": 75, "column": 35}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 75, "column": 28}, "end": {"line": 75, "column": 34}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 28}, "end": {"line": 75, "column": 34}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 34}, "end": {"line": 75, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 45}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 44}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 44}}, "token": {"kind": "identifier", "text": "Sendable"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 44}, "end": {"line": 75, "column": 45}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 75, "column": 46}, "end": {"line": 75, "column": 53}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 75, "column": 46}, "end": {"line": 75, "column": 53}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 46}, "end": {"line": 75, "column": 53}}, "token": {"kind": "identifier", "text": "Codable"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 75, "column": 54}, "end": {"line": 75, "column": 71}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 54}, "end": {"line": 75, "column": 55}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 69}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 69}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 69}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 56}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 56}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 56}, "end": {"line": 75, "column": 60}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 75, "column": 61}, "end": {"line": 75, "column": 69}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 75, "column": 61}, "end": {"line": 75, "column": 65}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 61}, "end": {"line": 75, "column": 64}}, "token": {"kind": "identifier", "text": "ltr"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 64}, "end": {"line": 75, "column": 65}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 75, "column": 66}, "end": {"line": 75, "column": 69}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 66}, "end": {"line": 75, "column": 69}}, "token": {"kind": "identifier", "text": "rtl"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 70}, "end": {"line": 75, "column": 71}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Format { static let mediaType = "text/turtle" }` at 78:1.
media_type_constant_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 78, "column": 1}, "end": {"line": 78, "column": 55}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 1}, "end": {"line": 78, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 8}, "end": {"line": 78, "column": 14}}, "token": {"kind": "identifier", "text": "Format"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 78, "column": 15}, "end": {"line": 78, "column": 55}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 15}, "end": {"line": 78, "column": 16}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 53}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 53}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 53}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 17}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 23}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 23}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 17}, "end": {"line": 78, "column": 23}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 24}, "end": {"line": 78, "column": 27}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 53}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 53}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 37}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 37}}, "token": {"kind": "identifier", "text": "mediaType"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 78, "column": 38}, "end": {"line": 78, "column": 53}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 38}, "end": {"line": 78, "column": 39}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 78, "column": 40}, "end": {"line": 78, "column": 53}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 40}, "end": {"line": 78, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                  {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 78, "column": 41}, "end": {"line": 78, "column": 52}}, "children": [
                    {"type": "StringSegmentSyntax", "range": {"start": {"line": 78, "column": 41}, "end": {"line": 78, "column": 52}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 41}, "end": {"line": 78, "column": 52}}, "token": {"kind": "stringSegment", "text": "text\/turtle"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 52}, "end": {"line": 78, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 54}, "end": {"line": 78, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Fauna { static let namespace = Namespace("http://example.org/fauna#") }` at 81:1.
namespace_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 81, "column": 1}, "end": {"line": 81, "column": 77}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 1}, "end": {"line": 81, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 6}, "end": {"line": 81, "column": 11}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 81, "column": 12}, "end": {"line": 81, "column": 77}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 12}, "end": {"line": 81, "column": 13}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 75}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 75}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 75}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 14}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 20}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 20}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 14}, "end": {"line": 81, "column": 20}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 21}, "end": {"line": 81, "column": 24}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 75}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 75}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 34}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 81, "column": 35}, "end": {"line": 81, "column": 75}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 35}, "end": {"line": 81, "column": 36}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 81, "column": 37}, "end": {"line": 81, "column": 75}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 81, "column": 37}, "end": {"line": 81, "column": 46}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 37}, "end": {"line": 81, "column": 46}}, "token": {"kind": "identifier", "text": "Namespace"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 46}, "end": {"line": 81, "column": 47}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 81, "column": 47}, "end": {"line": 81, "column": 74}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 81, "column": 47}, "end": {"line": 81, "column": 74}}, "children": [
                      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 81, "column": 47}, "end": {"line": 81, "column": 74}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 47}, "end": {"line": 81, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 81, "column": 48}, "end": {"line": 81, "column": 73}}, "children": [
                          {"type": "StringSegmentSyntax", "range": {"start": {"line": 81, "column": 48}, "end": {"line": 81, "column": 73}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 48}, "end": {"line": 81, "column": 73}}, "token": {"kind": "stringSegment", "text": "http:\/\/example.org\/fauna#"}, "children": []},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 73}, "end": {"line": 81, "column": 74}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 74}, "end": {"line": 81, "column": 75}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 81, "column": 76}, "end": {"line": 81, "column": 76}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 76}, "end": {"line": 81, "column": 77}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

test_denies_case_only_vocabulary_enum if {
  result := decision with input as case_only_vocabulary_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 100
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_case_only_rdfs_enum if {
  result := decision with input as case_only_rdfs_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 103
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_documented_vocabulary_enum if {
  result := decision with input as documented_vocabulary_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 106
  result.deny[0].column == 29
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_ontology_named_enum if {
  result := decision with input as ontology_named_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 109
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_stored_static_enum if {
  result := decision with input as stored_static_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 112
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_caseless_vocabulary_enum if {
  result := decision with input as caseless_vocabulary_enum_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 115
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_own_type_struct_constant if {
  result := decision with input as own_type_struct_constant_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 118
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_vocabulary_extension_static if {
  result := decision with input as vocabulary_extension_static_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 121
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_documented_namespace_struct if {
  result := decision with input as documented_namespace_struct_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_static_term_enum"
  result.deny[0].line == 124
  result.deny[0].column == 42
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_documented_plain_enum if {
  result := decision with input as documented_plain_enum_node

  count(result.deny) == 0
}

test_allows_iri_static_enum if {
  result := decision with input as iri_static_enum_node

  count(result.deny) == 0
}

test_allows_computed_static_enum_count if {
  result := decision with input as computed_static_enum_count_node

  count(result.deny) == 0
}

# Parser output for `enum Foaf { case knows, person, agent }` at 100:1.
case_only_vocabulary_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 100, "column": 1}, "end": {"line": 100, "column": 40}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 1}, "end": {"line": 100, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 6}, "end": {"line": 100, "column": 10}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 100, "column": 11}, "end": {"line": 100, "column": 40}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 11}, "end": {"line": 100, "column": 12}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 38}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 38}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 38}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 13}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 13}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 13}, "end": {"line": 100, "column": 17}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 100, "column": 18}, "end": {"line": 100, "column": 38}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 100, "column": 18}, "end": {"line": 100, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 18}, "end": {"line": 100, "column": 23}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 23}, "end": {"line": 100, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 100, "column": 25}, "end": {"line": 100, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 25}, "end": {"line": 100, "column": 31}}, "token": {"kind": "identifier", "text": "person"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 31}, "end": {"line": 100, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 100, "column": 33}, "end": {"line": 100, "column": 38}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 33}, "end": {"line": 100, "column": 38}}, "token": {"kind": "identifier", "text": "agent"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 100, "column": 39}, "end": {"line": 100, "column": 40}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum RDFS { case label, comment }` at 103:1.
case_only_rdfs_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 103, "column": 1}, "end": {"line": 103, "column": 34}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 1}, "end": {"line": 103, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 6}, "end": {"line": 103, "column": 10}}, "token": {"kind": "identifier", "text": "RDFS"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 103, "column": 11}, "end": {"line": 103, "column": 34}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 11}, "end": {"line": 103, "column": 12}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 32}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 32}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 32}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 13}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 13}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 13}, "end": {"line": 103, "column": 17}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 103, "column": 18}, "end": {"line": 103, "column": 32}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 103, "column": 18}, "end": {"line": 103, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 18}, "end": {"line": 103, "column": 23}}, "token": {"kind": "identifier", "text": "label"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 23}, "end": {"line": 103, "column": 24}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 103, "column": 25}, "end": {"line": 103, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 25}, "end": {"line": 103, "column": 32}}, "token": {"kind": "identifier", "text": "comment"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 103, "column": 33}, "end": {"line": 103, "column": 34}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `/** The FOAF vocabulary. */ enum Friend { case knows, person }` at 106:1.
documented_vocabulary_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 106, "column": 29}, "end": {"line": 106, "column": 63}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 29}, "end": {"line": 106, "column": 33}}, "token": {"kind": "keyword", "text": "enum", "documentation": "\/** The FOAF vocabulary. *\/"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 34}, "end": {"line": 106, "column": 40}}, "token": {"kind": "identifier", "text": "Friend"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 106, "column": 41}, "end": {"line": 106, "column": 63}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 41}, "end": {"line": 106, "column": 42}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 61}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 61}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 61}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 43}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 43}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 43}, "end": {"line": 106, "column": 47}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 106, "column": 48}, "end": {"line": 106, "column": 61}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 106, "column": 48}, "end": {"line": 106, "column": 54}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 48}, "end": {"line": 106, "column": 53}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 53}, "end": {"line": 106, "column": 54}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 106, "column": 55}, "end": {"line": 106, "column": 61}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 55}, "end": {"line": 106, "column": 61}}, "token": {"kind": "identifier", "text": "person"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 106, "column": 62}, "end": {"line": 106, "column": 63}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum FaunaOntology { case animal, habitat }` at 109:1.
ontology_named_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 109, "column": 1}, "end": {"line": 109, "column": 44}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 1}, "end": {"line": 109, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 6}, "end": {"line": 109, "column": 19}}, "token": {"kind": "identifier", "text": "FaunaOntology"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 44}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 20}, "end": {"line": 109, "column": 21}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 42}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 42}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 42}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 22}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 22}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 22}, "end": {"line": 109, "column": 26}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 109, "column": 27}, "end": {"line": 109, "column": 42}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 109, "column": 27}, "end": {"line": 109, "column": 34}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 27}, "end": {"line": 109, "column": 33}}, "token": {"kind": "identifier", "text": "animal"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 33}, "end": {"line": 109, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 42}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 35}, "end": {"line": 109, "column": 42}}, "token": {"kind": "identifier", "text": "habitat"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 109, "column": 43}, "end": {"line": 109, "column": 44}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Fauna { static let animal = Animal() }` at 112:1.
stored_static_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 112, "column": 1}, "end": {"line": 112, "column": 44}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 1}, "end": {"line": 112, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 6}, "end": {"line": 112, "column": 11}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 112, "column": 12}, "end": {"line": 112, "column": 44}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 12}, "end": {"line": 112, "column": 13}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 42}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 42}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 42}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 14}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 20}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 20}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 14}, "end": {"line": 112, "column": 20}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 21}, "end": {"line": 112, "column": 24}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 42}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 42}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 31}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 25}, "end": {"line": 112, "column": 31}}, "token": {"kind": "identifier", "text": "animal"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 42}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 32}, "end": {"line": 112, "column": 33}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 112, "column": 34}, "end": {"line": 112, "column": 42}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 112, "column": 34}, "end": {"line": 112, "column": 40}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 34}, "end": {"line": 112, "column": 40}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 40}, "end": {"line": 112, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 112, "column": 41}, "end": {"line": 112, "column": 41}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 41}, "end": {"line": 112, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 112, "column": 43}, "end": {"line": 112, "column": 43}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 112, "column": 43}, "end": {"line": 112, "column": 44}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Schema { static var name: Name { Name() } }` at 115:1.
caseless_vocabulary_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 115, "column": 1}, "end": {"line": 115, "column": 49}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 1}, "end": {"line": 115, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 6}, "end": {"line": 115, "column": 12}}, "token": {"kind": "identifier", "text": "Schema"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 115, "column": 13}, "end": {"line": 115, "column": 49}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 13}, "end": {"line": 115, "column": 14}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 47}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 47}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 47}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 15}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 21}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 21}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 15}, "end": {"line": 115, "column": 21}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 22}, "end": {"line": 115, "column": 25}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 115, "column": 26}, "end": {"line": 115, "column": 47}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 115, "column": 26}, "end": {"line": 115, "column": 47}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 115, "column": 26}, "end": {"line": 115, "column": 30}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 26}, "end": {"line": 115, "column": 30}}, "token": {"kind": "identifier", "text": "name"}, "children": []},
              ]},
              {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 115, "column": 30}, "end": {"line": 115, "column": 36}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 30}, "end": {"line": 115, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 115, "column": 32}, "end": {"line": 115, "column": 36}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 32}, "end": {"line": 115, "column": 36}}, "token": {"kind": "identifier", "text": "Name"}, "children": []},
                ]},
              ]},
              {"type": "AccessorBlockSyntax", "range": {"start": {"line": 115, "column": 37}, "end": {"line": 115, "column": 47}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 37}, "end": {"line": 115, "column": 38}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 115, "column": 39}, "end": {"line": 115, "column": 45}}, "children": [
                  {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 115, "column": 39}, "end": {"line": 115, "column": 45}}, "children": [
                    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 115, "column": 39}, "end": {"line": 115, "column": 45}}, "children": [
                      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 115, "column": 39}, "end": {"line": 115, "column": 43}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 39}, "end": {"line": 115, "column": 43}}, "token": {"kind": "identifier", "text": "Name"}, "children": []},
                      ]},
                      {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 43}, "end": {"line": 115, "column": 44}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 115, "column": 44}, "end": {"line": 115, "column": 44}}, "children": []},
                      {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 44}, "end": {"line": 115, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 115, "column": 46}, "end": {"line": 115, "column": 46}}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 46}, "end": {"line": 115, "column": 47}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 115, "column": 48}, "end": {"line": 115, "column": 49}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct Fauna { static let animal = Animal() }` at 118:1.
own_type_struct_constant_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 118, "column": 1}, "end": {"line": 118, "column": 46}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 1}, "end": {"line": 118, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 8}, "end": {"line": 118, "column": 13}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 118, "column": 14}, "end": {"line": 118, "column": 46}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 14}, "end": {"line": 118, "column": 15}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 44}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 44}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 44}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 16}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 22}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 22}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 16}, "end": {"line": 118, "column": 22}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 23}, "end": {"line": 118, "column": 26}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 118, "column": 27}, "end": {"line": 118, "column": 44}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 118, "column": 27}, "end": {"line": 118, "column": 44}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 118, "column": 27}, "end": {"line": 118, "column": 33}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 27}, "end": {"line": 118, "column": 33}}, "token": {"kind": "identifier", "text": "animal"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 44}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 34}, "end": {"line": 118, "column": 35}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 118, "column": 36}, "end": {"line": 118, "column": 44}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 118, "column": 36}, "end": {"line": 118, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 36}, "end": {"line": 118, "column": 42}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 42}, "end": {"line": 118, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 118, "column": 43}, "end": {"line": 118, "column": 43}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 43}, "end": {"line": 118, "column": 44}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 118, "column": 45}, "end": {"line": 118, "column": 45}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 118, "column": 45}, "end": {"line": 118, "column": 46}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Foaf { static let knows = Knows.shared }` at 121:1.
vocabulary_extension_static_node := {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 121, "column": 1}, "end": {"line": 121, "column": 51}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 1}, "end": {"line": 121, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 121, "column": 11}, "end": {"line": 121, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 11}, "end": {"line": 121, "column": 15}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 51}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 16}, "end": {"line": 121, "column": 17}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 49}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 49}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 49}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 18}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 24}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 24}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 18}, "end": {"line": 121, "column": 24}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 25}, "end": {"line": 121, "column": 28}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 121, "column": 29}, "end": {"line": 121, "column": 49}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 121, "column": 29}, "end": {"line": 121, "column": 49}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 121, "column": 29}, "end": {"line": 121, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 29}, "end": {"line": 121, "column": 34}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 121, "column": 35}, "end": {"line": 121, "column": 49}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 35}, "end": {"line": 121, "column": 36}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 121, "column": 37}, "end": {"line": 121, "column": 49}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 121, "column": 37}, "end": {"line": 121, "column": 42}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 37}, "end": {"line": 121, "column": 42}}, "token": {"kind": "identifier", "text": "Knows"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 42}, "end": {"line": 121, "column": 43}}, "token": {"kind": "period", "text": "."}, "children": []},
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 121, "column": 43}, "end": {"line": 121, "column": 49}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 43}, "end": {"line": 121, "column": 49}}, "token": {"kind": "identifier", "text": "shared"}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 121, "column": 50}, "end": {"line": 121, "column": 51}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `/** The terms of the fauna namespace. */ struct Fauna { static let animal = Fauna.Animal.self }` at 124:1.
documented_namespace_struct_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 124, "column": 42}, "end": {"line": 124, "column": 96}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 42}, "end": {"line": 124, "column": 48}}, "token": {"kind": "keyword", "text": "struct", "documentation": "\/** The terms of the fauna namespace. *\/"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 49}, "end": {"line": 124, "column": 54}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 124, "column": 55}, "end": {"line": 124, "column": 96}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 55}, "end": {"line": 124, "column": 56}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 94}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 94}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 94}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 57}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 63}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 63}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 57}, "end": {"line": 124, "column": 63}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 64}, "end": {"line": 124, "column": 67}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 124, "column": 68}, "end": {"line": 124, "column": 94}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 124, "column": 68}, "end": {"line": 124, "column": 94}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 124, "column": 68}, "end": {"line": 124, "column": 74}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 68}, "end": {"line": 124, "column": 74}}, "token": {"kind": "identifier", "text": "animal"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 124, "column": 75}, "end": {"line": 124, "column": 94}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 75}, "end": {"line": 124, "column": 76}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 124, "column": 77}, "end": {"line": 124, "column": 94}}, "children": [
                  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 124, "column": 77}, "end": {"line": 124, "column": 89}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 124, "column": 77}, "end": {"line": 124, "column": 82}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 77}, "end": {"line": 124, "column": 82}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 82}, "end": {"line": 124, "column": 83}}, "token": {"kind": "period", "text": "."}, "children": []},
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 124, "column": 83}, "end": {"line": 124, "column": 89}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 83}, "end": {"line": 124, "column": 89}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 89}, "end": {"line": 124, "column": 90}}, "token": {"kind": "period", "text": "."}, "children": []},
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 124, "column": 90}, "end": {"line": 124, "column": 94}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 90}, "end": {"line": 124, "column": 94}}, "token": {"kind": "keyword", "text": "self"}, "children": []},
                  ]},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 124, "column": 95}, "end": {"line": 124, "column": 96}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `/** The base direction of a literal. */ enum TextDirection { case ltr, rtl }` at 127:1.
documented_plain_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 127, "column": 41}, "end": {"line": 127, "column": 77}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 41}, "end": {"line": 127, "column": 45}}, "token": {"kind": "keyword", "text": "enum", "documentation": "\/** The base direction of a literal. *\/"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 46}, "end": {"line": 127, "column": 59}}, "token": {"kind": "identifier", "text": "TextDirection"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 127, "column": 60}, "end": {"line": 127, "column": 77}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 60}, "end": {"line": 127, "column": 61}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 75}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 75}}, "children": [
        {"type": "EnumCaseDeclSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 75}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 62}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 62}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 62}, "end": {"line": 127, "column": 66}}, "token": {"kind": "keyword", "text": "case"}, "children": []},
          {"type": "EnumCaseElementListSyntax", "range": {"start": {"line": 127, "column": 67}, "end": {"line": 127, "column": 75}}, "children": [
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 127, "column": 67}, "end": {"line": 127, "column": 71}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 67}, "end": {"line": 127, "column": 70}}, "token": {"kind": "identifier", "text": "ltr"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 70}, "end": {"line": 127, "column": 71}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "EnumCaseElementSyntax", "range": {"start": {"line": 127, "column": 72}, "end": {"line": 127, "column": 75}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 72}, "end": {"line": 127, "column": 75}}, "token": {"kind": "identifier", "text": "rtl"}, "children": []},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 127, "column": 76}, "end": {"line": 127, "column": 77}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum FoafA { static let knows = URL(string: "http://xmlns.com/foaf/0.1/knows")! }` at 130:1.
iri_static_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 82}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 1}, "end": {"line": 130, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 6}, "end": {"line": 130, "column": 11}}, "token": {"kind": "identifier", "text": "FoafA"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 130, "column": 12}, "end": {"line": 130, "column": 82}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 12}, "end": {"line": 130, "column": 13}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 80}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 80}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 80}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 14}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 20}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 20}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 14}, "end": {"line": 130, "column": 20}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 21}, "end": {"line": 130, "column": 24}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 130, "column": 25}, "end": {"line": 130, "column": 80}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 130, "column": 25}, "end": {"line": 130, "column": 80}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 130, "column": 25}, "end": {"line": 130, "column": 30}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 25}, "end": {"line": 130, "column": 30}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 130, "column": 31}, "end": {"line": 130, "column": 80}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 31}, "end": {"line": 130, "column": 32}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "ForceUnwrapExprSyntax", "range": {"start": {"line": 130, "column": 33}, "end": {"line": 130, "column": 80}}, "children": [
                  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 130, "column": 33}, "end": {"line": 130, "column": 79}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 130, "column": 33}, "end": {"line": 130, "column": 36}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 33}, "end": {"line": 130, "column": 36}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 36}, "end": {"line": 130, "column": 37}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 78}}, "children": [
                      {"type": "LabeledExprSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 78}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 37}, "end": {"line": 130, "column": 43}}, "token": {"kind": "identifier", "text": "string"}, "children": []},
                        {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 43}, "end": {"line": 130, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 130, "column": 45}, "end": {"line": 130, "column": 78}}, "children": [
                          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 45}, "end": {"line": 130, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 130, "column": 46}, "end": {"line": 130, "column": 77}}, "children": [
                            {"type": "StringSegmentSyntax", "range": {"start": {"line": 130, "column": 46}, "end": {"line": 130, "column": 77}}, "children": [
                              {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 46}, "end": {"line": 130, "column": 77}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                            ]},
                          ]},
                          {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 77}, "end": {"line": 130, "column": 78}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        ]},
                      ]},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 78}, "end": {"line": 130, "column": 79}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 130, "column": 79}, "end": {"line": 130, "column": 79}}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 79}, "end": {"line": 130, "column": 80}}, "token": {"kind": "exclamationMark", "text": "!"}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 130, "column": 81}, "end": {"line": 130, "column": 82}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Fauna { static var count: Int { 3 } }` at 133:1.
computed_static_enum_count_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 43}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 1}, "end": {"line": 133, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 6}, "end": {"line": 133, "column": 11}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 133, "column": 12}, "end": {"line": 133, "column": 43}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 12}, "end": {"line": 133, "column": 13}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 41}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 41}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 41}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 14}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 20}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 20}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 14}, "end": {"line": 133, "column": 20}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 21}, "end": {"line": 133, "column": 24}}, "token": {"kind": "keyword", "text": "var"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 133, "column": 25}, "end": {"line": 133, "column": 41}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 133, "column": 25}, "end": {"line": 133, "column": 41}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 133, "column": 25}, "end": {"line": 133, "column": 30}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 25}, "end": {"line": 133, "column": 30}}, "token": {"kind": "identifier", "text": "count"}, "children": []},
              ]},
              {"type": "TypeAnnotationSyntax", "range": {"start": {"line": 133, "column": 30}, "end": {"line": 133, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 30}, "end": {"line": 133, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 133, "column": 32}, "end": {"line": 133, "column": 35}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 32}, "end": {"line": 133, "column": 35}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
                ]},
              ]},
              {"type": "AccessorBlockSyntax", "range": {"start": {"line": 133, "column": 36}, "end": {"line": 133, "column": 41}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 36}, "end": {"line": 133, "column": 37}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
                {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 133, "column": 38}, "end": {"line": 133, "column": 39}}, "children": [
                  {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 133, "column": 38}, "end": {"line": 133, "column": 39}}, "children": [
                    {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 133, "column": 38}, "end": {"line": 133, "column": 39}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 38}, "end": {"line": 133, "column": 39}}, "token": {"kind": "integerLiteral", "text": "3"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 40}, "end": {"line": 133, "column": 41}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 133, "column": 42}, "end": {"line": 133, "column": 43}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# A static function that takes parameters turns them into a term; it is not a term constant.
test_allows_static_term_factory_with_parameters if {
  result := decision with input as static_term_factory_node

  count(result.deny) == 0
}

# A static built by a string-building call is no_static_iri_constant's, reported once.
test_leaves_appending_static_enum_to_iri_rule if {
  result := decision with input as appending_static_enum_node

  count(result.deny) == 0
}

# Parser output for `struct TurtleDecoder { static func term(from token: String) throws -> Term { fatalError() } }` at 136:1.
static_term_factory_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 94}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 1}, "end": {"line": 136, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 8}, "end": {"line": 136, "column": 21}}, "token": {"kind": "identifier", "text": "TurtleDecoder"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 136, "column": 22}, "end": {"line": 136, "column": 94}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 22}, "end": {"line": 136, "column": 23}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 92}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 92}}, "children": [
        {"type": "FunctionDeclSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 92}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 24}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 30}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 30}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 24}, "end": {"line": 136, "column": 30}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 31}, "end": {"line": 136, "column": 35}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 36}, "end": {"line": 136, "column": 40}}, "token": {"kind": "identifier", "text": "term"}, "children": []},
          {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 136, "column": 40}, "end": {"line": 136, "column": 75}}, "children": [
            {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 136, "column": 40}, "end": {"line": 136, "column": 60}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 40}, "end": {"line": 136, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
              {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 59}}, "children": [
                {"type": "FunctionParameterSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 59}}, "children": [
                  {"type": "AttributeListSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 41}}, "children": []},
                  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 41}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 41}, "end": {"line": 136, "column": 45}}, "token": {"kind": "identifier", "text": "from"}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 46}, "end": {"line": 136, "column": 51}}, "token": {"kind": "identifier", "text": "token"}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 51}, "end": {"line": 136, "column": 52}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 53}, "end": {"line": 136, "column": 59}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 53}, "end": {"line": 136, "column": 59}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 59}, "end": {"line": 136, "column": 60}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            ]},
            {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 136, "column": 61}, "end": {"line": 136, "column": 67}}, "children": [
              {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 136, "column": 61}, "end": {"line": 136, "column": 67}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 61}, "end": {"line": 136, "column": 67}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
              ]},
            ]},
            {"type": "ReturnClauseSyntax", "range": {"start": {"line": 136, "column": 68}, "end": {"line": 136, "column": 75}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 68}, "end": {"line": 136, "column": 70}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 136, "column": 71}, "end": {"line": 136, "column": 75}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 71}, "end": {"line": 136, "column": 75}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "CodeBlockSyntax", "range": {"start": {"line": 136, "column": 76}, "end": {"line": 136, "column": 92}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 76}, "end": {"line": 136, "column": 77}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
            {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 136, "column": 78}, "end": {"line": 136, "column": 90}}, "children": [
              {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 136, "column": 78}, "end": {"line": 136, "column": 90}}, "children": [
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 136, "column": 78}, "end": {"line": 136, "column": 90}}, "children": [
                  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 136, "column": 78}, "end": {"line": 136, "column": 88}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 78}, "end": {"line": 136, "column": 88}}, "token": {"kind": "identifier", "text": "fatalError"}, "children": []},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 88}, "end": {"line": 136, "column": 89}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 136, "column": 89}, "end": {"line": 136, "column": 89}}, "children": []},
                  {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 89}, "end": {"line": 136, "column": 90}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 136, "column": 91}, "end": {"line": 136, "column": 91}}, "children": []},
                ]},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 91}, "end": {"line": 136, "column": 92}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 136, "column": 93}, "end": {"line": 136, "column": 94}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `enum Foaf { static let knows = ns.appending("knows") }` at 138:1.
appending_static_enum_node := {"type": "EnumDeclSyntax", "range": {"start": {"line": 138, "column": 1}, "end": {"line": 138, "column": 55}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 1}, "end": {"line": 138, "column": 5}}, "token": {"kind": "keyword", "text": "enum"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 6}, "end": {"line": 138, "column": 10}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 138, "column": 11}, "end": {"line": 138, "column": 55}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 11}, "end": {"line": 138, "column": 12}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 53}}, "children": [
      {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 53}}, "children": [
        {"type": "VariableDeclSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 53}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 13}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 19}}, "children": [
            {"type": "DeclModifierSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 19}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 13}, "end": {"line": 138, "column": 19}}, "token": {"kind": "keyword", "text": "static"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 20}, "end": {"line": 138, "column": 23}}, "token": {"kind": "keyword", "text": "let"}, "children": []},
          {"type": "PatternBindingListSyntax", "range": {"start": {"line": 138, "column": 24}, "end": {"line": 138, "column": 53}}, "children": [
            {"type": "PatternBindingSyntax", "range": {"start": {"line": 138, "column": 24}, "end": {"line": 138, "column": 53}}, "children": [
              {"type": "IdentifierPatternSyntax", "range": {"start": {"line": 138, "column": 24}, "end": {"line": 138, "column": 29}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 24}, "end": {"line": 138, "column": 29}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
              ]},
              {"type": "InitializerClauseSyntax", "range": {"start": {"line": 138, "column": 30}, "end": {"line": 138, "column": 53}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 30}, "end": {"line": 138, "column": 31}}, "token": {"kind": "equal", "text": "="}, "children": []},
                {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 138, "column": 32}, "end": {"line": 138, "column": 53}}, "children": [
                  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 138, "column": 32}, "end": {"line": 138, "column": 44}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 138, "column": 32}, "end": {"line": 138, "column": 34}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 32}, "end": {"line": 138, "column": 34}}, "token": {"kind": "identifier", "text": "ns"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 34}, "end": {"line": 138, "column": 35}}, "token": {"kind": "period", "text": "."}, "children": []},
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 138, "column": 35}, "end": {"line": 138, "column": 44}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 35}, "end": {"line": 138, "column": 44}}, "token": {"kind": "identifier", "text": "appending"}, "children": []},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 44}, "end": {"line": 138, "column": 45}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 138, "column": 45}, "end": {"line": 138, "column": 52}}, "children": [
                    {"type": "LabeledExprSyntax", "range": {"start": {"line": 138, "column": 45}, "end": {"line": 138, "column": 52}}, "children": [
                      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 138, "column": 45}, "end": {"line": 138, "column": 52}}, "children": [
                        {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 45}, "end": {"line": 138, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 138, "column": 46}, "end": {"line": 138, "column": 51}}, "children": [
                          {"type": "StringSegmentSyntax", "range": {"start": {"line": 138, "column": 46}, "end": {"line": 138, "column": 51}}, "children": [
                            {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 46}, "end": {"line": 138, "column": 51}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                          ]},
                        ]},
                        {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 51}, "end": {"line": 138, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                      ]},
                    ]},
                  ]},
                  {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 52}, "end": {"line": 138, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 138, "column": 54}, "end": {"line": 138, "column": 54}}, "children": []},
                ]},
              ]},
            ]},
          ]},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 138, "column": 54}, "end": {"line": 138, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

