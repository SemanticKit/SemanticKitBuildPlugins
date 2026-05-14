package apple.hig.platform_services.apple_pay_button

apple_pay_button_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.platform_services.review_apple_pay_term_casing", "Review visible Apple Pay string literal; use the Apple Pay term casing.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  apple_pay_term_casing_visible_string_call(call)
  has_incorrect_apple_pay_term_casing(call)
}

apple_pay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

apple_pay_term_casing_visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_pay_term_casing_visible_string_call_names)
}

apple_pay_term_casing_visible_string_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, apple_pay_term_casing_visible_string_call_names)
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  lower_count := count(split(lower(argument), "apple pay")) - 1
  correct_count := count(split(argument, "Apple Pay")) - 1
  lower_count > correct_count
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  contains(lower(argument), "applepay")
}

has_incorrect_apple_pay_term_casing(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  contains(lower(argument), "apple-pay")
}
