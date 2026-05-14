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

custom_undo_redo_control_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_undo_redo_control",
  "message": "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  undo_redo_surface_call(fact)
  has_exact_undo_redo_string_argument(fact)
}

undo_redo_surface_names := {"Button", "Text", "Label", "Link"}

undo_redo_surface_call(fact) if {
  undo_redo_surface_names[fact.baseName]
}

undo_redo_surface_call(fact) if {
  undo_redo_surface_names[fact.memberName]
}

has_exact_undo_redo_string_argument(fact) if {
  argument := fact.stringArguments[_]
  argument == "Undo"
}

has_exact_undo_redo_string_argument(fact) if {
  argument := fact.stringArguments[_]
  argument == "Redo"
}
