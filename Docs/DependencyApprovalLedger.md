# Dependency Approval Ledger

This ledger records direct dependencies approved for `SemanticKitBuildPlugins`.

| Dependency | Source | Purpose | Approval basis | Initial requirement |
| --- | --- | --- | --- | --- |
| Yams | `https://github.com/jpsim/Yams.git` | YAML parsing and emission | Locked user constraint | `from: 6.2.1` |
| SwiftOPA | `https://github.com/open-policy-agent/swift-opa.git` | Policy-as-code validation backend | Locked user constraint | `from: 0.0.5` |
| SwiftLint | `https://github.com/realm/SwiftLint.git` | SwiftPM plugin lint integration for onboarded packages | Locked user constraint | `from: 0.63.2` |

## Rules

- Direct dependencies not listed here are rejected unless sourced from official Apple or official Swift-language-organization GitHub repositories for build-tool integration.
- Any other dependency requires explicit approval before it is added to `Package.swift`.
- Version bumps require a ledger update and validation evidence.
