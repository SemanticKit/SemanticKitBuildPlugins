# OPA/Rego-First Architecture (Authoritative)

This document supersedes the original scaffold direction and is the authoritative architecture contract for `SemanticKitBuildPlugins`.

## Core Rule

Policy semantics are defined in Rego modules under `Policies/`. Swift code does **not** hardcode policy outcomes.

## Build Flow

1. Build-tool plugin runs the internal executable.
2. Validator discovers artifacts by kind (rego modules, swift sources, package manifest, workflow yaml).
3. SwiftSyntax/SwiftParser extract Swift facts into policy-neutral facts.
4. Rego modules from local and dependency `Policies/` roots are bundled via `opa build --target plan`.
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

Dependency policy roots are discovered from `swift package show-dependencies --format json` path entries.

## Parser Constraint

Swift source facts are collected using official Swift parser tooling (`SwiftParser`/`SwiftSyntax`) only.
No regex/custom parser fallback is allowed.
