package apple.hig.patterns.tooltip_copy

test_warns_for_help_base_name_with_long_tooltip_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteToolbar.swift", [
  data.swift.syntax.test.function_call(31, 14, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("Open route planning controls and show detailed guidance for every available route option")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].message == "Review tooltip copy; describe the control directly and keep help text around 60 to 75 characters."
  result.warn[0].artifact == "Sources/App/RouteToolbar.swift"
  result.warn[0].line == 31
  result.warn[0].column == 14
  result.warn[0].severity == "warning"
}

test_warns_for_help_member_name_with_long_tooltip_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteToolbar.swift", [
  data.swift.syntax.test.function_call(44, 10, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("Review all routing controls and choose the setting that best matches the selected trip")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_tooltip_copy"
  result.warn[0].artifact == "Sources/App/RouteToolbar.swift"
  result.warn[0].line == 44
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_help_call_with_short_tooltip_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteToolbar.swift", [
  data.swift.syntax.test.function_call(52, 14, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("Show route options")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_help_call_with_long_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/RouteToolbar.swift", [
  data.swift.syntax.test.function_call(60, 12, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Open route planning controls and show detailed guidance for every available route option")
      ])
])

  count(result.warn) == 0
}
