package apple.hig.widgets.widget_margins

test_warns_for_content_margins_disabled_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/TrailWidget.swift", [
  data.swift.syntax.test.function_call(55, 8, [
        data.swift.syntax.test.identifier("contentMarginsDisabled")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.widgets.review_content_margins_disabled"
  result.warn[0].message == "Review disabled widget content margins; use standard widget margins for legibility unless the design needs custom spacing."
  result.warn[0].artifact == "Sources/App/TrailWidget.swift"
  result.warn[0].line == 55
  result.warn[0].column == 8
  result.warn[0].severity == "warning"
}

test_warns_for_member_only_content_margins_disabled_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SummaryWidget.swift", [
  data.swift.syntax.test.function_call(64, 10, [
        data.swift.syntax.test.identifier("contentMarginsDisabled")
      ])
])

  count(result.warn) == 1
  result.warn[0].artifact == "Sources/App/SummaryWidget.swift"
}

test_does_not_warn_for_other_spacing_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/TrailWidget.swift", [
  data.swift.syntax.test.function_call(70, 8, [
        data.swift.syntax.test.identifier("padding"),
        data.swift.syntax.test.integer_literal("16")
      ])
])

  count(result.warn) == 0
}
