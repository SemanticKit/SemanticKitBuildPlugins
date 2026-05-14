package apple.hig.siri.siri_pronouns

test_warns_for_text_with_siri_pronoun_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ShortcutsView.swift", [
  data.swift.syntax.test.function_call(24, 13, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Ask Siri what she can do")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_siri_pronoun_copy"
  result.warn[0].message == "Review Siri copy; refer to Siri by name instead of using pronouns such as she, him, or her."
  result.warn[0].artifact == "Sources/App/ShortcutsView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_names_with_siri_pronoun_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ShortcutsView.swift", [
  data.swift.syntax.test.function_call(31, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Siri will remind her")
      ]),
  data.swift.syntax.test.function_call(32, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Ask SIRI about HIM")
      ]),
  data.swift.syntax.test.function_call(33, 9, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Ask Siri what she can do")
      ]),
  data.swift.syntax.test.function_call(34, 10, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("Siri will remind her")
      ])
])

  count(result.warn) == 4
}

test_does_not_warn_for_supported_call_with_siri_named_directly if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ShortcutsView.swift", [
  data.swift.syntax.test.function_call(42, 13, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Ask Siri what Siri can do")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_unsupported_call_with_siri_pronoun_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ShortcutsView.swift", [
  data.swift.syntax.test.function_call(48, 9, [
        data.swift.syntax.test.identifier("Image"),
        data.swift.syntax.test.string_segment("Ask Siri to help him")
      ])
])

  count(result.warn) == 0
}

test_warns_for_non_exact_siri_pronoun_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ShortcutsView.swift", [
  data.swift.syntax.test.function_call(56, 13, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Ask Siri what she can do today")
      ])
])

  count(result.warn) == 1
}
