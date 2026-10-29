package apple.hig.patterns.progress_indicator

test_warns_for_progress_view_with_no_arguments if {
  result := decision with input as warns_for_progress_view_with_no_arguments_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_indeterminate_progress_indicator"
  result.warn[0].message == "Review indeterminate progress indicator; set expectations for long-running work."
  result.warn[0].line == 14
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_progress_view_with_label if {
  result := decision with input as does_not_warn_for_progress_view_with_label_node

  count(result.warn) == 0
}

# Parser output for `ProgressView()` at 14:9.
warns_for_progress_view_with_no_arguments_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 14, "column": 9}, "end": {"line": 14, "column": 23}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 14, "column": 9}, "end": {"line": 14, "column": 21}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 9}, "end": {"line": 14, "column": 21}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 21}, "end": {"line": 14, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 14, "column": 22}, "end": {"line": 14, "column": 22}}, "children": []},
  {"type": "TokenSyntax", "range": {"start": {"line": 14, "column": 22}, "end": {"line": 14, "column": 23}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 14, "column": 23}, "end": {"line": 14, "column": 23}}, "children": []},
]}

# Parser output for `ProgressView("Loading route")` at 22:9.
does_not_warn_for_progress_view_with_label_node := {"type": "FunctionCallExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 38}}, "children": [
  {"type": "DeclReferenceExprSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 21}}, "children": [
    {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 9}, "end": {"line": 22, "column": 21}}, "token": {"kind": "identifier", "text": "ProgressView"}, "children": []},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 21}, "end": {"line": 22, "column": 22}}, "token": {"kind": "leftParen", "text": "("}, "children": []},
  {"type": "LabeledExprListSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 37}}, "children": [
    {"type": "LabeledExprSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 37}}, "children": [
      {"type": "StringLiteralExprSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 37}}, "children": [
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 22}, "end": {"line": 22, "column": 23}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
        {"type": "StringLiteralSegmentListSyntax", "range": {"start": {"line": 22, "column": 23}, "end": {"line": 22, "column": 36}}, "children": [
          {"type": "StringSegmentSyntax", "range": {"start": {"line": 22, "column": 23}, "end": {"line": 22, "column": 36}}, "children": [
            {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 23}, "end": {"line": 22, "column": 36}}, "token": {"kind": "stringSegment", "text": "Loading route"}, "children": []},
          ]},
        ]},
        {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 36}, "end": {"line": 22, "column": 37}}, "token": {"kind": "stringQuote", "text": "\""}, "children": []},
      ]},
    ]},
  ]},
  {"type": "TokenSyntax", "range": {"start": {"line": 22, "column": 37}, "end": {"line": 22, "column": 38}}, "token": {"kind": "rightParen", "text": ")"}, "children": []},
  {"type": "MultipleTrailingClosureElementListSyntax", "range": {"start": {"line": 22, "column": 38}, "end": {"line": 22, "column": 38}}, "children": []},
]}
