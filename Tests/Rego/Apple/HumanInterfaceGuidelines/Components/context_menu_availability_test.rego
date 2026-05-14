package apple.hig.components.context_menu_availability

test_reviews_context_menu_base_name_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 7,
          "calledExpression": "contextMenu",
          "baseName": "contextMenu",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].message == "Review context-menu usage and confirm commands are also available from the main interface or menu bar."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 7
  result.warn[0].severity == "warning"
}

test_reviews_context_menu_member_name_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 42,
          "column": 11,
          "calledExpression": "Text(\"File\").contextMenu",
          "baseName": "",
          "memberName": "contextMenu",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.components.review_context_menu_availability"
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 42
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_does_not_review_non_context_menu_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 7,
          "calledExpression": "Menu",
          "baseName": "Menu",
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

test_does_not_review_context_menu_when_not_a_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": []
    }
  }

  count(result.warn) == 0
}
