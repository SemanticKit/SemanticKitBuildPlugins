# Apple Human Interface Guidelines Policies

`AppleHumanInterfaceGuidelines` is the policy target for Apple HIG Rego rules.

The target stores policy files under:

```text
Sources/AppleHumanInterfaceGuidelines/
```

Policy files are stored under the package namespace path:

```text
Sources/AppleHumanInterfaceGuidelines/apple/hig/
```

## Target Contract

This target owns Rego source files. It is compiled by `RegoPolicyCompile`.

The plugin receives this target from SwiftPM and collects only files SwiftPM exposes as `.rego` source files:

```swift
sourceTarget.sourceFiles(withSuffix: ".rego")
```

No plugin code should scan the target directory or infer policy groups from folders.

## Rule Shape

Rules should stay close to the parser output they consume.

Do not reintroduce:

- `data.swift.syntax.*` helper modules
- SwiftSyntax Rego helper libraries
- Swift-side fact models
- aggregate policy entrypoint files
- one-use helper predicates

Each policy file should own the small amount of Rego needed for that rule.

## How Policies Run in the Build

Every policy matches the parser syntax node shape; none reference the old `data.swift.syntax.*` helpers.

`RegoPolicyEvaluateTool` is the one place Swift takes part: it writes each Swift file's SwiftParser nodes as policy input (`SyntaxInput`) and evaluates the planned policies inside the build, so a rule can fail `swift build` by name. A new rule is policy work. It adds a Rego file and its test, not Swift package targets, evaluator abstractions or serializers.

## Policy Shape

Every policy matches the parser syntax node it receives as `input`; `Docs/BuildPlugins.md` describes the node and the `decision` contract. Each test in `Tests/Rego/Apple/HumanInterfaceGuidelines/` gives its policy the parser output for one line of Swift, written next to the test.
