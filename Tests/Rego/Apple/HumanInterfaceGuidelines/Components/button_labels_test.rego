package apple.hig.components.button_labels

test_warns_for_long_button_label_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 22,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Continue to the next section of onboarding"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_button_label_length"
  result.warn[0].message == "Review long button label; keep button text short and clear."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 22
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_short_button_label_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 22,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Continue"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
