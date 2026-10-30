package apple.hig.components.small_hit_region

test_warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions if {
  result := decision with input as warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_small_hit_region"
  result.warn[0].message == "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions."
  result.warn[0].line == 31
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_explicit_44_by_44_frame_dimensions if {
  result := decision with input as does_not_warn_for_explicit_44_by_44_frame_dimensions_node

  count(result.warn) == 0
}

test_does_not_warn_for_small_numeric_argument_without_width_and_height_labels if {
  result := decision with input as does_not_warn_for_small_numeric_argument_without_width_and_height_labels_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_frame_call if {
  result := decision with input as does_not_warn_for_non_frame_call_node

  count(result.warn) == 0
}

# Parser output for `icon.frame(width: 32, height: 32)` at 31:12.
warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions_node := {"declReferenceExprs": [{"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}, {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "32", "range": {"end": {"column": 32, "line": 31}, "start": {"column": 30, "line": 31}}}}, "label": "width", "range": {"end": {"column": 33, "line": 31}, "start": {"column": 23, "line": 31}}}, {"expression": {"integerLiteralExpr": {"literal": "32", "range": {"end": {"column": 44, "line": 31}, "start": {"column": 42, "line": 31}}}}, "label": "height", "range": {"end": {"column": 44, "line": 31}, "start": {"column": 34, "line": 31}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}}, "range": {"end": {"column": 45, "line": 31}, "start": {"column": 12, "line": 31}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}]}

# Parser output for `icon.frame(width: 44, height: 44)` at 31:12.
does_not_warn_for_explicit_44_by_44_frame_dimensions_node := {"declReferenceExprs": [{"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}, {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "44", "range": {"end": {"column": 32, "line": 31}, "start": {"column": 30, "line": 31}}}}, "label": "width", "range": {"end": {"column": 33, "line": 31}, "start": {"column": 23, "line": 31}}}, {"expression": {"integerLiteralExpr": {"literal": "44", "range": {"end": {"column": 44, "line": 31}, "start": {"column": 42, "line": 31}}}}, "label": "height", "range": {"end": {"column": 44, "line": 31}, "start": {"column": 34, "line": 31}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}}, "range": {"end": {"column": 45, "line": 31}, "start": {"column": 12, "line": 31}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}]}

# Parser output for `icon.frame(width: 32)` at 31:12.
does_not_warn_for_small_numeric_argument_without_width_and_height_labels_node := {"declReferenceExprs": [{"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}, {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "32", "range": {"end": {"column": 32, "line": 31}, "start": {"column": 30, "line": 31}}}}, "label": "width", "range": {"end": {"column": 32, "line": 31}, "start": {"column": 23, "line": 31}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}}, "range": {"end": {"column": 33, "line": 31}, "start": {"column": 12, "line": 31}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "frame", "range": {"end": {"column": 22, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 22, "line": 31}, "start": {"column": 12, "line": 31}}}]}

# Parser output for `icon.customSize(width: 32, height: 32)` at 31:12.
does_not_warn_for_non_frame_call_node := {"declReferenceExprs": [{"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}, {"baseName": "customSize", "range": {"end": {"column": 27, "line": 31}, "start": {"column": 17, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"integerLiteralExpr": {"literal": "32", "range": {"end": {"column": 37, "line": 31}, "start": {"column": 35, "line": 31}}}}, "label": "width", "range": {"end": {"column": 38, "line": 31}, "start": {"column": 28, "line": 31}}}, {"expression": {"integerLiteralExpr": {"literal": "32", "range": {"end": {"column": 49, "line": 31}, "start": {"column": 47, "line": 31}}}}, "label": "height", "range": {"end": {"column": 49, "line": 31}, "start": {"column": 39, "line": 31}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "customSize", "range": {"end": {"column": 27, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 27, "line": 31}, "start": {"column": 12, "line": 31}}}}, "range": {"end": {"column": 50, "line": 31}, "start": {"column": 12, "line": 31}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 16, "line": 31}, "start": {"column": 12, "line": 31}}}}, "declName": {"baseName": "customSize", "range": {"end": {"column": 27, "line": 31}, "start": {"column": 17, "line": 31}}}, "range": {"end": {"column": 27, "line": 31}, "start": {"column": 12, "line": 31}}}]}
