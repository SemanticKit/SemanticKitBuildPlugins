package apple.hig.accessibility.accessibility_hidden

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
  warning := accessibility_hidden_warning[_]
]

accessibility_hidden_warning contains data.swift.syntax.warning(call, "apple.hig.accessibility.review_accessibility_hidden", "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value.") if {
  call := data.swift.syntax.function_calls[_]
  accessibility_hidden_call(call)
}

accessibility_hidden_call(call) if {
  data.swift.syntax.call_named(call, "accessibilityHidden")
}

accessibility_hidden_call(call) if {
  data.swift.syntax.call_named(call, "accessibilityHidden")
}
