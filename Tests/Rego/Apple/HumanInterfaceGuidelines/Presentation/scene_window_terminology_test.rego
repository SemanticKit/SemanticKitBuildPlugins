package apple.hig.presentation.scene_window_terminology

test_warns_for_scene_term_in_visible_text_copy if {
	result := decision with input as warns_for_scene_term_in_visible_text_copy_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].message == "Review visible copy that says scene; use window when referring to app windows."
	result.warn[0].line == 12
	result.warn[0].column == 9
	result.warn[0].severity == "warning"
}

test_warns_for_scene_term_in_action_label if {
	result := decision with input as warns_for_scene_term_in_action_label_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_action_label"
	result.warn[0].message == "Review action label that says scene; use window for commands that open or manage windows."
	result.warn[0].line == 27
	result.warn[0].column == 13
	result.warn[0].severity == "warning"
}

test_warns_for_member_help_scene_term if {
	result := decision with input as warns_for_member_help_scene_term_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_window_copy if {
	result := decision with input as does_not_warn_for_window_copy_node

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_scene_identifier if {
	result := decision with input as does_not_warn_for_non_visible_scene_identifier_node

	count(result.warn) == 0
}

test_does_not_warn_for_scenery_word_boundary if {
	result := decision with input as does_not_warn_for_scenery_word_boundary_node

	count(result.warn) == 0
}

# Parser output for `Text("Open this scene from the Window menu")` at 12:9.
warns_for_scene_term_in_visible_text_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 53}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 13}, "end": {"line": 12, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 52}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 52}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 52}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 14}, "end": {"line": 12, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 12, "column": 15}, "end": {"line": 12, "column": 51}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 12, "column": 15}, "end": {"line": 12, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 15}, "end": {"line": 12, "column": 51}}, "token": {"kind": "stringSegment", "text": "Open this scene from the Window menu"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 51}, "end": {"line": 12, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 52}, "end": {"line": 12, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 53}, "end": {"line": 12, "column": 53}}, "children": []},
]}

# Parser output for `Button("Open New Scene", action: openScene)` at 27:13.
warns_for_scene_term_in_action_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 56}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 19}, "end": {"line": 27, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 20}, "end": {"line": 27, "column": 55}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 20}, "end": {"line": 27, "column": 37}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 20}, "end": {"line": 27, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 20}, "end": {"line": 27, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 21}, "end": {"line": 27, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 21}, "end": {"line": 27, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 21}, "end": {"line": 27, "column": 35}}, "token": {"kind": "stringSegment", "text": "Open New Scene"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 35}, "end": {"line": 27, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 36}, "end": {"line": 27, "column": 37}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 38}, "end": {"line": 27, "column": 55}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 38}, "end": {"line": 27, "column": 44}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 44}, "end": {"line": 27, "column": 45}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 46}, "end": {"line": 27, "column": 55}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 46}, "end": {"line": 27, "column": 55}}, "token": {"kind": "identifier", "text": "openScene"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 55}, "end": {"line": 27, "column": 56}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 56}, "end": {"line": 27, "column": 56}}, "children": []},
]}

# Parser output for `status.help("Shows the active scene")` at 34:8.
warns_for_member_help_scene_term_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 45}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 19}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 14}}, "token": {"kind": "identifier", "text": "status"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 14}, "end": {"line": 34, "column": 15}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 19}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 19}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 19}, "end": {"line": 34, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 44}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 43}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 43}}, "token": {"kind": "stringSegment", "text": "Shows the active scene"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 43}, "end": {"line": 34, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 44}, "end": {"line": 34, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 45}, "end": {"line": 34, "column": 45}}, "children": []},
]}

# Parser output for `Text("Open this window from the Window menu")` at 41:9.
does_not_warn_for_window_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 54}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 9}, "end": {"line": 41, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 13}, "end": {"line": 41, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 41, "column": 14}, "end": {"line": 41, "column": 53}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 41, "column": 14}, "end": {"line": 41, "column": 53}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 41, "column": 14}, "end": {"line": 41, "column": 53}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 14}, "end": {"line": 41, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 41, "column": 15}, "end": {"line": 41, "column": 52}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 41, "column": 15}, "end": {"line": 41, "column": 52}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 15}, "end": {"line": 41, "column": 52}}, "token": {"kind": "stringSegment", "text": "Open this window from the Window menu"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 52}, "end": {"line": 41, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 41, "column": 53}, "end": {"line": 41, "column": 54}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 41, "column": 54}, "end": {"line": 41, "column": 54}}, "children": []},
]}

# Parser output for `WindowGroup(id: "primary-scene") { ContentView() }` at 8:5.
does_not_warn_for_non_visible_scene_identifier_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 55}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 5}, "end": {"line": 8, "column": 16}}, "token": {"kind": "identifier", "text": "WindowGroup"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 16}, "end": {"line": 8, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 8, "column": 17}, "end": {"line": 8, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 8, "column": 17}, "end": {"line": 8, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 17}, "end": {"line": 8, "column": 19}}, "token": {"kind": "identifier", "text": "id"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 19}, "end": {"line": 8, "column": 20}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 21}, "end": {"line": 8, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 8, "column": 22}, "end": {"line": 8, "column": 35}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 8, "column": 22}, "end": {"line": 8, "column": 35}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 22}, "end": {"line": 8, "column": 35}}, "token": {"kind": "stringSegment", "text": "primary-scene"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 35}, "end": {"line": 8, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 36}, "end": {"line": 8, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 8, "column": 38}, "end": {"line": 8, "column": 55}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 38}, "end": {"line": 8, "column": 39}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 8, "column": 40}, "end": {"line": 8, "column": 53}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 8, "column": 40}, "end": {"line": 8, "column": 53}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 8, "column": 40}, "end": {"line": 8, "column": 53}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 8, "column": 40}, "end": {"line": 8, "column": 51}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 40}, "end": {"line": 8, "column": 51}}, "token": {"kind": "identifier", "text": "ContentView"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 51}, "end": {"line": 8, "column": 52}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 8, "column": 52}, "end": {"line": 8, "column": 52}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 52}, "end": {"line": 8, "column": 53}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 8, "column": 54}, "end": {"line": 8, "column": 54}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 8, "column": 54}, "end": {"line": 8, "column": 55}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 8, "column": 55}, "end": {"line": 8, "column": 55}}, "children": []},
]}

# Parser output for `Text("Choose scenery")` at 18:9.
does_not_warn_for_scenery_word_boundary_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 31}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 29}}, "token": {"kind": "stringSegment", "text": "Choose scenery"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 31}}, "children": []},
]}
