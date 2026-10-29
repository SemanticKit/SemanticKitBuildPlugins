package apple.hig.patterns.undo_redo_controls

test_warns_for_custom_button_with_undo_text if {
  result := decision with input as warns_for_custom_button_with_undo_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_undo_redo_control"
  result.warn[0].message == "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols."
  result.warn[0].line == 12
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_restore_route_button if {
  result := decision with input as does_not_warn_for_restore_route_button_node

  count(result.warn) == 0
}

# Parser output for `Button("Undo", action: undo)` at 12:9.
warns_for_custom_button_with_undo_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 37}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 9}, "end": {"line": 12, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 15}, "end": {"line": 12, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 23}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 16}, "end": {"line": 12, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 12, "column": 17}, "end": {"line": 12, "column": 21}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 12, "column": 17}, "end": {"line": 12, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 17}, "end": {"line": 12, "column": 21}}, "token": {"kind": "stringSegment", "text": "Undo"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 21}, "end": {"line": 12, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 22}, "end": {"line": 12, "column": 23}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 36}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 30}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 30}, "end": {"line": 12, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 32}, "end": {"line": 12, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 32}, "end": {"line": 12, "column": 36}}, "token": {"kind": "identifier", "text": "undo"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 36}, "end": {"line": 12, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 37}, "end": {"line": 12, "column": 37}}, "children": []},
]}

# Parser output for `Button("Restore Route", action: restoreRoute)` at 22:13.
does_not_warn_for_restore_route_button_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 13}, "end": {"line": 22, "column": 58}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 13}, "end": {"line": 22, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 13}, "end": {"line": 22, "column": 19}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 19}, "end": {"line": 22, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 57}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 36}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 35}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 21}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 34}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 34}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 34}}, "token": {"kind": "stringSegment", "text": "Restore Route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 35}, "end": {"line": 22, "column": 36}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 37}, "end": {"line": 22, "column": 57}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 37}, "end": {"line": 22, "column": 43}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 43}, "end": {"line": 22, "column": 44}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 45}, "end": {"line": 22, "column": 57}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 45}, "end": {"line": 22, "column": 57}}, "token": {"kind": "identifier", "text": "restoreRoute"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 57}, "end": {"line": 22, "column": 58}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 58}, "end": {"line": 22, "column": 58}}, "children": []},
]}
