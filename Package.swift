// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SemanticKitBuildPlugins",
    platforms: [
        .macOS(.v26),
    ],
    products: [
        .plugin(name: "SemanticKitBuildPluginsCommands", targets: ["SemanticKitBuildPluginsCommands"]),
        .plugin(name: "SemanticKitBuildPluginsBuildTool", targets: ["SemanticKitBuildPluginsBuildTool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "6.2.1"),
        .package(url: "https://github.com/open-policy-agent/swift-opa.git", from: "0.0.5"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.63.2"),
    ],
    targets: [
        .target(
            name: "SemanticKitBuildPluginsCore"
        ),
        .target(
            name: "SemanticKitBuildPluginsProfiles",
            dependencies: [
                "SemanticKitBuildPluginsCore",
            ]
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
                "SemanticKitBuildPluginsProfiles",
                "SemanticKitBuildPluginsPolicy",
                .product(name: "Yams", package: "Yams"),
            ]
        ),
        .executableTarget(
            name: "SemanticKitBuildPluginsTool",
            dependencies: [
                "SemanticKitBuildPluginsCommandSupport",
            ]
        ),
        .plugin(
            name: "SemanticKitBuildPluginsCommands",
            capability: .command(
                intent: .custom(
                    verb: "semantic-kit-build-plugins",
                    description: "Initialize, validate, and migrate SemanticKit CI/CD tooling."
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "Generate and update SemanticKit CI/CD configuration on explicit init or migration commands."),
                ]
            ),
            dependencies: [
                "SemanticKitBuildPluginsTool",
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
            name: "SemanticKitBuildPluginsCoreTests",
            dependencies: [
                "SemanticKitBuildPluginsCore",
                .product(name: "Yams", package: "Yams"),
            ]
        ),
        .testTarget(
            name: "SemanticKitBuildPluginsCommandSupportTests",
            dependencies: [
                "SemanticKitBuildPluginsCommandSupport",
            ]
        ),
        .testTarget(
            name: "SemanticKitBuildPluginsProfilesTests",
            dependencies: [
                "SemanticKitBuildPluginsProfiles",
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
