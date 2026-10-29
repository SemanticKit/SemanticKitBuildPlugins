package apple.hig.platform_services.airplay_term_casing

test_warns_for_lowercase_airplay_term_swift_syntax if {
  result := decision with input as warns_for_lowercase_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use the AirPlay term casing."
  warnings[0].line == 18
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_spaced_airplay_term_swift_syntax if {
  result := decision with input as warns_for_spaced_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_correct_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_airplay_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_airplay_string_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_casing"
  ]
  count(warnings) == 0
}

# Parser output for `Text("Open airplay settings")` at 18:11.
warns_for_lowercase_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 40}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 15}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 39}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 38}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 38}}, "token": {"kind": "stringSegment", "text": "Open airplay settings"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 40}}, "children": []},
]}

# Parser output for `Button("Choose Air Play", action: chooseRoute)` at 24:13.
warns_for_spaced_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 59}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 19}, "end": {"line": 24, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 58}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 38}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 20}, "end": {"line": 24, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 36}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 21}, "end": {"line": 24, "column": 36}}, "token": {"kind": "stringSegment", "text": "Choose Air Play"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 58}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 45}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 58}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 58}}, "token": {"kind": "identifier", "text": "chooseRoute"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 58}, "end": {"line": 24, "column": 59}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 59}, "end": {"line": 24, "column": 59}}, "children": []},
]}

# Parser output for `Label("Use AirPlay", systemImage: "tv")` at 31:9.
does_not_warn_for_correct_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 48}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 14}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 14}, "end": {"line": 31, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 47}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 29}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 15}, "end": {"line": 31, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 27}}, "token": {"kind": "stringSegment", "text": "Use AirPlay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 27}, "end": {"line": 31, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 30}, "end": {"line": 31, "column": 41}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 41}, "end": {"line": 31, "column": 42}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 43}, "end": {"line": 31, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 43}, "end": {"line": 31, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 46}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 46}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 44}, "end": {"line": 31, "column": 46}}, "token": {"kind": "stringSegment", "text": "tv"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 46}, "end": {"line": 31, "column": 47}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 48}, "end": {"line": 31, "column": 48}}, "children": []},
]}

# Parser output for `Logger(subsystem: "airplay")` at 44:17.
does_not_warn_for_non_visible_airplay_string_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 45}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 23}}, "token": {"kind": "identifier", "text": "Logger"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 23}, "end": {"line": 44, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 44}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 24}, "end": {"line": 44, "column": 33}}, "token": {"kind": "identifier", "text": "subsystem"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 33}, "end": {"line": 44, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 35}, "end": {"line": 44, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 43}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 36}, "end": {"line": 44, "column": 43}}, "token": {"kind": "stringSegment", "text": "airplay"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 43}, "end": {"line": 44, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 44}, "end": {"line": 44, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 45}, "end": {"line": 44, "column": 45}}, "children": []},
]}
