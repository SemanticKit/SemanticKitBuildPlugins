package apple.hig.healthkit.healthkit_terms
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := healthkit_term_warning[_]
]

healthkit_term_warning contains {
  "rule_id": "apple.hig.healthkit.review_user_facing_healthkit_term",
  "message": "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  {"Text", "Button", "Label", "TextField", "Alert", "help"}[callee.children[0].token.text]

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

  contains(lower(argument), "healthkit")
}

healthkit_term_warning contains {
  "rule_id": "apple.hig.healthkit.review_user_facing_healthkit_term",
  "message": "Review visible HealthKit terminology; prefer Apple Health or the Apple Health app in user-facing copy.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  {"Text", "Button", "Label", "TextField", "Alert", "help"}[callee.children[0].token.text]

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

  segment_without_correct_term := split(argument, "Apple Health")[_]
  text := lower(segment_without_correct_term)
  phrase := "apple health"
  parts := split(text, phrase)
  occurrence_count := count(parts) - 1
  some index
  before := parts[index]
  index < occurrence_count
  next_index := index + 1
  after := parts[next_index]
  {
    before == "",
    endswith(before, " "),
    endswith(before, "."),
    endswith(before, ","),
    endswith(before, ":"),
    endswith(before, ";"),
    endswith(before, "!"),
    endswith(before, "?"),
    endswith(before, "-"),
    endswith(before, "("),
    endswith(before, "["),
    endswith(before, "{"),
    endswith(before, "/"),
    endswith(before, "\\"),
    endswith(before, "'"),
    endswith(before, "\""),
  }[true]
  {
    after == "",
    startswith(after, " "),
    startswith(after, "."),
    startswith(after, ","),
    startswith(after, ":"),
    startswith(after, ";"),
    startswith(after, "!"),
    startswith(after, "?"),
    startswith(after, "-"),
    startswith(after, ")"),
    startswith(after, "]"),
    startswith(after, "}"),
    startswith(after, "/"),
    startswith(after, "\\"),
    startswith(after, "'"),
    startswith(after, "\""),
  }[true]
}
