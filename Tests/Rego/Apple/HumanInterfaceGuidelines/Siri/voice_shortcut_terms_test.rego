package apple.hig.siri.voice_shortcut_terms

test_warns_for_text_add_voice_shortcut_lowercase_hig_example if {
	result := decision with input as warns_for_text_add_voice_shortcut_lowercase_hig_example_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].message == "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt."
	result.warn[0].line == 21
	result.warn[0].column == 15
	result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_phrase_variants if {
	result := {"warn": [warning |
    node := warns_for_visible_string_call_phrase_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

	count(result.warn) == 3
}

test_warns_for_help_member_make_voice_command_lowercase_substring if {
	result := decision with input as warns_for_help_member_make_voice_command_lowercase_substring_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_warns_for_textfield_create_voice_prompt_lowercase_substring if {
	result := decision with input as warns_for_textfield_create_voice_prompt_lowercase_substring_node

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].line == 47
	result.warn[0].column == 19
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_matching_visible_string if {
	result := decision with input as does_not_warn_for_non_matching_visible_string_node

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_call_with_matching_string if {
	result := decision with input as does_not_warn_for_non_visible_call_with_matching_string_node

	count(result.warn) == 0
}

# Parser output for `Text("add voice shortcut")` at 21:15.
warns_for_text_add_voice_shortcut_lowercase_hig_example_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 41}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 15}, "end": {"line": 21, "column": 19}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 19}, "end": {"line": 21, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 40}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 40}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 20}, "end": {"line": 21, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 39}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 39}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 21}, "end": {"line": 21, "column": 39}}, "token": {"kind": "stringSegment", "text": "add voice shortcut"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 39}, "end": {"line": 21, "column": 40}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 21, "column": 40}, "end": {"line": 21, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 21, "column": 41}, "end": {"line": 21, "column": 41}}, "children": []},
]}

# Parser output for `Label("add voice shortcuts", systemImage: "mic")` at 28:9.
# Parser output for `Button("Make it easy to add voice shortcuts", action: addShortcut)` at 29:9.
# Parser output for `Text("Use this to ADD VOICE SHORTCUT")` at 30:9.
warns_for_visible_string_call_phrase_variants_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 57}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 9}, "end": {"line": 28, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 14}, "end": {"line": 28, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 56}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 37}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 15}, "end": {"line": 28, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 35}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 16}, "end": {"line": 28, "column": 35}}, "token": {"kind": "stringSegment", "text": "add voice shortcuts"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 35}, "end": {"line": 28, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 36}, "end": {"line": 28, "column": 37}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 38}, "end": {"line": 28, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 38}, "end": {"line": 28, "column": 49}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 49}, "end": {"line": 28, "column": 50}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 51}, "end": {"line": 28, "column": 56}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 51}, "end": {"line": 28, "column": 52}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 52}, "end": {"line": 28, "column": 55}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 52}, "end": {"line": 28, "column": 55}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 52}, "end": {"line": 28, "column": 55}}, "token": {"kind": "stringSegment", "text": "mic"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 55}, "end": {"line": 28, "column": 56}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 56}, "end": {"line": 28, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 57}, "end": {"line": 28, "column": 57}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 75}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 9}, "end": {"line": 29, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 15}, "end": {"line": 29, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 29, "column": 16}, "end": {"line": 29, "column": 74}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 29, "column": 16}, "end": {"line": 29, "column": 54}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 29, "column": 16}, "end": {"line": 29, "column": 53}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 16}, "end": {"line": 29, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 29, "column": 17}, "end": {"line": 29, "column": 52}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 29, "column": 17}, "end": {"line": 29, "column": 52}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 17}, "end": {"line": 29, "column": 52}}, "token": {"kind": "stringSegment", "text": "Make it easy to add voice shortcuts"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 52}, "end": {"line": 29, "column": 53}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 53}, "end": {"line": 29, "column": 54}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 29, "column": 55}, "end": {"line": 29, "column": 74}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 55}, "end": {"line": 29, "column": 61}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 61}, "end": {"line": 29, "column": 62}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 29, "column": 63}, "end": {"line": 29, "column": 74}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 63}, "end": {"line": 29, "column": 74}}, "token": {"kind": "identifier", "text": "addShortcut"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 29, "column": 74}, "end": {"line": 29, "column": 75}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 29, "column": 75}, "end": {"line": 29, "column": 75}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 47}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 13}, "end": {"line": 30, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 46}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 46}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 46}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 14}, "end": {"line": 30, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 30, "column": 15}, "end": {"line": 30, "column": 45}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 30, "column": 15}, "end": {"line": 30, "column": 45}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 15}, "end": {"line": 30, "column": 45}}, "token": {"kind": "stringSegment", "text": "Use this to ADD VOICE SHORTCUT"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 45}, "end": {"line": 30, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 46}, "end": {"line": 30, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 47}, "end": {"line": 30, "column": 47}}, "children": []},
  ]},
]

# Parser output for `routine.help("make a voice command for the morning routine")` at 34:8.
warns_for_help_member_make_voice_command_lowercase_substring_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 68}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 20}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 8}, "end": {"line": 34, "column": 15}}, "token": {"kind": "identifier", "text": "routine"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 15}, "end": {"line": 34, "column": 16}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 16}, "end": {"line": 34, "column": 20}}, "token": {"kind": "identifier", "text": "help"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 20}, "end": {"line": 34, "column": 21}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 67}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 67}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 67}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 21}, "end": {"line": 34, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 34, "column": 22}, "end": {"line": 34, "column": 66}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 34, "column": 22}, "end": {"line": 34, "column": 66}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 22}, "end": {"line": 34, "column": 66}}, "token": {"kind": "stringSegment", "text": "make a voice command for the morning routine"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 66}, "end": {"line": 34, "column": 67}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 34, "column": 67}, "end": {"line": 34, "column": 68}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 34, "column": 68}, "end": {"line": 34, "column": 68}}, "children": []},
]}

# Parser output for `TextField("create a voice prompt before saving", text: $prompt)` at 47:19.
warns_for_textfield_create_voice_prompt_lowercase_substring_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 82}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 28}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 19}, "end": {"line": 47, "column": 28}}, "token": {"kind": "identifier", "text": "TextField"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 28}, "end": {"line": 47, "column": 29}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 47, "column": 29}, "end": {"line": 47, "column": 81}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 29}, "end": {"line": 47, "column": 67}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 47, "column": 29}, "end": {"line": 47, "column": 66}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 29}, "end": {"line": 47, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 47, "column": 30}, "end": {"line": 47, "column": 65}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 47, "column": 30}, "end": {"line": 47, "column": 65}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 30}, "end": {"line": 47, "column": 65}}, "token": {"kind": "stringSegment", "text": "create a voice prompt before saving"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 65}, "end": {"line": 47, "column": 66}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 66}, "end": {"line": 47, "column": 67}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 47, "column": 68}, "end": {"line": 47, "column": 81}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 68}, "end": {"line": 47, "column": 72}}, "token": {"kind": "identifier", "text": "text"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 72}, "end": {"line": 47, "column": 73}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 47, "column": 74}, "end": {"line": 47, "column": 81}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 74}, "end": {"line": 47, "column": 81}}, "token": {"kind": "identifier", "text": "$prompt"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 47, "column": 81}, "end": {"line": 47, "column": 82}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 47, "column": 82}, "end": {"line": 47, "column": 82}}, "children": []},
]}

# Parser output for `Button("Add to Shortcuts", action: addShortcut)` at 58:12.
does_not_warn_for_non_matching_visible_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 58, "column": 12}, "end": {"line": 58, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 58, "column": 12}, "end": {"line": 58, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 12}, "end": {"line": 58, "column": 18}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 18}, "end": {"line": 58, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 58, "column": 19}, "end": {"line": 58, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 58, "column": 19}, "end": {"line": 58, "column": 38}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 58, "column": 19}, "end": {"line": 58, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 19}, "end": {"line": 58, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 58, "column": 20}, "end": {"line": 58, "column": 36}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 58, "column": 20}, "end": {"line": 58, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 20}, "end": {"line": 58, "column": 36}}, "token": {"kind": "stringSegment", "text": "Add to Shortcuts"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 36}, "end": {"line": 58, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 37}, "end": {"line": 58, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 58, "column": 39}, "end": {"line": 58, "column": 58}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 39}, "end": {"line": 58, "column": 45}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 45}, "end": {"line": 58, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 58, "column": 47}, "end": {"line": 58, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 47}, "end": {"line": 58, "column": 58}}, "token": {"kind": "identifier", "text": "addShortcut"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 58, "column": 58}, "end": {"line": 58, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 58, "column": 59}, "end": {"line": 58, "column": 59}}, "children": []},
]}

# Parser output for `IntentDescription("add voice shortcut")` at 66:10.
does_not_warn_for_non_visible_call_with_matching_string_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 66, "column": 10}, "end": {"line": 66, "column": 49}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 66, "column": 10}, "end": {"line": 66, "column": 27}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 10}, "end": {"line": 66, "column": 27}}, "token": {"kind": "identifier", "text": "IntentDescription"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 27}, "end": {"line": 66, "column": 28}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 66, "column": 28}, "end": {"line": 66, "column": 48}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 66, "column": 28}, "end": {"line": 66, "column": 48}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 66, "column": 28}, "end": {"line": 66, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 28}, "end": {"line": 66, "column": 29}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 66, "column": 29}, "end": {"line": 66, "column": 47}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 66, "column": 29}, "end": {"line": 66, "column": 47}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 29}, "end": {"line": 66, "column": 47}}, "token": {"kind": "stringSegment", "text": "add voice shortcut"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 47}, "end": {"line": 66, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 66, "column": 48}, "end": {"line": 66, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 66, "column": 49}, "end": {"line": 66, "column": 49}}, "children": []},
]}
