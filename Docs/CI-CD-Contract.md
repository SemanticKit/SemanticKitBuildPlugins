# SemanticKit CI/CD Contract

## Scope

`SemanticKitBuildPlugins` is the central SwiftPM-native CI/CD tooling package for SemanticKit repositories. It provides SwiftPM command plugins and build-tool plugins only; shell scripts are not CI entrypoints.

## Invariants

- SwiftPM is mandatory for onboarded repositories.
- Swift tools version remains `6.3` or higher unless a later approved contract revision raises it.
- The macOS deployment floor remains `26` or higher unless a later approved contract revision raises it.
- YAML parsing and emission go through `Yams`; custom YAML parsers are disallowed.
- Policy validation is owned by the central tooling and backed by SwiftOPA policy evaluation.
- SwiftLint integration is inherited through SwiftPM plugin wiring where target/package layout supports it.
- Generated workflows remain thin and invoke versioned SwiftPM tooling instead of embedding policy logic.

## Allowed Overrides

Repository-local overrides may only tune documented contract fields:

- optional conformance profile jobs,
- release workflow enablement,
- approved package-specific test filters,
- policy bundle reference pinned by version or digest,
- generated workflow reference pinning.

Overrides that weaken the Swift version, macOS floor, dependency policy, source admissibility policy, or plugin delivery model are invalid.

## Dependency Approval Rules

Direct dependencies are limited to the initialized approval ledger:

- `https://github.com/jpsim/Yams.git`,
- `https://github.com/open-policy-agent/swift-opa.git`,
- `https://github.com/realm/SwiftLint.git`.

Additional build-tool dependencies may be added without separate approval only when sourced from official Apple or official Swift-language-organization GitHub repositories. Any other direct dependency requires explicit approval and a ledger entry before use.

## Release and Tag Trigger Policy

Generated release workflows are opt-in during bootstrap. Release triggers must be explicit tag patterns recorded in repository-local configuration and validated by this tooling before CI relies on them.

Initial default tag patterns are intentionally conservative and pending project confirmation:

- package release tags: `v*`,
- SemanticKit date/version tags: repository-specific and disabled until configured.

## Generated Workflow Contract

Generated workflow files must remain deterministic and reviewable. A generated workflow may:

- run on pull requests and pushes,
- set up the approved Swift/macOS runner environment,
- invoke `swift package --allow-writing-to-package-directory semantic-kit-build-plugins validate`,
- invoke SwiftPM-native build/test/profile commands,
- call a pinned reusable workflow when configured.

A generated workflow must not:

- embed policy logic that belongs in this package,
- call repository shell scripts as primary CI entrypoints,
- introduce unapproved package managers or dependency sources,
- lower the Swift or macOS baseline.

## Workflow Behavior Matrix

| Event | Required behavior | Optional behavior |
| --- | --- | --- |
| Pull request | Resolve package dependencies, build, test, validate generated workflow/config contract | Run selected conformance profiles |
| Push | Same as pull request for protected branches | Publish validation artifacts |
| Release tag | Run release validation before publishing | Build release artifacts when configured |
| Optional profile dispatch | Run declared SwiftPM-native conformance profiles | Shard profiles through central profile metadata |
| Macro-aware package | Build and test with macro targets enabled by SwiftPM | Run macro-specific validation profiles |

## Source Admissibility

Normative design and behavior decisions must trace to one of:

- Apple documentation,
- Swift official documentation,
- GitHub official documentation,
- direct upstream repositories for approved dependencies for integration facts only,
- official Apple or official Swift-language-organization GitHub repositories for build-tool discovery/integration facts,
- verified local repository files or tool output.

Reddit, blogs, social posts, unofficial tutorials, and forum opinions are not admissible for normative decisions.

## Change Management

Changes to profiles, dependencies, generated workflow behavior, or policy bundles require:

1. a contract update,
2. dependency ledger update when applicable,
3. golden-output validation,
4. mutation tests for validation failures,
5. review for source admissibility and policy traceability.
