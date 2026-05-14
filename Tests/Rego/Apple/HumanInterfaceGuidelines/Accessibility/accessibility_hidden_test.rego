package apple.hig.accessibility.accessibility_hidden

test_warns_for_accessibility_hidden_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 10,
          "calledExpression": "accessibilityHidden",
          "baseName": "",
          "memberName": "accessibilityHidden",
          "argumentLabels": ["_"],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_accessibility_hidden"
  result.warn[0].message == "Review accessibilityHidden use; hide visible content from assistive technologies only when it adds no value."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 10
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_accessibility_label_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 22,
          "column": 10,
          "calledExpression": "accessibilityLabel",
          "baseName": "",
          "memberName": "accessibilityLabel",
          "argumentLabels": ["_"],
          "stringArguments": ["Route"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
