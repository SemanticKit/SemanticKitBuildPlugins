// swift-tools-version: 6.3

// A package that consumes SemanticKitBuildPlugins the way any other package
// does: it depends on the policy libraries and applies RegoPolicyEvaluate.
// `swift build` here prints the policy findings for Sources/PolicyConsumer.

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
        .target(
            name: "PolicyConsumer",
            dependencies: [
                .product(name: "AppleHumanInterfaceGuidelines", package: "SemanticKitBuildPlugins"),
                .product(name: "SemanticKitDesignGuidelines", package: "SemanticKitBuildPlugins"),
            ],
            plugins: [
                .plugin(name: "RegoPolicyEvaluate", package: "SemanticKitBuildPlugins"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
