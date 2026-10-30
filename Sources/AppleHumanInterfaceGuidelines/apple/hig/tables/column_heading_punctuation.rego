package apple.hig.tables.column_heading_punctuation
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
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
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "TableColumn"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  heading := segment.content
  endswith(heading, ":")
}

table_column_heading_warning contains {
  "rule_id": "apple.hig.tables.review_column_heading_sentence_punctuation",
  "message": "Review table column heading; use a short noun or noun phrase without ending punctuation.",
  "line": call.range.start.line,
  "column": call.range.start.column,
  "severity": "warning",
} if {
  some call in input.functionCallExprs
  callee := call.calledExpression.declReferenceExpr
  callee.baseName == "TableColumn"
  some labeled_argument in call.arguments
  literal := labeled_argument.expression.stringLiteralExpr
  segment := literal.segments[_].stringSegment
  heading := segment.content
  punctuation := sentence_ending_punctuations[_]
  endswith(heading, punctuation)
}

sentence_ending_punctuations := [".", "!", "?"]
