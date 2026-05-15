package apple.hig.components.context_menu_availability

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
  warning := context_menu_availability_warning[_]
]

context_menu_availability_warning contains data.swift.syntax.warning(call, "apple.hig.components.review_context_menu_availability", "Review context-menu usage and confirm commands are also available from the main interface or menu bar.") if {
  call := data.swift.syntax.function_calls[_]
  context_menu_call(call)
}

context_menu_call(call) if {
  data.swift.syntax.call_named(call, "contextMenu")
}

context_menu_call(call) if {
  data.swift.syntax.call_named(call, "contextMenu")
}
