import Foundation

public struct RepositoryConfiguration: Codable, Equatable, Sendable {
    public var swiftVersion: String
    public var macOSDeploymentTarget: String
    public var releaseWorkflow: ReleaseWorkflowConfiguration
    public var conformanceProfiles: [String]
    public var policyBundle: PolicyBundleConfiguration?

    public init(
        swiftVersion: String = ToolingBaseline.swiftToolsVersion,
        macOSDeploymentTarget: String = ToolingBaseline.macOSDeploymentTarget,
        releaseWorkflow: ReleaseWorkflowConfiguration = ReleaseWorkflowConfiguration(),
        conformanceProfiles: [String] = [],
        policyBundle: PolicyBundleConfiguration? = nil
    ) {
        self.swiftVersion = swiftVersion
        self.macOSDeploymentTarget = macOSDeploymentTarget
        self.releaseWorkflow = releaseWorkflow
        self.conformanceProfiles = conformanceProfiles
        self.policyBundle = policyBundle
    }
}

public struct ReleaseWorkflowConfiguration: Codable, Equatable, Sendable {
    public var enabled: Bool
    public var tagPatterns: [String]

    public init(enabled: Bool = false, tagPatterns: [String] = ["v*"]) {
        self.enabled = enabled
        self.tagPatterns = tagPatterns
    }
}

public struct PolicyBundleConfiguration: Codable, Equatable, Sendable {
    public var reference: String

    public init(reference: String) {
        self.reference = reference
    }
}
