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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_scene_copy_call_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := lower(segment.children[0].token.text)
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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  visible_scene_copy_call_names[member.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := lower(segment.children[0].token.text)
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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  scene_action_label_call_names[callee.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := lower(segment.children[0].token.text)
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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  scene_action_label_call_names[member.children[0].token.text]
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := lower(segment.children[0].token.text)
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
