package apple.hig.sharing.shareplay_term

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := shareplay_term_warning[_]
]

visible_string_call_names := {"Text", "Button", "Label"}

modified_shareplay_terms := {
  "shareplaying",
  "shareplayed",
  "shareplays",
  "share-play",
  "share play",
  "shareplay session",
}

shareplay_term_warning contains {
  "rule_id": "apple.hig.sharing.review_shareplay_term",
  "message": "Review visible SharePlay terminology; use SharePlay as a noun or direct-action verb without modifying the term.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  visible_string_call_names[callee.baseName]

  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := segment.content

  term := modified_shareplay_terms[_]
  contains(lower(argument), term)
}
