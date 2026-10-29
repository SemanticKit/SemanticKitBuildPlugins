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
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  argument := segment.children[0].token.text

  term := modified_shareplay_terms[_]
  contains(lower(argument), term)
}
