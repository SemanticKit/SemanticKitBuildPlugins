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
        .plugin(name: "RegoPolicyManifest", targets: ["RegoPolicyManifest"]),
        .plugin(name: "RegoPolicyCompile", targets: ["RegoPolicyCompile"]),
        .plugin(name: "RegoPolicyPlanBundle", targets: ["RegoPolicyPlanBundle"]),
        .plugin(name: "RegoPolicyEvaluate", targets: ["RegoPolicyEvaluate"]),
    ],
    dependencies: [
        .package(url: "https://github.com/open-policy-agent/swift-opa.git", from: "0.0.5"),
    ],
    targets: [
        .target(
            name: "AppleHumanInterfaceGuidelines",
            plugins: [
                .plugin(name: "RegoPolicyManifest"),
                .plugin(name: "RegoPolicyCompile"),
//                .plugin(name: "RegoPolicyPlanBundle"),
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
            capability: .buildTool(),
            dependencies: ["RegoPolicyManifestTool"]
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
            ]
        ),
        .executableTarget(
            name: "RegoPolicyManifestTool",
            dependencies: [
                .product(name: "SwiftOPA", package: "swift-opa"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
