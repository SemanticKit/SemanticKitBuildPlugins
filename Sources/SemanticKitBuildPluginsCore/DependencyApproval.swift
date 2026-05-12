import Foundation

public struct DependencyApproval: Equatable, Sendable {
    public var name: String
    public var url: String
    public var purpose: String

    public init(name: String, url: String, purpose: String) {
        self.name = name
        self.url = url
        self.purpose = purpose
    }
}

public enum DependencyApprovalPolicy {
    public static let approvedDirectDependencies: [DependencyApproval] = [
        DependencyApproval(
            name: "Yams",
            url: "https://github.com/jpsim/Yams.git",
            purpose: "YAML parsing and emission"
        ),
        DependencyApproval(
            name: "SwiftOPA",
            url: "https://github.com/open-policy-agent/swift-opa.git",
            purpose: "Policy-as-code validation backend"
        ),
        DependencyApproval(
            name: "SwiftLint",
            url: "https://github.com/realm/SwiftLint.git",
            purpose: "SwiftPM plugin lint integration"
        ),
    ]

    public static func validate(directDependencyURLs urls: [String]) -> [ValidationDiagnostic] {
        urls.compactMap { url in
            guard ToolingBaseline.approvedDependencyURLs.contains(url) || isPermittedOfficialBuildToolSource(url) else {
                return ValidationDiagnostic(
                    severity: .error,
                    message: "Unapproved dependency source: \(url)",
                    location: "Package.swift"
                )
            }
            return nil
        }
    }

    public static func isPermittedOfficialBuildToolSource(_ url: String) -> Bool {
        url.hasPrefix("https://github.com/apple/") || url.hasPrefix("https://github.com/swiftlang/")
    }
}
