import XCTest
import SemanticKitBuildPluginsCore
import SemanticKitBuildPluginsFacts
@testable import SemanticKitBuildPluginsPolicy

final class PolicyEngineTests: XCTestCase {
    private let packageDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

    func testPolicyEngineUsesSwiftOPABackendName() {
        XCTAssertEqual(SwiftOPAPolicyEngine().backendName, "SwiftOPA")
    }

    func testPolicyEngineRejectsLoweredSwiftBaseline() async {
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(swiftVersion: "6.2"),
            directDependencyURLs: [],
            workflowContainsScriptEntrypoints: false,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, packageDirectory: packageDirectory)
        XCTAssertTrue(evaluation.diagnostics.contains { $0.message.contains("Swift version baseline") })
    }

    func testPolicyEngineRejectsWorkflowScriptEntrypoints() async {
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(),
            directDependencyURLs: [],
            workflowContainsScriptEntrypoints: true,
            swiftSourceFacts: SwiftSourceFacts(),
            artifactCatalog: ArtifactCatalog(policyModuleRoots: [packageDirectory.appendingPathComponent("Policies").path])
        )

        let evaluation = await SwiftOPAPolicyEngine().evaluate(input, packageDirectory: packageDirectory)
        XCTAssertTrue(evaluation.diagnostics.contains { $0.message.contains("shell-script primary entrypoints") })
    }
}
