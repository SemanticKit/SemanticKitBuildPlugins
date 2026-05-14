package apple.hig.patterns.undo_redo_controls

test_warns_for_custom_button_with_undo_text if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 12,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Undo"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.patterns.review_custom_undo_redo_control"
  result.warn[0].message == "Review custom Undo/Redo control; prefer standard undo and redo gestures, menus, shortcuts, and symbols."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 12
  result.warn[0].column == 9
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_restore_route_button if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 22,
          "column": 13,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Restore Route"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
