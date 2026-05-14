package apple.hig.tables.column_heading_punctuation

test_warns_for_table_column_heading_with_trailing_colon if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/OrdersView.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("TableColumn"),
        data.swift.syntax.test.identifier("value"),
        data.swift.syntax.test.string_segment("Status:")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_trailing_colon"
  result.warn[0].message == "Review table column heading; column headings should avoid trailing punctuation such as a colon."
  result.warn[0].artifact == "Sources/App/OrdersView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_table_column_heading_with_sentence_punctuation if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/OrdersView.swift", [
  data.swift.syntax.test.function_call(24, 7, [
        data.swift.syntax.test.identifier("TableColumn"),
        data.swift.syntax.test.identifier("value"),
        data.swift.syntax.test.string_segment("Delivery date.")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_sentence_punctuation"
  result.warn[0].message == "Review table column heading; use a short noun or noun phrase without ending punctuation."
  result.warn[0].artifact == "Sources/App/OrdersView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_table_column_heading_without_punctuation if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/OrdersView.swift", [
  data.swift.syntax.test.function_call(30, 7, [
        data.swift.syntax.test.identifier("TableColumn"),
        data.swift.syntax.test.identifier("value"),
        data.swift.syntax.test.string_segment("Delivery date")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_table_column_visible_string if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/OrdersView.swift", [
  data.swift.syntax.test.function_call(42, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Status:")
      ])
])

  count(result.warn) == 0
}
