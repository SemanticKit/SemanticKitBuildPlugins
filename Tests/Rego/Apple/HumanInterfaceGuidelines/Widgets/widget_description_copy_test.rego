package apple.hig.widgets.widget_description_copy

test_warns_for_widget_description_boilerplate_lead_in if {
  result := decision with input as warns_for_widget_description_boilerplate_lead_in_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.widgets.review_widget_description_lead_in"
  result.warn[0].message == "Review widget description lead-in; start with an action verb instead of boilerplate widget copy."
  result.warn[0].line == 28
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_warns_for_each_discouraged_widget_description_lead_in if {
  forecast_result := decision with input as warns_for_each_discouraged_widget_description_lead_in_forecast_result_node

  checklist_result := decision with input as warns_for_each_discouraged_widget_description_lead_in_checklist_result_node

  count(forecast_result.warn) == 1
  count(checklist_result.warn) == 1
  forecast_result.warn[0].line == 31
  checklist_result.warn[0].line == 42
}

test_does_not_warn_for_action_verb_widget_description if {
  result := decision with input as does_not_warn_for_action_verb_widget_description_node

  count(result.warn) == 0
}

test_does_not_warn_for_boilerplate_on_unrelated_call if {
  result := decision with input as does_not_warn_for_boilerplate_on_unrelated_call_node

  count(result.warn) == 0
}

# Parser output for `configuration.description("This widget shows current trail conditions")` at 28:8.
warns_for_widget_description_boilerplate_lead_in_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 79}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 8}, "end": {"line": 28, "column": 21}}, "token": {"kind": "identifier", "text": "configuration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 21}, "end": {"line": 28, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 28, "column": 22}, "end": {"line": 28, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 22}, "end": {"line": 28, "column": 33}}, "token": {"kind": "identifier", "text": "description"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 33}, "end": {"line": 28, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 78}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 78}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 78}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 34}, "end": {"line": 28, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 28, "column": 35}, "end": {"line": 28, "column": 77}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 28, "column": 35}, "end": {"line": 28, "column": 77}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 35}, "end": {"line": 28, "column": 77}}, "token": {"kind": "stringSegment", "text": "This widget shows current trail conditions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 77}, "end": {"line": 28, "column": 78}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 28, "column": 78}, "end": {"line": 28, "column": 79}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 28, "column": 79}, "end": {"line": 28, "column": 79}}, "children": []},
]}

# Parser output for `configuration.description("Use this widget to check the forecast")` at 31:10.
warns_for_each_discouraged_widget_description_lead_in_forecast_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 76}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 35}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 10}, "end": {"line": 31, "column": 23}}, "token": {"kind": "identifier", "text": "configuration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 23}, "end": {"line": 31, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 31, "column": 24}, "end": {"line": 31, "column": 35}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 24}, "end": {"line": 31, "column": 35}}, "token": {"kind": "identifier", "text": "description"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 35}, "end": {"line": 31, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 75}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 75}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 75}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 36}, "end": {"line": 31, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 74}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 74}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 37}, "end": {"line": 31, "column": 74}}, "token": {"kind": "stringSegment", "text": "Use this widget to check the forecast"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 74}, "end": {"line": 31, "column": 75}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 31, "column": 75}, "end": {"line": 31, "column": 76}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 31, "column": 76}, "end": {"line": 31, "column": 76}}, "children": []},
]}

# Parser output for `configuration.description("Add this widget for quick checklist access")` at 42:10.
warns_for_each_discouraged_widget_description_lead_in_checklist_result_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 10}, "end": {"line": 42, "column": 81}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 42, "column": 10}, "end": {"line": 42, "column": 35}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 10}, "end": {"line": 42, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 10}, "end": {"line": 42, "column": 23}}, "token": {"kind": "identifier", "text": "configuration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 35}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 35}}, "token": {"kind": "identifier", "text": "description"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 35}, "end": {"line": 42, "column": 36}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 80}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 80}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 80}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 36}, "end": {"line": 42, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 79}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 79}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 37}, "end": {"line": 42, "column": 79}}, "token": {"kind": "stringSegment", "text": "Add this widget for quick checklist access"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 79}, "end": {"line": 42, "column": 80}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 80}, "end": {"line": 42, "column": 81}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 81}, "end": {"line": 42, "column": 81}}, "children": []},
]}

# Parser output for `configuration.description("Check current trail conditions")` at 33:8.
does_not_warn_for_action_verb_widget_description_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 33, "column": 8}, "end": {"line": 33, "column": 67}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 33, "column": 8}, "end": {"line": 33, "column": 33}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 8}, "end": {"line": 33, "column": 21}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 8}, "end": {"line": 33, "column": 21}}, "token": {"kind": "identifier", "text": "configuration"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 21}, "end": {"line": 33, "column": 22}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 33, "column": 22}, "end": {"line": 33, "column": 33}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 22}, "end": {"line": 33, "column": 33}}, "token": {"kind": "identifier", "text": "description"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 33}, "end": {"line": 33, "column": 34}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 66}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 66}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 66}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 34}, "end": {"line": 33, "column": 35}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 65}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 65}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 35}, "end": {"line": 33, "column": 65}}, "token": {"kind": "stringSegment", "text": "Check current trail conditions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 65}, "end": {"line": 33, "column": 66}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 33, "column": 66}, "end": {"line": 33, "column": 67}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 33, "column": 67}, "end": {"line": 33, "column": 67}}, "children": []},
]}

# Parser output for `Text("This widget shows current trail conditions")` at 44:12.
does_not_warn_for_boilerplate_on_unrelated_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 62}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 16}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 12}, "end": {"line": 44, "column": 16}}, "token": {"kind": "identifier", "text": "Text"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 16}, "end": {"line": 44, "column": 17}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 61}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 61}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 61}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 17}, "end": {"line": 44, "column": 18}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 44, "column": 18}, "end": {"line": 44, "column": 60}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 44, "column": 18}, "end": {"line": 44, "column": 60}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 18}, "end": {"line": 44, "column": 60}}, "token": {"kind": "stringSegment", "text": "This widget shows current trail conditions"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 60}, "end": {"line": 44, "column": 61}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 44, "column": 61}, "end": {"line": 44, "column": 62}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 44, "column": 62}, "end": {"line": 44, "column": 62}}, "children": []},
]}
