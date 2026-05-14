package apple.hig.presentation.alert_ok_button

test_warns_for_ok_button_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(28, 13, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("OK")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_alert_ok_button"
  result.warn[0].message == "Review OK button label; use a specific action title when the alert is not purely informational."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 28
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_dismiss_button_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(28, 13, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Dismiss")
      ])
])

  count(result.warn) == 0
}
