# OPA/Rego-First Architecture (Authoritative)

This document supersedes the original scaffold direction and is the authoritative architecture contract for `SemanticKitBuildPlugins`.

## Core Rule

Policy semantics are defined in Rego modules under `Policies/`. Swift code does **not** hardcode policy outcomes.

## Build Flow

1. Build-tool plugin discovers local and dependency `Policies/` roots from SwiftPM plugin context.
2. Build-tool plugin invokes `opa build --target plan` as a build command and declares the OPA bundle archive as a build output.
3. Build-tool plugin runs the internal evaluator executable as a separate build command that consumes the declared bundle output.
4. SwiftSyntax/SwiftParser extract Swift facts into policy-neutral input facts.
5. `swift-opa` evaluates `data.semantickit.main.decision` with the generated input.
6. Decision diagnostics are rendered as build output; deny fails validation.

## Artifact Root Conventions

- Local policy root: `<package-root>/Policies`
- Dependency policy root: `<dependency-root>/Policies`

No custom policy manifest is required.

## Ownership Boundaries

Swift owns:
- artifact discovery
- fact extraction
- bundle assembly/load and OPA invocation
- decision decoding and diagnostic rendering

Rego owns:
- allow/deny/warn policy semantics

## Dependency Discovery

Dependency policy roots are discovered from SwiftPM's plugin context (`Package.dependencies`) and must not be discovered by invoking nested `swift package` commands from a build-tool plugin.

## Parser Constraint

Swift source facts are collected using official Swift parser tooling (`SwiftParser`/`SwiftSyntax`) only.
No regex/custom parser fallback is allowed.
