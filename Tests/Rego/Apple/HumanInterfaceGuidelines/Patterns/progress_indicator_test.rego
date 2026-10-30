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
warns_for_progress_view_with_no_arguments_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 14}, "start": {"column": 9, "line": 14}}}], "functionCallExprs": [{"calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 14}, "start": {"column": 9, "line": 14}}}}, "range": {"end": {"column": 23, "line": 14}, "start": {"column": 9, "line": 14}}}]}

# Parser output for `ProgressView("Loading route")` at 22:9.
does_not_warn_for_progress_view_with_label_node := {"declReferenceExprs": [{"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 22}, "start": {"column": 9, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 37, "line": 22}, "start": {"column": 22, "line": 22}}, "segments": [{"stringSegment": {"content": "Loading route", "range": {"end": {"column": 36, "line": 22}, "start": {"column": 23, "line": 22}}}}]}}, "range": {"end": {"column": 37, "line": 22}, "start": {"column": 22, "line": 22}}}], "calledExpression": {"declReferenceExpr": {"baseName": "ProgressView", "range": {"end": {"column": 21, "line": 22}, "start": {"column": 9, "line": 22}}}}, "range": {"end": {"column": 38, "line": 22}, "start": {"column": 9, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 37, "line": 22}, "start": {"column": 22, "line": 22}}, "segments": [{"stringSegment": {"content": "Loading route", "range": {"end": {"column": 36, "line": 22}, "start": {"column": 23, "line": 22}}}}]}]}
