package apple.hig.patterns.share_button

test_warns_for_custom_button_with_share_text if {
  result := decision with input as warns_for_custom_button_with_share_text_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_share_button"
  result.warn[0].message == "Review custom Share control; prefer ShareLink or the system share sheet where available."
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_sharelink if {
  result := decision with input as does_not_warn_for_sharelink_node

  count(result.warn) == 0
}

# Parser output for `Button("Share", action: share)` at 18:11.
warns_for_custom_button_with_share_text_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 41}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 17}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 11}, "end": {"line": 18, "column": 17}}, "token": {"kind": "identifier", "text": "Button"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 17}, "end": {"line": 18, "column": 18}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 40}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 26}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 25}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 18}, "end": {"line": 18, "column": 19}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 24}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 24}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 19}, "end": {"line": 18, "column": 24}}, "token": {"kind": "stringSegment", "text": "Share"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 24}, "end": {"line": 18, "column": 25}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 25}, "end": {"line": 18, "column": 26}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 40}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 27}, "end": {"line": 18, "column": 33}}, "token": {"kind": "identifier", "text": "action"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 33}, "end": {"line": 18, "column": 34}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 40}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 35}, "end": {"line": 18, "column": 40}}, "token": {"kind": "identifier", "text": "share"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 18, "column": 40}, "end": {"line": 18, "column": 41}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 18, "column": 41}, "end": {"line": 18, "column": 41}}, "children": []},
]}

# Parser output for `ShareLink("Share", item: url)` at 26:9.
does_not_warn_for_sharelink_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 18}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 9}, "end": {"line": 26, "column": 18}}, "token": {"kind": "identifier", "text": "ShareLink"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 18}, "end": {"line": 26, "column": 19}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 26, "column": 19}, "end": {"line": 26, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 19}, "end": {"line": 26, "column": 27}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 26, "column": 19}, "end": {"line": 26, "column": 26}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 19}, "end": {"line": 26, "column": 20}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 26, "column": 20}, "end": {"line": 26, "column": 25}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 26, "column": 20}, "end": {"line": 26, "column": 25}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 20}, "end": {"line": 26, "column": 25}}, "token": {"kind": "stringSegment", "text": "Share"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 25}, "end": {"line": 26, "column": 26}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 26}, "end": {"line": 26, "column": 27}}, "token": {"kind": "comma", "text": ","}, "children": []},
    ]},
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 26, "column": 28}, "end": {"line": 26, "column": 37}}, "children": [
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 28}, "end": {"line": 26, "column": 32}}, "token": {"kind": "identifier", "text": "item"}, "children": []},
      {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 32}, "end": {"line": 26, "column": 33}}, "token": {"kind": "colon", "text": ":"}, "children": []},
      {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 26, "column": 34}, "end": {"line": 26, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 34}, "end": {"line": 26, "column": 37}}, "token": {"kind": "identifier", "text": "url"}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 26, "column": 37}, "end": {"line": 26, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 26, "column": 38}, "end": {"line": 26, "column": 38}}, "children": []},
]}
