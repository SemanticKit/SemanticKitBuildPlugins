import SemanticKitBuildPluginsCore

struct PolicyDiagnosticPayload: Decodable {
    var ruleID: String
    var message: String
    var artifact: String
    var line: Int
    var column: Int
    var severity: ValidationDiagnostic.Severity

    enum CodingKeys: String, CodingKey {
        case ruleID = "rule_id"
        case message
        case artifact
        case line
        case column
        case severity
    }

    var diagnostic: ValidationDiagnostic {
        ValidationDiagnostic(
            severity: severity,
            message: message,
            location: "\(artifact):\(line):\(column)",
            ruleID: ruleID
        )
    }
}
