package apple.hig.siri.hey_siri_phrase

test_warns_for_app_shortcut_phrase_with_hey_siri_comma if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppShortcuts.swift", [
  data.swift.syntax.test.function_call(17, 11, [
        data.swift.syntax.test.identifier("AppShortcut"),
        data.swift.syntax.test.identifier("intent"),
        data.swift.syntax.test.identifier("phrases"),
        data.swift.syntax.test.identifier("shortTitle"),
        data.swift.syntax.test.identifier("systemImageName"),
        data.swift.syntax.test.string_segment("Hey Siri, show my garden")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].message == "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri."
  result.warn[0].artifact == "Sources/App/AppShortcuts.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_member_app_shortcut_phrase_case_insensitively if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppShortcuts.swift", [
  data.swift.syntax.test.function_call(28, 8, [
        data.swift.syntax.test.identifier("AppShortcut"),
        data.swift.syntax.test.identifier("phrases"),
        data.swift.syntax.test.string_segment("Use HEY SIRI to open Today")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].artifact == "Sources/App/AppShortcuts.swift"
  result.warn[0].line == 28
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_text_with_hey_siri if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriTipsView.swift", [
  data.swift.syntax.test.function_call(35, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Hey Siri")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_phrase_without_hey_siri if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppShortcuts.swift", [
  data.swift.syntax.test.function_call(42, 13, [
        data.swift.syntax.test.identifier("AppShortcut"),
        data.swift.syntax.test.identifier("intent"),
        data.swift.syntax.test.identifier("phrases"),
        data.swift.syntax.test.identifier("shortTitle"),
        data.swift.syntax.test.identifier("systemImageName"),
        data.swift.syntax.test.string_segment("Show my garden")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_app_shortcut_hey_siri_outside_phrases_argument if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppShortcuts.swift", [
  data.swift.syntax.test.function_call(49, 13, [
        data.swift.syntax.test.identifier("AppShortcut"),
        data.swift.syntax.test.identifier("intent"),
        data.swift.syntax.test.identifier("shortTitle"),
        data.swift.syntax.test.identifier("systemImageName"),
        data.swift.syntax.test.string_segment("Hey Siri")
      ])
])

  count(result.warn) == 0
}
