package apple.hig.components.standard_navigation_labels
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := standard_navigation_label_warning[_]
]

standard_navigation_label_warning contains {
  "rule_id": "apple.hig.components.review_text_navigation_label",
  "message": "Review text navigation label; prefer standard Back or Close controls and symbols.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  navigation_text_call_names[callee.baseName]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  navigation_label_texts[segment.content]
}

navigation_text_call_names := {"Button", "Text", "Label", "Link"}
navigation_label_texts := {"Back", "Close"}
