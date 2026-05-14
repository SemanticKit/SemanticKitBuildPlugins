import Foundation
import XCTest
@testable import SemanticKitBuildPluginsFacts

final class SwiftSourceFactCollectorTests: XCTestCase {
    func testCollectsFactsFromExplicitSourceFilesOnly() throws {
        let packageDirectory = try makeTempPackage()
        let sourceDirectory = packageDirectory.appendingPathComponent("Sources/App", isDirectory: true)
        try FileManager.default.createDirectory(at: sourceDirectory, withIntermediateDirectories: true)

        let includedFile = sourceDirectory.appendingPathComponent("Included.swift")
        let ignoredFile = sourceDirectory.appendingPathComponent("Ignored.swift")
        try """
        import SwiftUI
        struct IncludedView: View {
            var body: some View {
                Text("Included")
                    .font(.system(size: 14))
            }
        }
        """.write(to: includedFile, atomically: true, encoding: .utf8)
        try """
        import SwiftUI
        struct IgnoredView: View {
            var body: some View {
                Text("Ignored")
                    .ignoresSafeArea()
            }
        }
        """.write(to: ignoredFile, atomically: true, encoding: .utf8)

        let facts = try SwiftSourceFactCollector().collect(
            sourceFiles: [includedFile],
            packageDirectory: packageDirectory
        )

        XCTAssertTrue(facts.callFacts.contains { $0.artifact == "Sources/App/Included.swift" && $0.baseName == "Text" })
        XCTAssertFalse(facts.callFacts.contains { $0.artifact == "Sources/App/Ignored.swift" })
    }

    func testCollectsStringLiteralsInsideArrayArguments() throws {
        let packageDirectory = try makeTempPackage()
        let sourceDirectory = packageDirectory.appendingPathComponent("Sources/App", isDirectory: true)
        try FileManager.default.createDirectory(at: sourceDirectory, withIntermediateDirectories: true)
        let sourceFile = sourceDirectory.appendingPathComponent("Shortcuts.swift")
        try """
        import AppIntents
        let shortcut = AppShortcut(intent: OpenRoute(), phrases: ["Hey Siri, plan a route"])
        """.write(to: sourceFile, atomically: true, encoding: .utf8)

        let facts = try SwiftSourceFactCollector().collect(
            sourceFiles: [sourceFile],
            packageDirectory: packageDirectory
        )

        let shortcutFact = try XCTUnwrap(facts.callFacts.first { $0.baseName == "AppShortcut" })
        XCTAssertEqual(shortcutFact.artifact, "Sources/App/Shortcuts.swift")
        XCTAssertTrue(shortcutFact.argumentLabels.contains("phrases"))
        XCTAssertEqual(shortcutFact.stringArguments, ["Hey Siri, plan a route"])
    }

    private func makeTempPackage() throws -> URL {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }
}
