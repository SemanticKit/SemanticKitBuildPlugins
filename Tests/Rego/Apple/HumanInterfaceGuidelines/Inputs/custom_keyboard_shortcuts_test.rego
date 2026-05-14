package apple.hig.inputs.custom_keyboard_shortcuts

test_warns_for_custom_keyboard_shortcut_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(18, 12, [
        data.swift.syntax.test.identifier("keyboardShortcut"),
        data.swift.syntax.test.string_segment("R")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.inputs.review_custom_keyboard_shortcut"
  result.warn[0].message == "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary."
  result.warn[0].artifact == "Sources/App/Commands.swift"
  result.warn[0].line == 18
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_keyboard_shortcut_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(24, 10, [
        data.swift.syntax.test.identifier("buttonStyle"),
        data.swift.syntax.test.string_segment("R")
      ])
])

  count(result.warn) == 0
}
