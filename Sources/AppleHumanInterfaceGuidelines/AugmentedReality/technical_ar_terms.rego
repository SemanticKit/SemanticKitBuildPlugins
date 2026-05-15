package apple.hig.augmented_reality.technical_ar_terms

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := technical_ar_terms_warning[_]
]

technical_ar_terms_warning contains {
  "rule_id": "apple.hig.augmented_reality.review_technical_ar_terms",
  "message": "Review AR instructional text; use approachable terms instead of technical AR terminology.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  visible_string_call_names[callee.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  term := technical_ar_terms[_]
  contains(lower(segment.children[0].token.text), term)
}

technical_ar_terms_warning contains {
  "rule_id": "apple.hig.augmented_reality.review_technical_ar_terms",
  "message": "Review AR instructional text; use approachable terms instead of technical AR terminology.",
  "artifact": input.sourceFile,
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  walk(input.swiftSyntax, [_, call])
  call.type == "FunctionCallExprSyntax"

  callee := call.children[0]
  callee.type == "MemberAccessExprSyntax"
  member := callee.children[count(callee.children) - 1]
  member.type == "DeclReferenceExprSyntax"
  visible_string_call_names[member.children[0].token.text]

  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  argument := argument_list.children[_]
  literal := argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  term := technical_ar_terms[_]
  contains(lower(segment.children[0].token.text), term)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}
technical_ar_terms := {"arkit", "world detection", "tracking"}
