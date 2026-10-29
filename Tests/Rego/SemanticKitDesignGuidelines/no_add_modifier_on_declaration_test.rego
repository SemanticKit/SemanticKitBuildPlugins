package semantickit.design_guidelines.no_add_modifier_on_declaration

test_denies_add_label_comment_chain if {
  result := decision with input as add_label_comment_chain_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_add_modifier_on_declaration"
  result.deny[0].line == 5
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_is_declared_by_modifier if {
  result := decision with input as is_declared_by_modifier_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_add_modifier_on_declaration"
  result.deny[0].line == 9
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_denies_add_domain_modifier if {
  result := decision with input as add_domain_modifier_node

  count(result.deny) == 1
  result.deny[0].rule_id == "semantickit.design_guidelines.no_add_modifier_on_declaration"
  result.deny[0].line == 13
  result.deny[0].column == 9
  result.deny[0].severity == "error"
  count(result.warn) == 0
}

test_allows_deprecated_modifier if {
  result := decision with input as deprecated_modifier_node

  count(result.deny) == 0
}

test_allows_declaration_content if {
  result := decision with input as declaration_content_node

  count(result.deny) == 0
}

test_allows_add_on_instance if {
  result := decision with input as add_on_instance_node

  count(result.deny) == 0
}

# Parser output for `Class("Foo").addLabel("Foo").addComment("A foo.")` at 5:9.
add_label_comment_chain_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 58}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 48}}, "children": [
    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 37}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 30}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 21}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 14}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 9}, "end": {"line": 5, "column": 14}}, "token": {"kind": "identifier", "text": "Class"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 14}, "end": {"line": 5, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 5, "column": 15}, "end": {"line": 5, "column": 20}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 5, "column": 15}, "end": {"line": 5, "column": 20}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 5, "column": 15}, "end": {"line": 5, "column": 20}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 15}, "end": {"line": 5, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 19}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 19}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 16}, "end": {"line": 5, "column": 19}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 19}, "end": {"line": 5, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 20}, "end": {"line": 5, "column": 21}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 5, "column": 21}, "end": {"line": 5, "column": 21}}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 21}, "end": {"line": 5, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 5, "column": 22}, "end": {"line": 5, "column": 30}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 22}, "end": {"line": 5, "column": 30}}, "token": {"kind": "identifier", "text": "addLabel"}, "children": []},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 30}, "end": {"line": 5, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 5, "column": 31}, "end": {"line": 5, "column": 36}}, "children": [
        {"type": "LabeledExprSyntax", "range": {"start": {"line": 5, "column": 31}, "end": {"line": 5, "column": 36}}, "children": [
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 5, "column": 31}, "end": {"line": 5, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 31}, "end": {"line": 5, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 5, "column": 32}, "end": {"line": 5, "column": 35}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 5, "column": 32}, "end": {"line": 5, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 32}, "end": {"line": 5, "column": 35}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 35}, "end": {"line": 5, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 36}, "end": {"line": 5, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 5, "column": 37}, "end": {"line": 5, "column": 37}}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 37}, "end": {"line": 5, "column": 38}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 5, "column": 38}, "end": {"line": 5, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 38}, "end": {"line": 5, "column": 48}}, "token": {"kind": "identifier", "text": "addComment"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 48}, "end": {"line": 5, "column": 49}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 5, "column": 49}, "end": {"line": 5, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 5, "column": 49}, "end": {"line": 5, "column": 57}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 5, "column": 49}, "end": {"line": 5, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 49}, "end": {"line": 5, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 5, "column": 50}, "end": {"line": 5, "column": 56}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 5, "column": 50}, "end": {"line": 5, "column": 56}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 50}, "end": {"line": 5, "column": 56}}, "token": {"kind": "stringSegment", "text": "A foo."}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 56}, "end": {"line": 5, "column": 57}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 5, "column": 57}, "end": {"line": 5, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 5, "column": 58}, "end": {"line": 5, "column": 58}}, "children": []},
]}

# Parser output for `Class("Foo").isDeclaredBy(namespace: fauna)` at 9:9.
is_declared_by_modifier_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 52}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 34}}, "children": [
    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 21}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 14}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 9}, "end": {"line": 9, "column": 14}}, "token": {"kind": "identifier", "text": "Class"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 14}, "end": {"line": 9, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 20}}, "children": [
        {"type": "LabeledExprSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 20}}, "children": [
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 20}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 15}, "end": {"line": 9, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 9, "column": 16}, "end": {"line": 9, "column": 19}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 9, "column": 16}, "end": {"line": 9, "column": 19}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 16}, "end": {"line": 9, "column": 19}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 19}, "end": {"line": 9, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 20}, "end": {"line": 9, "column": 21}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 9, "column": 21}, "end": {"line": 9, "column": 21}}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 21}, "end": {"line": 9, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 22}, "end": {"line": 9, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 22}, "end": {"line": 9, "column": 34}}, "token": {"kind": "identifier", "text": "isDeclaredBy"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 34}, "end": {"line": 9, "column": 35}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 9, "column": 35}, "end": {"line": 9, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 9, "column": 35}, "end": {"line": 9, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 35}, "end": {"line": 9, "column": 44}}, "token": {"kind": "identifier", "text": "namespace"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 44}, "end": {"line": 9, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 9, "column": 46}, "end": {"line": 9, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 46}, "end": {"line": 9, "column": 51}}, "token": {"kind": "identifier", "text": "fauna"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 9, "column": 51}, "end": {"line": 9, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 9, "column": 52}, "end": {"line": 9, "column": 52}}, "children": []},
]}

# Parser output for `ObjectProperty("hasHabitat").addDomain(Fauna.Animal)` at 13:9.
add_domain_modifier_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 61}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 47}}, "children": [
    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 37}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 23}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 9}, "end": {"line": 13, "column": 23}}, "token": {"kind": "identifier", "text": "ObjectProperty"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 23}, "end": {"line": 13, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 13, "column": 24}, "end": {"line": 13, "column": 36}}, "children": [
        {"type": "LabeledExprSyntax", "range": {"start": {"line": 13, "column": 24}, "end": {"line": 13, "column": 36}}, "children": [
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 13, "column": 24}, "end": {"line": 13, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 24}, "end": {"line": 13, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 13, "column": 25}, "end": {"line": 13, "column": 35}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 13, "column": 25}, "end": {"line": 13, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 25}, "end": {"line": 13, "column": 35}}, "token": {"kind": "stringSegment", "text": "hasHabitat"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 35}, "end": {"line": 13, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 36}, "end": {"line": 13, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 13, "column": 37}, "end": {"line": 13, "column": 37}}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 37}, "end": {"line": 13, "column": 38}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 38}, "end": {"line": 13, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 38}, "end": {"line": 13, "column": 47}}, "token": {"kind": "identifier", "text": "addDomain"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 47}, "end": {"line": 13, "column": 48}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 13, "column": 48}, "end": {"line": 13, "column": 60}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 13, "column": 48}, "end": {"line": 13, "column": 60}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 13, "column": 48}, "end": {"line": 13, "column": 60}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 48}, "end": {"line": 13, "column": 53}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 48}, "end": {"line": 13, "column": 53}}, "token": {"kind": "identifier", "text": "Fauna"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 53}, "end": {"line": 13, "column": 54}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 13, "column": 54}, "end": {"line": 13, "column": 60}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 54}, "end": {"line": 13, "column": 60}}, "token": {"kind": "identifier", "text": "Animal"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 13, "column": 60}, "end": {"line": 13, "column": 61}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 13, "column": 61}, "end": {"line": 13, "column": 61}}, "children": []},
]}

# Parser output for `Class("Foo").deprecated()` at 17:9.
deprecated_modifier_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 17, "column": 9}, "end": {"line": 17, "column": 34}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 17, "column": 9}, "end": {"line": 17, "column": 32}}, "children": [
    {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 17, "column": 9}, "end": {"line": 17, "column": 21}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 17, "column": 9}, "end": {"line": 17, "column": 14}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 9}, "end": {"line": 17, "column": 14}}, "token": {"kind": "identifier", "text": "Class"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 14}, "end": {"line": 17, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
      {"type": "LabeledExprListSyntax", "range": {"start": {"line": 17, "column": 15}, "end": {"line": 17, "column": 20}}, "children": [
        {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 15}, "end": {"line": 17, "column": 20}}, "children": [
          {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 17, "column": 15}, "end": {"line": 17, "column": 20}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 15}, "end": {"line": 17, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 19}}, "children": [
              {"type": "StringSegmentSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 19}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 16}, "end": {"line": 17, "column": 19}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
              ]},
            ]},
            {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 19}, "end": {"line": 17, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          ]},
        ]},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 20}, "end": {"line": 17, "column": 21}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
      {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 17, "column": 21}, "end": {"line": 17, "column": 21}}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 21}, "end": {"line": 17, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 17, "column": 22}, "end": {"line": 17, "column": 32}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 22}, "end": {"line": 17, "column": 32}}, "token": {"kind": "identifier", "text": "deprecated"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 32}, "end": {"line": 17, "column": 33}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 17, "column": 33}, "end": {"line": 17, "column": 33}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 33}, "end": {"line": 17, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 17, "column": 34}, "end": {"line": 17, "column": 34}}, "children": []},
]}

# Parser output for `Class("Foo") { Label("Foo"); Comment("A foo.") }` at 21:9.
declaration_content_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 57}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 14}}, "token": {"kind": "identifier", "text": "Class"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 20}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 20}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 20}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 16}, "end": {"line": 21, "column": 19}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 16}, "end": {"line": 21, "column": 19}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 16}, "end": {"line": 21, "column": 19}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 19}, "end": {"line": 21, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 21}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 57}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 22}, "end": {"line": 21, "column": 23}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 55}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 37}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 36}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 24}, "end": {"line": 21, "column": 29}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 29}, "end": {"line": 21, "column": 30}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 30}, "end": {"line": 21, "column": 35}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 30}, "end": {"line": 21, "column": 35}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 30}, "end": {"line": 21, "column": 35}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 30}, "end": {"line": 21, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 31}, "end": {"line": 21, "column": 34}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 31}, "end": {"line": 21, "column": 34}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 31}, "end": {"line": 21, "column": 34}}, "token": {"kind": "stringSegment", "text": "Foo"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 34}, "end": {"line": 21, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 35}, "end": {"line": 21, "column": 36}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 36}, "end": {"line": 21, "column": 36}}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 36}, "end": {"line": 21, "column": 37}}, "token": {"kind": "semicolon", "text": ";"}, "children": []},
      ]},
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 21, "column": 38}, "end": {"line": 21, "column": 55}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 38}, "end": {"line": 21, "column": 55}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 38}, "end": {"line": 21, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 38}, "end": {"line": 21, "column": 45}}, "token": {"kind": "identifier", "text": "Comment"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 45}, "end": {"line": 21, "column": 46}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 54}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 54}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 54}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 46}, "end": {"line": 21, "column": 47}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 47}, "end": {"line": 21, "column": 53}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 47}, "end": {"line": 21, "column": 53}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 47}, "end": {"line": 21, "column": 53}}, "token": {"kind": "stringSegment", "text": "A foo."}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 53}, "end": {"line": 21, "column": 54}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 54}, "end": {"line": 21, "column": 55}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 56}, "end": {"line": 21, "column": 56}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 56}, "end": {"line": 21, "column": 57}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 57}, "end": {"line": 21, "column": 57}}, "children": []},
]}

# Parser output for `numbers.addElement(value)` at 25:9.
add_on_instance_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 34}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 27}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 16}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 16}}, "token": {"kind": "identifier", "text": "numbers"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 17}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 17}, "end": {"line": 25, "column": 27}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 17}, "end": {"line": 25, "column": 27}}, "token": {"kind": "identifier", "text": "addElement"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 27}, "end": {"line": 25, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 33}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 28}, "end": {"line": 25, "column": 33}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 33}, "end": {"line": 25, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 25, "column": 34}, "end": {"line": 25, "column": 34}}, "children": []},
]}
