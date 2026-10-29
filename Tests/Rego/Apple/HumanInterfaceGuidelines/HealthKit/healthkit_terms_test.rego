package apple.hig.healthkit.healthkit_terms

test_warns_for_visible_healthkit_copy if {
  result := decision with input as warns_for_visible_healthkit_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
  result.warn[0].message == "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_bad_apple_health_capitalization_variants if {
  result := {"warn": [warning |
    node := warns_for_bad_apple_health_capitalization_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
}

test_does_not_warn_for_apple_health_copy if {
  result := decision with input as does_not_warn_for_apple_health_copy_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_healthkit_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_healthkit_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Connect HealthKit")` at 18:9.
warns_for_visible_healthkit_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 34}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 13}, "end": {"line": 18, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 33}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 33}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 33}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 14}, "end": {"line": 18, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 32}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 32}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 32}}, "token": {"kind": "stringSegment", "text": "Connect HealthKit"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 33}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 34}, "end": {"line": 18, "column": 34}}, "children": []},
]}

# Parser output for `Text("Connect apple health")` at 23:9.
# Parser output for `Button("Open Apple health", action: openHealth)` at 24:9.
# Parser output for `Label("Sync APPLE HEALTH data", systemImage: "heart")` at 25:9.
warns_for_bad_apple_health_capitalization_variants_nodes := [
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 37}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 13}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 9}, "end": {"line": 23, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 13}, "end": {"line": 23, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 36}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 36}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 14}, "end": {"line": 23, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 35}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 35}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 15}, "end": {"line": 23, "column": 35}}, "token": {"kind": "stringSegment", "text": "Connect apple health"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 35}, "end": {"line": 23, "column": 36}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 23, "column": 36}, "end": {"line": 23, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 23, "column": 37}, "end": {"line": 23, "column": 37}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 56}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 55}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 36}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 35}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 34}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 34}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 34}}, "token": {"kind": "stringSegment", "text": "Open Apple health"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 34}, "end": {"line": 24, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 35}, "end": {"line": 24, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 55}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 43}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 55}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 55}}, "token": {"kind": "identifier", "text": "openHealth"}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 55}, "end": {"line": 24, "column": 56}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 56}, "end": {"line": 24, "column": 56}}, "children": []},
  ]},
  {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 62}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 9}, "end": {"line": 25, "column": 14}}, "token": {"kind": "identifier", "text": "Label"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 14}, "end": {"line": 25, "column": 15}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
    {"type": "LabeledExprListSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 61}}, "children": [
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 40}}, "children": [
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 39}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 15}, "end": {"line": 25, "column": 16}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 38}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 38}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 16}, "end": {"line": 25, "column": 38}}, "token": {"kind": "stringSegment", "text": "Sync APPLE HEALTH data"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 38}, "end": {"line": 25, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 39}, "end": {"line": 25, "column": 40}}, "token": {"kind": "comma", "text": ","}, "children": []},
      ]},
      {"type": "LabeledExprSyntax", "range": {"start": {"line": 25, "column": 41}, "end": {"line": 25, "column": 61}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 41}, "end": {"line": 25, "column": 52}}, "token": {"kind": "identifier", "text": "systemImage"}, "children": []},
        {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 52}, "end": {"line": 25, "column": 53}}, "token": {"kind": "colon", "text": ":"}, "children": []},
        {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 25, "column": 54}, "end": {"line": 25, "column": 61}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 54}, "end": {"line": 25, "column": 55}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
          {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 25, "column": 55}, "end": {"line": 25, "column": 60}}, "children": [
            {"type": "StringSegmentSyntax", "range": {"start": {"line": 25, "column": 55}, "end": {"line": 25, "column": 60}}, "children": [
              {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 55}, "end": {"line": 25, "column": 60}}, "token": {"kind": "stringSegment", "text": "heart"}, "children": []},
            ]},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 60}, "end": {"line": 25, "column": 61}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 25, "column": 61}, "end": {"line": 25, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
    {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 25, "column": 62}, "end": {"line": 25, "column": 62}}, "children": []},
  ]},
]

# Parser output for `Text("Connect the Apple Health app")` at 24:9.
does_not_warn_for_apple_health_copy_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 45}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 13}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 13}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 13}, "end": {"line": 24, "column": 14}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 14}, "end": {"line": 24, "column": 44}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 14}, "end": {"line": 24, "column": 44}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 14}, "end": {"line": 24, "column": 44}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 14}, "end": {"line": 24, "column": 15}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 43}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 43}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 43}}, "token": {"kind": "stringSegment", "text": "Connect the Apple Health app"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 43}, "end": {"line": 24, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 44}, "end": {"line": 24, "column": 45}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 45}, "end": {"line": 24, "column": 45}}, "children": []},
]}

# Parser output for `Logger(subsystem: "com.example.app", category: "HealthKit")` at 31:13.
does_not_warn_for_non_visible_healthkit_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 72}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 13}, "end": {"line": 31, "column": 19}}, "token": {"kind": "identifier", "text": "Logger"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 19}, "end": {"line": 31, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 71}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 20}, "end": {"line": 31, "column": 29}}, "token": {"kind": "identifier", "text": "subsystem"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 29}, "end": {"line": 31, "column": 30}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 31}, "end": {"line": 31, "column": 48}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 31}, "end": {"line": 31, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 47}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 47}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 32}, "end": {"line": 31, "column": 47}}, "token": {"kind": "stringSegment", "text": "com.example.app"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 47}, "end": {"line": 31, "column": 48}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 48}, "end": {"line": 31, "column": 49}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 50}, "end": {"line": 31, "column": 71}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 50}, "end": {"line": 31, "column": 58}}, "token": {"kind": "identifier", "text": "category"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 58}, "end": {"line": 31, "column": 59}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 60}, "end": {"line": 31, "column": 71}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 60}, "end": {"line": 31, "column": 61}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 61}, "end": {"line": 31, "column": 70}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 61}, "end": {"line": 31, "column": 70}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 61}, "end": {"line": 31, "column": 70}}, "token": {"kind": "stringSegment", "text": "HealthKit"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 70}, "end": {"line": 31, "column": 71}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 71}, "end": {"line": 31, "column": 72}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 72}, "end": {"line": 31, "column": 72}}, "children": []},
]}
