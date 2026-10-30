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
warns_for_custom_button_with_share_text_node := {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 17, "line": 18}, "start": {"column": 11, "line": 18}}}, {"baseName": "share", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 35, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 25, "line": 18}, "start": {"column": 18, "line": 18}}, "segments": [{"stringSegment": {"content": "Share", "range": {"end": {"column": 24, "line": 18}, "start": {"column": 19, "line": 18}}}}]}}, "range": {"end": {"column": 26, "line": 18}, "start": {"column": 18, "line": 18}}}, {"expression": {"declReferenceExpr": {"baseName": "share", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 35, "line": 18}}}}, "label": "action", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 27, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 17, "line": 18}, "start": {"column": 11, "line": 18}}}}, "range": {"end": {"column": 41, "line": 18}, "start": {"column": 11, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 25, "line": 18}, "start": {"column": 18, "line": 18}}, "segments": [{"stringSegment": {"content": "Share", "range": {"end": {"column": 24, "line": 18}, "start": {"column": 19, "line": 18}}}}]}]}

# Parser output for `ShareLink("Share", item: url)` at 26:9.
does_not_warn_for_sharelink_node := {"declReferenceExprs": [{"baseName": "ShareLink", "range": {"end": {"column": 18, "line": 26}, "start": {"column": 9, "line": 26}}}, {"baseName": "url", "range": {"end": {"column": 37, "line": 26}, "start": {"column": 34, "line": 26}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 26, "line": 26}, "start": {"column": 19, "line": 26}}, "segments": [{"stringSegment": {"content": "Share", "range": {"end": {"column": 25, "line": 26}, "start": {"column": 20, "line": 26}}}}]}}, "range": {"end": {"column": 27, "line": 26}, "start": {"column": 19, "line": 26}}}, {"expression": {"declReferenceExpr": {"baseName": "url", "range": {"end": {"column": 37, "line": 26}, "start": {"column": 34, "line": 26}}}}, "label": "item", "range": {"end": {"column": 37, "line": 26}, "start": {"column": 28, "line": 26}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ShareLink", "range": {"end": {"column": 18, "line": 26}, "start": {"column": 9, "line": 26}}}}, "range": {"end": {"column": 38, "line": 26}, "start": {"column": 9, "line": 26}}}], "stringLiteralExprs": [{"range": {"end": {"column": 26, "line": 26}, "start": {"column": 19, "line": 26}}, "segments": [{"stringSegment": {"content": "Share", "range": {"end": {"column": 25, "line": 26}, "start": {"column": 20, "line": 26}}}}]}]}
