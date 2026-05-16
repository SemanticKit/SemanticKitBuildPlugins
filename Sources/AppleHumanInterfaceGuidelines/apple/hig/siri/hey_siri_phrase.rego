# METADATA
# scope: package
# entrypoint: true
package apple.hig.siri.hey_siri_phrase
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := hey_siri_phrase_warning[_]
]

hey_siri_phrase_warning contains {
  "rule_id": "apple.hig.siri.review_hey_siri_phrase",
  "message": "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "AppShortcut"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  labeled_argument.children[0].token.text == "phrases"
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  phrase := segment.children[0].token.text
  contains(lower(phrase), "hey siri")
}

hey_siri_phrase_warning contains {
  "rule_id": "apple.hig.siri.review_hey_siri_phrase",
  "message": "Review suggested Siri phrase; do not commandeer core Siri commands or include Hey Siri.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "AppShortcut"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  labeled_argument.children[0].token.text == "phrases"
  array := labeled_argument.children[_]
  array.type == "ArrayExprSyntax"
  element_list := array.children[_]
  element_list.type == "ArrayElementListSyntax"
  element := element_list.children[_]
  literal := element.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  phrase := segment.children[0].token.text
  contains(lower(phrase), "hey siri")
}
