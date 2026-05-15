package apple.hig.presentation.open_window_action

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
  warning := open_window_action_warning[_]
]

open_window_action_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_open_window_action", "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate.") if {
  call := data.swift.syntax.function_calls[_]
  open_window_swift_syntax(call)
}

open_window_swift_syntax(call) if {
  data.swift.syntax.call_named(call, "openWindow")
}

open_window_swift_syntax(call) if {
  data.swift.syntax.call_named(call, "openWindow")
}
