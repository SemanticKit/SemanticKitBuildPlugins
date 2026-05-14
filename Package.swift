// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SemanticKitBuildPlugins",
    platforms: [
        .macOS(.v26),
    ],
    products: [
        .plugin(name: "SemanticKitBuildPluginsBuildTool", targets: ["SemanticKitBuildPluginsBuildTool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/open-policy-agent/swift-opa.git", from: "0.0.5"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", exact: "604.0.0-prerelease-2026-01-20"),
    ],
    targets: [
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
