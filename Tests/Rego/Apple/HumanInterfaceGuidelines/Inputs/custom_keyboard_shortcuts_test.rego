package apple.hig.inputs.custom_keyboard_shortcuts

test_warns_for_custom_keyboard_shortcut_swift_syntax if {
  result := decision with input as warns_for_custom_keyboard_shortcut_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_custom_keyboard_shortcut"
  result.warn[0].message == "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary."
  result.warn[0].line == 18
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_keyboard_shortcut_swift_syntax if {
  result := decision with input as does_not_warn_for_non_keyboard_shortcut_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `refreshButton.keyboardShortcut("R")` at 18:12.
warns_for_custom_keyboard_shortcut_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 47}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 42}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 25}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 12}, "end": {"line": 18, "column": 25}}, "token": {"kind": "identifier", "text": "refreshButton"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 26}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 42}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 26}, "end": {"line": 18, "column": 42}}, "token": {"kind": "identifier", "text": "keyboardShortcut"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 42}, "end": {"line": 18, "column": 43}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 46}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 46}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 46}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 43}, "end": {"line": 18, "column": 44}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 45}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 44}, "end": {"line": 18, "column": 45}}, "token": {"kind": "stringSegment", "text": "R"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 46}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 46}, "end": {"line": 18, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 47}}, "children": []},
]}

# Parser output for `refreshButton.buttonStyle("R")` at 24:10.
does_not_warn_for_non_keyboard_shortcut_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 10}, "end": {"line": 24, "column": 40}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 24, "column": 10}, "end": {"line": 24, "column": 35}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 10}, "end": {"line": 24, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 10}, "end": {"line": 24, "column": 23}}, "token": {"kind": "identifier", "text": "refreshButton"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 23}, "end": {"line": 24, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 24}, "end": {"line": 24, "column": 35}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 24}, "end": {"line": 24, "column": 35}}, "token": {"kind": "identifier", "text": "buttonStyle"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 35}, "end": {"line": 24, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 39}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 38}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 37}, "end": {"line": 24, "column": 38}}, "token": {"kind": "stringSegment", "text": "R"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 39}, "end": {"line": 24, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 40}, "end": {"line": 24, "column": 40}}, "children": []},
]}
