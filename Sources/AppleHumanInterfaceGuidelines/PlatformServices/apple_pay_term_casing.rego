package apple.hig.platform_services.apple_pay_term_casing

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := apple_pay_term_casing_warning[_]
]

apple_pay_term_casing_warning contains data.swift.syntax.warning(call, "apple.hig.platform_services.review_apple_pay_term_casing", "Review visible Apple Pay string literal; use the Apple Pay term casing.") if {
  call := data.swift.syntax.function_calls[_]
  apple_pay_term_casing_visible_string_call(call)
  has_incorrect_apple_pay_term_casing(call)
}

apple_pay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

apple_pay_term_casing_visible_string_call(call) if {
  data.swift.syntax.call_named_in(call, apple_pay_term_casing_visible_string_call_names)
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  lower_count := count(split(lower(argument), "apple pay")) - 1
  correct_count := count(split(argument, "Apple Pay")) - 1
  lower_count > correct_count
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "applepay")
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.swift.syntax.string_literals(call)[_]
  contains(lower(argument), "apple-pay")
}
