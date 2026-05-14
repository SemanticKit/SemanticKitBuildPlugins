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

generic_search_placeholder_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.navigation.review_generic_search_placeholder", "Review search field placeholder; describe what people can search for instead of using generic Search text.") if {
  call := data.apple.hig.swift_syntax.function_calls[_]
  generic_search_placeholder_call(call)
  has_generic_search_placeholder(call)
}

search_field_call_names := {"TextField", "SearchField", "NSSearchField"}

generic_search_placeholder_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, search_field_call_names)
}

generic_search_placeholder_call(call) if {
  data.apple.hig.swift_syntax.call_named_in(call, search_field_call_names)
}

generic_search_placeholder_call(call) if {
  searchable_call(call)
  has_argument_label(call, "prompt")
}

searchable_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "searchable")
}

searchable_call(call) if {
  data.apple.hig.swift_syntax.call_named(call, "searchable")
}

has_generic_search_placeholder(call) if {
  placeholder := data.apple.hig.swift_syntax.string_literals(call)[_]
  placeholder == "Search"
}

has_argument_label(call, label) if {
  data.apple.hig.swift_syntax.argument_label(call, label)
}
