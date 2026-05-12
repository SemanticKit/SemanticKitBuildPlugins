package semantickit.main

test_denies_lowered_swift_baseline if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.2",
      "macOSDeploymentTarget": "26"
    },
    "directDependencyURLs": [],
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.deny) == 1
}

test_allows_baseline_configuration if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "directDependencyURLs": [],
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
    "directDependencyURLs": [],
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
    "directDependencyURLs": [],
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
    "directDependencyURLs": [],
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": [], "doccCatalogs": []}
  }
  count(result.warn) == 2
}

test_allows_when_docs_artifacts_present if {
  result := decision with input as {
    "repositoryConfiguration": {
      "swiftVersion": "6.3",
      "macOSDeploymentTarget": "26"
    },
    "directDependencyURLs": [],
    "workflowContainsScriptEntrypoints": false,
    "swiftSourceFacts": {"bindingConstructionFacts": []},
    "artifactCatalog": {"markdownFiles": ["README.md"], "doccCatalogs": ["Docs/Guide.docc"]}
  }
  count(result.warn) == 0
}
