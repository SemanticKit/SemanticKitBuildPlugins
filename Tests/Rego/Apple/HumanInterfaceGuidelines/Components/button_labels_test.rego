package apple.hig.components.button_labels

test_warns_for_long_button_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(22, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Continue to the next section of onboarding")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_button_label_length"
  result.warn[0].message == "Review long button label; keep button text short and clear."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_short_button_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(22, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Continue")
      ])
])

  count(result.warn) == 0
}
