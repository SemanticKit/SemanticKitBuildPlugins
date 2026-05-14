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

apple_pay_button_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.platform_services.review_custom_apple_pay_button", "Review Apple Pay button; use Apple-provided APIs and avoid custom Apple Pay button text or logos.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  custom_payment_surface_call(call)
  has_apple_pay_string_argument(call)
  not apple_pay_api_call(call)
}

custom_payment_surface_names := {"Button", "Text", "Label", "Link"}
apple_pay_api_names := {"PKPaymentButton", "PayWithApplePayButton", "ApplePayButton"}

custom_payment_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_payment_surface_names)
}

custom_payment_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, custom_payment_surface_names)
}

apple_pay_api_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_pay_api_names)
}

apple_pay_api_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_pay_api_names)
}

has_apple_pay_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  indexof(argument, "Apple Pay") >= 0
}
