package apple.hig.status.vague_progress_description

test_warns_for_progress_view_loading_description if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ImportProgressView.swift",
          "line": 18,
          "column": 11,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["loading"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.status.review_vague_progress_description"
  result.warn[0].message == "Review progress description; use accurate, succinct text instead of vague status copy."
  result.warn[0].artifact == "Sources/App/ImportProgressView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 11
  result.warn[0].severity == "warning"
}

test_warns_for_each_configured_vague_progress_description if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ImportProgressView.swift",
          "line": 20,
          "column": 11,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Loading..."],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ExportProgressView.swift",
          "line": 24,
          "column": 9,
          "calledExpression": "SwiftUI.ProgressView",
          "baseName": "",
          "memberName": "ProgressView",
          "argumentLabels": ["_"],
          "stringArguments": ["Please wait"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/SyncProgressView.swift",
          "line": 31,
          "column": 13,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Working"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/AuthProgressView.swift",
          "line": 34,
          "column": 13,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Authenticating"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 4
  result.warn[_].artifact == "Sources/App/ImportProgressView.swift"
  result.warn[_].artifact == "Sources/App/ExportProgressView.swift"
  result.warn[_].artifact == "Sources/App/SyncProgressView.swift"
  result.warn[_].artifact == "Sources/App/AuthProgressView.swift"
}

test_does_not_warn_for_descriptive_progress_description if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ImportProgressView.swift",
          "line": 36,
          "column": 11,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Importing photos"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}

test_warns_for_case_insensitive_vague_progress_description if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/SyncProgressView.swift",
          "line": 42,
          "column": 11,
          "calledExpression": "ProgressView",
          "baseName": "ProgressView",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["loading"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 1
  result.warn[0].artifact == "Sources/App/SyncProgressView.swift"
}

test_does_not_warn_for_vague_text_on_unrelated_call if {
  result := decision with input as {
    "swiftSourceFacts": {
      "callFacts": [
        {
          "artifact": "Sources/App/ImportProgressView.swift",
          "line": 49,
          "column": 11,
          "calledExpression": "Text",
          "baseName": "Text",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["Loading"],
          "numericArguments": []
        }
      ]
    }
  }

  count(result.warn) == 0
}
