package apple.hig.platform_services.apple_pay_term_casing

test_warns_for_lowercase_apple_pay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(22, 11, [
        data.swift.syntax.test.identifier("Text"),
        data.swift.syntax.test.string_segment("Pay with apple pay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
  warnings[0].message == "Review visible Apple Pay string literal; use the Apple Pay term casing."
  warnings[0].artifact == "Sources/App/CheckoutView.swift"
  warnings[0].line == 22
  warnings[0].column == 11
  warnings[0].severity == "warning"
}

test_warns_for_unspaced_apple_pay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(30, 13, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Use ApplePay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 1
}

test_does_not_warn_for_correct_apple_pay_term_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutView.swift", [
  data.swift.syntax.test.function_call(38, 9, [
        data.swift.syntax.test.identifier("Label"),
        data.swift.syntax.test.string_segment("Pay with Apple Pay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}

test_does_not_warn_for_non_visible_apple_pay_string_swift_syntax if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/CheckoutLogger.swift", [
  data.swift.syntax.test.function_call(46, 17, [
        data.swift.syntax.test.identifier("Logger"),
        data.swift.syntax.test.identifier("subsystem"),
        data.swift.syntax.test.string_segment("apple pay")
      ])
])

  warnings := [warning |
    warning := result.warn[_]
    warning.rule_id == "apple.hig.platform_services.review_apple_pay_term_casing"
  ]
  count(warnings) == 0
}
