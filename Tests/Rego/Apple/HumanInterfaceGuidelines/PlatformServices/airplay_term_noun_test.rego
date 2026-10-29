package apple.hig.platform_services.airplay_term_noun

test_warns_for_modified_airplay_term_swift_syntax if {
  result := decision with input as warns_for_modified_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible AirPlay string literal; use AirPlay as a noun and avoid modifying the term."
  warnings[0].line == 20
  warnings[0].column == 9
  warnings[0].severity == "warning"
}

test_does_not_warn_for_noun_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_noun_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_modified_airplay_term_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_modified_airplay_term_swift_syntax_node

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_airplay_term_as_noun"
  ]
  count(warnings) == 0
}

# Parser output for `Text("AirPlaying to living room")` at 20:9.
warns_for_modified_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 9}, "end": {"line": 20, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 13}, "end": {"line": 20, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 20, "column": 14}, "end": {"line": 20, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 20, "column": 14}, "end": {"line": 20, "column": 41}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 20, "column": 14}, "end": {"line": 20, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 14}, "end": {"line": 20, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 20, "column": 15}, "end": {"line": 20, "column": 40}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 20, "column": 15}, "end": {"line": 20, "column": 40}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 15}, "end": {"line": 20, "column": 40}}, "token": {"kind": "stringSegment", "text": "AirPlaying to living room"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 40}, "end": {"line": 20, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 20, "column": 41}, "end": {"line": 20, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 20, "column": 42}, "end": {"line": 20, "column": 42}}, "children": []},
]}

# Parser output for `Text("Use AirPlay with speakers")` at 27:9.
does_not_warn_for_noun_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 9}, "end": {"line": 27, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 13}, "end": {"line": 27, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 41}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 14}, "end": {"line": 27, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 40}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 40}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 15}, "end": {"line": 27, "column": 40}}, "token": {"kind": "stringSegment", "text": "Use AirPlay with speakers"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 40}, "end": {"line": 27, "column": 41}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 27, "column": 41}, "end": {"line": 27, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 27, "column": 42}, "end": {"line": 27, "column": 42}}, "children": []},
]}

# Parser output for `Logger(subsystem: "airplaying")` at 35:13.
does_not_warn_for_non_visible_modified_airplay_term_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 44}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 13}, "end": {"line": 35, "column": 19}}, "token": {"kind": "identifier", "text": "Logger"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 19}, "end": {"line": 35, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 35, "column": 20}, "end": {"line": 35, "column": 43}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 35, "column": 20}, "end": {"line": 35, "column": 43}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 20}, "end": {"line": 35, "column": 29}}, "token": {"kind": "identifier", "text": "subsystem"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 29}, "end": {"line": 35, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 35, "column": 31}, "end": {"line": 35, "column": 43}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 31}, "end": {"line": 35, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 35, "column": 32}, "end": {"line": 35, "column": 42}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 35, "column": 32}, "end": {"line": 35, "column": 42}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 32}, "end": {"line": 35, "column": 42}}, "token": {"kind": "stringSegment", "text": "airplaying"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 42}, "end": {"line": 35, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 35, "column": 43}, "end": {"line": 35, "column": 44}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 35, "column": 44}, "end": {"line": 35, "column": 44}}, "children": []},
]}
