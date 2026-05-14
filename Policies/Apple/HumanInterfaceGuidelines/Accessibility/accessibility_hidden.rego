package apple.hig.accessibility.accessibility_hidden

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := accessibility_hidden_warning[_]
]

accessibility_hidden_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.accessibility.review_accessibility_hidden", "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  accessibility_hidden_call(call)
}

accessibility_hidden_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "accessibilityHidden")
}

accessibility_hidden_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "accessibilityHidden")
}
