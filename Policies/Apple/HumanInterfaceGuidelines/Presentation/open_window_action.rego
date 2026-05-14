package apple.hig.presentation.open_window_action

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := open_window_action_warning[_]
]

open_window_action_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.presentation.review_open_window_action", "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  open_window_swift_syntax(call)
}

open_window_swift_syntax(call) if {
  data.apple.hig.swift_syntax.call_named(call, "openWindow")
}

open_window_swift_syntax(call) if {
  data.apple.hig.swift_syntax.call_named(call, "openWindow")
}
