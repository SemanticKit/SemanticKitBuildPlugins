package apple.hig.presentation.unhelpful_alert_title

test_warns_for_generic_error_text_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(14, 13, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Error")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_unhelpful_alert_title"
  result.warn[0].message == "Review alert title; use direct, neutral, specific copy instead of generic error text."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 14
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_specific_route_unavailable_text_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(14, 13, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Route unavailable")
      ])
])

  count(result.warn) == 0
}
