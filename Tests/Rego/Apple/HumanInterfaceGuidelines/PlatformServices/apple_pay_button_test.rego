package apple.hig.platform_services.apple_pay_button

test_warns_for_custom_button_with_apple_pay_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/CheckoutView.swift",
          "line": 24,
          "column": 13,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Apple Pay"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.platform_services.review_custom_apple_pay_button"
  result.warn[0].message == "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos."
  result.warn[0].artifact == "Sources/App/CheckoutView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_pkpaymentbutton if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/CheckoutView.swift",
          "line": 31,
          "column": 9,
          "calledExpression": "PKPaymentButton",
          "baseName": "PKPaymentButton",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Apple Pay"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
