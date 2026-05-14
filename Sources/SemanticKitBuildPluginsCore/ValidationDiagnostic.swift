import Foundation

public struct ValidationDiagnostic: Equatable, Sendable {
    public enum Severity: String, Codable, Sendable {
        case error
        case warning
        case note
    }

    public var severity: Severity
    public var message: String
    public var location: String
    public var ruleID: String

    public init(severity: Severity, message: String, location: String, ruleID: String) {
        self.severity = severity
        self.message = message
        self.location = location
        self.ruleID = ruleID
    }
}
