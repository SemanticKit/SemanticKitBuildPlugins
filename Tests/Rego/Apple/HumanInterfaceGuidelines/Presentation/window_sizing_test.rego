package apple.hig.presentation.window_sizing

test_warns_for_base_default_size_call if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/App.swift", [
  data.swift.syntax.test.function_call(16, 10, [
        data.swift.syntax.test.identifier("defaultSize"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.identifier("height"),
        data.swift.syntax.test.integer_literal("1280"),
        data.swift.syntax.test.integer_literal("720")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].message == "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable."
	result.warn[0].artifact == "Sources/App/App.swift"
	result.warn[0].line == 16
	result.warn[0].column == 10
	result.warn[0].severity == "warning"
}

test_warns_for_member_window_resizability_call if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/App.swift", [
  data.swift.syntax.test.function_call(22, 8, [
        data.swift.syntax.test.identifier("windowResizability")
      ])
])

	count(result.warn) == 1
	result.warn[0].rule_id == "apple.hig.presentation.review_window_sizing_constraints"
	result.warn[0].artifact == "Sources/App/App.swift"
	result.warn[0].line == 22
	result.warn[0].column == 8
	result.warn[0].severity == "warning"
}

test_does_not_warn_for_unrelated_frame_call if {
	result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(44, 12, [
        data.swift.syntax.test.identifier("frame"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.identifier("height"),
        data.swift.syntax.test.integer_literal("320"),
        data.swift.syntax.test.integer_literal("240")
      ])
])

	count(result.warn) == 0
}
