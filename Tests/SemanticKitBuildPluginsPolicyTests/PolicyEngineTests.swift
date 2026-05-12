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
            directDependencyURLs: [],
            workflowContainsScriptEntrypoints: false,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, packageDirectory: packageDirectory)
        let diagnostic = try XCTUnwrap(evaluation.diagnostics.first)
        XCTAssertEqual(diagnostic.message, "Denied by fixture policy")
        XCTAssertEqual(diagnostic.location, "Sources/App/Fixture.swift:8:4")
    }

    func testPolicyEngineAllowsEmptyPolicyRoots() async throws {
        let packageDirectory = try makeTemporaryPackageDirectory(regoSource: nil)
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(),
            directDependencyURLs: [],
            workflowContainsScriptEntrypoints: false,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, packageDirectory: packageDirectory)
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
}
