package apple.hig.components.context_menu_availability

test_reviews_context_menu_base_name_swift_syntax if {
  result := decision with input as reviews_context_menu_base_name_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].message == "Review context-menu usage and confirm commands are also available from the main interface or menu bar."
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_reviews_context_menu_member_name_swift_syntax if {
  result := decision with input as reviews_context_menu_member_name_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_review_non_context_menu_swift_syntax if {
  result := decision with input as does_not_review_non_context_menu_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_review_context_menu_when_not_a_swift_syntax if {
  result := decision with input as does_not_review_context_menu_when_not_a_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `contextMenu { Button("Copy", action: copy) }` at 18:7.
reviews_context_menu_base_name_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 51}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "token": {"kind": "identifier", "text": "contextMenu"}, "children": []},
  ]},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 19}}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 51}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 20}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 49}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 49}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 49}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 27}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 48}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 35}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 34}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 28}, "end": {"line": 18, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 33}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 33}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringSegment", "text": "Copy"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 48}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 36}, "end": {"line": 18, "column": 42}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 42}, "end": {"line": 18, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 48}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 48}}, "token": {"kind": "identifier", "text": "copy"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 50}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 51}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 51}}, "children": []},
]}

# Parser output for `row.contextMenu { Button("Copy", action: copy) }` at 42:11.
reviews_context_menu_member_name_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 59}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 26}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 11}, "end": {"line": 42, "column": 14}}, "token": {"kind": "identifier", "text": "row"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 14}, "end": {"line": 42, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 26}}, "token": {"kind": "identifier", "text": "contextMenu"}, "children": []},
    ]},
  ]},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 27}}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 59}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 28}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 57}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 57}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 57}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 29}, "end": {"line": 42, "column": 35}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 35}, "end": {"line": 42, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 56}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 43}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 42}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 41}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 41}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 41}}, "token": {"kind": "stringSegment", "text": "Copy"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 41}, "end": {"line": 42, "column": 42}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 43}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 56}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 44}, "end": {"line": 42, "column": 50}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 51}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 52}, "end": {"line": 42, "column": 56}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 52}, "end": {"line": 42, "column": 56}}, "token": {"kind": "identifier", "text": "copy"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 58}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 58}, "end": {"line": 42, "column": 59}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 59}}, "children": []},
]}

# Parser output for `Menu("Actions") { Button("Copy", action: copy) }` at 18:7.
does_not_review_non_context_menu_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 55}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 11}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 11}}, "token": {"kind": "identifier", "text": "Menu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 12}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 21}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 21}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 21}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 13}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 20}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 20}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 20}}, "token": {"kind": "stringSegment", "text": "Actions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 21}, "end": {"line": 18, "column": 22}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 55}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 24}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 53}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 53}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 53}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 31}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 32}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 52}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 39}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 37}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 37}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 37}}, "token": {"kind": "stringSegment", "text": "Copy"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 38}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 52}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 46}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 47}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 52}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 48}, "end": {"line": 18, "column": 52}}, "token": {"kind": "identifier", "text": "copy"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 52}, "end": {"line": 18, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 54}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 55}, "end": {"line": 18, "column": 55}}, "children": []},
]}

# Parser output for `(an empty file)`
does_not_review_context_menu_when_not_a_swift_syntax_node := {"type": "SourceFileSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": [
  {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 1, "column": 1}, "end": {"line": 1, "column": 1}}, "token": {"kind": "endOfFile", "text": ""}, "children": []},
]}
