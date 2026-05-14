package apple.hig.components.standard_navigation_labels

test_warns_for_button_back_text_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Back")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_text_navigation_label"
  result.warn[0].message == "Review text navigation label; prefer standard Back or Close controls and symbols."
  result.warn[0].artifact == "Sources/App/RouteView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_start_route_text_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Start Route")
      ])
])

  count(result.warn) == 0
}
