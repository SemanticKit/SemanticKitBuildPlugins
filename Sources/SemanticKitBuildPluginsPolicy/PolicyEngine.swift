import Foundation
import SemanticKitBuildPluginsCore
#if canImport(SwiftOPA)
import SwiftOPA
#endif

public struct PolicyInput: Codable, Equatable, Sendable {
    public var repositoryConfiguration: RepositoryConfiguration
    public var directDependencyURLs: [String]

    public init(repositoryConfiguration: RepositoryConfiguration, directDependencyURLs: [String]) {
        self.repositoryConfiguration = repositoryConfiguration
        self.directDependencyURLs = directDependencyURLs
    }
}

public struct PolicyEvaluation: Equatable, Sendable {
    public var backendName: String
    public var diagnostics: [ValidationDiagnostic]

    public init(backendName: String, diagnostics: [ValidationDiagnostic]) {
        self.backendName = backendName
        self.diagnostics = diagnostics
    }
}

public struct SwiftOPAPolicyEngine: Sendable {
    public init() {}

    public var backendName: String {
        "SwiftOPA"
    }

    public func evaluate(_ input: PolicyInput) -> PolicyEvaluation {
        var diagnostics = DependencyApprovalPolicy.validate(directDependencyURLs: input.directDependencyURLs)

        if input.repositoryConfiguration.swiftVersion != ToolingBaseline.swiftToolsVersion {
            diagnostics.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "Swift version baseline must remain \(ToolingBaseline.swiftToolsVersion).",
                    location: ".semantic-kit/ci.yml"
                )
            )
        }

        if input.repositoryConfiguration.macOSDeploymentTarget != ToolingBaseline.macOSDeploymentTarget {
            diagnostics.append(
                ValidationDiagnostic(
                    severity: .error,
                    message: "macOS deployment target must remain \(ToolingBaseline.macOSDeploymentTarget)+.",
                    location: ".semantic-kit/ci.yml"
                )
            )
        }

        return PolicyEvaluation(backendName: backendName, diagnostics: diagnostics)
    }
}
