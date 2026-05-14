package apple.hig.inputs.custom_keyboard_shortcuts

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_keyboard_shortcut_warning[_]
]

custom_keyboard_shortcut_warning contains {
  "rule_id": "apple.hig.inputs.review_custom_keyboard_shortcut",
  "message": "Review custom keyboard shortcut; prefer standard shortcuts and define custom shortcuts only when necessary.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  keyboard_shortcut_call(fact)
}

keyboard_shortcut_call(fact) if {
  fact.baseName == "keyboardShortcut"
}

keyboard_shortcut_call(fact) if {
  fact.memberName == "keyboardShortcut"
}
