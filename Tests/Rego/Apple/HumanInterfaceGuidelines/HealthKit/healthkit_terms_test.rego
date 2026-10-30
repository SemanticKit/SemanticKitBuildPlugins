package apple.hig.healthkit.healthkit_terms

test_warns_for_visible_healthkit_copy if {
  result := decision with input as warns_for_visible_healthkit_copy_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
  result.warn[0].message == "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy."
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_bad_apple_health_capitalization_variants if {
  result := {"warn": [warning |
    node := warns_for_bad_apple_health_capitalization_variants_nodes[_]
    node_decision := decision with input as node
    warning := node_decision.warn[_]
  ]}

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.healthkit.review_user_facing_healthkit_term"
}

test_does_not_warn_for_apple_health_copy if {
  result := decision with input as does_not_warn_for_apple_health_copy_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_healthkit_swift_syntax if {
  result := decision with input as does_not_warn_for_non_visible_healthkit_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Text("Connect HealthKit")` at 18:9.
warns_for_visible_healthkit_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 33, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Connect HealthKit", "range": {"end": {"column": 32, "line": 18}, "start": {"column": 15, "line": 18}}}}]}}, "range": {"end": {"column": 33, "line": 18}, "start": {"column": 14, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 18}, "start": {"column": 9, "line": 18}}}}, "range": {"end": {"column": 34, "line": 18}, "start": {"column": 9, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 33, "line": 18}, "start": {"column": 14, "line": 18}}, "segments": [{"stringSegment": {"content": "Connect HealthKit", "range": {"end": {"column": 32, "line": 18}, "start": {"column": 15, "line": 18}}}}]}]}

# Parser output for `Text("Connect apple health")` at 23:9.
# Parser output for `Button("Open Apple health", action: openHealth)` at 24:9.
# Parser output for `Label("Sync APPLE HEALTH data", systemImage: "heart")` at 25:9.
warns_for_bad_apple_health_capitalization_variants_nodes := [
  {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 23}, "start": {"column": 9, "line": 23}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 36, "line": 23}, "start": {"column": 14, "line": 23}}, "segments": [{"stringSegment": {"content": "Connect apple health", "range": {"end": {"column": 35, "line": 23}, "start": {"column": 15, "line": 23}}}}]}}, "range": {"end": {"column": 36, "line": 23}, "start": {"column": 14, "line": 23}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 23}, "start": {"column": 9, "line": 23}}}}, "range": {"end": {"column": 37, "line": 23}, "start": {"column": 9, "line": 23}}}], "stringLiteralExprs": [{"range": {"end": {"column": 36, "line": 23}, "start": {"column": 14, "line": 23}}, "segments": [{"stringSegment": {"content": "Connect apple health", "range": {"end": {"column": 35, "line": 23}, "start": {"column": 15, "line": 23}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}, {"baseName": "openHealth", "range": {"end": {"column": 55, "line": 24}, "start": {"column": 45, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Open Apple health", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 17, "line": 24}}}}]}}, "range": {"end": {"column": 36, "line": 24}, "start": {"column": 16, "line": 24}}}, {"expression": {"declReferenceExpr": {"baseName": "openHealth", "range": {"end": {"column": 55, "line": 24}, "start": {"column": 45, "line": 24}}}}, "label": "action", "range": {"end": {"column": 55, "line": 24}, "start": {"column": 37, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Button", "range": {"end": {"column": 15, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 56, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 24}, "start": {"column": 16, "line": 24}}, "segments": [{"stringSegment": {"content": "Open Apple health", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 17, "line": 24}}}}]}]},
  {"declReferenceExprs": [{"baseName": "Label", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 39, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "Sync APPLE HEALTH data", "range": {"end": {"column": 38, "line": 25}, "start": {"column": 16, "line": 25}}}}]}}, "range": {"end": {"column": 40, "line": 25}, "start": {"column": 15, "line": 25}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 61, "line": 25}, "start": {"column": 54, "line": 25}}, "segments": [{"stringSegment": {"content": "heart", "range": {"end": {"column": 60, "line": 25}, "start": {"column": 55, "line": 25}}}}]}}, "label": "systemImage", "range": {"end": {"column": 61, "line": 25}, "start": {"column": 41, "line": 25}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Label", "range": {"end": {"column": 14, "line": 25}, "start": {"column": 9, "line": 25}}}}, "range": {"end": {"column": 62, "line": 25}, "start": {"column": 9, "line": 25}}}], "stringLiteralExprs": [{"range": {"end": {"column": 39, "line": 25}, "start": {"column": 15, "line": 25}}, "segments": [{"stringSegment": {"content": "Sync APPLE HEALTH data", "range": {"end": {"column": 38, "line": 25}, "start": {"column": 16, "line": 25}}}}]}, {"range": {"end": {"column": 61, "line": 25}, "start": {"column": 54, "line": 25}}, "segments": [{"stringSegment": {"content": "heart", "range": {"end": {"column": 60, "line": 25}, "start": {"column": 55, "line": 25}}}}]}]},
]

# Parser output for `Text("Connect the Apple Health app")` at 24:9.
does_not_warn_for_apple_health_copy_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 13, "line": 24}, "start": {"column": 9, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 44, "line": 24}, "start": {"column": 14, "line": 24}}, "segments": [{"stringSegment": {"content": "Connect the Apple Health app", "range": {"end": {"column": 43, "line": 24}, "start": {"column": 15, "line": 24}}}}]}}, "range": {"end": {"column": 44, "line": 24}, "start": {"column": 14, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 13, "line": 24}, "start": {"column": 9, "line": 24}}}}, "range": {"end": {"column": 45, "line": 24}, "start": {"column": 9, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 44, "line": 24}, "start": {"column": 14, "line": 24}}, "segments": [{"stringSegment": {"content": "Connect the Apple Health app", "range": {"end": {"column": 43, "line": 24}, "start": {"column": 15, "line": 24}}}}]}]}

# Parser output for `Logger(subsystem: "com.example.app", category: "HealthKit")` at 31:13.
does_not_warn_for_non_visible_healthkit_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Logger", "range": {"end": {"column": 19, "line": 31}, "start": {"column": 13, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 48, "line": 31}, "start": {"column": 31, "line": 31}}, "segments": [{"stringSegment": {"content": "com.example.app", "range": {"end": {"column": 47, "line": 31}, "start": {"column": 32, "line": 31}}}}]}}, "label": "subsystem", "range": {"end": {"column": 49, "line": 31}, "start": {"column": 20, "line": 31}}}, {"expression": {"stringLiteralExpr": {"range": {"end": {"column": 71, "line": 31}, "start": {"column": 60, "line": 31}}, "segments": [{"stringSegment": {"content": "HealthKit", "range": {"end": {"column": 70, "line": 31}, "start": {"column": 61, "line": 31}}}}]}}, "label": "category", "range": {"end": {"column": 71, "line": 31}, "start": {"column": 50, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Logger", "range": {"end": {"column": 19, "line": 31}, "start": {"column": 13, "line": 31}}}}, "range": {"end": {"column": 72, "line": 31}, "start": {"column": 13, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 48, "line": 31}, "start": {"column": 31, "line": 31}}, "segments": [{"stringSegment": {"content": "com.example.app", "range": {"end": {"column": 47, "line": 31}, "start": {"column": 32, "line": 31}}}}]}, {"range": {"end": {"column": 71, "line": 31}, "start": {"column": 60, "line": 31}}, "segments": [{"stringSegment": {"content": "HealthKit", "range": {"end": {"column": 70, "line": 31}, "start": {"column": 61, "line": 31}}}}]}]}
