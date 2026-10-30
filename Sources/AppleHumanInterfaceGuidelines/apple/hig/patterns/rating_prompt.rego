package apple.hig.patterns.rating_prompt
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_rating_prompt_warning[_]
]

custom_rating_surface_names := {"Button", "Text", "Label", "Link"}
system_rating_prompt_names := {"RequestReviewAction", "requestReview", "SKStoreReviewController", "requestReviewInCurrentScene"}

custom_rating_prompt_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_rating_prompt",
  "message": "Review custom rating prompt; prefer the system rating prompt and ask only after engagement.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee_name := callee.baseName
  custom_rating_surface_names[callee_name]
  not system_rating_prompt_names[callee_name]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  {indexof(argument, "Rate") >= 0, indexof(argument, "Review") >= 0}[true]
}
