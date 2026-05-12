import Foundation

/// Placeholder model kept for backward compatibility with earlier scaffolding.
/// Repository-specific dependency approvals must be expressed in local Rego policy bundles,
/// not hardcoded in this tool package.
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
