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

table_column_heading_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.tables.review_column_heading_trailing_colon", "Review table column heading; column headings should avoid trailing punctuation such as a colon.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  table_column_call(call)
  heading := data.apple.hig.swift_syntax.string_literals(call)[_]
  endswith(heading, ":")
}

table_column_heading_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.tables.review_column_heading_sentence_punctuation", "Review table column heading; use a short noun or noun phrase without ending punctuation.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  table_column_call(call)
  heading := data.apple.hig.swift_syntax.string_literals(call)[_]
  has_sentence_ending_punctuation(heading)
}

sentence_ending_punctuations := [".", "!", "?"]

table_column_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "TableColumn")
}

table_column_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "TableColumn")
}

has_sentence_ending_punctuation(heading) if {
  punctuation := sentence_ending_punctuations[_]
  endswith(heading, punctuation)
}
