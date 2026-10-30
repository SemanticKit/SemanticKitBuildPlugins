package apple.hig.patterns.undo_redo_controls
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := custom_undo_redo_control_warning[_]
]

undo_redo_surface_names := {"Button", "Text", "Label", "Link"}

custom_undo_redo_control_warning contains {
  "rule_id": "apple.hig.patterns.review_custom_undo_redo_control",
  "message": "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  undo_redo_surface_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  {"Undo", "Redo"}[segment.content]
}
