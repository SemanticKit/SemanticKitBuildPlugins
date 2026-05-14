package apple.hig.presentation.destructive_action_labels

test_warns_for_button_delete_route_label if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteView.swift",
          "line": 18,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Delete Route"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.presentation.review_destructive_action_label"
  result.warn[0].message == "Review destructive action; use destructive styling and provide a clear cancel path."
  result.warn[0].artifact == "Sources/App/RouteView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_save_route_label if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/RouteView.swift",
          "line": 24,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Save Route"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
