package apple.hig.menus.menu_title_capitalization

test_warns_for_sentence_style_command_menu_title if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppCommands.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("CommandMenu"),
        data.swift.syntax.test.string_segment("file actions")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.menus.review_command_menu_title_capitalization"
	result.warn[0].message == "Review CommandMenu title; multiword menu titles should use title-style capitalization."
	result.warn[0].artifact == "Sources/App/AppCommands.swift"
	result.warn[0].line == 18
	result.warn[0].column == 7
	result.warn[0].severity == "warning"
}

test_warns_for_sentence_style_menu_title if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(44, 11, [
        data.swift.syntax.test.identifier("Menu"),
        data.swift.syntax.test.string_segment("recent documents")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.menus.review_menu_title_capitalization"
	result.warn[0].message == "Review Menu title; multiword menu titles should use title-style capitalization."
	result.warn[0].artifact == "Sources/App/ContentView.swift"
	result.warn[0].line == 44
	result.warn[0].column == 11
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_title_style_command_menu_title if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/AppCommands.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("CommandMenu"),
        data.swift.syntax.test.string_segment("File Actions")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_title_style_menu_title_with_minor_word if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(44, 11, [
        data.swift.syntax.test.identifier("Menu"),
        data.swift.syntax.test.string_segment("Find in Files")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_one_word_menu_title if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(44, 11, [
        data.swift.syntax.test.identifier("Menu"),
        data.swift.syntax.test.string_segment("Window")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_non_menu_visible_string if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(51, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("recent documents")
      ])
])

	count(result.warn) == 0
}
