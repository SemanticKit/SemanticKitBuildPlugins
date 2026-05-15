# Current Plugin Architecture

This is the active contract for `SemanticKitBuildPlugins`.

## Package Shape

The package currently has one policy target and two build-tool plugins:

- `AppleHumanInterfaceGuidelines`
- `RegoPolicyCompile`
- `RegoPolicyEvaluate`

`AppleHumanInterfaceGuidelines` owns the Rego policy files. It applies `RegoPolicyCompile`.

`RegoPolicyEvaluate` depends on the `swift-parser-cli` executable product from SwiftParserCLI. It does not depend on SwiftSyntax libraries directly.

There is no Swift policy engine target in this package. There is no SwiftOPA evaluation target. There is no SwiftSyntax Rego helper library.

## RegoPolicyCompile

`RegoPolicyCompile` is the build-tool plugin for targets that contain `.rego` files.

It uses SwiftPM's target file surface:

```swift
sourceTarget.sourceFiles(withSuffix: ".rego")
```

If the target has no Rego files, it emits no commands.

If the target has Rego files, it emits one build command:

```text
opa build --output <plugin-work-directory>/<target-name>.tar.gz <rego-files>
```

The plugin does not:

- scan directories
- inspect package dependencies
- discover hardcoded policy roots
- infer entrypoints
- choose an OPA target mode
- sanitize target names

The Rego files are passed directly to `opa build`.

## RegoPolicyEvaluate

`RegoPolicyEvaluate` is the build-tool plugin for Swift targets.

It uses SwiftPM's target file surface:

```swift
sourceTarget.sourceFiles(withSuffix: ".swift")
```

It gets SwiftParserCLI from SwiftPM:

```swift
try context.tool(named: "swift-parser-cli")
```

For each Swift source file, it calls the parser CLI directly:

```text
swift-parser-cli print-tree <swift-file>
```

The plugin does not:

- wrap the parser in `/bin/sh`
- serialize SwiftSyntax itself
- emit custom AST JSON
- create a wrapper parser executable
- scan source directories
- discover Rego files

SwiftParserCLI owns the syntax tree output shape.

## Rego Boundary

Policy logic belongs in Rego files.

The Swift plugins only connect SwiftPM targets to external tools:

- `RegoPolicyCompile` connects Rego source files to `opa build`.
- `RegoPolicyEvaluate` connects Swift source files to `swift-parser-cli print-tree`.

Any future evaluator wiring should stay at this boundary unless a concrete SwiftPM requirement forces otherwise.

## Apple HIG Policies

Apple Human Interface Guidelines policy documentation is separate from this plugin architecture document.

See `Docs/Apple-Human-Interface-Guidelines-Policies.md`.
