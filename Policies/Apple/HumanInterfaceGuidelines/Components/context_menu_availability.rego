package apple.hig.components.context_menu_availability

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := context_menu_availability_warning[_]
]

context_menu_availability_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.components.review_context_menu_availability", "Review context-menu usage and confirm commands are also available from the main interface or menu bar.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  context_menu_call(call)
}

context_menu_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "contextMenu")
}

context_menu_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "contextMenu")
}
