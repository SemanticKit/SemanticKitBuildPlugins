package apple.hig.tap_to_pay.tap_to_pay_button_label

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tap_to_pay_button_label_warning[_]
]

tap_to_pay_button_label_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.tap_to_pay.review_button_label", "Review Tap to Pay button label string literal; Apple HIG button labels are \"Tap to Pay on iPhone\" or \"Tap to Pay\".") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  button_call(call)
  has_nonstandard_tap_to_pay_label(call)
}

button_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Button")
}

button_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "Button")
}

allowed_tap_to_pay_button_labels := {
  "Tap to Pay",
  "Tap to Pay on iPhone",
}

has_nonstandard_tap_to_pay_label(call) if {
  label := data.apple.hig.swift_syntax.string_literals(call)[_]
  tap_to_pay_label_reference(label)
  not allowed_tap_to_pay_button_label(label)
}

allowed_tap_to_pay_button_label(label) if {
  allowed_tap_to_pay_button_labels[label]
}

tap_to_pay_label_reference(label) if {
  contains(lower(label), "tap to pay")
}

tap_to_pay_label_reference(label) if {
  contains(lower(label), "tap-to-pay")
}
