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
