package apple.hig.patterns.rating_prompt

test_warns_for_custom_button_with_rate_text if {
  result := decision with input as warns_for_custom_button_with_rate_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_rating_prompt"
  result.warn[0].message == "Review custom rating prompt; prefer the system rating prompt and ask only after engagement."
  result.warn[0].line == 42
  result.warn[0].column == 17
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_request_review_call if {
  result := decision with input as does_not_warn_for_request_review_call_node

  count(result.warn) == 0
}

# Parser output for `Button("Rate This App", action: rateApp)` at 42:17.
warns_for_custom_button_with_rate_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 57}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 23}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 17}, "end": {"line": 42, "column": 23}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 23}, "end": {"line": 42, "column": 24}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 56}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 40}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 39}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 24}, "end": {"line": 42, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 38}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 38}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 25}, "end": {"line": 42, "column": 38}}, "token": {"kind": "stringSegment", "text": "Rate This App"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 38}, "end": {"line": 42, "column": 39}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 39}, "end": {"line": 42, "column": 40}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 42, "column": 41}, "end": {"line": 42, "column": 56}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 41}, "end": {"line": 42, "column": 47}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 47}, "end": {"line": 42, "column": 48}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 56}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 49}, "end": {"line": 42, "column": 56}}, "token": {"kind": "identifier", "text": "rateApp"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 42, "column": 56}, "end": {"line": 42, "column": 57}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 42, "column": 57}, "end": {"line": 42, "column": 57}}, "children": []},
]}

# Parser output for `requestReview("Review")` at 51:9.
does_not_warn_for_request_review_call_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 32}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 22}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 9}, "end": {"line": 51, "column": 22}}, "token": {"kind": "identifier", "text": "requestReview"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 22}, "end": {"line": 51, "column": 23}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 31}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 31}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 31}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 23}, "end": {"line": 51, "column": 24}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 30}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 30}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 24}, "end": {"line": 51, "column": 30}}, "token": {"kind": "stringSegment", "text": "Review"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 30}, "end": {"line": 51, "column": 31}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 51, "column": 31}, "end": {"line": 51, "column": 32}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 51, "column": 32}, "end": {"line": 51, "column": 32}}, "children": []},
]}
