package apple.hig.menus.menu_title_capitalization

test_warns_for_sentence_style_command_menu_title if {
	result := decision with input as warns_for_sentence_style_command_menu_title_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.menus.review_command_menu_title_capitalization"
	result.warn[0].message == "Review CommandMenu title; multiword menu titles should use title-style capitalization."
	result.warn[0].line == 18
	result.warn[0].column == 7
	result.warn[0].severity == "warning"
}

test_warns_for_sentence_style_menu_title if {
	result := decision with input as warns_for_sentence_style_menu_title_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.menus.review_menu_title_capitalization"
	result.warn[0].message == "Review Menu title; multiword menu titles should use title-style capitalization."
	result.warn[0].line == 44
	result.warn[0].column == 11
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_title_style_command_menu_title if {
	result := decision with input as does_not_warn_for_title_style_command_menu_title_node

	count(result.warn) == 0
}

test_does_not_warn_for_title_style_menu_title_with_minor_word if {
	result := decision with input as does_not_warn_for_title_style_menu_title_with_minor_word_node

	count(result.warn) == 0
}

test_does_not_warn_for_one_word_menu_title if {
	result := decision with input as does_not_warn_for_one_word_menu_title_node

	count(result.warn) == 0
}

test_does_not_warn_for_non_menu_visible_string if {
	result := decision with input as does_not_warn_for_non_menu_visible_string_node

	count(result.warn) == 0
}

# Parser output for `CommandMenu("file actions") { Button("Export", action: export) }` at 18:7.
warns_for_sentence_style_command_menu_title_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 71}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "token": {"kind": "identifier", "text": "CommandMenu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "token": {"kind": "stringSegment", "text": "file actions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 71}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 36}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 43}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 44}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 68}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 53}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 52}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "token": {"kind": "stringSegment", "text": "Export"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 52}, "end": {"line": 18, "column": 53}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 68}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 60}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 60}, "end": {"line": 18, "column": 61}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 68}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 68}}, "token": {"kind": "identifier", "text": "export"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 68}, "end": {"line": 18, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 70}, "end": {"line": 18, "column": 70}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 70}, "end": {"line": 18, "column": 71}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 71}, "end": {"line": 18, "column": 71}}, "children": []},
]}

# Parser output for `Menu("recent documents") { Button("Clear", action: clear) }` at 44:11.
warns_for_sentence_style_menu_title_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 70}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "token": {"kind": "identifier", "text": "Menu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 15}, "end": {"line": 44, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 34}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 33}}, "token": {"kind": "stringSegment", "text": "recent documents"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 34}, "end": {"line": 44, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 70}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 37}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 68}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 68}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 68}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 44}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 38}, "end": {"line": 44, "column": 44}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 44}, "end": {"line": 44, "column": 45}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 45}, "end": {"line": 44, "column": 67}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 45}, "end": {"line": 44, "column": 53}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 45}, "end": {"line": 44, "column": 52}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 45}, "end": {"line": 44, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 46}, "end": {"line": 44, "column": 51}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 46}, "end": {"line": 44, "column": 51}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 46}, "end": {"line": 44, "column": 51}}, "token": {"kind": "stringSegment", "text": "Clear"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 51}, "end": {"line": 44, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 52}, "end": {"line": 44, "column": 53}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 54}, "end": {"line": 44, "column": 67}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 54}, "end": {"line": 44, "column": 60}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 60}, "end": {"line": 44, "column": 61}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 62}, "end": {"line": 44, "column": 67}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 62}, "end": {"line": 44, "column": 67}}, "token": {"kind": "identifier", "text": "clear"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 67}, "end": {"line": 44, "column": 68}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 69}, "end": {"line": 44, "column": 69}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 69}, "end": {"line": 44, "column": 70}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 70}, "end": {"line": 44, "column": 70}}, "children": []},
]}

# Parser output for `CommandMenu("File Actions") { Button("Export", action: export) }` at 18:7.
does_not_warn_for_title_style_command_menu_title_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 71}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 7}, "end": {"line": 18, "column": 18}}, "token": {"kind": "identifier", "text": "CommandMenu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 20}, "end": {"line": 18, "column": 32}}, "token": {"kind": "stringSegment", "text": "File Actions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 71}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 36}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 69}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 37}, "end": {"line": 18, "column": 43}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 44}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 68}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 53}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 52}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 45}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 51}}, "token": {"kind": "stringSegment", "text": "Export"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 52}, "end": {"line": 18, "column": 53}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 68}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 54}, "end": {"line": 18, "column": 60}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 60}, "end": {"line": 18, "column": 61}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 68}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 62}, "end": {"line": 18, "column": 68}}, "token": {"kind": "identifier", "text": "export"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 68}, "end": {"line": 18, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 70}, "end": {"line": 18, "column": 70}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 70}, "end": {"line": 18, "column": 71}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 71}, "end": {"line": 18, "column": 71}}, "children": []},
]}

# Parser output for `Menu("Find in Files") { Button("Find", action: find) }` at 44:11.
does_not_warn_for_title_style_menu_title_with_minor_word_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 65}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "token": {"kind": "identifier", "text": "Menu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 15}, "end": {"line": 44, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 31}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 31}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 30}}, "token": {"kind": "stringSegment", "text": "Find in Files"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 30}, "end": {"line": 44, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 31}, "end": {"line": 44, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 65}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 34}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 63}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 63}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 63}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 41}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 41}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 41}, "end": {"line": 44, "column": 42}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 42}, "end": {"line": 44, "column": 62}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 42}, "end": {"line": 44, "column": 49}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 42}, "end": {"line": 44, "column": 48}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 42}, "end": {"line": 44, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 47}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 47}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 47}}, "token": {"kind": "stringSegment", "text": "Find"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 47}, "end": {"line": 44, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 48}, "end": {"line": 44, "column": 49}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 50}, "end": {"line": 44, "column": 62}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 50}, "end": {"line": 44, "column": 56}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 56}, "end": {"line": 44, "column": 57}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 58}, "end": {"line": 44, "column": 62}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 58}, "end": {"line": 44, "column": 62}}, "token": {"kind": "identifier", "text": "find"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 62}, "end": {"line": 44, "column": 63}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 64}, "end": {"line": 44, "column": 64}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 64}, "end": {"line": 44, "column": 65}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 65}, "end": {"line": 44, "column": 65}}, "children": []},
]}

# Parser output for `Menu("Window") { Button("Zoom", action: zoom) }` at 44:11.
does_not_warn_for_one_word_menu_title_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 11}, "end": {"line": 44, "column": 15}}, "token": {"kind": "identifier", "text": "Menu"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 15}, "end": {"line": 44, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 24}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 24}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 24}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "token": {"kind": "stringSegment", "text": "Window"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 23}, "end": {"line": 44, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 25}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 58}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 26}, "end": {"line": 44, "column": 27}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 56}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 56}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 56}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 28}, "end": {"line": 44, "column": 34}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 34}, "end": {"line": 44, "column": 35}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 55}}, "children": [
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 42}}, "children": [
              {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 41}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
                {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 40}}, "children": [
                  {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 40}}, "children": [
                    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 40}}, "token": {"kind": "stringSegment", "text": "Zoom"}, "children": []},
                  ]},
                ]},
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 40}, "end": {"line": 44, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 41}, "end": {"line": 44, "column": 42}}, "token": {"kind": "comma", "text": ","}, "children": []},
            ]},
            {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 55}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 49}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
              {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 49}, "end": {"line": 44, "column": 50}}, "token": {"kind": "colon", "text": ":"}, "children": []},
              {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 51}, "end": {"line": 44, "column": 55}}, "children": [
                {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 51}, "end": {"line": 44, "column": 55}}, "token": {"kind": "identifier", "text": "zoom"}, "children": []},
              ]},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 55}, "end": {"line": 44, "column": 56}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 57}, "end": {"line": 44, "column": 57}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 57}, "end": {"line": 44, "column": 58}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 58}, "end": {"line": 44, "column": 58}}, "children": []},
]}

# Parser output for `Text("recent documents")` at 51:9.
does_not_warn_for_non_menu_visible_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 33}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 13}, "end": {"line": 51, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 32}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 14}, "end": {"line": 51, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 31}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 15}, "end": {"line": 51, "column": 31}}, "token": {"kind": "stringSegment", "text": "recent documents"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 31}, "end": {"line": 51, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 32}, "end": {"line": 51, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 51, "column": 33}, "end": {"line": 51, "column": 33}}, "children": []},
]}
