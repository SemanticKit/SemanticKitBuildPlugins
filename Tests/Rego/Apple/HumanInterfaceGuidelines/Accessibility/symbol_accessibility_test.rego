package apple.hig.accessibility.symbol_accessibility

test_warns_for_system_symbol_image_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(24, 13, [
        data.swift.syntax.test.identifier("Image"),
        data.swift.syntax.test.identifier("systemName"),
        data.swift.syntax.test.string_segment("square.and.arrow.up")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_symbol_accessibility_label"
  result.warn[0].message == "Review symbol image accessibility; provide alternative text for custom interface icons and symbols."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asset_image_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/ContentView.swift", [
  data.swift.syntax.test.function_call(31, 13, [
        data.swift.syntax.test.identifier("Image"),
        data.swift.syntax.test.string_segment("assetName")
      ])
])

  count(result.warn) == 0
}
