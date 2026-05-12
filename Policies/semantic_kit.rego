package semantickit.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": array.concat(baseline_denials, swiftui_denials),
  "warn": [],
  "note": []
}

baseline_denials := [d |
  d := baseline_denial[_]
]

swiftui_denials := [d |
  d := swiftui_denial[_]
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
