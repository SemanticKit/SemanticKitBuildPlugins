// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SemanticKitBuildPlugins",
    platforms: [
        .macOS(.v26),
    ],
    products: [
        .library(name: "AppleHumanInterfaceGuidelines", targets: ["AppleHumanInterfaceGuidelines"]),
        .library(name: "ProofPolicy", targets: ["ProofPolicy"]),
        .library(name: "SemanticKitDesignGuidelines", targets: ["SemanticKitDesignGuidelines"]),
        .plugin(name: "RegoPolicyManifest", targets: ["RegoPolicyManifest"]),
        .plugin(name: "RegoPolicyCompile", targets: ["RegoPolicyCompile"]),
        .plugin(name: "RegoPolicyPlanBundle", targets: ["RegoPolicyPlanBundle"]),
        .plugin(name: "RegoPolicyEvaluate", targets: ["RegoPolicyEvaluate"]),
    ],
    dependencies: [
        .package(url: "https://github.com/open-policy-agent/swift-opa.git", from: "0.0.5"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "604.0.0"),
        .package(url: "https://github.com/tsolomko/SWCompression.git", from: "4.9.1"),
    ],
    targets: [
        .target(
            name: "AppleHumanInterfaceGuidelines",
            plugins: [
                .plugin(name: "RegoPolicyManifest"),
                .plugin(name: "RegoPolicyCompile"),
                .plugin(name: "RegoPolicyPlanBundle"),
            ]
        ),
        .target(
            name: "SemanticKitDesignGuidelines",
            plugins: [
                .plugin(name: "RegoPolicyManifest"),
                .plugin(name: "RegoPolicyCompile"),
                .plugin(name: "RegoPolicyPlanBundle"),
            ]
        ),
        .target(
            name: "ProofPolicy",
            plugins: [
                .plugin(name: "RegoPolicyManifest"),
                .plugin(name: "RegoPolicyCompile"),
                .plugin(name: "RegoPolicyPlanBundle"),
            ]
        ),
        .plugin(
            name: "RegoPolicyManifest",
            capability: .buildTool(),
            dependencies: ["RegoPolicyManifestTool"]
        ),
        .plugin(
            name: "RegoPolicyCompile",
            capability: .buildTool()
        ),
        .plugin(
            name: "RegoPolicyPlanBundle",
            capability: .buildTool()
        ),
        .plugin(
            name: "RegoPolicyEvaluate",
            capability: .buildTool(),
            dependencies: ["RegoPolicyEvaluateTool"]
        ),
        .executableTarget(
            name: "RegoPolicyEvaluateTool",
            dependencies: [
                .product(name: "SwiftOPA", package: "swift-opa"),
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SWCompression", package: "SWCompression"),
            ]
        ),
        .executableTarget(
            name: "RegoPolicyManifestTool",
            dependencies: [
                .product(name: "SwiftOPA", package: "swift-opa"),
                .product(name: "SWCompression", package: "SWCompression"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
