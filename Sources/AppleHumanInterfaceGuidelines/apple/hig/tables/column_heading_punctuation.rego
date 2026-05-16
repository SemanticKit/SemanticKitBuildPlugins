# METADATA
# scope: package
# entrypoint: true
package apple.hig.tables.column_heading_punctuation
default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := table_column_heading_warning[_]
]

table_column_heading_warning contains {
  "rule_id": "apple.hig.tables.review_column_heading_trailing_colon",
  "message": "Review table column heading; column headings should avoid trailing punctuation such as a colon.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "TableColumn"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  heading := segment.children[0].token.text
  endswith(heading, ":")
}

table_column_heading_warning contains {
  "rule_id": "apple.hig.tables.review_column_heading_sentence_punctuation",
  "message": "Review table column heading; use a short noun or noun phrase without ending punctuation.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  call := input
  call.type == "FunctionCallExprSyntax"
  callee := call.children[0]
  callee.type == "DeclReferenceExprSyntax"
  callee.children[0].token.text == "TableColumn"
  argument_list := call.children[_]
  argument_list.type == "LabeledExprListSyntax"
  labeled_argument := argument_list.children[_]
  literal := labeled_argument.children[_]
  literal.type == "StringLiteralExprSyntax"
  segment_list := literal.children[_]
  segment_list.type == "StringLiteralSegmentListSyntax"
  segment := segment_list.children[_]
  segment.type == "StringSegmentSyntax"
  heading := segment.children[0].token.text
  punctuation := sentence_ending_punctuations[_]
  endswith(heading, punctuation)
}

sentence_ending_punctuations := [".", "!", "?"]
