package apple.hig.writing.click_here_label

test_warns_for_click_here_button_label_swift_syntax if {
  result := decision with input as warns_for_click_here_button_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
  result.warn[0].message == "Review visible string literal containing Click here; use action-oriented button or link label copy."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_click_here_link_label_swift_syntax if {
  result := decision with input as warns_for_click_here_link_label_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
}

test_does_not_warn_for_action_oriented_visible_label_swift_syntax if {
  result := {"warn": [warning |
    node := does_not_warn_for_action_oriented_visible_label_swift_syntax_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_text_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_text_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

test_does_not_warn_for_label_click_here_string_swift_syntax if {
  result := decision with input as does_not_warn_for_label_click_here_string_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Button("Click here", action: learnMore)` at 18:9.
warns_for_click_here_button_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}, {"baseName": "learnMore", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 38, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 27, "line": 18}, "start": {"column": 17, "line": 18}}}}]}}, "range": {"end": {"column": 29, "line": 18}, "start": {"column": 16, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "learnMore", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 38, "line": 18}}}}, "label": "action", "range": {"end": {"column": 47, "line": 18}, "start": {"column": 30, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 48, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 18}, "start": {"column": 16, "line": 18}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 27, "line": 18}, "start": {"column": 17, "line": 18}}}}]}]}

# Parser output for `Link("Click here to learn more", destination: helpURL)` at 27:11.
warns_for_click_here_link_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Link", "range": {"end": {"column": 15, "line": 27}, "start": {"column": 11, "line": 27}}}, {"baseName": "helpURL", "range": {"end": {"column": 64, "line": 27}, "start": {"column": 57, "line": 27}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 42, "line": 27}, "start": {"column": 16, "line": 27}}, "segments": [{"stringSegment": {"content": "Click here to learn more", "range": {"end": {"column": 41, "line": 27}, "start": {"column": 17, "line": 27}}}}]}}, "range": {"end": {"column": 43, "line": 27}, "start": {"column": 16, "line": 27}}}, {"expression": {"declReferenceExpr": {"baseName": "helpURL", "range": {"end": {"column": 64, "line": 27}, "start": {"column": 57, "line": 27}}}}, "label": "destination", "range": {"end": {"column": 64, "line": 27}, "start": {"column": 44, "line": 27}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Link", "range": {"end": {"column": 15, "line": 27}, "start": {"column": 11, "line": 27}}}}, "range": {"end": {"column": 65, "line": 27}, "start": {"column": 11, "line": 27}}}], "stringLiteralExprs": [{"range": {"end": {"column": 42, "line": 27}, "start": {"column": 16, "line": 27}}, "segments": [{"stringSegment": {"content": "Click here to learn more", "range": {"end": {"column": 41, "line": 27}, "start": {"column": 17, "line": 27}}}}]}]}

# Parser output for `Button("Learn More", action: learnMore)` at 34:9.
# Parser output for `Link("View Details", destination: detailsURL)` at 35:9.
does_not_warn_for_action_oriented_visible_label_swift_syntax_nodes := [
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 34}, "start": {"column": 9, "line": 34}}}, {"baseName": "learnMore", "range": {"end": {"column": 47, "line": 34}, "start": {"column": 38, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 34}, "start": {"column": 16, "line": 34}}, "segments": [{"stringSegment": {"content": "Learn More", "range": {"end": {"column": 27, "line": 34}, "start": {"column": 17, "line": 34}}}}]}}, "range": {"end": {"column": 29, "line": 34}, "start": {"column": 16, "line": 34}}}, {"expression": {"declReferenceExpr": {"baseName": "learnMore", "range": {"end": {"column": 47, "line": 34}, "start": {"column": 38, "line": 34}}}}, "label": "action", "range": {"end": {"column": 47, "line": 34}, "start": {"column": 30, "line": 34}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 34}, "start": {"column": 9, "line": 34}}}}, "range": {"end": {"column": 48, "line": 34}, "start": {"column": 9, "line": 34}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 34}, "start": {"column": 16, "line": 34}}, "segments": [{"stringSegment": {"content": "Learn More", "range": {"end": {"column": 27, "line": 34}, "start": {"column": 17, "line": 34}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Link", "range": {"end": {"column": 13, "line": 35}, "start": {"column": 9, "line": 35}}}, {"baseName": "detailsURL", "range": {"end": {"column": 53, "line": 35}, "start": {"column": 43, "line": 35}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 35}, "start": {"column": 14, "line": 35}}, "segments": [{"stringSegment": {"content": "View Details", "range": {"end": {"column": 27, "line": 35}, "start": {"column": 15, "line": 35}}}}]}}, "range": {"end": {"column": 29, "line": 35}, "start": {"column": 14, "line": 35}}}, {"expression": {"declReferenceExpr": {"baseName": "detailsURL", "range": {"end": {"column": 53, "line": 35}, "start": {"column": 43, "line": 35}}}}, "label": "destination", "range": {"end": {"column": 53, "line": 35}, "start": {"column": 30, "line": 35}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Link", "range": {"end": {"column": 13, "line": 35}, "start": {"column": 9, "line": 35}}}}, "range": {"end": {"column": 54, "line": 35}, "start": {"column": 9, "line": 35}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 35}, "start": {"column": 14, "line": 35}}, "segments": [{"stringSegment": {"content": "View Details", "range": {"end": {"column": 27, "line": 35}, "start": {"column": 15, "line": 35}}}}]}]},
]

# Parser output for `URL(string: "https://example.com/click here")` at 42:14.
does_not_warn_for_non_visible_click_here_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "URL", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 14, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 58, "line": 42}, "start": {"column": 26, "line": 42}}, "segments": [{"stringSegment": {"content": "https://example.com/click here", "range": {"end": {"column": 57, "line": 42}, "start": {"column": 27, "line": 42}}}}]}}, "label": "string", "range": {"end": {"column": 58, "line": 42}, "start": {"column": 18, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "URL", "range": {"end": {"column": 17, "line": 42}, "start": {"column": 14, "line": 42}}}}, "range": {"end": {"column": 59, "line": 42}, "start": {"column": 14, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 58, "line": 42}, "start": {"column": 26, "line": 42}}, "segments": [{"stringSegment": {"content": "https://example.com/click here", "range": {"end": {"column": 57, "line": 42}, "start": {"column": 27, "line": 42}}}}]}]}

# Parser output for `Text("Click here")` at 51:9.
does_not_warn_for_text_click_here_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 51}, "start": {"column": 9, "line": 51}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 26, "line": 51}, "start": {"column": 14, "line": 51}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 25, "line": 51}, "start": {"column": 15, "line": 51}}}}]}}, "range": {"end": {"column": 26, "line": 51}, "start": {"column": 14, "line": 51}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 51}, "start": {"column": 9, "line": 51}}}}, "range": {"end": {"column": 27, "line": 51}, "start": {"column": 9, "line": 51}}}], "stringLiteralExprs": [{"range": {"end": {"column": 26, "line": 51}, "start": {"column": 14, "line": 51}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 25, "line": 51}, "start": {"column": 15, "line": 51}}}}]}]}

# Parser output for `Label("Click here", systemImage: "info.circle")` at 59:9.
does_not_warn_for_label_click_here_string_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 59}, "start": {"column": 9, "line": 59}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 27, "line": 59}, "start": {"column": 15, "line": 59}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 26, "line": 59}, "start": {"column": 16, "line": 59}}}}]}}, "range": {"end": {"column": 28, "line": 59}, "start": {"column": 15, "line": 59}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 55, "line": 59}, "start": {"column": 42, "line": 59}}, "segments": [{"stringSegment": {"content": "info.circle", "range": {"end": {"column": 54, "line": 59}, "start": {"column": 43, "line": 59}}}}]}}, "label": "systemImage", "range": {"end": {"column": 55, "line": 59}, "start": {"column": 29, "line": 59}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 59}, "start": {"column": 9, "line": 59}}}}, "range": {"end": {"column": 56, "line": 59}, "start": {"column": 9, "line": 59}}}], "stringLiteralExprs": [{"range": {"end": {"column": 27, "line": 59}, "start": {"column": 15, "line": 59}}, "segments": [{"stringSegment": {"content": "Click here", "range": {"end": {"column": 26, "line": 59}, "start": {"column": 16, "line": 59}}}}]}, {"range": {"end": {"column": 55, "line": 59}, "start": {"column": 42, "line": 59}}, "segments": [{"stringSegment": {"content": "info.circle", "range": {"end": {"column": 54, "line": 59}, "start": {"column": 43, "line": 59}}}}]}]}
