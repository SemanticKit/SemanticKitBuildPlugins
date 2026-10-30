package apple.hig.augmented_reality.technical_ar_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := technical_ar_terms_warning[_]
]

technical_ar_terms_warning contains {
  "rule_id": "apple.hig.augmented_reality.review_technical_ar_terms",
  "message": "Review AR instructional text; use approachable terms instead of technical AR terminology.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  visible_string_call_names[callee.baseName]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  term := technical_ar_terms[_]
  contains(lower(segment.content), term)
}

technical_ar_terms_warning contains {
  "rule_id": "apple.hig.augmented_reality.review_technical_ar_terms",
  "message": "Review AR instructional text; use approachable terms instead of technical AR terminology.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  member := call.calledExpression.memberAccessExpr.declName
  visible_string_call_names[member.baseName]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  term := technical_ar_terms[_]
  contains(lower(segment.content), term)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}
technical_ar_terms := {"arkit", "world detection", "tracking"}
