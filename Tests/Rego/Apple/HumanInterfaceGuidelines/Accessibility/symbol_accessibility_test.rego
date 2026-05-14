package apple.hig.accessibility.symbol_accessibility

test_warns_for_system_symbol_image_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 24,
          "column": 13,
          "calledExpression": "Image",
          "baseName": "Image",
          "memberName": "",
          "argumentLabels": ["systemName"],
          "stringArguments": ["square.and.arrow.up"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_symbol_accessibility_label"
  result.warn[0].message == "Review symbol image accessibility; provide alternative text for custom interface icons and symbols."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 24
  result.warn[0].column == 13
  result.warn[0].severity == "warning"
}

test_does_not_warn_for_asset_image_call_fact if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 31,
          "column": 13,
          "calledExpression": "Image",
          "baseName": "Image",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["assetName"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
