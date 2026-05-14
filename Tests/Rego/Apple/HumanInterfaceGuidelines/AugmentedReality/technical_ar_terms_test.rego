package apple.hig.augmented_reality.technical_ar_terms

test_warns_for_exact_technical_ar_terms_in_visible_string_calls if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ARInstructions.swift", [
  data.swift.syntax.test.function_call(17, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("ARKit")
      ]),
  data.swift.syntax.test.function_call(18, 11, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("World Detection")
      ]),
  data.swift.syntax.test.function_call(19, 11, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Tracking")
      ]),
  data.swift.syntax.test.function_call(20, 11, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("World tracking")
      ])
])

  count(result.warn) == 4
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].artifact == "Sources/App/ARInstructions.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_text_field_exact_technical_ar_term if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ARSetupView.swift", [
  data.swift.syntax.test.function_call(29, 9, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Tracking")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].artifact == "Sources/App/ARSetupView.swift"
  result.warn[0].line == 29
  result.warn[0].column == 9
}

test_does_not_warn_for_approachable_ar_instructional_text if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ARInstructions.swift", [
  data.swift.syntax.test.function_call(24, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Move your device to find a surface")
      ])
])

  count(result.warn) == 0
}

test_warns_for_substring_and_case_different_terms if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ARInstructions.swift", [
  data.swift.syntax.test.function_call(31, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Use ARKit to scan the room")
      ]),
  data.swift.syntax.test.function_call(32, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("world detection")
      ])
])

  count(result.warn) == 2
  result.warn[0].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[0].message == "Review AR instructional text; use approachable terms instead of technical AR terminology."
  result.warn[0].artifact == "Sources/App/ARInstructions.swift"
  result.warn[0].line == 31
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
  result.warn[1].rule_id == "apple.hig.augmented_reality.review_technical_ar_terms"
  result.warn[1].artifact == "Sources/App/ARInstructions.swift"
  result.warn[1].line == 32
  result.warn[1].column == 11
}

test_does_not_warn_for_exact_term_on_non_visible_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ARState.swift", [
  data.swift.syntax.test.function_call(12, 5, [
        data.swift.syntax.test.identifier("logEvent"),
        data.swift.syntax.test.identifier("name"),
        data.swift.syntax.test.string_segment("ARKit")
      ])
])

  count(result.warn) == 0
}
