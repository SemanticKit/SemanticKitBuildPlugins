package apple.hig.accessibility.fixed_font_size
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := fixed_font_size_warning[_]
]

fixed_font_size_warning contains {
  "rule_id": "apple.hig.accessibility.review_fixed_font_size",
  "message": "Review literal SwiftUI system font size use; support larger text sizes.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  member := call.calledExpression.memberAccessExpr.declName
  member.baseName == "system"

  some argument in call.arguments
  argument.label == "size"

  literal := number_literal(argument.expression)
}

# A number written as a literal: `44`, `0.5`.
number_literal(expression) := expression.integerLiteralExpr

number_literal(expression) := expression.floatLiteralExpr
