import SemanticKitBuildPluginsCore

public struct PolicyEvaluation: Equatable, Sendable {
    public var backendName: String
    public var diagnostics: [ValidationDiagnostic]

    public init(backendName: String, diagnostics: [ValidationDiagnostic]) {
        self.backendName = backendName
        self.diagnostics = diagnostics
    }
}
