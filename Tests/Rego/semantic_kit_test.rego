package semantickit.main

test_denies_lowered_swift_baseline if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.2",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }
  count(result.deny) == 1
}

test_allows_baseline_configuration if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.deny) == 0
}

test_denies_workflow_script_entrypoints if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": true,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.deny) == 1
}

test_denies_binding_get_set_constructor if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 12,
          "column": 9,
          "kind": "binding_get_set_initializer"
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.deny) == 1
}



test_warns_when_docs_artifacts_missing if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": [], "doccCatalogs": [], "propertyLists": ["Config/Info.plist"]}
  }
  count(result.warn) == 2
}

test_allows_when_docs_artifacts_present if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.warn) == 0
}

test_warns_for_safe_area_opt_out_call_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 14,
          "calledExpression": ".ignoresSafeArea",
          "baseName": "ignoresSafeArea",
          "memberName": "ignoresSafeArea",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/DetailView.swift",
          "line": 42,
          "column": 7,
          "calledExpression": "edgesIgnoringSafeArea(.all)",
          "baseName": "edgesIgnoringSafeArea",
          "memberName": "",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 2
  content_warning := result.warn[_]
  content_warning.rule_id == "apple.hig.layout.review_safe_area_opt_out"
  content_warning.artifact == "Sources/App/ContentView.swift"
  content_warning.line == 18
  content_warning.column == 14
  content_warning.severity == "warning"
  detail_warning := result.warn[_]
  detail_warning.rule_id == "apple.hig.layout.review_safe_area_opt_out"
  detail_warning.artifact == "Sources/App/DetailView.swift"
  detail_warning.line == 42
  detail_warning.column == 7
  detail_warning.severity == "warning"
}

test_does_not_warn_without_safe_area_opt_out_call_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 14,
          "calledExpression": "content.padding()",
          "baseName": "content",
          "memberName": "padding",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 0
}

test_warns_for_fixed_font_size_call_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 19,
          "calledExpression": ".system",
          "baseName": "system",
          "memberName": "system",
          "argumentLabels": ["size"],
          "stringArguments": [],
          "numericArguments": ["14"]
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 1
  result.warn[0].rule_id == "apple.hig.accessibility.review_fixed_font_size"
  result.warn[0].message == "Review literal SwiftUI system font size use; support larger text sizes."
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 28
  result.warn[0].column == 19
  result.warn[0].severity == "warning"
}

test_does_not_warn_without_fixed_font_size_call_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 28,
          "column": 19,
          "calledExpression": ".system",
          "baseName": "system",
          "memberName": "system",
          "argumentLabels": [],
          "stringArguments": [],
          "numericArguments": []
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 0
}

test_warns_for_hardcoded_color_call_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ColorView.swift",
          "line": 34,
          "column": 11,
          "calledExpression": "Color",
          "baseName": "Color",
          "memberName": "",
          "argumentLabels": ["red", "green", "blue"],
          "stringArguments": [],
          "numericArguments": ["1", "0", "0"]
        },
        {
          "artifact": "Sources/App/AccentView.swift",
          "line": 51,
          "column": 15,
          "calledExpression": "NSColor",
          "baseName": "NSColor",
          "memberName": "",
          "argumentLabels": ["calibratedHue", "saturation", "brightness", "alpha"],
          "stringArguments": [],
          "numericArguments": ["0.6", "0.5", "0.8", "1"]
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 2
  rgb_warning := result.warn[_]
  rgb_warning.rule_id == "apple.hig.color.review_hardcoded_color"
  rgb_warning.message == "Review hardcoded color; prefer system colors."
  rgb_warning.artifact == "Sources/App/ColorView.swift"
  rgb_warning.line == 34
  rgb_warning.column == 11
  rgb_warning.severity == "warning"
  hsb_warning := result.warn[_]
  hsb_warning.rule_id == "apple.hig.color.review_hardcoded_color"
  hsb_warning.message == "Review hardcoded color; prefer system colors."
  hsb_warning.artifact == "Sources/App/AccentView.swift"
  hsb_warning.line == 51
  hsb_warning.column == 15
  hsb_warning.severity == "warning"
}

test_does_not_warn_for_semantic_color_call_facts if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "callFacts": [
        {
          "artifact": "Sources/App/ColorView.swift",
          "line": 34,
          "column": 11,
          "calledExpression": "Color",
          "baseName": "Color",
          "memberName": "",
          "argumentLabels": ["_"],
          "stringArguments": ["RouteAccent"],
          "numericArguments": []
        },
        {
          "artifact": "Sources/App/ColorView.swift",
          "line": 35,
          "column": 11,
          "calledExpression": "UIColor",
          "baseName": "UIColor",
          "memberName": "",
          "argumentLabels": ["named"],
          "stringArguments": ["RouteAccent"],
          "numericArguments": []
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 0
}

test_warns_when_metal_sources_missing_docc if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {
      "markdownFiles": ["README.md"],
      "doccCatalogs": [],
      "propertyLists": ["Config/Info.plist"],
      "metalSources": ["Shaders/Compute.metal"]
    }
  }
  count(result.warn) == 2
}

test_warns_when_cfamily_sources_missing_markdown if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {
      "markdownFiles": [],
      "doccCatalogs": ["Docs/Guide.docc"],
      "propertyLists": ["Config/Info.plist"],
      "cFamilySources": ["Sources/C/include.h"]
    }
  }
  count(result.warn) == 2
}
