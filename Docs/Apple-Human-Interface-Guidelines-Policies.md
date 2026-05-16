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

## Current Migration Work

Some policy files still reference the deleted `data.swift.syntax.*` helper shape. Those files need to be migrated to the parser CLI syntax output shape.

That migration is policy work. It should not add new Swift package targets, Swift evaluator abstractions, or SwiftSyntax serializers.
