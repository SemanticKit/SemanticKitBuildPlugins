package apple.hig.presentation.destructive_action_labels

test_warns_for_button_delete_route_label if {
  result := decision with input as warns_for_button_delete_route_label_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_destructive_action_label"
  result.warn[0].message == "Review destructive action; use destructive styling and provide a clear cancel path."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_save_route_label if {
  result := decision with input as does_not_warn_for_button_save_route_label_node

  count(result.warn) == 0
}

# Parser output for `Button("Delete Route", action: deleteRoute)` at 18:9.
warns_for_button_delete_route_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 52}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 9}, "end": {"line": 18, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 15}, "end": {"line": 18, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 51}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 31}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 30}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 16}, "end": {"line": 18, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 29}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 29}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 29}}, "token": {"kind": "stringSegment", "text": "Delete Route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 29}, "end": {"line": 18, "column": 30}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 51}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 51}}, "token": {"kind": "identifier", "text": "deleteRoute"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 51}, "end": {"line": 18, "column": 52}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 52}, "end": {"line": 18, "column": 52}}, "children": []},
]}

# Parser output for `Button("Save Route", action: saveRoute)` at 24:9.
does_not_warn_for_button_save_route_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 48}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 9}, "end": {"line": 24, "column": 15}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 15}, "end": {"line": 24, "column": 16}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 47}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 29}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 16}, "end": {"line": 24, "column": 17}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 27}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 27}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 17}, "end": {"line": 24, "column": 27}}, "token": {"kind": "stringSegment", "text": "Save Route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 27}, "end": {"line": 24, "column": 28}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 28}, "end": {"line": 24, "column": 29}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 47}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 30}, "end": {"line": 24, "column": 36}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 36}, "end": {"line": 24, "column": 37}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 47}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 38}, "end": {"line": 24, "column": 47}}, "token": {"kind": "identifier", "text": "saveRoute"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 24, "column": 47}, "end": {"line": 24, "column": 48}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 24, "column": 48}, "end": {"line": 24, "column": 48}}, "children": []},
]}
