package apple.hig.platform_services.apple_pay_button

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := apple_pay_button_warning[_]
]

apple_pay_button_warning contains {
  "rule_id": "apple.hig.platform_services.review_custom_apple_pay_button",
  "message": "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  custom_payment_surface_call(fact)
  has_apple_pay_string_argument(fact)
  not apple_pay_api_call(fact)
}

custom_payment_surface_names := {"Button", "Text", "Label", "Link"}
apple_pay_api_names := {"PKPaymentButton", "PayWithApplePayButton", "ApplePayButton"}

custom_payment_surface_call(fact) if {
  custom_payment_surface_names[fact.baseName]
}

custom_payment_surface_call(fact) if {
  custom_payment_surface_names[fact.memberName]
}

apple_pay_api_call(fact) if {
  apple_pay_api_names[fact.baseName]
}

apple_pay_api_call(fact) if {
  apple_pay_api_names[fact.memberName]
}

has_apple_pay_string_argument(fact) if {
  argument := fact.stringArguments[_]
  indexof(argument, "Apple Pay") >= 0
}
