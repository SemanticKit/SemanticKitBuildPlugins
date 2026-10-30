package apple.hig.accessibility.accessibility_hidden

test_warns_for_accessibility_hidden_swift_syntax if {
  result := decision with input as warns_for_accessibility_hidden_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_accessibility_hidden"
  result.warn[0].message == "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value."
  result.warn[0].line == 18
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_accessibility_label_swift_syntax if {
  result := decision with input as does_not_warn_for_accessibility_label_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `decoration.accessibilityHidden(true)` at 18:10.
warns_for_accessibility_hidden_swift_syntax_node := {"declReferenceExprs": [{"baseName": "decoration", "range": {"end": {"column": 20, "line": 18}, "start": {"column": 10, "line": 18}}}, {"baseName": "accessibilityHidden", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 21, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"booleanLiteralExpr": {"literal": "true", "range": {"end": {"column": 45, "line": 18}, "start": {"column": 41, "line": 18}}}}, "range": {"end": {"column": 45, "line": 18}, "start": {"column": 41, "line": 18}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "decoration", "range": {"end": {"column": 20, "line": 18}, "start": {"column": 10, "line": 18}}}}, "declName": {"baseName": "accessibilityHidden", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 21, "line": 18}}}, "range": {"end": {"column": 40, "line": 18}, "start": {"column": 10, "line": 18}}}}, "range": {"end": {"column": 46, "line": 18}, "start": {"column": 10, "line": 18}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "decoration", "range": {"end": {"column": 20, "line": 18}, "start": {"column": 10, "line": 18}}}}, "declName": {"baseName": "accessibilityHidden", "range": {"end": {"column": 40, "line": 18}, "start": {"column": 21, "line": 18}}}, "range": {"end": {"column": 40, "line": 18}, "start": {"column": 10, "line": 18}}}]}

# Parser output for `icon.accessibilityLabel("Route")` at 22:10.
does_not_warn_for_accessibility_label_swift_syntax_node := {"declReferenceExprs": [{"baseName": "icon", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 10, "line": 22}}}, {"baseName": "accessibilityLabel", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 41, "line": 22}, "start": {"column": 34, "line": 22}}, "segments": [{"stringSegment": {"content": "Route", "range": {"end": {"column": 40, "line": 22}, "start": {"column": 35, "line": 22}}}}]}}, "range": {"end": {"column": 41, "line": 22}, "start": {"column": 34, "line": 22}}}], "calledExpression": {"memberAccessExpr": {"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 10, "line": 22}}}}, "declName": {"baseName": "accessibilityLabel", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 10, "line": 22}}}}, "range": {"end": {"column": 42, "line": 22}, "start": {"column": 10, "line": 22}}}], "memberAccessExprs": [{"base": {"declReferenceExpr": {"baseName": "icon", "range": {"end": {"column": 14, "line": 22}, "start": {"column": 10, "line": 22}}}}, "declName": {"baseName": "accessibilityLabel", "range": {"end": {"column": 33, "line": 22}, "start": {"column": 15, "line": 22}}}, "range": {"end": {"column": 33, "line": 22}, "start": {"column": 10, "line": 22}}}], "stringLiteralExprs": [{"range": {"end": {"column": 41, "line": 22}, "start": {"column": 34, "line": 22}}, "segments": [{"stringSegment": {"content": "Route", "range": {"end": {"column": 40, "line": 22}, "start": {"column": 35, "line": 22}}}}]}]}
