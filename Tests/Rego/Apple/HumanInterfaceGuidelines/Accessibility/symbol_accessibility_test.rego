package apple.hig.accessibility.symbol_accessibility

test_warns_for_system_symbol_image_swift_syntax if {
  result := decision with input as warns_for_system_symbol_image_swift_syntax_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_symbol_accessibility_label"
  result.warn[0].message == "Review symbol image accessibility; provide alternative text for custom interface icons and symbols."
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asset_image_swift_syntax if {
  result := decision with input as does_not_warn_for_asset_image_swift_syntax_node

  count(result.warn) == 0
}

# Parser output for `Image(systemName: "square.and.arrow.up")` at 24:13.
warns_for_system_symbol_image_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Image", "range": {"end": {"column": 18, "line": 24}, "start": {"column": 13, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 52, "line": 24}, "start": {"column": 31, "line": 24}}, "segments": [{"stringSegment": {"content": "square.and.arrow.up", "range": {"end": {"column": 51, "line": 24}, "start": {"column": 32, "line": 24}}}}]}}, "label": "systemName", "range": {"end": {"column": 52, "line": 24}, "start": {"column": 19, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Image", "range": {"end": {"column": 18, "line": 24}, "start": {"column": 13, "line": 24}}}}, "range": {"end": {"column": 53, "line": 24}, "start": {"column": 13, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 52, "line": 24}, "start": {"column": 31, "line": 24}}, "segments": [{"stringSegment": {"content": "square.and.arrow.up", "range": {"end": {"column": 51, "line": 24}, "start": {"column": 32, "line": 24}}}}]}]}

# Parser output for `Image("assetName")` at 31:13.
does_not_warn_for_asset_image_swift_syntax_node := {"declReferenceExprs": [{"baseName": "Image", "range": {"end": {"column": 18, "line": 31}, "start": {"column": 13, "line": 31}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 30, "line": 31}, "start": {"column": 19, "line": 31}}, "segments": [{"stringSegment": {"content": "assetName", "range": {"end": {"column": 29, "line": 31}, "start": {"column": 20, "line": 31}}}}]}}, "range": {"end": {"column": 30, "line": 31}, "start": {"column": 19, "line": 31}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Image", "range": {"end": {"column": 18, "line": 31}, "start": {"column": 13, "line": 31}}}}, "range": {"end": {"column": 31, "line": 31}, "start": {"column": 13, "line": 31}}}], "stringLiteralExprs": [{"range": {"end": {"column": 30, "line": 31}, "start": {"column": 19, "line": 31}}, "segments": [{"stringSegment": {"content": "assetName", "range": {"end": {"column": 29, "line": 31}, "start": {"column": 20, "line": 31}}}}]}]}
