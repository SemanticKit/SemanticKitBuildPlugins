package apple.hig.content.image_tap_gesture
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "onTapGesture"
}
