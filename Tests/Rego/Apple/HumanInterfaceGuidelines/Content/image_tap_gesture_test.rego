package apple.hig.content.image_tap_gesture

test_warns_for_on_tap_gesture if {
  result := decision with input as warns_for_on_tap_gesture_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.content.review_tap_gesture_action"
  result.warn[0].message == "Review tap gesture action; use a Button when visible content initiates an action."
  result.warn[0].line == 22
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_open if {
  result := decision with input as does_not_warn_for_button_open_node

  count(result.warn) == 0
}

# Parser output for `photo.onTapGesture { openPhoto() }` at 22:15.
warns_for_on_tap_gesture_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 49}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 20}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 15}, "end": {"line": 22, "column": 20}}, "token": {"kind": "identifier", "text": "photo"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 20}, "end": {"line": 22, "column": 21}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 33}}, "token": {"kind": "identifier", "text": "onTapGesture"}, "children": []},
    ]},
  ]},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 34}}, "children": []},
  {"type": "ClosureExprSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 49}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 34}, "end": {"line": 22, "column": 35}}, "token": {"kind": "leftBrace", "text": "{"}, "children": []},
    {"type": "CodeBlockItemListSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 47}}, "children": [
      {"type": "CodeBlockItemSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 47}}, "children": [
        {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 47}}, "children": [
          {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 45}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 45}}, "token": {"kind": "identifier", "text": "openPhoto"}, "children": []},
          ]},
          {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 45}, "end": {"line": 22, "column": 46}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
          {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 46}, "end": {"line": 22, "column": 46}}, "children": []},
          {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 46}, "end": {"line": 22, "column": 47}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
          {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 48}, "end": {"line": 22, "column": 48}}, "children": []},
        ]},
      ]},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 48}, "end": {"line": 22, "column": 49}}, "token": {"kind": "rightBrace", "text": "}"}, "children": []},
  ]},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 49}, "end": {"line": 22, "column": 49}}, "children": []},
]}

# Parser output for `Button("Open", action: openPhoto)` at 30:9.
does_not_warn_for_button_open_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 42}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 9}, "end": {"line": 30, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 15}, "end": {"line": 30, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 41}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 23}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 22}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 16}, "end": {"line": 30, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 21}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 21}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 17}, "end": {"line": 30, "column": 21}}, "token": {"kind": "stringSegment", "text": "Open"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 21}, "end": {"line": 30, "column": 22}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 22}, "end": {"line": 30, "column": 23}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 30, "column": 24}, "end": {"line": 30, "column": 41}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 24}, "end": {"line": 30, "column": 30}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 30}, "end": {"line": 30, "column": 31}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 30, "column": 32}, "end": {"line": 30, "column": 41}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 32}, "end": {"line": 30, "column": 41}}, "token": {"kind": "identifier", "text": "openPhoto"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 30, "column": 41}, "end": {"line": 30, "column": 42}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 30, "column": 42}, "end": {"line": 30, "column": 42}}, "children": []},
]}
