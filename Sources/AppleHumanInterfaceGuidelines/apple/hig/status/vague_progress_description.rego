package apple.hig.status.vague_progress_description
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := vague_progress_description_warning[_]
]

vague_progress_terms := {"loading", "loading...", "please wait", "working", "authenticating"}

vague_progress_description_warning contains {
  "rule_id": "apple.hig.status.review_vague_progress_description",
  "message": "Review progress description; use accurate, succinct text instead of vague status copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "ProgressView"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  description := segment.content
  vague_progress_terms[lower(description)]
}
