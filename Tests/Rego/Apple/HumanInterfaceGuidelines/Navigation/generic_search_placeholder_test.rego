package apple.hig.navigation.generic_search_placeholder

test_warns_for_text_field_search_placeholder if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SearchView.swift", [
  data.swift.syntax.test.function_call(14, 7, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Search")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].message == "Review search field placeholder; describe what people can search for instead of using generic Search text."
  result.warn[0].artifact == "Sources/App/SearchView.swift"
  result.warn[0].line == 14
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_searchable_member_search_placeholder if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/LibraryView.swift", [
  data.swift.syntax.test.function_call(31, 5, [
        data.swift.syntax.test.identifier("searchable"),
        data.swift.syntax.test.identifier("text"),
        data.swift.syntax.test.identifier("placement"),
        data.swift.syntax.test.identifier("prompt"),
        data.swift.syntax.test.string_segment("Search")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].artifact == "Sources/App/LibraryView.swift"
  result.warn[0].line == 31
  result.warn[0].column == 5
}

test_warns_for_searchable_base_search_prompt if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/LibraryView.swift", [
  data.swift.syntax.test.function_call(37, 5, [
        data.swift.syntax.test.identifier("searchable"),
        data.swift.syntax.test.identifier("text"),
        data.swift.syntax.test.identifier("prompt"),
        data.swift.syntax.test.string_segment("Search")
      ])
])

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].artifact == "Sources/App/LibraryView.swift"
  result.warn[0].line == 37
  result.warn[0].column == 5
}

test_does_not_warn_for_descriptive_search_placeholder if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SearchView.swift", [
  data.swift.syntax.test.function_call(19, 7, [
        data.swift.syntax.test.identifier("TextField"),
        data.swift.syntax.test.string_segment("Search messages")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_searchable_search_without_prompt_label if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/LibraryView.swift", [
  data.swift.syntax.test.function_call(41, 5, [
        data.swift.syntax.test.identifier("searchable"),
        data.swift.syntax.test.identifier("text"),
        data.swift.syntax.test.identifier("placement"),
        data.swift.syntax.test.string_segment("Search")
      ])
])

  count(result.warn) == 0
}

test_does_not_warn_for_generic_search_text_on_unrelated_call if {
  result := decision with input as data.swift.syntax.test.source_input("Sources/App/SearchView.swift", [
  data.swift.syntax.test.function_call(23, 9, [
        data.swift.syntax.test.identifier("Button"),
        data.swift.syntax.test.string_segment("Search")
      ])
])

  count(result.warn) == 0
}
