package apple.hig.platform_services.game_center_terms

test_warns_for_lowercase_game_center_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_game_center_term_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
  result.warn[0].message == "Review visible Game Center string literal; use the Game Center term casing in custom UI."
  result.warn[0].line == 21
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_gamecenter_without_space_swift_syntax if {
  result := decision with input as warns_for_gamecenter_without_space_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_game_center_term_casing"
}

test_does_not_warn_for_correct_game_center_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_game_center_term_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_game_center_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_game_center_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Open game center")` at 21:9.
warns_for_lowercase_game_center_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 33}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 9}, "end": {"line": 21, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 13}, "end": {"line": 21, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 32}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 32}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 14}, "end": {"line": 21, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 31}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 31}}, "token": {"kind": "stringSegment", "text": "Open game center"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 31}, "end": {"line": 21, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 32}, "end": {"line": 21, "column": 33}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 33}, "end": {"line": 21, "column": 33}}, "children": []},
]}

# Parser output for `Label("Open GameCenter", systemImage: "gamecontroller")` at 28:9.
warns_for_gamecenter_without_space_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 64}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 14}, "end": {"line": 28, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 63}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 32}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 31}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 31}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 31}}, "token": {"kind": "stringSegment", "text": "Open GameCenter"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 32}, "end": {"line": 28, "column": 33}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 63}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 45}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 45}, "end": {"line": 28, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 47}, "end": {"line": 28, "column": 63}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 47}, "end": {"line": 28, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 48}, "end": {"line": 28, "column": 62}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 48}, "end": {"line": 28, "column": 62}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 48}, "end": {"line": 28, "column": 62}}, "token": {"kind": "stringSegment", "text": "gamecontroller"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 62}, "end": {"line": 28, "column": 63}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 63}, "end": {"line": 28, "column": 64}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 64}, "end": {"line": 28, "column": 64}}, "children": []},
]}

# Parser output for `Button("Open Game Center", action: openGameCenter)` at 36:9.
does_not_warn_for_correct_game_center_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 9}, "end": {"line": 36, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 15}, "end": {"line": 36, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 35}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 16}, "end": {"line": 36, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 17}, "end": {"line": 36, "column": 33}}, "token": {"kind": "stringSegment", "text": "Open Game Center"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 33}, "end": {"line": 36, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 34}, "end": {"line": 36, "column": 35}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 36, "column": 36}, "end": {"line": 36, "column": 58}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 36}, "end": {"line": 36, "column": 42}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 42}, "end": {"line": 36, "column": 43}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 44}, "end": {"line": 36, "column": 58}}, "token": {"kind": "identifier", "text": "openGameCenter"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 36, "column": 58}, "end": {"line": 36, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 36, "column": 59}, "end": {"line": 36, "column": 59}}, "children": []},
]}

# Parser output for `Logger(subsystem: "game center")` at 44:17.
does_not_warn_for_non_visible_game_center_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 49}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "token": {"kind": "identifier", "text": "Logger"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 23}, "end": {"line": 44, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 48}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 48}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 33}}, "token": {"kind": "identifier", "text": "subsystem"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 47}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 47}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 47}}, "token": {"kind": "stringSegment", "text": "game center"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 47}, "end": {"line": 44, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 48}, "end": {"line": 44, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 49}, "end": {"line": 44, "column": 49}}, "children": []},
]}
