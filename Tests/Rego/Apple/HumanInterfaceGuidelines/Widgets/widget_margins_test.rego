package apple.hig.widgets.widget_margins

test_warns_for_content_margins_disabled_swift_syntax if {
  result := decision with input as warns_for_content_margins_disabled_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.widgets.review_content_margins_disabled"
  result.warn[0].message == "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing."
  result.warn[0].line == 55
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_warns_for_member_only_content_margins_disabled_swift_syntax if {
  result := decision with input as warns_for_member_only_content_margins_disabled_swift_syntax_node

  count(result.warn) == 1
}

test_does_not_warn_for_other_spacing_call if {
  result := decision with input as does_not_warn_for_other_spacing_call_node

  count(result.warn) == 0
}

# Parser output for `contentMarginsDisabled()` at 55:8.
warns_for_content_margins_disabled_swift_syntax_node := {"declReferenceExprs": [{"baseName": "contentMarginsDisabled", "range": {"end": {"column": 30, "line": 55}, "start": {"column": 8, "line": 55}}}], "functionCallExprs": [{"calledExpression": {"declReferenceExpr": {"baseName": "contentMarginsDisabled", "range": {"end": {"column": 30, "line": 55}, "start": {"column": 8, "line": 55}}}}, "range": {"end": {"column": 32, "line": 55}, "start": {"column": 8, "line": 55}}}]}

# Parser output for `configuration.contentMarginsDisabled()` at 64:10.
warns_for_member_only_content_margins_disabled_swift_syntax_node := {"declReferenceExprs": [{"baseName": "configuration", "range": {"end": {"column": 23, "line": 64}, "start": {"column": 10, "line": 64}}}, {"baseName": "contentMarginsDisabled", "range": {"end": {"column": 46, "line": 64}, "start": {"column": 24, "line": 64}}}], "functionCallExprs": [{"calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "configuration", "range": {"end": {"column": 23, "line": 64}, "start": {"column": 10, "line": 64}}}}, "declName": {"baseName": "contentMarginsDisabled", "range": {"end": {"column": 46, "line": 64}, "start": {"column": 24, "line": 64}}}, "range": {"end": {"column": 46, "line": 64}, "start": {"column": 10, "line": 64}}}}, "range": {"end": {"column": 48, "line": 64}, "start": {"column": 10, "line": 64}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "configuration", "range": {"end": {"column": 23, "line": 64}, "start": {"column": 10, "line": 64}}}}, "declName": {"baseName": "contentMarginsDisabled", "range": {"end": {"column": 46, "line": 64}, "start": {"column": 24, "line": 64}}}, "range": {"end": {"column": 46, "line": 64}, "start": {"column": 10, "line": 64}}}]}

# Parser output for `content.padding(16)` at 70:8.
does_not_warn_for_other_spacing_call_node := {"declReferenceExprs": [{"baseName": "content", "range": {"end": {"column": 15, "line": 70}, "start": {"column": 8, "line": 70}}}, {"baseName": "padding", "range": {"end": {"column": 23, "line": 70}, "start": {"column": 16, "line": 70}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "16", "range": {"end": {"column": 26, "line": 70}, "start": {"column": 24, "line": 70}}}}, "range": {"end": {"column": 26, "line": 70}, "start": {"column": 24, "line": 70}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "content", "range": {"end": {"column": 15, "line": 70}, "start": {"column": 8, "line": 70}}}}, "declName": {"baseName": "padding", "range": {"end": {"column": 23, "line": 70}, "start": {"column": 16, "line": 70}}}, "range": {"end": {"column": 23, "line": 70}, "start": {"column": 8, "line": 70}}}}, "range": {"end": {"column": 27, "line": 70}, "start": {"column": 8, "line": 70}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "content", "range": {"end": {"column": 15, "line": 70}, "start": {"column": 8, "line": 70}}}}, "declName": {"baseName": "padding", "range": {"end": {"column": 23, "line": 70}, "start": {"column": 16, "line": 70}}}, "range": {"end": {"column": 23, "line": 70}, "start": {"column": 8, "line": 70}}}]}
