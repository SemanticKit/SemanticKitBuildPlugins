package semantickit.design_guidelines.no_mode_flag_helper

test_denies_private_decode_with_mode_flag if {
  result := decision with input as private_decode_term_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_mode_flag_helper"
  result.deny[0].line == 3
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_free_parse_with_swift_bool_flag if {
  result := decision with input as free_parse_literal_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_mode_flag_helper"
  result.deny[0].line == 6
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_fileprivate_encode_in_parser_type if {
  result := decision with input as fileprivate_encode_term_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_mode_flag_helper"
  result.deny[0].line == 9
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_private_parse_in_extension if {
  result := decision with input as private_parse_in_extension_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_mode_flag_helper"
  result.deny[0].line == 12
  result.deny[0].column == 20
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_local_parse_helper if {
  result := decision with input as local_parse_helper_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_mode_flag_helper"
  result.deny[0].line == 30
  result.deny[0].column == 5
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_method_of_coder_type if {
  result := decision with input as coder_method_node

  count(result.deny) == 0
}

test_allows_free_decode_without_flag if {
  result := decision with input as free_decode_without_flag_node

  count(result.deny) == 0
}

test_allows_private_flag_on_other_function if {
  result := decision with input as private_render_flag_node

  count(result.deny) == 0
}

test_allows_initializer_on_term_type if {
  result := decision with input as term_initializer_node

  count(result.deny) == 0
}

test_allows_coder_factory if {
  result := decision with input as free_decoder_factory_node

  count(result.deny) == 0
}

# Parser output for `private func decodeTerm(_ token: String, tsvMode: Bool) throws -> ObjectTerm { fatalError() }` at 3:5.
private_decode_term_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 98}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 12}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 12}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 5}, "end": {"line": 3, "column": 12}}, "token": {"kind": "keyword", "text": "private"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 13}, "end": {"line": 3, "column": 17}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 18}, "end": {"line": 3, "column": 28}}, "token": {"kind": "identifier", "text": "decodeTerm"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 3, "column": 28}, "end": {"line": 3, "column": 81}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 3, "column": 28}, "end": {"line": 3, "column": 60}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 28}, "end": {"line": 3, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 59}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 45}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 29}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 29}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 30}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 31}, "end": {"line": 3, "column": 36}}, "token": {"kind": "identifier", "text": "token"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 36}, "end": {"line": 3, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 38}, "end": {"line": 3, "column": 44}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 38}, "end": {"line": 3, "column": 44}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 44}, "end": {"line": 3, "column": 45}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 59}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 46}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 46}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 46}, "end": {"line": 3, "column": 53}}, "token": {"kind": "identifier", "text": "tsvMode"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 53}, "end": {"line": 3, "column": 54}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 55}, "end": {"line": 3, "column": 59}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 55}, "end": {"line": 3, "column": 59}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 59}, "end": {"line": 3, "column": 60}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 3, "column": 61}, "end": {"line": 3, "column": 67}}, "children": [
      {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 3, "column": 61}, "end": {"line": 3, "column": 67}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 61}, "end": {"line": 3, "column": 67}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
      ]},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 3, "column": 68}, "end": {"line": 3, "column": 81}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 68}, "end": {"line": 3, "column": 70}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 71}, "end": {"line": 3, "column": 81}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 71}, "end": {"line": 3, "column": 81}}, "token": {"kind": "identifier", "text": "ObjectTerm"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 3, "column": 82}, "end": {"line": 3, "column": 98}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 82}, "end": {"line": 3, "column": 83}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 3, "column": 84}, "end": {"line": 3, "column": 96}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 3, "column": 84}, "end": {"line": 3, "column": 96}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 3, "column": 84}, "end": {"line": 3, "column": 96}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 3, "column": 84}, "end": {"line": 3, "column": 94}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 84}, "end": {"line": 3, "column": 94}}, "token": {"kind": "identifier", "text": "fatalError"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 94}, "end": {"line": 3, "column": 95}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 3, "column": 95}, "end": {"line": 3, "column": 95}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 95}, "end": {"line": 3, "column": 96}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 3, "column": 97}, "end": {"line": 3, "column": 97}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 97}, "end": {"line": 3, "column": 98}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `func parseLiteral(_ text: String, strict: Swift.Bool) -> Literal? { nil }` at 6:1.
free_parse_literal_node := {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 6, "column": 1}, "end": {"line": 6, "column": 74}}, "children": [
  {"type": "FunctionDeclSyntax", "range": {"start": {"line": 6, "column": 1}, "end": {"line": 6, "column": 74}}, "children": [
    {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 1}, "end": {"line": 6, "column": 5}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 6}, "end": {"line": 6, "column": 18}}, "token": {"kind": "identifier", "text": "parseLiteral"}, "children": []},
    {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 6, "column": 18}, "end": {"line": 6, "column": 66}}, "children": [
      {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 6, "column": 18}, "end": {"line": 6, "column": 54}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 18}, "end": {"line": 6, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 6, "column": 19}, "end": {"line": 6, "column": 53}}, "children": [
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 6, "column": 19}, "end": {"line": 6, "column": 34}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 6, "column": 19}, "end": {"line": 6, "column": 19}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 6, "column": 19}, "end": {"line": 6, "column": 19}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 19}, "end": {"line": 6, "column": 20}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 21}, "end": {"line": 6, "column": 25}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 25}, "end": {"line": 6, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 27}, "end": {"line": 6, "column": 33}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 27}, "end": {"line": 6, "column": 33}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 33}, "end": {"line": 6, "column": 34}}, "token": {"kind": "comma", "text": ","}, "children": []},
          ]},
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 53}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 35}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 35}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 41}}, "token": {"kind": "identifier", "text": "strict"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 41}, "end": {"line": 6, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "MemberTypeSyntax", "range": {"start": {"line": 6, "column": 43}, "end": {"line": 6, "column": 53}}, "children": [
              {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 43}, "end": {"line": 6, "column": 48}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 43}, "end": {"line": 6, "column": 48}}, "token": {"kind": "identifier", "text": "Swift"}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 48}, "end": {"line": 6, "column": 49}}, "token": {"kind": "period", "text": "."}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 49}, "end": {"line": 6, "column": 53}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 53}, "end": {"line": 6, "column": 54}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      ]},
      {"type": "ReturnClauseSyntax", "range": {"start": {"line": 6, "column": 55}, "end": {"line": 6, "column": 66}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 55}, "end": {"line": 6, "column": 57}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
        {"type": "OptionalTypeSyntax", "range": {"start": {"line": 6, "column": 58}, "end": {"line": 6, "column": 66}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 58}, "end": {"line": 6, "column": 65}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 58}, "end": {"line": 6, "column": 65}}, "token": {"kind": "identifier", "text": "Literal"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 65}, "end": {"line": 6, "column": 66}}, "token": {"kind": "postfixQuestionMark", "text": "?"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "CodeBlockSyntax", "range": {"start": {"line": 6, "column": 67}, "end": {"line": 6, "column": 74}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 67}, "end": {"line": 6, "column": 68}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
      {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 6, "column": 69}, "end": {"line": 6, "column": 72}}, "children": [
        {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 6, "column": 69}, "end": {"line": 6, "column": 72}}, "children": [
          {"type": "NilLiteralExprSyntax", "range": {"start": {"line": 6, "column": 69}, "end": {"line": 6, "column": 72}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 69}, "end": {"line": 6, "column": 72}}, "token": {"kind": "keyword", "text": "nil"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 73}, "end": {"line": 6, "column": 74}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
    ]},
  ]},
]}

# Parser output for `struct NTriplesParser { fileprivate func encodeTerm(_ term: Term, turtle: Bool) -> String { "" } }` at 9:1.
fileprivate_encode_term_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 97}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 25}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 36}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 36}}, "token": {"kind": "keyword", "text": "fileprivate"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 37}, "end": {"line": 9, "column": 41}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 42}, "end": {"line": 9, "column": 52}}, "token": {"kind": "identifier", "text": "encodeTerm"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 9, "column": 52}, "end": {"line": 9, "column": 90}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 9, "column": 52}, "end": {"line": 9, "column": 80}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 52}, "end": {"line": 9, "column": 53}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 9, "column": 53}, "end": {"line": 9, "column": 79}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 9, "column": 53}, "end": {"line": 9, "column": 66}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 9, "column": 53}, "end": {"line": 9, "column": 53}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 9, "column": 53}, "end": {"line": 9, "column": 53}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 53}, "end": {"line": 9, "column": 54}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 55}, "end": {"line": 9, "column": 59}}, "token": {"kind": "identifier", "text": "term"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 59}, "end": {"line": 9, "column": 60}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 9, "column": 61}, "end": {"line": 9, "column": 65}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 61}, "end": {"line": 9, "column": 65}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 65}, "end": {"line": 9, "column": 66}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 9, "column": 67}, "end": {"line": 9, "column": 79}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 9, "column": 67}, "end": {"line": 9, "column": 67}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 9, "column": 67}, "end": {"line": 9, "column": 67}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 67}, "end": {"line": 9, "column": 73}}, "token": {"kind": "identifier", "text": "turtle"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 73}, "end": {"line": 9, "column": 74}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 9, "column": 75}, "end": {"line": 9, "column": 79}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 75}, "end": {"line": 9, "column": 79}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 79}, "end": {"line": 9, "column": 80}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "ReturnClauseSyntax", "range": {"start": {"line": 9, "column": 81}, "end": {"line": 9, "column": 90}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 81}, "end": {"line": 9, "column": 83}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 9, "column": 84}, "end": {"line": 9, "column": 90}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 84}, "end": {"line": 9, "column": 90}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 9, "column": 91}, "end": {"line": 9, "column": 97}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 91}, "end": {"line": 9, "column": 92}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 9, "column": 93}, "end": {"line": 9, "column": 95}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 9, "column": 93}, "end": {"line": 9, "column": 95}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 9, "column": 93}, "end": {"line": 9, "column": 95}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 93}, "end": {"line": 9, "column": 94}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 9, "column": 94}, "end": {"line": 9, "column": 94}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 9, "column": 94}, "end": {"line": 9, "column": 94}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 94}, "end": {"line": 9, "column": 94}}, "token": {"kind": "stringSegment", "text": ""}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 94}, "end": {"line": 9, "column": 95}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 96}, "end": {"line": 9, "column": 97}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Parser { private func parse(_ text: String, lenient: Bool) {} }` at 12:1.
private_parse_in_extension_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 72}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 20}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 27}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 20}, "end": {"line": 12, "column": 27}}, "token": {"kind": "keyword", "text": "private"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 28}, "end": {"line": 12, "column": 32}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 33}, "end": {"line": 12, "column": 38}}, "token": {"kind": "identifier", "text": "parse"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 69}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 69}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 38}, "end": {"line": 12, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 68}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 54}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 39}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 39}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 40}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 41}, "end": {"line": 12, "column": 45}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 45}, "end": {"line": 12, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 12, "column": 47}, "end": {"line": 12, "column": 53}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 47}, "end": {"line": 12, "column": 53}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 53}, "end": {"line": 12, "column": 54}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 12, "column": 55}, "end": {"line": 12, "column": 68}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 12, "column": 55}, "end": {"line": 12, "column": 55}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 55}, "end": {"line": 12, "column": 55}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 55}, "end": {"line": 12, "column": 62}}, "token": {"kind": "identifier", "text": "lenient"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 62}, "end": {"line": 12, "column": 63}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 12, "column": 64}, "end": {"line": 12, "column": 68}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 64}, "end": {"line": 12, "column": 68}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 68}, "end": {"line": 12, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 12, "column": 70}, "end": {"line": 12, "column": 72}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 70}, "end": {"line": 12, "column": 71}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 12, "column": 71}, "end": {"line": 12, "column": 71}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 71}, "end": {"line": 12, "column": 72}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `struct TurtleDecoder { func decode(_ text: String, strict: Bool) throws {} }` at 15:1.
coder_method_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 75}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 24}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 24}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 28}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 29}, "end": {"line": 15, "column": 35}}, "token": {"kind": "identifier", "text": "decode"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 15, "column": 35}, "end": {"line": 15, "column": 72}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 15, "column": 35}, "end": {"line": 15, "column": 65}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 35}, "end": {"line": 15, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 64}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 51}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 36}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 36}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 37}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 38}, "end": {"line": 15, "column": 42}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 42}, "end": {"line": 15, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 44}, "end": {"line": 15, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 44}, "end": {"line": 15, "column": 50}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 50}, "end": {"line": 15, "column": 51}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 15, "column": 52}, "end": {"line": 15, "column": 64}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 15, "column": 52}, "end": {"line": 15, "column": 52}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 15, "column": 52}, "end": {"line": 15, "column": 52}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 52}, "end": {"line": 15, "column": 58}}, "token": {"kind": "identifier", "text": "strict"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 58}, "end": {"line": 15, "column": 59}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 60}, "end": {"line": 15, "column": 64}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 60}, "end": {"line": 15, "column": 64}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 64}, "end": {"line": 15, "column": 65}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
    {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 15, "column": 66}, "end": {"line": 15, "column": 72}}, "children": [
      {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 15, "column": 66}, "end": {"line": 15, "column": 72}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 66}, "end": {"line": 15, "column": 72}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 15, "column": 73}, "end": {"line": 15, "column": 75}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 73}, "end": {"line": 15, "column": 74}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 15, "column": 74}, "end": {"line": 15, "column": 74}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 74}, "end": {"line": 15, "column": 75}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `func decodeTerm(_ token: String) throws -> Term { fatalError() }` at 18:1.
free_decode_without_flag_node := {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 1}, "end": {"line": 18, "column": 65}}, "children": [
  {"type": "FunctionDeclSyntax", "range": {"start": {"line": 18, "column": 1}, "end": {"line": 18, "column": 65}}, "children": [
    {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 1}, "end": {"line": 18, "column": 5}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 6}, "end": {"line": 18, "column": 16}}, "token": {"kind": "identifier", "text": "decodeTerm"}, "children": []},
    {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 48}}, "children": [
      {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 32}}, "children": [
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 32}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 17}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 17}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 18}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 24}}, "token": {"kind": "identifier", "text": "token"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 25}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 32}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 32}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      ]},
      {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 40}}, "children": [
        {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 40}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 40}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
        ]},
      ]},
      {"type": "ReturnClauseSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 43}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 48}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 48}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "CodeBlockSyntax", "range": {"start": {"line": 18, "column": 49}, "end": {"line": 18, "column": 65}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 49}, "end": {"line": 18, "column": 50}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
      {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 63}}, "children": [
        {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 63}}, "children": [
          {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 63}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 61}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 61}}, "token": {"kind": "identifier", "text": "fatalError"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 61}, "end": {"line": 18, "column": 62}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 62}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 63}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 64}, "end": {"line": 18, "column": 64}}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 64}, "end": {"line": 18, "column": 65}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
    ]},
  ]},
]}

# Parser output for `private func render(_ text: String, compact: Bool) {}` at 21:1.
private_render_flag_node := {"type": "FunctionDeclSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 54}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 8}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 8}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 8}}, "token": {"kind": "keyword", "text": "private"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 13}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 20}}, "token": {"kind": "identifier", "text": "render"}, "children": []},
  {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 51}}, "children": [
    {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 50}}, "children": [
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 36}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 21}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 21}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 22}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 23}, "end": {"line": 21, "column": 27}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 27}, "end": {"line": 21, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 21, "column": 29}, "end": {"line": 21, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 29}, "end": {"line": 21, "column": 35}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 35}, "end": {"line": 21, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "FunctionParameterSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 50}}, "children": [
          {"type": "AttributeListSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 37}}, "children": []},
          {"type": "DeclModifierListSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 37}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 37}, "end": {"line": 21, "column": 44}}, "token": {"kind": "identifier", "text": "compact"}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 44}, "end": {"line": 21, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 50}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 50}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 50}, "end": {"line": 21, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    ]},
  ]},
  {"type": "CodeBlockSyntax", "range": {"start": {"line": 21, "column": 52}, "end": {"line": 21, "column": 54}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 52}, "end": {"line": 21, "column": 53}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 21, "column": 53}, "end": {"line": 21, "column": 53}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 53}, "end": {"line": 21, "column": 54}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `extension Term { init(token: String) throws { fatalError() } }` at 24:1.
term_initializer_node := {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 24, "column": 1}, "end": {"line": 24, "column": 63}}, "children": [
  {"type": "ExtensionDeclSyntax", "range": {"start": {"line": 24, "column": 1}, "end": {"line": 24, "column": 63}}, "children": [
    {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 1}, "end": {"line": 24, "column": 10}}, "token": {"kind": "keyword", "text": "extension"}, "children": []},
    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 24, "column": 11}, "end": {"line": 24, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 11}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
    ]},
    {"type": "MemberBlockSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 63}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
      {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 61}}, "children": [
        {"type": "MemberBlockItemSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 61}}, "children": [
          {"type": "InitializerDeclSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 61}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 18}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 18}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 18}, "end": {"line": 24, "column": 22}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
            {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 44}}, "children": [
              {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 37}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 22}, "end": {"line": 24, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 36}}, "children": [
                  {"type": "FunctionParameterSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 36}}, "children": [
                    {"type": "AttributeListSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 23}}, "children": []},
                    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 23}}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 28}}, "token": {"kind": "identifier", "text": "token"}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 28}, "end": {"line": 24, "column": 29}}, "token": {"kind": "colon", "text": ":"}, "children": []},
                    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 36}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 36}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
                    ]},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
              ]},
              {"type": "FunctionEffectSpecifiersSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 44}}, "children": [
                {"type": "ThrowsClauseSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 44}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 44}}, "token": {"kind": "keyword", "text": "throws"}, "children": []},
                ]},
              ]},
            ]},
            {"type": "CodeBlockSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 61}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 46}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
              {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 59}}, "children": [
                {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 59}}, "children": [
                  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 59}}, "children": [
                    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 57}}, "children": [
                      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 57}}, "token": {"kind": "identifier", "text": "fatalError"}, "children": []},
                    ]},
                    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 57}, "end": {"line": 24, "column": 58}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
                    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 58}}, "children": []},
                    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
                    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 60}, "end": {"line": 24, "column": 60}}, "children": []},
                  ]},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 60}, "end": {"line": 24, "column": 61}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
            ]},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 62}, "end": {"line": 24, "column": 63}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
    ]},
  ]},
]}

# Parser output for `func decoder(strict: Bool) -> TurtleDecoder { TurtleDecoder() }` at 27:1.
free_decoder_factory_node := {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 27, "column": 1}, "end": {"line": 27, "column": 64}}, "children": [
  {"type": "FunctionDeclSyntax", "range": {"start": {"line": 27, "column": 1}, "end": {"line": 27, "column": 64}}, "children": [
    {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 1}, "end": {"line": 27, "column": 5}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 6}, "end": {"line": 27, "column": 13}}, "token": {"kind": "identifier", "text": "decoder"}, "children": []},
    {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 44}}, "children": [
      {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 27}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 26}}, "children": [
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 26}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 14}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 14}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 20}}, "token": {"kind": "identifier", "text": "strict"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 20}, "end": {"line": 27, "column": 21}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 27, "column": 22}, "end": {"line": 27, "column": 26}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 22}, "end": {"line": 27, "column": 26}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 26}, "end": {"line": 27, "column": 27}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      ]},
      {"type": "ReturnClauseSyntax", "range": {"start": {"line": 27, "column": 28}, "end": {"line": 27, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 28}, "end": {"line": 27, "column": 30}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 27, "column": 31}, "end": {"line": 27, "column": 44}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 31}, "end": {"line": 27, "column": 44}}, "token": {"kind": "identifier", "text": "TurtleDecoder"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "CodeBlockSyntax", "range": {"start": {"line": 27, "column": 45}, "end": {"line": 27, "column": 64}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 45}, "end": {"line": 27, "column": 46}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
      {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 27, "column": 47}, "end": {"line": 27, "column": 62}}, "children": [
        {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 27, "column": 47}, "end": {"line": 27, "column": 62}}, "children": [
          {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 47}, "end": {"line": 27, "column": 62}}, "children": [
            {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 47}, "end": {"line": 27, "column": 60}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 47}, "end": {"line": 27, "column": 60}}, "token": {"kind": "identifier", "text": "TurtleDecoder"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 60}, "end": {"line": 27, "column": 61}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
            {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 61}, "end": {"line": 27, "column": 61}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 61}, "end": {"line": 27, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
            {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 63}, "end": {"line": 27, "column": 63}}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 63}, "end": {"line": 27, "column": 64}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
    ]},
  ]},
]}

# Parser output for `func parseToken(_ text: String, quoted: Bool) -> String { text }` at 30:5.
local_parse_helper_node := {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 69}}, "children": [
  {"type": "FunctionDeclSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 69}}, "children": [
    {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 5}, "end": {"line": 30, "column": 9}}, "token": {"kind": "keyword", "text": "func"}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 10}, "end": {"line": 30, "column": 20}}, "token": {"kind": "identifier", "text": "parseToken"}, "children": []},
    {"type": "FunctionSignatureSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 60}}, "children": [
      {"type": "FunctionParameterClauseSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 20}, "end": {"line": 30, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "FunctionParameterListSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 49}}, "children": [
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 36}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 21}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 21}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 22}}, "token": {"kind": "wildcard", "text": "_"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 23}, "end": {"line": 30, "column": 27}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 27}, "end": {"line": 30, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 29}, "end": {"line": 30, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 29}, "end": {"line": 30, "column": 35}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 35}, "end": {"line": 30, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
          ]},
          {"type": "FunctionParameterSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 49}}, "children": [
            {"type": "AttributeListSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 37}}, "children": []},
            {"type": "DeclModifierListSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 37}}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 43}}, "token": {"kind": "identifier", "text": "quoted"}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 43}, "end": {"line": 30, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 49}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 49}}, "token": {"kind": "identifier", "text": "Bool"}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 49}, "end": {"line": 30, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      ]},
      {"type": "ReturnClauseSyntax", "range": {"start": {"line": 30, "column": 51}, "end": {"line": 30, "column": 60}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 51}, "end": {"line": 30, "column": 53}}, "token": {"kind": "arrow", "text": "->"}, "children": []},
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 54}, "end": {"line": 30, "column": 60}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 54}, "end": {"line": 30, "column": 60}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "CodeBlockSyntax", "range": {"start": {"line": 30, "column": 61}, "end": {"line": 30, "column": 69}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 61}, "end": {"line": 30, "column": 62}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
      {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 30, "column": 63}, "end": {"line": 30, "column": 67}}, "children": [
        {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 30, "column": 63}, "end": {"line": 30, "column": 67}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 63}, "end": {"line": 30, "column": 67}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 63}, "end": {"line": 30, "column": 67}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 68}, "end": {"line": 30, "column": 69}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
    ]},
  ]},
]}
