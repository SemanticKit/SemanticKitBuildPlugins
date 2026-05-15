package apple.hig.in_app_purchase.refund_labels

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
  warning := refund_label_warning[_]
]

refund_label_warning contains data.swift.syntax.warning(call, "apple.hig.in_app_purchase.review_refund_action_label", "Review refund action label; use simple labels such as Refund or Request a Refund.") if {
  call := data.swift.syntax.function_calls[_]
  refund_action_call(call)
  has_complex_refund_label(call)
}

refund_action_call(call) if {
  data.swift.syntax.call_named(call, "Button")
}

refund_action_call(call) if {
  data.swift.syntax.call_named(call, "Button")
}

accepted_refund_labels := {"refund", "request a refund"}

has_complex_refund_label(call) if {
  label := data.swift.syntax.string_literals(call)[_]
  normalized_label := lower(label)
  contains(normalized_label, "refund")
  not accepted_refund_labels[normalized_label]
}
