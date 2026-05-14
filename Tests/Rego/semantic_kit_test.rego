package semantickit.main

test_main_decision_aggregates_apple_hig_warnings if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SiriTipsView.swift", [
  data.swift.syntax.test.function_call(17, 11, [
        data.swift.syntax.test.identifier("AppShortcut"),
        data.swift.syntax.test.identifier("intent"),
        data.swift.syntax.test.identifier("phrases"),
        data.swift.syntax.test.identifier("shortTitle"),
        data.swift.syntax.test.identifier("systemImageName"),
        data.swift.syntax.test.string_segment("Hey Siri, plan a route")
      ])
])

  count(result.deny) == 0
  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.siri.review_hey_siri_phrase"
  result.warn[0].message == "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri."
  result.warn[0].artifact == "Sources/App/SiriTipsView.swift"
  result.warn[0].line == 17
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_main_decision_aggregates_newest_tap_to_pay_label_warning if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Apple Tap to Pay")
      ])
])

  count(result.deny) == 0
  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
  result.warn[0].artifact == "Sources/App/CheckoutView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_main_decision_aggregates_newly_wired_hig_batch_warning if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/OrdersView.swift", [
  data.swift.syntax.test.function_call(18, 7, [
        data.swift.syntax.test.identifier("TableColumn"),
        data.swift.syntax.test.identifier("value"),
        data.swift.syntax.test.string_segment("Status:")
      ])
])

  count(result.deny) == 0
  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tables.review_column_heading_trailing_colon"
  result.warn[0].artifact == "Sources/App/OrdersView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_main_decision_aggregates_design_guideline_dictionary_warning if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/SemanticKitBuildPlugins/PolicyDiagnostics.swift", [
  data.swift.syntax.test.function_call(42, 13, [
        data.swift.syntax.test.identifier("Dictionary"),
        data.swift.syntax.test.identifier("uniqueKeysWithValues"),
        data.swift.syntax.test.string_segment("rule_id"),
        data.swift.syntax.test.string_segment("message"),
        data.swift.syntax.test.string_segment("severity")
      ])
])

  count(result.deny) == 0
  count(result.warn) == 1
  result.warn[0].rule_id == "semantickit.design_guidelines.no_dictionary_boundary_plumbing"
  result.warn[0].artifact == "Sources/SemanticKitBuildPlugins/PolicyDiagnostics.swift"
  result.warn[0].line == 42
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}
