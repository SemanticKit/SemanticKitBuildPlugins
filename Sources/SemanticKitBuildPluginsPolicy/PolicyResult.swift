struct PolicyResult: Decodable {
    var deny: [PolicyDiagnosticPayload]?
    var warn: [PolicyDiagnosticPayload]?
    var note: [PolicyDiagnosticPayload]?
    var result: PolicyDecision?
    var expressions: [PolicyExpression]?

    var decision: PolicyDecision? {
        if let deny, let warn, let note {
            return PolicyDecision(deny: deny, warn: warn, note: note)
        }

        return result ?? expressions?.first?.value
    }
}
