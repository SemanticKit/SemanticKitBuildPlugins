package apple.hig.typography.custom_font

test_warns_for_custom_font_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 19,
          "calledExpression": ".custom",
          "baseName": "custom",
          "memberName": "custom",
          "argumentLabels": ["_", "size"],
          "stringArguments": ["Avenir"],
          "numericArguments": ["14"]
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.typography.review_custom_font"
  result.warn[0].message == "Review custom font; prefer system fonts and verify legibility."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 28
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_system_font_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 19,
          "calledExpression": ".system",
          "baseName": "system",
          "memberName": "system",
          "argumentLabels": ["size"],
          "stringArguments": [],
          "numericArguments": ["14"]
        }
      ]
    }
  }

  count(result.warn) == 0
}
