# Current Policy Plugin Architecture

This is the active working contract for `SemanticKitBuildPlugins`.

## Immediate Priority

- Do not reintroduce recursive directory scanning.
- Do not discover `Policies/` roots from package or dependency directories.
- Do not use `FileManager.default.enumerator` for policy or source discovery.
- Do not rebuild an aggregate `semantickit/main/decision` entrypoint.
- Do not use the old aggregate files `Policies/semantic_kit.rego`, `Policies/Apple/HumanInterfaceGuidelines/main.rego`, or `Policies/SemanticKitDesignGuidelines/main.rego`.
- Do not commit, reset, stage, checkout, or otherwise mutate git state without a current explicit instruction.

## Plugin Split

There are two new minimal build-tool plugin registrations:

- `RegoPolicyCompile`
- `RegoPolicyEvaluate`

The plugins are intentionally only registered right now. They must not grow hidden behavior before their target roles are implemented deliberately.

## RegoPolicyCompile Role

`RegoPolicyCompile` is for targets that own Rego policy files.

It must use SwiftPM's target file surface:

```swift
sourceTarget.sourceFiles(withSuffix: ".rego")
```

It must compile Rego policy files into OPA plan artifacts.

It must not walk package directories, dependency directories, or hardcoded `Policies/` roots.

## RegoPolicyEvaluate Role

`RegoPolicyEvaluate` is for Swift targets in any consumer project.

It must use SwiftPM's target file surface:

```swift
sourceTarget.sourceFiles(withSuffix: ".swift")
```

It evaluates SwiftSyntax input against supplied/generated policy plan artifacts.

It must not discover Rego files itself.

## SwiftPM Boundary

SwiftPM is the build tool. Plugin code returns `Command.buildCommand` values with explicit inputs and outputs.

The executable invoked by a command should do the command's work. It should not become a replacement scheduler for target-wide plugin behavior.

## Rego Boundary

Each real policy Rego file should own its package and `decision`.

Shared helper modules, such as SwiftSyntax helpers, may exist without `decision`.

Policy semantics belong in Rego. Swift parses Swift source, encodes SwiftSyntax input, invokes policy artifacts, decodes diagnostics, and prints build-tool diagnostics.

## Current Known Problem

The older `SemanticKitBuildPluginsBuildTool` code currently contains work that conflicts with this contract:

- it discovers policy roots by scanning package and dependency directories
- it recursively discovers `.rego` files
- it creates policy plans from that scan
- it currently has target-level evaluator batching that is not part of the plugin split contract

That code should not be treated as the model for the two new plugins.
