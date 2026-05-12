package semantickit.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": array.concat(baseline_denials, swiftui_denials),
  "warn": documentation_warnings,
  "note": []
}

baseline_denials := [d |
  d := baseline_denial[_]
]

swiftui_denials := [d |
  d := swiftui_denial[_]
]

documentation_warnings := [w |
  w := documentation_warning[_]
]

baseline_denial contains {
  "message": "Swift version baseline must remain 6.3.",
  "artifact": ".semantic-kit/ci.yml",
  "severity": "error",
} if {
  input.repositoryConfiguration.swiftVersion != "6.3"
}

baseline_denial contains {
  "message": "macOS deployment target must remain 26+.",
  "artifact": ".semantic-kit/ci.yml",
  "severity": "error",
} if {
  input.repositoryConfiguration.macOSDeploymentTarget != "26"
}

baseline_denial contains {
  "message": "Generated CI workflow must not use shell-script primary entrypoints.",
  "artifact": ".github/workflows/ci.yml",
  "severity": "error",
} if {
  input.workflowContainsScriptEntrypoints
}

swiftui_denial contains {
  "message": "Do not manually construct Binding(get:set:) in SwiftUI contexts.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "error",
} if {
  fact := input.swiftSourceFacts.bindingConstructionFacts[_]
  fact.kind == "binding_get_set_initializer"
}

documentation_warning contains {
  "message": "Repository should include a README.md for policy/documentation discoverability.",
  "artifact": "README.md",
  "severity": "warning",
} if {
  count(input.artifactCatalog.markdownFiles) == 0
}

documentation_warning contains {
  "message": "Repository should include at least one DocC catalog (.docc) for developer-facing docs.",
  "artifact": "Docs",
  "severity": "warning",
} if {
  count(input.artifactCatalog.doccCatalogs) == 0
}

documentation_warning contains {
  "message": "Xcode projects should include at least one property list (.plist) artifact.",
  "artifact": "Config",
  "severity": "warning",
} if {
  count(input.artifactCatalog.xcodeMetadata) > 0
  count(input.artifactCatalog.propertyLists) == 0
}

documentation_warning contains {
  "message": "Metal shader sources should be accompanied by developer-facing DocC documentation.",
  "artifact": "Docs",
  "severity": "warning",
} if {
  count(input.artifactCatalog.metalSources) > 0
  count(input.artifactCatalog.doccCatalogs) == 0
}

documentation_warning contains {
  "message": "C-family sources should include at least one markdown design note.",
  "artifact": "README.md",
  "severity": "warning",
} if {
  count(input.artifactCatalog.cFamilySources) > 0
  count(input.artifactCatalog.markdownFiles) == 0
}
