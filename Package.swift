// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SemanticKitBuildPlugins",
    platforms: [
        .macOS(.v26),
    ],
    products: [
        .library(name: "AppleHumanInterfaceGuidelines", targets: ["AppleHumanInterfaceGuidelines"]),
        .plugin(name: "RegoPolicyCompile", targets: ["RegoPolicyCompile"]),
        .plugin(name: "RegoPolicyEvaluate", targets: ["RegoPolicyEvaluate"]),
    ],
    dependencies: [
        .package(path: ".build/checkouts/swift-syntax/SwiftParserCLI"),
    ],
    targets: [
        .target(
            name: "AppleHumanInterfaceGuidelines",
            plugins: [
                .plugin(name: "RegoPolicyCompile"),
            ]
        ),
        .plugin(
            name: "RegoPolicyCompile",
            capability: .buildTool()
        ),
        .plugin(
            name: "RegoPolicyEvaluate",
            capability: .buildTool(),
            dependencies: [
                .product(name: "swift-parser-cli", package: "SwiftParserCLI"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
