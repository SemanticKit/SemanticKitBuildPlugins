package apple.hig.accessibility.fixed_font_size

test_warns_for_literal_system_font_size if {
  result := decision with input as fixed_system_font_size_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_fixed_font_size"
  result.warn[0].message == "Review literal SwiftUI system font size use; support larger text sizes."
  result.warn[0].line == 12
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_warns_for_literal_system_font_size_in_implicit_member if {
  result := decision with input as fixed_system_font_size_with_weight_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_fixed_font_size"
  result.warn[0].message == "Review literal SwiftUI system font size use; support larger text sizes."
  result.warn[0].line == 14
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_text_style_system_font if {
  result := decision with input as dynamic_text_style_font_node

  count(result.warn) == 0
}

test_does_not_warn_for_custom_font_size if {
  result := decision with input as custom_font_size_node

  count(result.warn) == 0
}

# Parser output for `Font.system(size: 17)` at 12:19.
fixed_system_font_size_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 12, "column": 19}, "end": {"line": 12, "column": 40}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 12, "column": 19}, "end": {"line": 12, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 19}, "end": {"line": 12, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 19}, "end": {"line": 12, "column": 23}}, "token": {"kind": "identifier", "text": "Font"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 23}, "end": {"line": 12, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 24}, "end": {"line": 12, "column": 30}}, "token": {"kind": "identifier", "text": "system"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 30}, "end": {"line": 12, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 39}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 39}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 31}, "end": {"line": 12, "column": 35}}, "token": {"kind": "identifier", "text": "size"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 35}, "end": {"line": 12, "column": 36}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 12, "column": 37}, "end": {"line": 12, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 37}, "end": {"line": 12, "column": 39}}, "token": {"kind": "integerLiteral", "text": "17"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 12, "column": 39}, "end": {"line": 12, "column": 40}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 12, "column": 40}, "end": {"line": 12, "column": 40}}, "children": []},
]}

# Parser output for `.system(size: 13.5, weight: .semibold)` at 14:19.
fixed_system_font_size_with_weight_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 57}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 26}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 19}, "end": {"line": 14, "column": 20}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 20}, "end": {"line": 14, "column": 26}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 20}, "end": {"line": 14, "column": 26}}, "token": {"kind": "identifier", "text": "system"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 26}, "end": {"line": 14, "column": 27}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 27}, "end": {"line": 14, "column": 56}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 27}, "end": {"line": 14, "column": 38}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 27}, "end": {"line": 14, "column": 31}}, "token": {"kind": "identifier", "text": "size"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 31}, "end": {"line": 14, "column": 32}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "FloatLiteralExprSyntax", "range": {"start": {"line": 14, "column": 33}, "end": {"line": 14, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 33}, "end": {"line": 14, "column": 37}}, "token": {"kind": "floatLiteral", "text": "13.5"}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 37}, "end": {"line": 14, "column": 38}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 56}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 39}, "end": {"line": 14, "column": 45}}, "token": {"kind": "identifier", "text": "weight"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 45}, "end": {"line": 14, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 14, "column": 47}, "end": {"line": 14, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 47}, "end": {"line": 14, "column": 48}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 48}, "end": {"line": 14, "column": 56}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 48}, "end": {"line": 14, "column": 56}}, "token": {"kind": "identifier", "text": "semibold"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 56}, "end": {"line": 14, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 57}, "end": {"line": 14, "column": 57}}, "children": []},
]}

# Parser output for `Font.system(.body)` at 16:19.
dynamic_text_style_font_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 16, "column": 19}, "end": {"line": 16, "column": 37}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 16, "column": 19}, "end": {"line": 16, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 19}, "end": {"line": 16, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 19}, "end": {"line": 16, "column": 23}}, "token": {"kind": "identifier", "text": "Font"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 23}, "end": {"line": 16, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 24}, "end": {"line": 16, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 24}, "end": {"line": 16, "column": 30}}, "token": {"kind": "identifier", "text": "system"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 30}, "end": {"line": 16, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 16, "column": 31}, "end": {"line": 16, "column": 36}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 16, "column": 31}, "end": {"line": 16, "column": 36}}, "children": [
      {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 16, "column": 31}, "end": {"line": 16, "column": 36}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 31}, "end": {"line": 16, "column": 32}}, "token": {"kind": "period", "text": "."}, "children": []},
        {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 16, "column": 32}, "end": {"line": 16, "column": 36}}, "children": [
          {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 32}, "end": {"line": 16, "column": 36}}, "token": {"kind": "identifier", "text": "body"}, "children": []},
        ]},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 16, "column": 36}, "end": {"line": 16, "column": 37}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 16, "column": 37}, "end": {"line": 16, "column": 37}}, "children": []},
]}

# Parser output for `Font.custom("Avenir", size: 17)` at 18:19.
custom_font_size_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 50}}, "children": [
  {"type": "MemberAccessExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 30}}, "children": [
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 23}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 23}}, "token": {"kind": "identifier", "text": "Font"}, "children": []},
    ]},
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 23}, "end": {"line": 18, "column": 24}}, "token": {"kind": "period", "text": "."}, "children": []},
    {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 30}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 30}}, "token": {"kind": "identifier", "text": "custom"}, "children": []},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 30}, "end": {"line": 18, "column": 31}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 49}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 40}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 31}, "end": {"line": 18, "column": 32}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 32}, "end": {"line": 18, "column": 38}}, "token": {"kind": "stringSegment", "text": "Avenir"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 38}, "end": {"line": 18, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 39}, "end": {"line": 18, "column": 40}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 49}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 45}}, "token": {"kind": "identifier", "text": "size"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 45}, "end": {"line": 18, "column": 46}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "IntegerLiteralExprSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 49}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 47}, "end": {"line": 18, "column": 49}}, "token": {"kind": "integerLiteral", "text": "17"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 49}, "end": {"line": 18, "column": 50}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 50}, "end": {"line": 18, "column": 50}}, "children": []},
]}
