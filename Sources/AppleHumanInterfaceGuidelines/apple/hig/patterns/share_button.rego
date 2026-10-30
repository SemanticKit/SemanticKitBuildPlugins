package apple.hig.patterns.share_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_share_button_warning[_]
]

custom_share_surface_names := {"Button", "Text", "Label", "Link"}

custom_share_button_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_share_button",
  "message": "Review custom Share control; prefer ShareLink or the system share sheet where available.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee_name := callee.baseName
  custom_share_surface_names[callee_name]
  callee_name != "ShareLink"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content
  {argument == "Share", indexof(argument, "Share ") >= 0, indexof(argument, " share") >= 0}[true]
}
