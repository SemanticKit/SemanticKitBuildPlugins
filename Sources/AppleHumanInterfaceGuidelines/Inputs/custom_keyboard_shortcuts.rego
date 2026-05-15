package apple.hig.inputs.custom_keyboard_shortcuts

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
  warning := custom_keyboard_shortcut_warning[_]
]

custom_keyboard_shortcut_warning contains data.swift.syntax.warning(call, "apple.hig.inputs.review_custom_keyboard_shortcut", "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary.") if {
  call := data.swift.syntax.function_calls[_]
  keyboard_shortcut_call(call)
}

keyboard_shortcut_call(call) if {
  data.swift.syntax.call_named(call, "keyboardShortcut")
}

keyboard_shortcut_call(call) if {
  data.swift.syntax.call_named(call, "keyboardShortcut")
}
