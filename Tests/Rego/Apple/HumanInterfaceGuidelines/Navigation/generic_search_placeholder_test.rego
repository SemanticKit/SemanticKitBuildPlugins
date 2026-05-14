package apple.hig.navigation.generic_search_placeholder

test_warns_for_text_field_search_placeholder if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SearchView.swift",
          "line": 14,
          "column": 7,
          "calledExpression": "TextField",
          "baseName": "TextField",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Search"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].message == "Review search field placeholder; describe what people can search for instead of using generic Search text."
  result.warn[0].artifact == "Sources/App/SearchView.swift"
  result.warn[0].line == 14
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_warns_for_searchable_member_search_placeholder if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/LibraryView.swift",
          "line": 31,
          "column": 5,
          "calledExpression": ".searchable",
          "baseName": "",
          "memberName": "searchable",
          "argumentLabels": ["text", "placement", "prompt"],
          "stringArguments": ["Search"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].artifact == "Sources/App/LibraryView.swift"
  result.warn[0].line == 31
  result.warn[0].column == 5
}

test_warns_for_searchable_base_search_prompt if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/LibraryView.swift",
          "line": 37,
          "column": 5,
          "calledExpression": "searchable",
          "baseName": "searchable",
          "memberName": "",
          "argumentLabels": ["text", "prompt"],
          "stringArguments": ["Search"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.navigation.review_generic_search_placeholder"
  result.warn[0].artifact == "Sources/App/LibraryView.swift"
  result.warn[0].line == 37
  result.warn[0].column == 5
}

test_does_not_warn_for_descriptive_search_placeholder if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SearchView.swift",
          "line": 19,
          "column": 7,
          "calledExpression": "TextField",
          "baseName": "TextField",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Search messages"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_searchable_search_without_prompt_label if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/LibraryView.swift",
          "line": 41,
          "column": 5,
          "calledExpression": ".searchable",
          "baseName": "",
          "memberName": "searchable",
          "argumentLabels": ["text", "placement"],
          "stringArguments": ["Search"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_warn_for_generic_search_text_on_unrelated_call if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SearchView.swift",
          "line": 23,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Search"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
