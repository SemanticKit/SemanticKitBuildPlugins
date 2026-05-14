package apple.hig.components.context_menu_availability

test_reviews_context_menu_base_name_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("contextMenu")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].message == "Review context-menu usage and confirm commands are also available from the main interface or menu bar."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_reviews_context_menu_member_name_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(42, 11, [
        data.swift.syntax.test.identifier("contextMenu")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_review_non_context_menu_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("Menu")
      ])
])

  count(result.warn) == 0
}

test_does_not_review_context_menu_when_not_a_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input(null, [])

  count(result.warn) == 0
}
