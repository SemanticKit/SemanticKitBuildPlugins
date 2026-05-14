package apple.hig.patterns.share_button

test_warns_for_custom_button_with_share_text if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(18, 11, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Share")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_share_button"
  result.warn[0].message == "Review custom Share control; prefer ShareLink or the system share sheet where available."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_sharelink if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(26, 9, [
        data.swift.syntax.test.identifier("ShareLink"),
        data.swift.syntax.test.identifier("item"),
        data.swift.syntax.test.string_segment("Share")
      ])
])

  count(result.warn) == 0
}
