package apple.hig.presentation.unhelpful_alert_title

test_warns_for_generic_error_text_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 14,
          "column": 13,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Error"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_unhelpful_alert_title"
  result.warn[0].message == "Review alert title; use direct, neutral, specific copy instead of generic error text."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 14
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_specific_route_unavailable_text_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 14,
          "column": 13,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Route unavailable"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
