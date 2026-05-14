package apple.hig.presentation.alert_ok_button

test_warns_for_ok_button_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 13,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["OK"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_alert_ok_button"
  result.warn[0].message == "Review OK button label; use a specific action title when the alert is not purely informational."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 28
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_dismiss_button_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 13,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": ["Dismiss"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
