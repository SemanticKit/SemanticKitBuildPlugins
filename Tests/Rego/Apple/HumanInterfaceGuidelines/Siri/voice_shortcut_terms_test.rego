package apple.hig.siri.voice_shortcut_terms

test_warns_for_text_add_voice_shortcut_lowercase_hig_example if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [{
		"artifact": "Sources/App/SiriShortcutsView.swift",
		"line": 21,
		"column": 15,
		"calledExpression": "Text",
		"baseName": "Text",
		"memberName": "",
		"argumentLabels": ["_"],
		"stringArguments": ["add voice shortcut"],
		"numericArguments": [],
	}]}}

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].message == "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt."
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 21
	result.warn[0].column == 15
	result.warn[0].severity == "warning"
}

test_warns_for_visible_string_call_phrase_variants if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [
		{
			"artifact": "Sources/App/SiriShortcutsView.swift",
			"line": 28,
			"column": 9,
			"calledExpression": "Label",
			"baseName": "Label",
			"memberName": "",
			"argumentLabels": ["_"],
			"stringArguments": ["add voice shortcuts"],
			"numericArguments": [],
		},
		{
			"artifact": "Sources/App/SiriShortcutsView.swift",
			"line": 29,
			"column": 9,
			"calledExpression": "Button",
			"baseName": "Button",
			"memberName": "",
			"argumentLabels": ["_"],
			"stringArguments": ["Make it easy to add voice shortcuts"],
			"numericArguments": [],
		},
		{
			"artifact": "Sources/App/SiriShortcutsView.swift",
			"line": 30,
			"column": 9,
			"calledExpression": "Text",
			"baseName": "Text",
			"memberName": "",
			"argumentLabels": ["_"],
			"stringArguments": ["Use this to ADD VOICE SHORTCUT"],
			"numericArguments": [],
		},
	]}}

	count(result.warn) == 3
	result.warn[_].artifact == "Sources/App/SiriShortcutsView.swift"
}

test_warns_for_help_member_make_voice_command_lowercase_substring if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [{
		"artifact": "Sources/App/SiriShortcutsView.swift",
		"line": 34,
		"column": 8,
		"calledExpression": "view.help",
		"baseName": "",
		"memberName": "help",
		"argumentLabels": ["_"],
		"stringArguments": ["make a voice command for the morning routine"],
		"numericArguments": [],
	}]}}

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_warns_for_textfield_create_voice_prompt_lowercase_substring if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [{
		"artifact": "Sources/App/SiriShortcutsView.swift",
		"line": 47,
		"column": 19,
		"calledExpression": "TextField",
		"baseName": "TextField",
		"memberName": "",
		"argumentLabels": ["_"],
		"stringArguments": ["create a voice prompt before saving"],
		"numericArguments": [],
	}]}}

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.siri.review_voice_shortcut_terms"
	result.warn[0].artifact == "Sources/App/SiriShortcutsView.swift"
	result.warn[0].line == 47
	result.warn[0].column == 19
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_non_matching_visible_string if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [{
		"artifact": "Sources/App/SiriShortcutsView.swift",
		"line": 58,
		"column": 12,
		"calledExpression": "Button",
		"baseName": "Button",
		"memberName": "",
		"argumentLabels": ["_"],
		"stringArguments": ["Add to Shortcuts"],
		"numericArguments": [],
	}]}}

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_call_with_matching_string if {
	result := decision with input as {"swiftSourceFacts": {"callFacts": [{
		"artifact": "Sources/App/SiriShortcutsView.swift",
		"line": 66,
		"column": 10,
		"calledExpression": "IntentDescription",
		"baseName": "IntentDescription",
		"memberName": "",
		"argumentLabels": ["_"],
		"stringArguments": ["add voice shortcut"],
		"numericArguments": [],
	}]}}

	count(result.warn) == 0
}
