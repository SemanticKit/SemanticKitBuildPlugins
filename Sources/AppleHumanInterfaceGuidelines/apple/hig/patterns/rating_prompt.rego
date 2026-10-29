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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee_name := callee.children[0].token.text
  custom_rating_surface_names[callee_name]
  not system_rating_prompt_names[callee_name]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text
  {indexof(argument, "Rate") >= 0, indexof(argument, "Review") >= 0}[true]
}
