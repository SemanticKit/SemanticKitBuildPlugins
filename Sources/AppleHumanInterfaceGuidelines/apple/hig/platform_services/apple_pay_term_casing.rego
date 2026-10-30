package apple.hig.platform_services.apple_pay_term_casing
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := apple_pay_term_casing_warning[_]
]

apple_pay_term_casing_visible_string_call_names := {"Text", "Button", "Label", "Link", "TextField", "Alert", "help"}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  apple_pay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  lower_count := count(split(lower(argument), "apple pay")) - 1
  correct_count := count(split(argument, "Apple Pay")) - 1
  lower_count > correct_count
}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  apple_pay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  contains(lower(argument), "applepay")
}

apple_pay_term_casing_warning contains {
  "rule_id": "apple.hig.platform_services.review_apple_pay_term_casing",
  "message": "Review visible Apple Pay string literal; use the Apple Pay term casing.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  # `name(...)` or the modifier form `base.name(...)`
  reference := called_reference(call)
  apple_pay_term_casing_visible_string_call_names[reference.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  contains(lower(argument), "apple-pay")
}

# The name a call calls: `Text` in `Text("…")`, `help` in `.help("…")`.
called_reference(call) := call.calledExpression.declReferenceExpr

called_reference(call) := call.calledExpression.memberAccessExpr.declName
