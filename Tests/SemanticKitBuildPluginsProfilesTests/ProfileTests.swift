import XCTest
@testable import SemanticKitBuildPluginsProfiles

final class ProfileTests: XCTestCase {
    func testInitialMigrationProfilesCoverSPARQLAndSHACLPriorityGates() {
        let identifiers = Set(SemanticKitConformanceProfiles.all.map(\.identifier))

        XCTAssertTrue(identifiers.contains("sparql.conformance"))
        XCTAssertTrue(identifiers.contains("shacl.fast-conformance"))
        XCTAssertTrue(identifiers.contains("shacl.changed-area"))
        XCTAssertTrue(identifiers.contains("shacl.sharded-tests"))
    }

    func testSHACLProfilesRemainMigrationPendingUntilParityIsProven() throws {
        let shaclProfiles = SemanticKitConformanceProfiles.all.filter { $0.repositoryName == "SHACLKit" }

        XCTAssertFalse(shaclProfiles.isEmpty)
        XCTAssertTrue(shaclProfiles.allSatisfy { $0.status == .migrationPending })
        XCTAssertTrue(shaclProfiles.contains { $0.notes.contains { $0.contains("stale") } })
    }
}
