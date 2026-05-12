import Foundation
import SemanticKitBuildPluginsCore

public struct ConformanceProfile: Equatable, Sendable {
    public enum Status: String, Sendable {
        case ready
        case migrationPending
        case blocked
    }

    public var identifier: String
    public var repositoryName: String
    public var legacyScriptPath: String?
    public var swiftTestArguments: [String]
    public var requirementDocumentRoots: [String]
    public var status: Status
    public var notes: [String]

    public init(
        identifier: String,
        repositoryName: String,
        legacyScriptPath: String?,
        swiftTestArguments: [String],
        requirementDocumentRoots: [String],
        status: Status,
        notes: [String] = []
    ) {
        self.identifier = identifier
        self.repositoryName = repositoryName
        self.legacyScriptPath = legacyScriptPath
        self.swiftTestArguments = swiftTestArguments
        self.requirementDocumentRoots = requirementDocumentRoots
        self.status = status
        self.notes = notes
    }
}

public enum SemanticKitConformanceProfiles {
    public static let all: [ConformanceProfile] = [
        ConformanceProfile(
            identifier: "sparql.conformance",
            repositoryName: "SPARQLKit",
            legacyScriptPath: "Scripts/run-conformance-tests.sh",
            swiftTestArguments: ["swift", "test"],
            requirementDocumentRoots: ["Docs/Requirements", "Docs/Specifications"],
            status: .migrationPending,
            notes: ["Filter discovery must be verified against Swift Testing before script parity is declared."]
        ),
        ConformanceProfile(
            identifier: "shacl.fast-conformance",
            repositoryName: "SHACLKit",
            legacyScriptPath: "Scripts/RunFastConformanceGate.sh",
            swiftTestArguments: ["swift", "test"],
            requirementDocumentRoots: ["Docs/Requirements", "Docs/Specifications"],
            status: .migrationPending,
            notes: ["Legacy script path assumptions are stale and must map to the current SwiftPM layout."]
        ),
        ConformanceProfile(
            identifier: "shacl.changed-area",
            repositoryName: "SHACLKit",
            legacyScriptPath: "Scripts/RunChangedAreaGate.sh",
            swiftTestArguments: ["swift", "test"],
            requirementDocumentRoots: ["Docs/Requirements", "Docs/Specifications"],
            status: .migrationPending,
            notes: ["Changed-area behavior requires side-by-side parity evidence before CI onboarding."]
        ),
        ConformanceProfile(
            identifier: "shacl.sharded-tests",
            repositoryName: "SHACLKit",
            legacyScriptPath: "Scripts/RunShardedTests.sh",
            swiftTestArguments: ["swift", "test"],
            requirementDocumentRoots: ["Docs/Requirements", "Docs/Specifications"],
            status: .migrationPending,
            notes: ["Sharding must be encoded in Swift-native profile metadata rather than shell entrypoints."]
        ),
    ]

    public static func profile(identifier: String) -> ConformanceProfile? {
        all.first { $0.identifier == identifier }
    }
}
