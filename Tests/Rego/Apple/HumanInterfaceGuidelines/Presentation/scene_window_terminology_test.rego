package apple.hig.presentation.scene_window_terminology

test_warns_for_scene_term_in_visible_text_copy if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/WindowCopy.swift", [
  data.swift.syntax.test.function_call(12, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Open this scene from the Window menu")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].message == "Review visible copy that says scene; use window when referring to app windows."
	result.warn[0].artifact == "Sources/App/WindowCopy.swift"
	result.warn[0].line == 12
	result.warn[0].column == 9
	result.warn[0].severity == "warning"
}

test_warns_for_scene_term_in_action_label if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/Commands.swift", [
  data.swift.syntax.test.function_call(27, 13, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Open New Scene")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_action_label"
	result.warn[0].message == "Review action label that says scene; use window for commands that open or manage windows."
	result.warn[0].artifact == "Sources/App/Commands.swift"
	result.warn[0].line == 27
	result.warn[0].column == 13
	result.warn[0].severity == "warning"
}

test_warns_for_member_help_scene_term if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/Toolbar.swift", [
  data.swift.syntax.test.function_call(34, 8, [
        data.swift.syntax.test.identifier("help"),
        data.swift.syntax.test.string_segment("Shows the active scene")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_scene_term_in_visible_copy"
	result.warn[0].artifact == "Sources/App/Toolbar.swift"
	result.warn[0].line == 34
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_window_copy if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/WindowCopy.swift", [
  data.swift.syntax.test.function_call(41, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Open this window from the Window menu")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_non_visible_scene_identifier if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/App.swift", [
  data.swift.syntax.test.function_call(8, 5, [
        data.swift.syntax.test.identifier("WindowGroup"),
        data.swift.syntax.test.identifier("id"),
        data.swift.syntax.test.string_segment("primary-scene")
      ])
])

	count(result.warn) == 0
}

test_does_not_warn_for_scenery_word_boundary if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/Gallery.swift", [
  data.swift.syntax.test.function_call(18, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Choose scenery")
      ])
])

	count(result.warn) == 0
}
