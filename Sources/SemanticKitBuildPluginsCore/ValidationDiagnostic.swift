import Foundation

public struct ValidationDiagnostic: Equatable, Sendable {
    public enum Severity: String, Sendable {
        case error
        case warning
        case note
    }

    public var severity: Severity
    public var message: String
    public var location: String?

    public init(severity: Severity, message: String, location: String? = nil) {
        self.severity = severity
        self.message = message
        self.location = location
    }

    public var buildLogMessage: String {
        guard let location, !location.isEmpty else {
            return "\(severity.rawValue): \(message)"
        }

        return "\(location): \(severity.rawValue): \(message)"
    }
}

public struct ValidationReport: Equatable, Sendable {
    public var diagnostics: [ValidationDiagnostic]

    public init(diagnostics: [ValidationDiagnostic] = []) {
        self.diagnostics = diagnostics
    }

    public var hasErrors: Bool {
        diagnostics.contains { $0.severity == .error }
    }

    public mutating func append(_ diagnostic: ValidationDiagnostic) {
        diagnostics.append(diagnostic)
    }

    public mutating func append(contentsOf newDiagnostics: [ValidationDiagnostic]) {
        diagnostics.append(contentsOf: newDiagnostics)
    }
}
