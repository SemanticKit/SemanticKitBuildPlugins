package apple.hig.components.help_button
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_help_button_warning[_]
]

custom_help_button_warning contains {
  "rule_id": "apple.hig.components.review_custom_help_button",
  "message": "Review custom Help button; use the system help button for help documentation where appropriate.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs

  callee := call.calledExpression.declReferenceExpr
  help_text_call_names[callee.baseName]

  some argument in call.arguments
  literal := argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  segment.content == "Help"
}

help_text_call_names := {"Button", "Text", "Label", "Link"}
