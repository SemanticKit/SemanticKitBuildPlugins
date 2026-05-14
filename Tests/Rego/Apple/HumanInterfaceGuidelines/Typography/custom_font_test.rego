package apple.hig.typography.custom_font

test_warns_for_custom_font_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(28, 19, [
        data.swift.syntax.test.identifier("custom"),
        data.swift.syntax.test.identifier("size"),
        data.swift.syntax.test.string_segment("Avenir"),
        data.swift.syntax.test.integer_literal("14")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_custom_font"
  result.warn[0].message == "Review custom font; prefer system fonts and verify legibility."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 28
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_system_font_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(28, 19, [
        data.swift.syntax.test.identifier("system"),
        data.swift.syntax.test.identifier("size"),
        data.swift.syntax.test.integer_literal("14")
      ])
])

  count(result.warn) == 0
}
