package semantickit.design_guidelines.no_term_registry

test_denies_iri_keyed_dictionary_type if {
  result := decision with input as iri_keyed_dictionary_type_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 3
  result.deny[0].column == 23
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_string_keyed_generic_dictionary if {
  result := decision with input as string_keyed_generic_dictionary_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 6
  result.deny[0].column == 18
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_string_keyed_dictionary_initializer if {
  result := decision with input as string_keyed_dictionary_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 9
  result.deny[0].column == 18
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_registry_class if {
  result := decision with input as registry_class_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 12
  result.deny[0].column == 1
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_type_keyed_dictionary_type if {
  result := decision with input as type_keyed_dictionary_type_node

  count(result.deny) == 0
}

test_allows_typed_set if {
  result := decision with input as typed_set_node

  count(result.deny) == 0
}

test_allows_ontology_struct if {
  result := decision with input as ontology_struct_node

  count(result.deny) == 0
}

# Parser output for `var terms: [IRI: Term]` at 3:12.
iri_keyed_dictionary_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 3, "column": 23}, "end": {"line": 3, "column": 34}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 23}, "end": {"line": 3, "column": 24}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 27}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 24}, "end": {"line": 3, "column": 27}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 27}, "end": {"line": 3, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 33}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 29}, "end": {"line": 3, "column": 33}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 3, "column": 33}, "end": {"line": 3, "column": 34}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var classes: Dictionary<String, Term>` at 6:5.
string_keyed_generic_dictionary_node := {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 18}, "end": {"line": 6, "column": 42}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 18}, "end": {"line": 6, "column": 28}}, "token": {"kind": "identifier", "text": "Dictionary"}, "children": []},
  {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 6, "column": 28}, "end": {"line": 6, "column": 42}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 28}, "end": {"line": 6, "column": 29}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
    {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 6, "column": 29}, "end": {"line": 6, "column": 41}}, "children": [
      {"type": "GenericArgumentSyntax", "range": {"start": {"line": 6, "column": 29}, "end": {"line": 6, "column": 36}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 29}, "end": {"line": 6, "column": 35}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 29}, "end": {"line": 6, "column": 35}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 35}, "end": {"line": 6, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "GenericArgumentSyntax", "range": {"start": {"line": 6, "column": 37}, "end": {"line": 6, "column": 41}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 6, "column": 37}, "end": {"line": 6, "column": 41}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 37}, "end": {"line": 6, "column": 41}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 6, "column": 41}, "end": {"line": 6, "column": 42}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
  ]},
]}

# Parser output for `let lookup = [String: Term]()` at 9:5.
string_keyed_dictionary_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 34}}, "children": [
  {"type": "DictionaryExprSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 32}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 18}, "end": {"line": 9, "column": 19}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
    {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 9, "column": 19}, "end": {"line": 9, "column": 31}}, "children": [
      {"type": "DictionaryElementSyntax", "range": {"start": {"line": 9, "column": 19}, "end": {"line": 9, "column": 31}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 19}, "end": {"line": 9, "column": 25}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 19}, "end": {"line": 9, "column": 25}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 25}, "end": {"line": 9, "column": 26}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 31}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 27}, "end": {"line": 9, "column": 31}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 31}, "end": {"line": 9, "column": 32}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 32}, "end": {"line": 9, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 9, "column": 33}, "end": {"line": 9, "column": 33}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 33}, "end": {"line": 9, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 9, "column": 34}, "end": {"line": 9, "column": 34}}, "children": []},
]}

# Parser output for `final class TermRegistry {}` at 12:1.
registry_class_node := {"type": "ClassDeclSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 28}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 6}}, "children": [
    {"type": "DeclModifierSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 6}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 1}, "end": {"line": 12, "column": 6}}, "token": {"kind": "keyword", "text": "final"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 7}, "end": {"line": 12, "column": 12}}, "token": {"kind": "keyword", "text": "class"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 25}}, "token": {"kind": "identifier", "text": "TermRegistry"}, "children": []},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 28}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 26}, "end": {"line": 12, "column": 27}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 12, "column": 27}, "end": {"line": 12, "column": 27}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 27}, "end": {"line": 12, "column": 28}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

# Parser output for `var counts: [Fauna.Habitat: Int]` at 15:5.
type_keyed_dictionary_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 15, "column": 17}, "end": {"line": 15, "column": 37}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 17}, "end": {"line": 15, "column": 18}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "MemberTypeSyntax", "range": {"start": {"line": 15, "column": 18}, "end": {"line": 15, "column": 31}}, "children": [
    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 18}, "end": {"line": 15, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 18}, "end": {"line": 15, "column": 23}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 23}, "end": {"line": 15, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 24}, "end": {"line": 15, "column": 31}}, "token": {"kind": "identifier", "text": "Habitat"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 31}, "end": {"line": 15, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 15, "column": 33}, "end": {"line": 15, "column": 36}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 33}, "end": {"line": 15, "column": 36}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 15, "column": 36}, "end": {"line": 15, "column": 37}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var habitats: Set<Fauna.Habitat>` at 18:5.
typed_set_node := {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 37}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 22}}, "token": {"kind": "identifier", "text": "Set"}, "children": []},
  {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 18, "column": 22}, "end": {"line": 18, "column": 37}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 22}, "end": {"line": 18, "column": 23}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
    {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 36}}, "children": [
      {"type": "GenericArgumentSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 36}}, "children": [
        {"type": "MemberTypeSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 36}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 28}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 28}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 29}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 36}}, "token": {"kind": "identifier", "text": "Habitat"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 37}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
  ]},
]}

# Parser output for `struct Fauna: Ontology {}` at 21:1.
ontology_struct_node := {"type": "StructDeclSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 26}}, "children": [
  {"type": "AttributeListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "DeclModifierListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 1}, "end": {"line": 21, "column": 7}}, "token": {"kind": "keyword", "text": "struct"}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 8}, "end": {"line": 21, "column": 13}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
  {"type": "InheritanceClauseSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 14}}, "token": {"kind": "colon", "text": ":"}, "children": []},
    {"type": "InheritedTypeListSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 23}}, "children": [
      {"type": "InheritedTypeSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 23}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 23}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 23}}, "token": {"kind": "identifier", "text": "Ontology"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "MemberBlockSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 26}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 25}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "MemberBlockItemListSyntax", "range": {"start": {"line": 21, "column": 25}, "end": {"line": 21, "column": 25}}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 25}, "end": {"line": 21, "column": 26}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
]}

test_denies_generic_dictionary_initializer if {
  result := decision with input as generic_dictionary_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 30
  result.deny[0].column == 17
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_dictionary_init_member if {
  result := decision with input as dictionary_init_member_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 33
  result.deny[0].column == 17
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_key_dictionary_type if {
  result := decision with input as qualified_key_dictionary_type_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 36
  result.deny[0].column == 16
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_generic_dictionary if {
  result := decision with input as qualified_generic_dictionary_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 39
  result.deny[0].column == 16
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_key_dictionary_initializer if {
  result := decision with input as qualified_key_dictionary_initializer_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 42
  result.deny[0].column == 17
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_type_keyed_dictionary_initializer if {
  result := decision with input as type_keyed_dictionary_initializer_node

  count(result.deny) == 0
}

test_allows_string_index_key if {
  result := decision with input as string_index_key_node

  count(result.deny) == 0
}

test_allows_generic_set_initializer if {
  result := decision with input as generic_set_initializer_node

  count(result.deny) == 0
}

# Parser output for `var terms = Dictionary<IRI, Term>()` at 30:5.
generic_dictionary_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 40}}, "children": [
  {"type": "GenericSpecializationExprSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 38}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 27}}, "token": {"kind": "identifier", "text": "Dictionary"}, "children": []},
    ]},
    {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 30, "column": 27}, "end": {"line": 30, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 27}, "end": {"line": 30, "column": 28}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
      {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 37}}, "children": [
        {"type": "GenericArgumentSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 32}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 28}, "end": {"line": 30, "column": 31}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 31}, "end": {"line": 30, "column": 32}}, "token": {"kind": "comma", "text": ","}, "children": []},
        ]},
        {"type": "GenericArgumentSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 37}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 33}, "end": {"line": 30, "column": 37}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 37}, "end": {"line": 30, "column": 38}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 38}, "end": {"line": 30, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 39}, "end": {"line": 30, "column": 39}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 39}, "end": {"line": 30, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 40}, "end": {"line": 30, "column": 40}}, "children": []},
]}

# Parser output for `var terms = [IRI: Term].init()` at 33:5.
dictionary_init_member_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 17}, "end": {"line": 33, "column": 35}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 33, "column": 17}, "end": {"line": 33, "column": 33}}, "children": [
    {"type": "DictionaryExprSyntax", "range": {"start": {"line": 33, "column": 17}, "end": {"line": 33, "column": 28}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 17}, "end": {"line": 33, "column": 18}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
      {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 27}}, "children": [
        {"type": "DictionaryElementSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 27}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 18}, "end": {"line": 33, "column": 21}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 21}, "end": {"line": 33, "column": 22}}, "token": {"kind": "colon", "text": ":"}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 23}, "end": {"line": 33, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 23}, "end": {"line": 33, "column": 27}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 27}, "end": {"line": 33, "column": 28}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 28}, "end": {"line": 33, "column": 29}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 29}, "end": {"line": 33, "column": 33}}, "token": {"kind": "keyword", "text": "init"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 33}, "end": {"line": 33, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 34}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 35}}, "children": []},
]}

# Parser output for `var terms: [Swift.String: Term] = [:]` at 36:5.
qualified_key_dictionary_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 36}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 17}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "MemberTypeSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 29}}, "children": [
    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 22}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 22}}, "token": {"kind": "identifier", "text": "Swift"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 22}, "end": {"line": 36, "column": 23}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 23}, "end": {"line": 36, "column": 29}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 29}, "end": {"line": 36, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 36, "column": 31}, "end": {"line": 36, "column": 35}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 31}, "end": {"line": 36, "column": 35}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 35}, "end": {"line": 36, "column": 36}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var terms: Swift.Dictionary<IRIKit.IRI, Term> = [:]` at 39:5.
qualified_generic_dictionary_node := {"type": "MemberTypeSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 50}}, "children": [
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 21}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 16}, "end": {"line": 39, "column": 21}}, "token": {"kind": "identifier", "text": "Swift"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 21}, "end": {"line": 39, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 22}, "end": {"line": 39, "column": 32}}, "token": {"kind": "identifier", "text": "Dictionary"}, "children": []},
  {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 39, "column": 32}, "end": {"line": 39, "column": 50}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 32}, "end": {"line": 39, "column": 33}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
    {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 49}}, "children": [
      {"type": "GenericArgumentSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 44}}, "children": [
        {"type": "MemberTypeSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 43}}, "children": [
          {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 39}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 33}, "end": {"line": 39, "column": 39}}, "token": {"kind": "identifier", "text": "IRIKit"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 39}, "end": {"line": 39, "column": 40}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 40}, "end": {"line": 39, "column": 43}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 43}, "end": {"line": 39, "column": 44}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "GenericArgumentSyntax", "range": {"start": {"line": 39, "column": 45}, "end": {"line": 39, "column": 49}}, "children": [
        {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 39, "column": 45}, "end": {"line": 39, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 45}, "end": {"line": 39, "column": 49}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 39, "column": 49}, "end": {"line": 39, "column": 50}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
  ]},
]}

# Parser output for `var terms = [Swift.String: Term]()` at 42:5.
qualified_key_dictionary_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 39}}, "children": [
  {"type": "DictionaryExprSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 37}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 18}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
    {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 36}}, "children": [
      {"type": "DictionaryElementSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 36}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 30}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 23}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 18}, "end": {"line": 42, "column": 23}}, "token": {"kind": "identifier", "text": "Swift"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 30}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 30}, "end": {"line": 42, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 32}, "end": {"line": 42, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 32}, "end": {"line": 42, "column": 36}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 37}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 38}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 38}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 39}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 39}, "end": {"line": 42, "column": 39}}, "children": []},
]}

# Parser output for `var counts = [Fauna.Habitat: Int]()` at 45:5.
type_keyed_dictionary_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 45, "column": 18}, "end": {"line": 45, "column": 40}}, "children": [
  {"type": "DictionaryExprSyntax", "range": {"start": {"line": 45, "column": 18}, "end": {"line": 45, "column": 38}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 18}, "end": {"line": 45, "column": 19}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
    {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 37}}, "children": [
      {"type": "DictionaryElementSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 37}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 32}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 19}, "end": {"line": 45, "column": 24}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 24}, "end": {"line": 45, "column": 25}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 25}, "end": {"line": 45, "column": 32}}, "token": {"kind": "identifier", "text": "Habitat"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 32}, "end": {"line": 45, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 45, "column": 34}, "end": {"line": 45, "column": 37}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 34}, "end": {"line": 45, "column": 37}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 37}, "end": {"line": 45, "column": 38}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 38}, "end": {"line": 45, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 45, "column": 39}, "end": {"line": 45, "column": 39}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 45, "column": 39}, "end": {"line": 45, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 45, "column": 40}, "end": {"line": 45, "column": 40}}, "children": []},
]}

# Parser output for `var marks: [String.Index: Int]` at 48:5.
string_index_key_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 35}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 16}, "end": {"line": 48, "column": 17}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "MemberTypeSyntax", "range": {"start": {"line": 48, "column": 17}, "end": {"line": 48, "column": 29}}, "children": [
    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 48, "column": 17}, "end": {"line": 48, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 17}, "end": {"line": 48, "column": 23}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 23}, "end": {"line": 48, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 24}, "end": {"line": 48, "column": 29}}, "token": {"kind": "identifier", "text": "Index"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 29}, "end": {"line": 48, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 48, "column": 31}, "end": {"line": 48, "column": 34}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 31}, "end": {"line": 48, "column": 34}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 48, "column": 34}, "end": {"line": 48, "column": 35}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var habitats = Set<Fauna.Habitat>()` at 51:5.
generic_set_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 40}}, "children": [
  {"type": "GenericSpecializationExprSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 38}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 20}, "end": {"line": 51, "column": 23}}, "token": {"kind": "identifier", "text": "Set"}, "children": []},
    ]},
    {"type": "GenericArgumentClauseSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 24}}, "token": {"kind": "leftAngle", "text": "<"}, "children": []},
      {"type": "GenericArgumentListSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 37}}, "children": [
        {"type": "GenericArgumentSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 37}}, "children": [
          {"type": "MemberTypeSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 37}}, "children": [
            {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 29}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 29}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 29}, "end": {"line": 51, "column": 30}}, "token": {"kind": "period", "text": "."}, "children": []},
            {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 30}, "end": {"line": 51, "column": 37}}, "token": {"kind": "identifier", "text": "Habitat"}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 37}, "end": {"line": 51, "column": 38}}, "token": {"kind": "rightAngle", "text": ">"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 38}, "end": {"line": 51, "column": 39}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 51, "column": 39}, "end": {"line": 51, "column": 39}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 39}, "end": {"line": 51, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 51, "column": 40}, "end": {"line": 51, "column": 40}}, "children": []},
]}

test_denies_literal_named_registry if {
  result := decision with input as literal_named_registry_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 54
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_literal_term_kind_registry if {
  result := decision with input as literal_term_kind_registry_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 57
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_literal_iri_call_key if {
  result := decision with input as literal_iri_call_key_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 60
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_literal_iri_projection_key if {
  result := decision with input as literal_iri_projection_key_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 63
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_literal_iri_string_key if {
  result := decision with input as literal_iri_string_key_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 66
  result.deny[0].column == 25
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_url_keyed_dictionary_type if {
  result := decision with input as url_keyed_dictionary_type_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 69
  result.deny[0].column == 23
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_qualified_url_keyed_dictionary_type if {
  result := decision with input as qualified_url_keyed_dictionary_type_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 72
  result.deny[0].column == 23
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_string_keyed_metatype_dictionary if {
  result := decision with input as string_keyed_metatype_dictionary_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_term_registry"
  result.deny[0].line == 75
  result.deny[0].column == 23
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_string_keyed_headers_type if {
  result := decision with input as string_keyed_headers_type_node

  count(result.deny) == 0
}

test_allows_string_keyed_counts_type if {
  result := decision with input as string_keyed_counts_type_node

  count(result.deny) == 0
}

test_allows_headers_literal if {
  result := decision with input as headers_literal_node

  count(result.deny) == 0
}

test_allows_string_keyed_counts_initializer if {
  result := decision with input as string_keyed_counts_initializer_node

  count(result.deny) == 0
}

# Parser output for `let terms = ["knows": Knows(), "name": Name()]` at 54:13.
literal_named_registry_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 54, "column": 25}, "end": {"line": 54, "column": 59}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 25}, "end": {"line": 54, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 54, "column": 26}, "end": {"line": 54, "column": 58}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 54, "column": 26}, "end": {"line": 54, "column": 43}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 54, "column": 26}, "end": {"line": 54, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 26}, "end": {"line": 54, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 54, "column": 27}, "end": {"line": 54, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 54, "column": 27}, "end": {"line": 54, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 27}, "end": {"line": 54, "column": 32}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 32}, "end": {"line": 54, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 33}, "end": {"line": 54, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 54, "column": 35}, "end": {"line": 54, "column": 42}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 54, "column": 35}, "end": {"line": 54, "column": 40}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 35}, "end": {"line": 54, "column": 40}}, "token": {"kind": "identifier", "text": "Knows"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 40}, "end": {"line": 54, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 54, "column": 41}, "end": {"line": 54, "column": 41}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 41}, "end": {"line": 54, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 54, "column": 42}, "end": {"line": 54, "column": 42}}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 42}, "end": {"line": 54, "column": 43}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 54, "column": 44}, "end": {"line": 54, "column": 58}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 54, "column": 44}, "end": {"line": 54, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 44}, "end": {"line": 54, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 54, "column": 45}, "end": {"line": 54, "column": 49}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 54, "column": 45}, "end": {"line": 54, "column": 49}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 45}, "end": {"line": 54, "column": 49}}, "token": {"kind": "stringSegment", "text": "name"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 49}, "end": {"line": 54, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 50}, "end": {"line": 54, "column": 51}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 54, "column": 52}, "end": {"line": 54, "column": 58}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 54, "column": 52}, "end": {"line": 54, "column": 56}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 52}, "end": {"line": 54, "column": 56}}, "token": {"kind": "identifier", "text": "Name"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 56}, "end": {"line": 54, "column": 57}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 54, "column": 57}, "end": {"line": 54, "column": 57}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 57}, "end": {"line": 54, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 54, "column": 58}, "end": {"line": 54, "column": 58}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 54, "column": 58}, "end": {"line": 54, "column": 59}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `let terms = ["knows": Property("knows")]` at 57:13.
literal_term_kind_registry_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 57, "column": 25}, "end": {"line": 57, "column": 53}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 25}, "end": {"line": 57, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 57, "column": 26}, "end": {"line": 57, "column": 52}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 57, "column": 26}, "end": {"line": 57, "column": 52}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 57, "column": 26}, "end": {"line": 57, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 26}, "end": {"line": 57, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 57, "column": 27}, "end": {"line": 57, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 57, "column": 27}, "end": {"line": 57, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 27}, "end": {"line": 57, "column": 32}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 32}, "end": {"line": 57, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 33}, "end": {"line": 57, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 57, "column": 35}, "end": {"line": 57, "column": 52}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 57, "column": 35}, "end": {"line": 57, "column": 43}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 35}, "end": {"line": 57, "column": 43}}, "token": {"kind": "identifier", "text": "Property"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 43}, "end": {"line": 57, "column": 44}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 57, "column": 44}, "end": {"line": 57, "column": 51}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 57, "column": 44}, "end": {"line": 57, "column": 51}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 57, "column": 44}, "end": {"line": 57, "column": 51}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 44}, "end": {"line": 57, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 57, "column": 45}, "end": {"line": 57, "column": 50}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 57, "column": 45}, "end": {"line": 57, "column": 50}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 45}, "end": {"line": 57, "column": 50}}, "token": {"kind": "stringSegment", "text": "knows"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 50}, "end": {"line": 57, "column": 51}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 51}, "end": {"line": 57, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 57, "column": 52}, "end": {"line": 57, "column": 52}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 57, "column": 52}, "end": {"line": 57, "column": 53}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `let terms = [IRI("http://xmlns.com/foaf/0.1/knows"): Knows()]` at 60:13.
literal_iri_call_key_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 74}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 25}, "end": {"line": 60, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 60, "column": 26}, "end": {"line": 60, "column": 73}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 60, "column": 26}, "end": {"line": 60, "column": 73}}, "children": [
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 60, "column": 26}, "end": {"line": 60, "column": 64}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 60, "column": 26}, "end": {"line": 60, "column": 29}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 26}, "end": {"line": 60, "column": 29}}, "token": {"kind": "identifier", "text": "IRI"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 29}, "end": {"line": 60, "column": 30}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 63}}, "children": [
          {"type": "LabeledExprSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 63}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 63}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 30}, "end": {"line": 60, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 60, "column": 31}, "end": {"line": 60, "column": 62}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 60, "column": 31}, "end": {"line": 60, "column": 62}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 31}, "end": {"line": 60, "column": 62}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 62}, "end": {"line": 60, "column": 63}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 63}, "end": {"line": 60, "column": 64}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 60, "column": 64}, "end": {"line": 60, "column": 64}}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 64}, "end": {"line": 60, "column": 65}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 60, "column": 66}, "end": {"line": 60, "column": 73}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 60, "column": 66}, "end": {"line": 60, "column": 71}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 66}, "end": {"line": 60, "column": 71}}, "token": {"kind": "identifier", "text": "Knows"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 71}, "end": {"line": 60, "column": 72}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 60, "column": 72}, "end": {"line": 60, "column": 72}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 72}, "end": {"line": 60, "column": 73}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 60, "column": 73}, "end": {"line": 60, "column": 73}}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 60, "column": 73}, "end": {"line": 60, "column": 74}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `let terms = [Foaf.knows.iri: 1]` at 63:13.
literal_iri_projection_key_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 63, "column": 25}, "end": {"line": 63, "column": 44}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 25}, "end": {"line": 63, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 43}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 43}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 40}}, "children": [
        {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 36}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 26}, "end": {"line": 63, "column": 30}}, "token": {"kind": "identifier", "text": "Foaf"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 30}, "end": {"line": 63, "column": 31}}, "token": {"kind": "period", "text": "."}, "children": []},
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 63, "column": 31}, "end": {"line": 63, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 31}, "end": {"line": 63, "column": 36}}, "token": {"kind": "identifier", "text": "knows"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 36}, "end": {"line": 63, "column": 37}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 63, "column": 37}, "end": {"line": 63, "column": 40}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 37}, "end": {"line": 63, "column": 40}}, "token": {"kind": "identifier", "text": "iri"}, "children": []},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 40}, "end": {"line": 63, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 63, "column": 42}, "end": {"line": 63, "column": 43}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 42}, "end": {"line": 63, "column": 43}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 63, "column": 43}, "end": {"line": 63, "column": 44}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `let terms = ["http://xmlns.com/foaf/0.1/knows": 1]` at 66:13.
literal_iri_string_key_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 66, "column": 25}, "end": {"line": 66, "column": 63}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 25}, "end": {"line": 66, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 62}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 62}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 59}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 26}, "end": {"line": 66, "column": 27}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 66, "column": 27}, "end": {"line": 66, "column": 58}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 66, "column": 27}, "end": {"line": 66, "column": 58}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 27}, "end": {"line": 66, "column": 58}}, "token": {"kind": "stringSegment", "text": "http:\/\/xmlns.com\/foaf\/0.1\/knows"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 58}, "end": {"line": 66, "column": 59}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 59}, "end": {"line": 66, "column": 60}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 66, "column": 61}, "end": {"line": 66, "column": 62}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 61}, "end": {"line": 66, "column": 62}}, "token": {"kind": "integerLiteral", "text": "1"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 62}, "end": {"line": 66, "column": 63}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var terms: [URL: Term]` at 69:12.
url_keyed_dictionary_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 69, "column": 23}, "end": {"line": 69, "column": 34}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 23}, "end": {"line": 69, "column": 24}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 69, "column": 24}, "end": {"line": 69, "column": 27}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 24}, "end": {"line": 69, "column": 27}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 27}, "end": {"line": 69, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 69, "column": 29}, "end": {"line": 69, "column": 33}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 29}, "end": {"line": 69, "column": 33}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 69, "column": 33}, "end": {"line": 69, "column": 34}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var terms: [Foundation.URL: Int]` at 72:12.
qualified_url_keyed_dictionary_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 72, "column": 23}, "end": {"line": 72, "column": 44}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 23}, "end": {"line": 72, "column": 24}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "MemberTypeSyntax", "range": {"start": {"line": 72, "column": 24}, "end": {"line": 72, "column": 38}}, "children": [
    {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 72, "column": 24}, "end": {"line": 72, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 24}, "end": {"line": 72, "column": 34}}, "token": {"kind": "identifier", "text": "Foundation"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 34}, "end": {"line": 72, "column": 35}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 35}, "end": {"line": 72, "column": 38}}, "token": {"kind": "identifier", "text": "URL"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 38}, "end": {"line": 72, "column": 39}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 72, "column": 40}, "end": {"line": 72, "column": 43}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 40}, "end": {"line": 72, "column": 43}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 72, "column": 43}, "end": {"line": 72, "column": 44}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var types: [String: any Term.Type]` at 75:12.
string_keyed_metatype_dictionary_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 75, "column": 23}, "end": {"line": 75, "column": 46}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 23}, "end": {"line": 75, "column": 24}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 75, "column": 24}, "end": {"line": 75, "column": 30}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 24}, "end": {"line": 75, "column": 30}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 30}, "end": {"line": 75, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "SomeOrAnyTypeSyntax", "range": {"start": {"line": 75, "column": 32}, "end": {"line": 75, "column": 45}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 32}, "end": {"line": 75, "column": 35}}, "token": {"kind": "keyword", "text": "any"}, "children": []},
    {"type": "MetatypeTypeSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 45}}, "children": [
      {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 36}, "end": {"line": 75, "column": 40}}, "token": {"kind": "identifier", "text": "Term"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 40}, "end": {"line": 75, "column": 41}}, "token": {"kind": "period", "text": "."}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 41}, "end": {"line": 75, "column": 45}}, "token": {"kind": "keyword", "text": "Type"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 75, "column": 45}, "end": {"line": 75, "column": 46}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var headers: [String: String]` at 78:14.
string_keyed_headers_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 78, "column": 27}, "end": {"line": 78, "column": 43}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 27}, "end": {"line": 78, "column": 28}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 34}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 28}, "end": {"line": 78, "column": 34}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 34}, "end": {"line": 78, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 78, "column": 36}, "end": {"line": 78, "column": 42}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 36}, "end": {"line": 78, "column": 42}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 78, "column": 42}, "end": {"line": 78, "column": 43}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var counts: [String: Int]` at 81:13.
string_keyed_counts_type_node := {"type": "DictionaryTypeSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 38}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 25}, "end": {"line": 81, "column": 26}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 81, "column": 26}, "end": {"line": 81, "column": 32}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 26}, "end": {"line": 81, "column": 32}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 32}, "end": {"line": 81, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
  {"type": "IdentifierTypeSyntax", "range": {"start": {"line": 81, "column": 34}, "end": {"line": 81, "column": 37}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 34}, "end": {"line": 81, "column": 37}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 81, "column": 37}, "end": {"line": 81, "column": 38}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `let headers = ["Accept": "text/turtle"]` at 84:15.
headers_literal_node := {"type": "DictionaryExprSyntax", "range": {"start": {"line": 84, "column": 29}, "end": {"line": 84, "column": 54}}, "children": [
  {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 29}, "end": {"line": 84, "column": 30}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
  {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 84, "column": 30}, "end": {"line": 84, "column": 53}}, "children": [
    {"type": "DictionaryElementSyntax", "range": {"start": {"line": 84, "column": 30}, "end": {"line": 84, "column": 53}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 84, "column": 30}, "end": {"line": 84, "column": 38}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 30}, "end": {"line": 84, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 84, "column": 31}, "end": {"line": 84, "column": 37}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 84, "column": 31}, "end": {"line": 84, "column": 37}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 31}, "end": {"line": 84, "column": 37}}, "token": {"kind": "stringSegment", "text": "Accept"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 37}, "end": {"line": 84, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 38}, "end": {"line": 84, "column": 39}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 84, "column": 40}, "end": {"line": 84, "column": 53}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 40}, "end": {"line": 84, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 84, "column": 41}, "end": {"line": 84, "column": 52}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 84, "column": 41}, "end": {"line": 84, "column": 52}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 41}, "end": {"line": 84, "column": 52}}, "token": {"kind": "stringSegment", "text": "text\/turtle"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 52}, "end": {"line": 84, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 84, "column": 53}, "end": {"line": 84, "column": 54}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
]}

# Parser output for `var counts = [String: Int]()` at 87:14.
string_keyed_counts_initializer_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 87, "column": 27}, "end": {"line": 87, "column": 42}}, "children": [
  {"type": "DictionaryExprSyntax", "range": {"start": {"line": 87, "column": 27}, "end": {"line": 87, "column": 40}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 27}, "end": {"line": 87, "column": 28}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
    {"type": "DictionaryElementListSyntax", "range": {"start": {"line": 87, "column": 28}, "end": {"line": 87, "column": 39}}, "children": [
      {"type": "DictionaryElementSyntax", "range": {"start": {"line": 87, "column": 28}, "end": {"line": 87, "column": 39}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 87, "column": 28}, "end": {"line": 87, "column": 34}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 28}, "end": {"line": 87, "column": 34}}, "token": {"kind": "identifier", "text": "String"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 34}, "end": {"line": 87, "column": 35}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 87, "column": 36}, "end": {"line": 87, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 36}, "end": {"line": 87, "column": 39}}, "token": {"kind": "identifier", "text": "Int"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 39}, "end": {"line": 87, "column": 40}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 40}, "end": {"line": 87, "column": 41}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 87, "column": 41}, "end": {"line": 87, "column": 41}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 87, "column": 41}, "end": {"line": 87, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 87, "column": 42}, "end": {"line": 87, "column": 42}}, "children": []},
]}
