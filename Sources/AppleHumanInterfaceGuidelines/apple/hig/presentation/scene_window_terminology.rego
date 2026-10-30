package apple.hig.presentation.scene_window_terminology
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := scene_window_terminology_warning[_]
]

visible_scene_copy_call_names := {
  "Text",
  "Label",
  "TextField",
  "SecureField",
  "Alert",
  "help",
  "navigationTitle",
  "accessibilityLabel",
  "accessibilityHint",
}

scene_action_label_call_names := {"Button", "Link", "Menu", "CommandMenu"}

scene_window_terminology_warning contains {
  "rule_id": "apple.hig.presentation.review_scene_term_in_visible_copy",
  "message": "Review visible copy that says scene; use window when referring to app windows.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  visible_scene_copy_call_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := lower(segment.content)
  term := scene_terms[_]
  has_term_with_boundaries(argument, term)
}

scene_window_terminology_warning contains {
  "rule_id": "apple.hig.presentation.review_scene_term_in_visible_copy",
  "message": "Review visible copy that says scene; use window when referring to app windows.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  visible_scene_copy_call_names[member.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := lower(segment.content)
  term := scene_terms[_]
  has_term_with_boundaries(argument, term)
}

scene_window_terminology_warning contains {
  "rule_id": "apple.hig.presentation.review_scene_term_in_action_label",
  "message": "Review action label that says scene; use window for commands that open or manage windows.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  scene_action_label_call_names[callee.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := lower(segment.content)
  term := scene_terms[_]
  has_term_with_boundaries(argument, term)
}

scene_window_terminology_warning contains {
  "rule_id": "apple.hig.presentation.review_scene_term_in_action_label",
  "message": "Review action label that says scene; use window for commands that open or manage windows.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  member := call.calledExpression.memberAccessExpr.declName
  scene_action_label_call_names[member.baseName]
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  argument := lower(segment.content)
  term := scene_terms[_]
  has_term_with_boundaries(argument, term)
}

scene_terms := {"scene", "scenes"}

boundary_characters := {
  " ",
  ".",
  ",",
  ":",
  ";",
  "!",
  "?",
  "-",
  "(",
  ")",
  "[",
  "]",
  "{",
  "}",
  "/",
  "\\",
  "'",
  "\"",
}

has_term_with_boundaries(text, term) if {
  parts := split(text, term)
  occurrence_count := count(parts) - 1
  some index
  before := parts[index]
  index < occurrence_count
  next_index := index + 1
  after := parts[next_index]
  boundary_before_term(before)
  boundary_after_term(after)
}

boundary_before_term(before) if {
  before == ""
}

boundary_before_term(before) if {
  boundary := boundary_characters[_]
  endswith(before, boundary)
}

boundary_after_term(after) if {
  after == ""
}

boundary_after_term(after) if {
  boundary := boundary_characters[_]
  startswith(after, boundary)
}
