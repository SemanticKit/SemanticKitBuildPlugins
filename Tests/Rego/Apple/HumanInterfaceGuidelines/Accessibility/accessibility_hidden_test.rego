package apple.hig.accessibility.accessibility_hidden

test_warns_for_accessibility_hidden_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(18, 10, [
        data.swift.syntax.test.identifier("accessibilityHidden")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_accessibility_hidden"
  result.warn[0].message == "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_accessibility_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(22, 10, [
        data.swift.syntax.test.identifier("accessibilityLabel"),
        data.swift.syntax.test.string_segment("Route")
      ])
])

  count(result.warn) == 0
}
