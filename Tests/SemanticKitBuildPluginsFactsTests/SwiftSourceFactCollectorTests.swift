import Foundation
import XCTest
@testable import SemanticKitBuildPluginsFacts

final class SwiftSourceFactCollectorTests: XCTestCase {
    func testCollectsManualBindingInitializerFacts() throws {
        let root = try makeTempPackage()
        let sourceDir = root.appendingPathComponent("Sources/App", isDirectory: true)
        try FileManager.default.createDirectory(at: sourceDir, withIntermediateDirectories: true)
        let source = """
        import SwiftUI
        struct Demo: View {
            var body: some View {
                let value = Binding(get: { true }, set: { _ in })
                return Toggle(\"X\", isOn: value)
            }
        }
        """
        try source.write(to: sourceDir.appendingPathComponent("Demo.swift"), atomically: true, encoding: .utf8)

        let facts = try SwiftSourceFactCollector().collect(packageDirectory: root)
        XCTAssertEqual(facts.bindingConstructionFacts.count, 1)
        XCTAssertEqual(facts.bindingConstructionFacts.first?.artifact, "Sources/App/Demo.swift")
    }

    func testCollectArtifactCatalogDiscoversKinds() throws {
        let root = try makeTempPackage()
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Policies"), withIntermediateDirectories: true)
        try "package x".write(
            to: root.appendingPathComponent("Policies/policy.rego"),
            atomically: true,
            encoding: .utf8
        )
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Sources/App"), withIntermediateDirectories: true)
        try "struct A {}".write(
            to: root.appendingPathComponent("Sources/App/A.swift"),
            atomically: true,
            encoding: .utf8
        )
        try FileManager.default.createDirectory(at: root.appendingPathComponent(".github/workflows"), withIntermediateDirectories: true)
        try "name: CI".write(
            to: root.appendingPathComponent(".github/workflows/ci.yml"),
            atomically: true,
            encoding: .utf8
        )
        try "// swift-tools-version: 6.3\nimport PackageDescription\nlet package = Package(name: \"X\")\n".write(
            to: root.appendingPathComponent("Package.swift"),
            atomically: true,
            encoding: .utf8
        )
        try "# Project".write(
            to: root.appendingPathComponent("README.md"),
            atomically: true,
            encoding: .utf8
        )
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Docs/Guide.docc"), withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Config"), withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Shaders"), withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Sources/C"), withIntermediateDirectories: true)
        try "<plist/>".write(
            to: root.appendingPathComponent("Config/Info.plist"),
            atomically: true,
            encoding: .utf8
        )
        try "kernel void k() {}".write(
            to: root.appendingPathComponent("Shaders/Compute.metal"),
            atomically: true,
            encoding: .utf8
        )
        try "int x;".write(
            to: root.appendingPathComponent("Sources/C/include.h"),
            atomically: true,
            encoding: .utf8
        )
        try FileManager.default.createDirectory(at: root.appendingPathComponent("App.xcodeproj"), withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: root.appendingPathComponent("Workspace.xcworkspace"), withIntermediateDirectories: true)

        let catalog = try SwiftSourceFactCollector().collectArtifactCatalog(
            packageDirectory: root,
            policyModuleRoots: [root.appendingPathComponent("Policies")]
        )

        XCTAssertEqual(catalog.regoModules, ["Policies/policy.rego"])
        XCTAssertEqual(catalog.swiftSources, ["Sources/App/A.swift"])
        XCTAssertEqual(catalog.packageManifest, ["Package.swift"])
        XCTAssertEqual(catalog.workflowYAML, [".github/workflows/ci.yml"])
        XCTAssertEqual(catalog.markdownFiles, ["README.md"])
        XCTAssertEqual(catalog.doccCatalogs, ["Docs/Guide.docc"])
        XCTAssertEqual(catalog.propertyLists, ["Config/Info.plist"])
        XCTAssertEqual(catalog.metalSources, ["Shaders/Compute.metal"])
        XCTAssertEqual(catalog.cFamilySources, ["Sources/C/include.h"])
        XCTAssertEqual(catalog.xcodeMetadata, ["App.xcodeproj", "Workspace.xcworkspace"])
        XCTAssertEqual(catalog.policyModuleRoots, [root.appendingPathComponent("Policies").path])
    }

    func testIgnoresOtherCalls() throws {
        let root = try makeTempPackage()
        let sourceDir = root.appendingPathComponent("Sources/App", isDirectory: true)
        try FileManager.default.createDirectory(at: sourceDir, withIntermediateDirectories: true)
        let source = """
        import Foundation
        func demo() {
            _ = max(1,2)
        }
        """
        try source.write(to: sourceDir.appendingPathComponent("Demo.swift"), atomically: true, encoding: .utf8)

        let facts = try SwiftSourceFactCollector().collect(packageDirectory: root)
        XCTAssertTrue(facts.bindingConstructionFacts.isEmpty)
    }

    private func makeTempPackage() throws -> URL {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }
}
