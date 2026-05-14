package apple.hig.writing.click_here_label

test_warns_for_click_here_button_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Click here")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
  result.warn[0].message == "Review visible string literal containing Click here; use action-oriented button or link label copy."
  result.warn[0].artifact == "Sources/App/HelpView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_click_here_link_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(27, 11, [
        data.swift.syntax.test.identifier("Link"),
        data.swift.syntax.test.string_segment("Click here to learn more")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.writing.review_click_here_label"
}

test_does_not_warn_for_action_oriented_visible_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(34, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Learn More")
      ]),
  data.swift.syntax.test.function_call(35, 9, [
        data.swift.syntax.test.identifier("Link"),
        data.swift.syntax.test.string_segment("View Details")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_visible_click_here_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(42, 14, [
        data.swift.syntax.test.identifier("URL"),
        data.swift.syntax.test.identifier("string"),
        data.swift.syntax.test.string_segment("https://example.com/click here")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_text_click_here_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(51, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Click here")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_label_click_here_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/HelpView.swift", [
  data.swift.syntax.test.function_call(59, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.identifier("systemImage"),
        data.swift.syntax.test.string_segment("Click here"),
        data.swift.syntax.test.string_segment("info.circle")
      ])
])

  count(result.warn) == 0
}
