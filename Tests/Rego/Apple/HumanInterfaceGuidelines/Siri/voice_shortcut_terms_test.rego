package apple.hig.siri.voice_shortcut_terms

test_warns_for_text_add_voice_shortcut_lowercase_hig_example if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(21, 15, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("add voice shortcut")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].message == "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt."
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 21
	result.warn[0].column == 15
	result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_phrase_variants if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(28, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("add voice shortcuts")
      ]),
  data.swift.syntax.test.function_call(29, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Make it easy to add voice shortcuts")
      ]),
  data.swift.syntax.test.function_call(30, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Use this to ADD VOICE SHORTCUT")
      ])
])

	count(result.warn) == 3
	result.warn[_].artifact == "Sources/App/SiriShortcutsView.swift"
}

test_warns_for_help_member_make_voice_command_lowercase_substring if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(34, 8, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("make a voice command for the morning routine")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_warns_for_textfield_create_voice_prompt_lowercase_substring if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(47, 19, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("create a voice prompt before saving")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 47
	result.warn[0].column == 19
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_matching_visible_string if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(58, 12, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Add to Shortcuts")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_call_with_matching_string if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriShortcutsView.swift", [
  data.swift.syntax.test.function_call(66, 10, [
        data.swift.syntax.test.identifier("IntentDescription"),
        data.swift.syntax.test.string_segment("add voice shortcut")
      ])
])

	count(result.warn) == 0
}
