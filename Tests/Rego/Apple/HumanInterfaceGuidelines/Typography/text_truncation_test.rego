package apple.hig.typography.text_truncation

test_warns_for_tail_truncation_mode_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(34, 15, [
        data.swift.syntax.test.identifier("truncationMode")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_text_truncation"
  result.warn[0].message == "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 34
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_font_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(28, 19, [
        data.swift.syntax.test.identifier("font")
      ])
])

  count(result.warn) == 0
}
