package apple.hig.nfc.nfc_terms

test_warns_for_visible_nfc_technical_term if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/NFCScanView.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Start NFC scan")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.nfc.review_user_instruction_terms"
  result.warn[0].message == "Review visible NFC instruction copy; prefer scan or hold near and avoid technical or contact terms."
  result.warn[0].artifact == "Sources/App/NFCScanView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_visible_nfc_technical_term_variants if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/NFCScanView.swift", [
  data.swift.syntax.test.function_call(23, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Use Core NFC")
      ]),
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Near-field communication scan")
      ]),
  data.swift.syntax.test.function_call(25, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Near field communication reader")
      ])
])

  count(result.warn) == 3
  result.warn[_].rule_id == "apple.hig.nfc.review_user_instruction_terms"
}

test_warns_for_contact_term_with_nfc_context if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/NFCScanView.swift", [
  data.swift.syntax.test.function_call(27, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Tap the NFC reader")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.nfc.review_user_instruction_terms"
}

test_does_not_warn_for_unrelated_tag_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SocialView.swift", [
  data.swift.syntax.test.function_call(41, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Tag friends")
      ]),
  data.swift.syntax.test.function_call(42, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Hashtag ideas")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_contact_terms_without_nfc_context if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ReaderView.swift", [
  data.swift.syntax.test.function_call(47, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Tap the reader")
      ]),
  data.swift.syntax.test.function_call(48, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Touch the screen")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_preferred_nfc_copy if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/NFCScanView.swift", [
  data.swift.syntax.test.function_call(34, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Hold near the pass")
      ])
])

  count(result.warn) == 0
}
