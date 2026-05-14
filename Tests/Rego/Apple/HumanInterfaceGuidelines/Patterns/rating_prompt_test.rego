package apple.hig.patterns.rating_prompt

test_warns_for_custom_button_with_rate_text if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SettingsView.swift", [
  data.swift.syntax.test.function_call(42, 17, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Rate This App")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_rating_prompt"
  result.warn[0].message == "Review custom rating prompt; prefer the system rating prompt and ask only after engagement."
  result.warn[0].artifact == "Sources/App/SettingsView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 17
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_request_review_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SettingsView.swift", [
  data.swift.syntax.test.function_call(51, 9, [
        data.swift.syntax.test.identifier("requestReview"),
        data.swift.syntax.test.string_segment("Review")
      ])
])

  count(result.warn) == 0
}
