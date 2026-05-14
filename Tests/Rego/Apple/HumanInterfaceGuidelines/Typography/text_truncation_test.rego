package apple.hig.typography.text_truncation

test_warns_for_tail_truncation_mode_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 34,
          "column": 15,
          "calledExpression": ".truncationMode(.tail)",
          "baseName": "truncationMode",
          "memberName": "truncationMode",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_text_truncation"
  result.warn[0].message == "Review text truncation; prefer readable truncation such as centered ellipsis where appropriate."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 34
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_font_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 19,
          "calledExpression": ".font(.body)",
          "baseName": "font",
          "memberName": "font",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
