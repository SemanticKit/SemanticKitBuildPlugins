package apple.hig.in_app_purchase.refund_labels

test_warns_for_complex_refund_button_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PurchaseView.swift", [
  data.swift.syntax.test.function_call(42, 11, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Start a refund claim")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.in_app_purchase.review_refund_action_label"
  result.warn[0].message == "Review refund action label; use simple labels such as Refund or Request a Refund."
  result.warn[0].artifact == "Sources/App/PurchaseView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_simple_refund_button_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PurchaseView.swift", [
  data.swift.syntax.test.function_call(47, 11, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Request a Refund")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_refund_button_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/PurchaseView.swift", [
  data.swift.syntax.test.function_call(52, 11, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Purchase Help")
      ])
])

  count(result.warn) == 0
}
