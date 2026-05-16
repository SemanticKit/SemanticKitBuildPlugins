# METADATA
# scope: package
# entrypoint: true
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
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  member.children[0].token.text == "onTapGesture"
}
