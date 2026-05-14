package apple.hig.presentation.open_window_action

test_reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(19, 9, [
        data.swift.syntax.test.identifier("openWindow"),
        data.swift.syntax.test.identifier("id"),
        data.swift.syntax.test.string_segment("document")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].message == "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate."
  result.warn[0].artifact == "Sources/App/Commands.swift"
  result.warn[0].line == 19
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/DocumentView.swift", [
  data.swift.syntax.test.function_call(42, 15, [
        data.swift.syntax.test.identifier("environment"),
        data.swift.syntax.test.identifier("openWindow"),
        data.swift.syntax.test.identifier("id"),
        data.swift.syntax.test.identifier("value"),
        data.swift.syntax.test.string_segment("detail")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].artifact == "Sources/App/DocumentView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_review_open_url_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(31, 9, [
        data.swift.syntax.test.identifier("openURL")
      ])
])

  count(result.warn) == 0
}

test_does_not_review_open_window_action_without_open_window_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(52, 13, [
        data.swift.syntax.test.identifier("OpenWindowAction")
      ])
])

  count(result.warn) == 0
}
