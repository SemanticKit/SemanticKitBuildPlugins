import XCTest
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
@testable import SemanticKitBuildPluginsPolicy

final class PolicyEngineTests: XCTestCase {
    func testPolicyEngineUsesSwiftOPABackendName() {
        XCTAssertEqual(SwiftOPAPolicyEngine().backendName, "SwiftOPA")
    }

    func testPolicyEngineDecodesStructuredPolicyDecision() async throws {
        let packageDirectory = try makeTemporaryPackageDirectory(regoSource: """
        package semantickit.main

        decision := {
          "deny": [{
            "id": "test.rule",
            "severity": "error",
            "message": "Denied by fixture policy",
            "artifact": "Sources/App/Fixture.swift",
            "line": 8,
            "column": 4
          }],
          "warn": [],
          "note": []
        }
        """)

        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(),
            workflowContainsScriptEntrypoints: false,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let bundleDirectory = try buildPlanBundleDirectory(from: packageDirectory.appendingPathComponent("Policies", isDirectory: true))
        defer { try? FileManager.default.removeItem(at: bundleDirectory.deletingLastPathComponent()) }

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, preparedBundleDirectory: bundleDirectory)
        let diagnostic = try XCTUnwrap(evaluation.diagnostics.first)
        XCTAssertEqual(diagnostic.message, "Denied by fixture policy")
        XCTAssertEqual(diagnostic.location, "Sources/App/Fixture.swift:8:4")
    }

    func testPolicyEngineAllowsEmptyPolicyRoots() async throws {
        let packageDirectory = try makeTemporaryPackageDirectory(regoSource: nil)
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(),
            workflowContainsScriptEntrypoints: false,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, preparedBundleDirectory: nil)
        XCTAssertTrue(evaluation.diagnostics.isEmpty)
    }

    private func makeTemporaryPackageDirectory(regoSource: String?) throws -> URL {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let policiesDirectory = directory.appendingPathComponent("Policies", isDirectory: true)
        try FileManager.default.createDirectory(at: policiesDirectory, withIntermediateDirectories: true)

        if let regoSource {
            let policyFile = policiesDirectory.appendingPathComponent("fixture.rego")
            try regoSource.write(to: policyFile, atomically: true, encoding: .utf8)
        }

        return directory
    }

    private func buildPlanBundleDirectory(from policiesDirectory: URL) throws -> URL {
        let tempRoot = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        let outputArchive = tempRoot.appendingPathComponent("bundle.tar.gz")
        let extractedBundle = tempRoot.appendingPathComponent("bundle", isDirectory: true)

        try FileManager.default.createDirectory(at: tempRoot, withIntermediateDirectories: true)
        try runCommand(
            "opa",
            arguments: ["build", "--target", "plan", "--entrypoint", "semantickit/main/decision", "--output", outputArchive.path, policiesDirectory.path],
            currentDirectory: tempRoot
        )
        try FileManager.default.createDirectory(at: extractedBundle, withIntermediateDirectories: true)
        try runCommand(
            "tar",
            arguments: ["-xzf", outputArchive.path, "-C", extractedBundle.path],
            currentDirectory: tempRoot
        )
        return extractedBundle
    }

    private func runCommand(_ command: String, arguments: [String], currentDirectory: URL) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = [command] + arguments
        process.currentDirectoryURL = currentDirectory

        let errorPipe = Pipe()
        process.standardError = errorPipe

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            let errorOutput = String(data: errorPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
            throw NSError(domain: "PolicyEngineTests.Process", code: Int(process.terminationStatus), userInfo: [NSLocalizedDescriptionKey: errorOutput])
        }
    }
}
