package apple.hig.content.image_tap_gesture

test_warns_for_on_tap_gesture if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/GalleryView.swift",
          "line": 22,
          "column": 15,
          "calledExpression": ".onTapGesture",
          "baseName": "onTapGesture",
          "memberName": "onTapGesture",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.content.review_tap_gesture_action"
  result.warn[0].message == "Review tap gesture action; use a Button when visible content initiates an action."
  result.warn[0].artifact == "Sources/App/GalleryView.swift"
  result.warn[0].line == 22
  result.warn[0].column == 15
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_button_open if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/GalleryView.swift",
          "line": 30,
          "column": 9,
          "calledExpression": "Button",
          "baseName": "Button",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Open"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
