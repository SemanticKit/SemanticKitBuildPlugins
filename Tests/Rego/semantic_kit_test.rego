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

test_warns_for_safe_area_opt_out_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "safeAreaOptOutFacts": [
        {
          "artifact": "Sources/App/ContentView.swift",
          "line": 18,
          "column": 14
        },
        {
          "artifact": "Sources/App/DetailView.swift",
          "line": 42,
          "column": 7
        }
      ]
    },
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"], "propertyLists": ["Config/Info.plist"]}
  }

  count(result.warn) == 2
  result.warn[0].rule_id == "apple.hig.layout.review_safe_area_opt_out"
  result.warn[0].artifact == "Sources/App/ContentView.swift"
  result.warn[0].line == 18
  result.warn[0].column == 14
  result.warn[0].severity == "warning"
  result.warn[1].rule_id == "apple.hig.layout.review_safe_area_opt_out"
  result.warn[1].artifact == "Sources/App/DetailView.swift"
  result.warn[1].line == 42
  result.warn[1].column == 7
  result.warn[1].severity == "warning"
}

test_does_not_warn_without_safe_area_opt_out_fact if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {
      "bindingConstructionFacts": [],
      "safeAreaOptOutFacts": []
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
