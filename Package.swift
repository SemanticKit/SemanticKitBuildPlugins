// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SemanticKitBuildPlugins",
    platforms: [
        .macOS(.v26),
    ],
    products: [
        .library(name: "AppleHumanInterfaceGuidelines", targets: ["AppleHumanInterfaceGuidelines"]),
        .library(name: "SwiftSyntaxRego", targets: ["SwiftSyntaxRego"]),
        .plugin(name: "RegoPolicyCompile", targets: ["RegoPolicyCompile"]),
        .plugin(name: "RegoPolicyEvaluate", targets: ["RegoPolicyEvaluate"]),
        .plugin(name: "SemanticKitBuildPluginsBuildTool", targets: ["SemanticKitBuildPluginsBuildTool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/open-policy-agent/swift-opa.git", from: "0.0.5"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", exact: "604.0.0-prerelease-2026-01-20"),
    ],
    targets: [
        .target(
            name: "AppleHumanInterfaceGuidelines",
            dependencies: [
                "SwiftSyntaxRego",
            ],
            plugins: [
                .plugin(name: "RegoPolicyCompile"),
            ]
        ),
        .target(
            name: "SwiftSyntaxRego",
            plugins: [
                .plugin(name: "RegoPolicyCompile"),
            ]
        ),
        .target(
            name: "SemanticKitBuildPluginsCore"
        ),
        .target(
            name: "SemanticKitBuildPluginsPolicy",
            dependencies: [
                "SemanticKitBuildPluginsCore",
                .product(name: "SwiftOPA", package: "swift-opa"),
            ]
        ),
        .target(
            name: "SemanticKitBuildPluginsCommandSupport",
            dependencies: [
                "SemanticKitBuildPluginsCore",
                "SemanticKitBuildPluginsPolicy",
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
            ]
        ),
        .executableTarget(
            name: "SemanticKitBuildPluginsTool",
            dependencies: [
                "SemanticKitBuildPluginsCommandSupport",
            ]
        ),
        .plugin(
            name: "RegoPolicyCompile",
            capability: .buildTool()
        ),
        .plugin(
            name: "RegoPolicyEvaluate",
            capability: .buildTool()
        ),
        .plugin(
            name: "SemanticKitBuildPluginsBuildTool",
            capability: .buildTool(),
            dependencies: [
                "SemanticKitBuildPluginsTool",
            ]
        ),
        .testTarget(
            name: "SemanticKitBuildPluginsPolicyTests",
            dependencies: [
                "SemanticKitBuildPluginsPolicy",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
