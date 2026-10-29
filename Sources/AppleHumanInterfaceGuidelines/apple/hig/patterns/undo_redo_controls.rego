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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  undo_redo_surface_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  {"Undo", "Redo"}[segment.children[0].token.text]
}
