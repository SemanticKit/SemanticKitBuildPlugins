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
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "ProgressView"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  description := segment.children[0].token.text
  vague_progress_terms[lower(description)]
}
