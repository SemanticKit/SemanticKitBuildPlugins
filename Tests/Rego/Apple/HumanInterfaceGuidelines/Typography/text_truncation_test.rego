package apple.hig.typography.text_truncation

test_warns_for_tail_truncation_mode_swift_syntax if {
  result := decision with input as warns_for_tail_truncation_mode_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_text_truncation"
  result.warn[0].message == "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate."
  result.warn[0].line == 34
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_font_swift_syntax if {
  result := decision with input as does_not_warn_for_font_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `title.truncationMode(.tail)` at 34:15.
warns_for_tail_truncation_mode_swift_syntax_node := {"declReferenceExprs": [{"baseName": "title", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 15, "line": 34}}}, {"baseName": "truncationMode", "range": {"end": {"column": 35, "line": 34}, "start": {"column": 21, "line": 34}}}, {"baseName": "tail", "range": {"end": {"column": 41, "line": 34}, "start": {"column": 37, "line": 34}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "tail", "range": {"end": {"column": 41, "line": 34}, "start": {"column": 37, "line": 34}}}, "range": {"end": {"column": 41, "line": 34}, "start": {"column": 36, "line": 34}}}}, "range": {"end": {"column": 41, "line": 34}, "start": {"column": 36, "line": 34}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "title", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 15, "line": 34}}}}, "declName": {"baseName": "truncationMode", "range": {"end": {"column": 35, "line": 34}, "start": {"column": 21, "line": 34}}}, "range": {"end": {"column": 35, "line": 34}, "start": {"column": 15, "line": 34}}}}, "range": {"end": {"column": 42, "line": 34}, "start": {"column": 15, "line": 34}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "title", "range": {"end": {"column": 20, "line": 34}, "start": {"column": 15, "line": 34}}}}, "declName": {"baseName": "truncationMode", "range": {"end": {"column": 35, "line": 34}, "start": {"column": 21, "line": 34}}}, "range": {"end": {"column": 35, "line": 34}, "start": {"column": 15, "line": 34}}}, {"declName": {"baseName": "tail", "range": {"end": {"column": 41, "line": 34}, "start": {"column": 37, "line": 34}}}, "range": {"end": {"column": 41, "line": 34}, "start": {"column": 36, "line": 34}}}]}

# Parser output for `title.font(.headline)` at 28:19.
does_not_warn_for_font_swift_syntax_node := {"declReferenceExprs": [{"baseName": "title", "range": {"end": {"column": 24, "line": 28}, "start": {"column": 19, "line": 28}}}, {"baseName": "font", "range": {"end": {"column": 29, "line": 28}, "start": {"column": 25, "line": 28}}}, {"baseName": "headline", "range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}}], "functionCallExprs": [{"arguments": [{"expression": {"memberAccessExpr": {"declName": {"baseName": "headline", "range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}}, "range": {"end": {"column": 39, "line": 28}, "start": {"column": 30, "line": 28}}}}, "range": {"end": {"column": 39, "line": 28}, "start": {"column": 30, "line": 28}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "title", "range": {"end": {"column": 24, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "font", "range": {"end": {"column": 29, "line": 28}, "start": {"column": 25, "line": 28}}}, "range": {"end": {"column": 29, "line": 28}, "start": {"column": 19, "line": 28}}}}, "range": {"end": {"column": 40, "line": 28}, "start": {"column": 19, "line": 28}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "title", "range": {"end": {"column": 24, "line": 28}, "start": {"column": 19, "line": 28}}}}, "declName": {"baseName": "font", "range": {"end": {"column": 29, "line": 28}, "start": {"column": 25, "line": 28}}}, "range": {"end": {"column": 29, "line": 28}, "start": {"column": 19, "line": 28}}}, {"declName": {"baseName": "headline", "range": {"end": {"column": 39, "line": 28}, "start": {"column": 31, "line": 28}}}, "range": {"end": {"column": 39, "line": 28}, "start": {"column": 30, "line": 28}}}]}
