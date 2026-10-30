package apple.hig.siri.hey_siri_phrase
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := hey_siri_phrase_warning[_]
]

hey_siri_phrase_warning contains {
  "rule_id": "apple.hig.siri.review_hey_siri_phrase",
  "message": "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "AppShortcut"
  some labeled_argument in call.arguments
  labeled_argument.label == "phrases"
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  phrase := segment.content
  contains(lower(phrase), "hey siri")
}

hey_siri_phrase_warning contains {
  "rule_id": "apple.hig.siri.review_hey_siri_phrase",
  "message": "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "AppShortcut"
  some labeled_argument in call.arguments
  labeled_argument.label == "phrases"
  some element in labeled_argument.expression.arrayExpr.elements
  literal := element.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  phrase := segment.content
  contains(lower(phrase), "hey siri")
}
