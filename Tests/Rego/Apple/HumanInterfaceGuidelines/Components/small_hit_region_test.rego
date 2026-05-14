package apple.hig.components.small_hit_region

test_warns_for_explicit_small_frame_dimensions_that_may_affect_hit_regions if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(31, 12, [
        data.swift.syntax.test.identifier("frame"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.identifier("height"),
        data.swift.syntax.test.integer_literal("32"),
        data.swift.syntax.test.integer_literal("32")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_small_hit_region"
  result.warn[0].message == "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 31
  result.warn[0].column == 12
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_explicit_44_by_44_frame_dimensions if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(31, 12, [
        data.swift.syntax.test.identifier("frame"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.identifier("height"),
        data.swift.syntax.test.integer_literal("44"),
        data.swift.syntax.test.integer_literal("44")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_small_numeric_argument_without_width_and_height_labels if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(31, 12, [
        data.swift.syntax.test.identifier("frame"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.integer_literal("32")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_frame_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(31, 12, [
        data.swift.syntax.test.identifier("customSize"),
        data.swift.syntax.test.identifier("width"),
        data.swift.syntax.test.identifier("height"),
        data.swift.syntax.test.integer_literal("32"),
        data.swift.syntax.test.integer_literal("32")
      ])
])

  count(result.warn) == 0
}
