package apple.hig.tables.column_heading_punctuation

test_warns_for_table_column_heading_with_trailing_colon if {
  result := decision with input as warns_for_table_column_heading_with_trailing_colon_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_trailing_colon"
  result.warn[0].message == "Review table column heading; column headings should avoid trailing punctuation such as a colon."
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_table_column_heading_with_sentence_punctuation if {
  result := decision with input as warns_for_table_column_heading_with_sentence_punctuation_node

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_sentence_punctuation"
  result.warn[0].message == "Review table column heading; use a short noun or noun phrase without ending punctuation."
  result.warn[0].line == 24
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_table_column_heading_without_punctuation if {
  result := decision with input as does_not_warn_for_table_column_heading_without_punctuation_node

  count(result.warn) == 0
}

test_does_not_warn_for_non_table_column_visible_string if {
  result := decision with input as does_not_warn_for_non_table_column_visible_string_node

  count(result.warn) == 0
}

# Parser output for `TableColumn("Status:", value: \.status)` at 18:7.
warns_for_table_column_heading_with_trailing_colon_node := {"declReferenceExprs": [{"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 18}, "start": {"column": 7, "line": 18}}}, {"baseName": "status", "range": {"end": {"column": 45, "line": 18}, "start": {"column": 39, "line": 18}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 28, "line": 18}, "start": {"column": 19, "line": 18}}, "segments": [{"stringSegment": {"content": "Status:", "range": {"end": {"column": 27, "line": 18}, "start": {"column": 20, "line": 18}}}}]}}, "range": {"end": {"column": 29, "line": 18}, "start": {"column": 19, "line": 18}}}, {"expression": {"keyPathExpr": {"range": {"end": {"column": 45, "line": 18}, "start": {"column": 37, "line": 18}}}}, "label": "value", "range": {"end": {"column": 45, "line": 18}, "start": {"column": 30, "line": 18}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 18}, "start": {"column": 7, "line": 18}}}}, "range": {"end": {"column": 46, "line": 18}, "start": {"column": 7, "line": 18}}}], "stringLiteralExprs": [{"range": {"end": {"column": 28, "line": 18}, "start": {"column": 19, "line": 18}}, "segments": [{"stringSegment": {"content": "Status:", "range": {"end": {"column": 27, "line": 18}, "start": {"column": 20, "line": 18}}}}]}]}

# Parser output for `TableColumn("Delivery date.", value: \.deliveryDate)` at 24:7.
warns_for_table_column_heading_with_sentence_punctuation_node := {"declReferenceExprs": [{"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 24}, "start": {"column": 7, "line": 24}}}, {"baseName": "deliveryDate", "range": {"end": {"column": 58, "line": 24}, "start": {"column": 46, "line": 24}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 35, "line": 24}, "start": {"column": 19, "line": 24}}, "segments": [{"stringSegment": {"content": "Delivery date.", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 20, "line": 24}}}}]}}, "range": {"end": {"column": 36, "line": 24}, "start": {"column": 19, "line": 24}}}, {"expression": {"keyPathExpr": {"range": {"end": {"column": 58, "line": 24}, "start": {"column": 44, "line": 24}}}}, "label": "value", "range": {"end": {"column": 58, "line": 24}, "start": {"column": 37, "line": 24}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 24}, "start": {"column": 7, "line": 24}}}}, "range": {"end": {"column": 59, "line": 24}, "start": {"column": 7, "line": 24}}}], "stringLiteralExprs": [{"range": {"end": {"column": 35, "line": 24}, "start": {"column": 19, "line": 24}}, "segments": [{"stringSegment": {"content": "Delivery date.", "range": {"end": {"column": 34, "line": 24}, "start": {"column": 20, "line": 24}}}}]}]}

# Parser output for `TableColumn("Delivery date", value: \.deliveryDate)` at 30:7.
does_not_warn_for_table_column_heading_without_punctuation_node := {"declReferenceExprs": [{"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 30}, "start": {"column": 7, "line": 30}}}, {"baseName": "deliveryDate", "range": {"end": {"column": 57, "line": 30}, "start": {"column": 45, "line": 30}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 34, "line": 30}, "start": {"column": 19, "line": 30}}, "segments": [{"stringSegment": {"content": "Delivery date", "range": {"end": {"column": 33, "line": 30}, "start": {"column": 20, "line": 30}}}}]}}, "range": {"end": {"column": 35, "line": 30}, "start": {"column": 19, "line": 30}}}, {"expression": {"keyPathExpr": {"range": {"end": {"column": 57, "line": 30}, "start": {"column": 43, "line": 30}}}}, "label": "value", "range": {"end": {"column": 57, "line": 30}, "start": {"column": 36, "line": 30}}}], "calledExpression": {"declReferenceExpr": {"baseName": "TableColumn", "range": {"end": {"column": 18, "line": 30}, "start": {"column": 7, "line": 30}}}}, "range": {"end": {"column": 58, "line": 30}, "start": {"column": 7, "line": 30}}}], "stringLiteralExprs": [{"range": {"end": {"column": 34, "line": 30}, "start": {"column": 19, "line": 30}}, "segments": [{"stringSegment": {"content": "Delivery date", "range": {"end": {"column": 33, "line": 30}, "start": {"column": 20, "line": 30}}}}]}]}

# Parser output for `Text("Status:")` at 42:11.
does_not_warn_for_non_table_column_visible_string_node := {"declReferenceExprs": [{"baseName": "Text", "range": {"end": {"column": 15, "line": 42}, "start": {"column": 11, "line": 42}}}], "functionCallExprs": [{"arguments": [{"expression": {"stringLiteralExpr": {"range": {"end": {"column": 25, "line": 42}, "start": {"column": 16, "line": 42}}, "segments": [{"stringSegment": {"content": "Status:", "range": {"end": {"column": 24, "line": 42}, "start": {"column": 17, "line": 42}}}}]}}, "range": {"end": {"column": 25, "line": 42}, "start": {"column": 16, "line": 42}}}], "calledExpression": {"declReferenceExpr": {"baseName": "Text", "range": {"end": {"column": 15, "line": 42}, "start": {"column": 11, "line": 42}}}}, "range": {"end": {"column": 26, "line": 42}, "start": {"column": 11, "line": 42}}}], "stringLiteralExprs": [{"range": {"end": {"column": 25, "line": 42}, "start": {"column": 16, "line": 42}}, "segments": [{"stringSegment": {"content": "Status:", "range": {"end": {"column": 24, "line": 42}, "start": {"column": 17, "line": 42}}}}]}]}
