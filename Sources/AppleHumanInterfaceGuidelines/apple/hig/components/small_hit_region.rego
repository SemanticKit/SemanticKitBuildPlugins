package apple.hig.components.small_hit_region
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  some call in input.functionCallExprs

  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "frame"

  some width_argument in call.arguments
  width_argument.label == "width"
  some height_argument in call.arguments
  height_argument.label == "height"

  some numeric_argument in call.arguments
  literal := number_literal(numeric_argument.expression)
  dimension := to_number(literal.literal)
  dimension < 44
}

# A number written as a literal: `44`, `0.5`.
number_literal(expression) := expression.integerLiteralExpr

number_literal(expression) := expression.floatLiteralExpr
