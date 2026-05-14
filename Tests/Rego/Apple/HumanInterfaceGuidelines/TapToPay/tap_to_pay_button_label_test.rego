package apple.hig.tap_to_pay.tap_to_pay_button_label

test_warns_for_nonstandard_tap_to_pay_button_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(24, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Start Tap to Pay")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
  result.warn[0].artifact == "Sources/App/CheckoutView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_warns_for_tap_to_pay_case_variant_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(31, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Tap to pay on iPhone")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
}

test_warns_for_apple_tap_to_pay_label_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(36, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Apple Tap to Pay")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.tap_to_pay.review_button_label"
  result.warn[0].message == "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\"."
}

test_does_not_warn_for_hig_tap_to_pay_button_labels if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(39, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Tap to Pay")
      ]),
  data.swift.syntax.test.function_call(40, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Tap to Pay on iPhone")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_non_button_tap_to_pay_copy_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(49, 9, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Start Tap to Pay")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_unrelated_button_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(58, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Pay with card")
      ])
])

  count(result.warn) == 0
}
