package apple.hig.patterns.undo_redo_controls

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_undo_redo_control_warning[_]
]

custom_undo_redo_control_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.patterns.review_custom_undo_redo_control", "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  undo_redo_surface_call(call)
  has_exact_undo_redo_string_argument(call)
}

undo_redo_surface_names := {"Button", "Text", "Label", "Link"}

undo_redo_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, undo_redo_surface_names)
}

undo_redo_surface_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, undo_redo_surface_names)
}

has_exact_undo_redo_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  argument == "Undo"
}

has_exact_undo_redo_string_argument(call) if {
  argument := data.apple.hig.swift_syntax.string_literals(call)[_]
  argument == "Redo"
}
