package apple.hig.content.image_tap_gesture

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := tap_gesture_action_warning[_]
]

tap_gesture_action_warning contains {
  "rule_id": "apple.hig.content.review_tap_gesture_action",
  "message": "Review tap gesture action; use a Button when visible content initiates an action.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  tap_gesture_call(fact)
}

tap_gesture_call(fact) if {
  fact.baseName == "onTapGesture"
}

tap_gesture_call(fact) if {
  fact.memberName == "onTapGesture"
}
