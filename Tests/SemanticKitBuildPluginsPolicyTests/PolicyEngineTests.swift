import XCTest
import SemanticKitBuildPluginsCore
@testable import SemanticKitBuildPluginsPolicy

final class PolicyEngineTests: XCTestCase {
    func testPolicyEngineUsesSwiftOPABackendName() {
        XCTAssertEqual(SwiftOPAPolicyEngine().backendName, "SwiftOPA")
    }

    func testPolicyEngineRejectsLoweredSwiftBaseline() {
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(swiftVersion: "6.2"),
            directDependencyURLs: []
        )

        let evaluation = SwiftOPAPolicyEngine().evaluate(input)
        XCTAssertTrue(evaluation.diagnostics.contains { $0.message.contains("Swift version baseline") })
    }

    func testPolicyEngineRejectsUnapprovedDependency() {
        let input = PolicyInput(
            repositoryConfiguration: RepositoryConfiguration(),
            directDependencyURLs: ["https://github.com/example/NotApproved.git"]
        )

        let evaluation = SwiftOPAPolicyEngine().evaluate(input)
        XCTAssertTrue(evaluation.diagnostics.contains { $0.message.contains("Unapproved dependency source") })
    }
}
