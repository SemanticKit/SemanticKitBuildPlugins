package apple.hig.siri.hey_siri_phrase

test_warns_for_app_shortcut_phrase_with_hey_siri_comma if {
  result := decision with input as warns_for_app_shortcut_phrase_with_hey_siri_comma_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].message == "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri."
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_member_app_shortcut_phrase_case_insensitively if {
  result := decision with input as warns_for_member_app_shortcut_phrase_case_insensitively_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].line == 28
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_text_with_hey_siri if {
  result := decision with input as does_not_warn_for_text_with_hey_siri_node

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_phrase_without_hey_siri if {
  result := decision with input as does_not_warn_for_app_shortcut_phrase_without_hey_siri_node

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_hey_siri_outside_phrases_argument if {
  result := decision with input as does_not_warn_for_app_shortcut_hey_siri_outside_phrases_argument_node

  count(result.warn) == 0
}

# Parser output for `AppShortcut(intent: ShowGardenIntent(), phrases: ["Hey Siri, show my garden"], shortTitle: "Garden", systemImageName: "leaf")` at 17:11.
warns_for_app_shortcut_phrase_with_hey_siri_comma_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 136}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 11}, "end": {"line": 17, "column": 22}}, "token": {"kind": "identifier", "text": "AppShortcut"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 22}, "end": {"line": 17, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 17, "column": 23}, "end": {"line": 17, "column": 135}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 23}, "end": {"line": 17, "column": 50}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 23}, "end": {"line": 17, "column": 29}}, "token": {"kind": "identifier", "text": "intent"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 29}, "end": {"line": 17, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 17, "column": 31}, "end": {"line": 17, "column": 49}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 17, "column": 31}, "end": {"line": 17, "column": 47}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 31}, "end": {"line": 17, "column": 47}}, "token": {"kind": "identifier", "text": "ShowGardenIntent"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 47}, "end": {"line": 17, "column": 48}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 17, "column": 48}, "end": {"line": 17, "column": 48}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 48}, "end": {"line": 17, "column": 49}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 17, "column": 49}, "end": {"line": 17, "column": 49}}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 49}, "end": {"line": 17, "column": 50}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 51}, "end": {"line": 17, "column": 89}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 51}, "end": {"line": 17, "column": 58}}, "token": {"kind": "identifier", "text": "phrases"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 58}, "end": {"line": 17, "column": 59}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "ArrayExprSyntax", "range": {"start": {"line": 17, "column": 60}, "end": {"line": 17, "column": 88}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 60}, "end": {"line": 17, "column": 61}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
        {"type": "ArrayElementListSyntax", "range": {"start": {"line": 17, "column": 61}, "end": {"line": 17, "column": 87}}, "children": [
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 17, "column": 61}, "end": {"line": 17, "column": 87}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 17, "column": 61}, "end": {"line": 17, "column": 87}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 61}, "end": {"line": 17, "column": 62}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 17, "column": 62}, "end": {"line": 17, "column": 86}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 17, "column": 62}, "end": {"line": 17, "column": 86}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 62}, "end": {"line": 17, "column": 86}}, "token": {"kind": "stringSegment", "text": "Hey Siri, show my garden"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 86}, "end": {"line": 17, "column": 87}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 87}, "end": {"line": 17, "column": 88}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 88}, "end": {"line": 17, "column": 89}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 90}, "end": {"line": 17, "column": 111}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 90}, "end": {"line": 17, "column": 100}}, "token": {"kind": "identifier", "text": "shortTitle"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 100}, "end": {"line": 17, "column": 101}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 17, "column": 102}, "end": {"line": 17, "column": 110}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 102}, "end": {"line": 17, "column": 103}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 17, "column": 103}, "end": {"line": 17, "column": 109}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 17, "column": 103}, "end": {"line": 17, "column": 109}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 103}, "end": {"line": 17, "column": 109}}, "token": {"kind": "stringSegment", "text": "Garden"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 109}, "end": {"line": 17, "column": 110}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 110}, "end": {"line": 17, "column": 111}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 17, "column": 112}, "end": {"line": 17, "column": 135}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 112}, "end": {"line": 17, "column": 127}}, "token": {"kind": "identifier", "text": "systemImageName"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 127}, "end": {"line": 17, "column": 128}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 17, "column": 129}, "end": {"line": 17, "column": 135}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 129}, "end": {"line": 17, "column": 130}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 17, "column": 130}, "end": {"line": 17, "column": 134}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 17, "column": 130}, "end": {"line": 17, "column": 134}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 130}, "end": {"line": 17, "column": 134}}, "token": {"kind": "stringSegment", "text": "leaf"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 134}, "end": {"line": 17, "column": 135}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 17, "column": 135}, "end": {"line": 17, "column": 136}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 17, "column": 136}, "end": {"line": 17, "column": 136}}, "children": []},
]}

# Parser output for `AppShortcut(phrases: ["Use HEY SIRI to open Today"])` at 28:8.
warns_for_member_app_shortcut_phrase_case_insensitively_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 60}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 19}}, "token": {"kind": "identifier", "text": "AppShortcut"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 19}, "end": {"line": 28, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 59}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 59}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 20}, "end": {"line": 28, "column": 27}}, "token": {"kind": "identifier", "text": "phrases"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 27}, "end": {"line": 28, "column": 28}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "ArrayExprSyntax", "range": {"start": {"line": 28, "column": 29}, "end": {"line": 28, "column": 59}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 29}, "end": {"line": 28, "column": 30}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
        {"type": "ArrayElementListSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 58}}, "children": [
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 58}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 58}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 30}, "end": {"line": 28, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 57}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 57}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 31}, "end": {"line": 28, "column": 57}}, "token": {"kind": "stringSegment", "text": "Use HEY SIRI to open Today"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 57}, "end": {"line": 28, "column": 58}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 58}, "end": {"line": 28, "column": 59}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 59}, "end": {"line": 28, "column": 60}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 60}, "end": {"line": 28, "column": 60}}, "children": []},
]}

# Parser output for `Text("Hey Siri")` at 35:11.
does_not_warn_for_text_with_hey_siri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 35, "column": 11}, "end": {"line": 35, "column": 27}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 11}, "end": {"line": 35, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 11}, "end": {"line": 35, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 15}, "end": {"line": 35, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 35, "column": 16}, "end": {"line": 35, "column": 26}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 16}, "end": {"line": 35, "column": 26}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 35, "column": 16}, "end": {"line": 35, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 16}, "end": {"line": 35, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 35, "column": 17}, "end": {"line": 35, "column": 25}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 35, "column": 17}, "end": {"line": 35, "column": 25}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 17}, "end": {"line": 35, "column": 25}}, "token": {"kind": "stringSegment", "text": "Hey Siri"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 25}, "end": {"line": 35, "column": 26}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 26}, "end": {"line": 35, "column": 27}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 35, "column": 27}, "end": {"line": 35, "column": 27}}, "children": []},
]}

# Parser output for `AppShortcut(intent: ShowGardenIntent(), phrases: ["Show my garden"], shortTitle: "Garden", systemImageName: "leaf")` at 42:13.
does_not_warn_for_app_shortcut_phrase_without_hey_siri_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 128}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 24}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 13}, "end": {"line": 42, "column": 24}}, "token": {"kind": "identifier", "text": "AppShortcut"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 127}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 31}}, "token": {"kind": "identifier", "text": "intent"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 31}, "end": {"line": 42, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 33}, "end": {"line": 42, "column": 51}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 33}, "end": {"line": 42, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 33}, "end": {"line": 42, "column": 49}}, "token": {"kind": "identifier", "text": "ShowGardenIntent"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 50}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 50}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 51}, "end": {"line": 42, "column": 51}}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 51}, "end": {"line": 42, "column": 52}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 53}, "end": {"line": 42, "column": 81}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 53}, "end": {"line": 42, "column": 60}}, "token": {"kind": "identifier", "text": "phrases"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 60}, "end": {"line": 42, "column": 61}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "ArrayExprSyntax", "range": {"start": {"line": 42, "column": 62}, "end": {"line": 42, "column": 80}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 62}, "end": {"line": 42, "column": 63}}, "token": {"kind": "leftSquare", "text": "["}, "children": []},
        {"type": "ArrayElementListSyntax", "range": {"start": {"line": 42, "column": 63}, "end": {"line": 42, "column": 79}}, "children": [
          {"type": "ArrayElementSyntax", "range": {"start": {"line": 42, "column": 63}, "end": {"line": 42, "column": 79}}, "children": [
            {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 63}, "end": {"line": 42, "column": 79}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 63}, "end": {"line": 42, "column": 64}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
              {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 64}, "end": {"line": 42, "column": 78}}, "children": [
                {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 64}, "end": {"line": 42, "column": 78}}, "children": [
                  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 64}, "end": {"line": 42, "column": 78}}, "token": {"kind": "stringSegment", "text": "Show my garden"}, "children": []},
                ]},
              ]},
              {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 78}, "end": {"line": 42, "column": 79}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
            ]},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 79}, "end": {"line": 42, "column": 80}}, "token": {"kind": "rightSquare", "text": "]"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 80}, "end": {"line": 42, "column": 81}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 82}, "end": {"line": 42, "column": 103}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 82}, "end": {"line": 42, "column": 92}}, "token": {"kind": "identifier", "text": "shortTitle"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 92}, "end": {"line": 42, "column": 93}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 94}, "end": {"line": 42, "column": 102}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 94}, "end": {"line": 42, "column": 95}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 95}, "end": {"line": 42, "column": 101}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 95}, "end": {"line": 42, "column": 101}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 95}, "end": {"line": 42, "column": 101}}, "token": {"kind": "stringSegment", "text": "Garden"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 101}, "end": {"line": 42, "column": 102}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 102}, "end": {"line": 42, "column": 103}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 104}, "end": {"line": 42, "column": 127}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 104}, "end": {"line": 42, "column": 119}}, "token": {"kind": "identifier", "text": "systemImageName"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 119}, "end": {"line": 42, "column": 120}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 121}, "end": {"line": 42, "column": 127}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 121}, "end": {"line": 42, "column": 122}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 122}, "end": {"line": 42, "column": 126}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 122}, "end": {"line": 42, "column": 126}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 122}, "end": {"line": 42, "column": 126}}, "token": {"kind": "stringSegment", "text": "leaf"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 126}, "end": {"line": 42, "column": 127}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 127}, "end": {"line": 42, "column": 128}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 128}, "end": {"line": 42, "column": 128}}, "children": []},
]}

# Parser output for `AppShortcut(intent: ShowGardenIntent(), shortTitle: "Hey Siri", systemImageName: "leaf")` at 49:13.
does_not_warn_for_app_shortcut_hey_siri_outside_phrases_argument_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 49, "column": 13}, "end": {"line": 49, "column": 101}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 49, "column": 13}, "end": {"line": 49, "column": 24}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 13}, "end": {"line": 49, "column": 24}}, "token": {"kind": "identifier", "text": "AppShortcut"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 24}, "end": {"line": 49, "column": 25}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 49, "column": 25}, "end": {"line": 49, "column": 100}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 49, "column": 25}, "end": {"line": 49, "column": 52}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 25}, "end": {"line": 49, "column": 31}}, "token": {"kind": "identifier", "text": "intent"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 31}, "end": {"line": 49, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 49, "column": 33}, "end": {"line": 49, "column": 51}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 49, "column": 33}, "end": {"line": 49, "column": 49}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 33}, "end": {"line": 49, "column": 49}}, "token": {"kind": "identifier", "text": "ShowGardenIntent"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 49}, "end": {"line": 49, "column": 50}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
        {"type": "LabeledExprListSyntax", "range": {"start": {"line": 49, "column": 50}, "end": {"line": 49, "column": 50}}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 50}, "end": {"line": 49, "column": 51}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
        {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 49, "column": 51}, "end": {"line": 49, "column": 51}}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 51}, "end": {"line": 49, "column": 52}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 49, "column": 53}, "end": {"line": 49, "column": 76}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 53}, "end": {"line": 49, "column": 63}}, "token": {"kind": "identifier", "text": "shortTitle"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 63}, "end": {"line": 49, "column": 64}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 49, "column": 65}, "end": {"line": 49, "column": 75}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 65}, "end": {"line": 49, "column": 66}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 49, "column": 66}, "end": {"line": 49, "column": 74}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 49, "column": 66}, "end": {"line": 49, "column": 74}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 66}, "end": {"line": 49, "column": 74}}, "token": {"kind": "stringSegment", "text": "Hey Siri"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 74}, "end": {"line": 49, "column": 75}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 75}, "end": {"line": 49, "column": 76}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 49, "column": 77}, "end": {"line": 49, "column": 100}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 77}, "end": {"line": 49, "column": 92}}, "token": {"kind": "identifier", "text": "systemImageName"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 92}, "end": {"line": 49, "column": 93}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 49, "column": 94}, "end": {"line": 49, "column": 100}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 94}, "end": {"line": 49, "column": 95}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 49, "column": 95}, "end": {"line": 49, "column": 99}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 49, "column": 95}, "end": {"line": 49, "column": 99}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 95}, "end": {"line": 49, "column": 99}}, "token": {"kind": "stringSegment", "text": "leaf"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 99}, "end": {"line": 49, "column": 100}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 49, "column": 100}, "end": {"line": 49, "column": 101}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 49, "column": 101}, "end": {"line": 49, "column": 101}}, "children": []},
]}
