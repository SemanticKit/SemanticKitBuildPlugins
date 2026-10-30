// swift-tools-version: 6.3

// A package that consumes SemanticKitBuildPlugins the way any other package
// does: it depends on the policy libraries and applies RegoPolicyEvaluate.
//
// - `swift build --target PolicyConsumer` prints the warn and note findings
//   of PolicyTriggers.swift and passes: Intended.swift holds the shapes the
//   SemanticKit invariants allow.
// - `swift build --target PolicyProbes` fails: Banned.swift holds one shape
//   per line that a SemanticKit invariant denies, each with its named rule.
//
// Both depend on PolicyOntologies, whose ontology declarations are the
// vocabulary in scope (`input.vocabulary`). The SemanticKit shapes sit in
// `#if false` blocks: the policies read every `#if` branch, the compiler
// skips them, so the targets need no SemanticKit library to build.
// ConsumerBuildTests runs both builds.

import PackageDescription

let package = Package(
    name: "PolicyConsumer",
    platforms: [
        .macOS(.v26),
    ],
    dependencies: [
        .package(name: "SemanticKitBuildPlugins", path: "../.."),
    ],
    targets: [
        .target(name: "PolicyOntologies"),
        .target(
            name: "PolicyConsumer",
            dependencies: [
                "PolicyOntologies",
                .product(name: "AppleHumanInterfaceGuidelines", package: "SemanticKitBuildPlugins"),
                .product(name: "SemanticKitDesignGuidelines", package: "SemanticKitBuildPlugins"),
            ],
            plugins: [
                .plugin(name: "RegoPolicyEvaluate", package: "SemanticKitBuildPlugins"),
            ]
        ),
        .target(
            name: "PolicyProbes",
            dependencies: [
                "PolicyOntologies",
                .product(name: "SemanticKitDesignGuidelines", package: "SemanticKitBuildPlugins"),
            ],
            plugins: [
                .plugin(name: "RegoPolicyEvaluate", package: "SemanticKitBuildPlugins"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
