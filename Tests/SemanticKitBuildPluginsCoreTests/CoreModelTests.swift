import XCTest
import Yams
@testable import SemanticKitBuildPluginsCore

final class CoreModelTests: XCTestCase {
    func testWorkflowYAMLRoundTripsThroughYams() throws {
        let workflow = GitHubWorkflow(name: "SemanticKit CI")

        let text = try YAMLEncoder().encode(workflow)
        XCTAssertTrue(text.contains("SemanticKit CI"))
        XCTAssertTrue(text.contains("allow-writing-to-package-directory"))

        let decoded = try YAMLDecoder().decode(GitHubWorkflow.self, from: text)
        XCTAssertEqual(decoded, workflow)
        XCTAssertEqual(
            decoded.jobs.validate.steps.last?.run,
            "swift package --allow-writing-to-package-directory semantic-kit-build-plugins validate"
        )
    }
}
