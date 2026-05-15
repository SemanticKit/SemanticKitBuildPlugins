package apple.hig.content.image_tap_gesture

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
  warning := tap_gesture_action_warning[_]
]

tap_gesture_action_warning contains data.swift.syntax.warning(call, "apple.hig.content.review_tap_gesture_action", "Review tap gesture action; use a Button when visible content initiates an action.") if {
  call := data.swift.syntax.function_calls[_]
  tap_gesture_call(call)
}

tap_gesture_call(call) if {
  data.swift.syntax.call_named(call, "onTapGesture")
}

tap_gesture_call(call) if {
  data.swift.syntax.call_named(call, "onTapGesture")
}
