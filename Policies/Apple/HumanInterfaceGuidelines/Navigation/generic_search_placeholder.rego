package apple.hig.navigation.generic_search_placeholder

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := generic_search_placeholder_warning[_]
]

generic_search_placeholder_warning contains {
  "rule_id": "apple.hig.navigation.review_generic_search_placeholder",
  "message": "Review search field placeholder; describe what people can search for instead of using generic Search text.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  generic_search_placeholder_call(fact)
  has_generic_search_placeholder(fact)
}

search_field_call_names := {"TextField", "SearchField", "NSSearchField"}

generic_search_placeholder_call(fact) if {
  search_field_call_names[fact.baseName]
}

generic_search_placeholder_call(fact) if {
  search_field_call_names[fact.memberName]
}

generic_search_placeholder_call(fact) if {
  searchable_call(fact)
  has_argument_label(fact, "prompt")
}

searchable_call(fact) if {
  fact.baseName == "searchable"
}

searchable_call(fact) if {
  fact.memberName == "searchable"
}

has_generic_search_placeholder(fact) if {
  placeholder := fact.stringArguments[_]
  placeholder == "Search"
}

has_argument_label(fact, label) if {
  fact.argumentLabels[_] == label
}
