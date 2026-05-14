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

context_menu_availability_warning contains {
  "rule_id": "apple.hig.components.review_context_menu_availability",
  "message": "Review context-menu usage and confirm commands are also available from the main interface or menu bar.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  context_menu_call(fact)
}

context_menu_call(fact) if {
  fact.baseName == "contextMenu"
}

context_menu_call(fact) if {
  fact.memberName == "contextMenu"
}
