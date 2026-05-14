package apple.hig.presentation.open_window_action

test_reviews_base_open_window_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/Commands.swift",
          "line": 19,
          "column": 9,
          "calledExpression": "openWindow",
          "baseName": "openWindow",
          "memberName": "",
          "argumentLabels": ["id"],
          "stringArguments": ["document"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].message == "Review openWindow/OpenWindowAction usage; confirm new-window commands are deliberate."
  result.warn[0].artifact == "Sources/App/Commands.swift"
  result.warn[0].line == 19
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_reviews_member_open_window_action_usage_to_confirm_new_window_command_is_deliberate if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/DocumentView.swift",
          "line": 42,
          "column": 15,
          "calledExpression": "environment.openWindow",
          "baseName": "environment",
          "memberName": "openWindow",
          "argumentLabels": ["id", "value"],
          "stringArguments": ["detail"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_open_window_action"
  result.warn[0].artifact == "Sources/App/DocumentView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_review_open_url_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/Commands.swift",
          "line": 31,
          "column": 9,
          "calledExpression": "openURL",
          "baseName": "openURL",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_does_not_review_open_window_action_without_open_window_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/Commands.swift",
          "line": 52,
          "column": 13,
          "calledExpression": "OpenWindowAction",
          "baseName": "OpenWindowAction",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
