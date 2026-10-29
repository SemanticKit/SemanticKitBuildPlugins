package apple.hig.presentation.open_window_action

test_reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].message == "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate."
  result.warn[0].line == 19
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].line == 42
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_review_open_url_swift_syntax if {
  result := decision with input as does_not_review_open_url_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_review_open_window_action_without_open_window_swift_syntax if {
  result := decision with input as does_not_review_open_window_action_without_open_window_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `openWindow(id: "document")` at 19:9.
reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 19, "column": 9}, "end": {"line": 19, "column": 35}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 19, "column": 9}, "end": {"line": 19, "column": 19}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 9}, "end": {"line": 19, "column": 19}}, "token": {"kind": "identifier", "text": "openWindow"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 19}, "end": {"line": 19, "column": 20}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 19, "column": 20}, "end": {"line": 19, "column": 34}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 19, "column": 20}, "end": {"line": 19, "column": 34}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 20}, "end": {"line": 19, "column": 22}}, "token": {"kind": "identifier", "text": "id"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 22}, "end": {"line": 19, "column": 23}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 34}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 24}, "end": {"line": 19, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 19, "column": 25}, "end": {"line": 19, "column": 33}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 19, "column": 25}, "end": {"line": 19, "column": 33}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 25}, "end": {"line": 19, "column": 33}}, "token": {"kind": "stringSegment", "text": "document"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 33}, "end": {"line": 19, "column": 34}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 19, "column": 34}, "end": {"line": 19, "column": 35}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 19, "column": 35}, "end": {"line": 19, "column": 35}}, "children": []},
]}

# Parser output for `environment.openWindow(id: "detail", value: detail.id)` at 42:15.
reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 69}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 37}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 15}, "end": {"line": 42, "column": 26}}, "token": {"kind": "identifier", "text": "environment"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 26}, "end": {"line": 42, "column": 27}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 37}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 27}, "end": {"line": 42, "column": 37}}, "token": {"kind": "identifier", "text": "openWindow"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 38}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 68}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 51}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 40}}, "token": {"kind": "identifier", "text": "id"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 40}, "end": {"line": 42, "column": 41}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 50}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 42}, "end": {"line": 42, "column": 43}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 43}, "end": {"line": 42, "column": 49}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 43}, "end": {"line": 42, "column": 49}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 43}, "end": {"line": 42, "column": 49}}, "token": {"kind": "stringSegment", "text": "detail"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 50}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 50}, "end": {"line": 42, "column": 51}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 52}, "end": {"line": 42, "column": 68}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 52}, "end": {"line": 42, "column": 57}}, "token": {"kind": "identifier", "text": "value"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 58}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 68}}, "children": [
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 65}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 59}, "end": {"line": 42, "column": 65}}, "token": {"kind": "identifier", "text": "detail"}, "children": []},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 65}, "end": {"line": 42, "column": 66}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 66}, "end": {"line": 42, "column": 68}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 66}, "end": {"line": 42, "column": 68}}, "token": {"kind": "identifier", "text": "id"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 68}, "end": {"line": 42, "column": 69}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 69}, "end": {"line": 42, "column": 69}}, "children": []},
]}

# Parser output for `openURL(documentURL)` at 31:9.
does_not_review_open_url_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 29}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 9}, "end": {"line": 31, "column": 16}}, "token": {"kind": "identifier", "text": "openURL"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 16}, "end": {"line": 31, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 28}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 28}}, "children": [
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 28}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 17}, "end": {"line": 31, "column": 28}}, "token": {"kind": "identifier", "text": "documentURL"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 28}, "end": {"line": 31, "column": 29}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 29}, "end": {"line": 31, "column": 29}}, "children": []},
]}

# Parser output for `OpenWindowAction()` at 52:13.
does_not_review_open_window_action_without_open_window_swift_syntax_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 52, "column": 13}, "end": {"line": 52, "column": 31}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 52, "column": 13}, "end": {"line": 52, "column": 29}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 13}, "end": {"line": 52, "column": 29}}, "token": {"kind": "identifier", "text": "OpenWindowAction"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 29}, "end": {"line": 52, "column": 30}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 52, "column": 30}, "end": {"line": 52, "column": 30}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 52, "column": 30}, "end": {"line": 52, "column": 31}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 52, "column": 31}, "end": {"line": 52, "column": 31}}, "children": []},
]}
