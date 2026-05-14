import SemanticKitBuildPluginsCore

struct PolicyDecision: Decodable {
    var deny: [PolicyDiagnosticPayload]
    var warn: [PolicyDiagnosticPayload]
    var note: [PolicyDiagnosticPayload]

    var diagnostics: [ValidationDiagnostic] {
        (deny + warn + note).map(\.diagnostic)
    }
}
