# METADATA
# scope: package
# entrypoint: true
package apple.hig.components.small_hit_region
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := small_hit_region_warning[_]
]

small_hit_region_warning contains {
  "rule_id": "apple.hig.components.review_small_hit_region",
  "message": "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions.",
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
  member.children[0].token.text == "frame"

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  width_argument := argument_list.children[_]
  width_argument.children[0].token.text == "width"
  height_argument := argument_list.children[_]
  height_argument.children[0].token.text == "height"

  numeric_argument := argument_list.children[_]
  literal := numeric_argument.children[_]
  {"IntegerLiteralExprSyntax", "FloatLiteralExprSyntax"}[literal.type]
  dimension := to_number(literal.children[0].token.text)
  dimension < 44
}
