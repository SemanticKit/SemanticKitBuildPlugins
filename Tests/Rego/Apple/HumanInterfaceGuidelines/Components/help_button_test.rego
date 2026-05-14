package apple.hig.components.help_button

test_warns_for_button_help_text if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Help")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_custom_help_button"
  result.warn[0].message == "Review custom Help button; use the system help button for help documentation where appropriate."
  result.warn[0].artifact == "Sources/App/RouteView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_route_details_button_text if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Route Details")
      ])
])

  count(result.warn) == 0
}
