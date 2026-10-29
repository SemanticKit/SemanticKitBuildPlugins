/// One finding of one policy, printed as a build diagnostic.
struct PolicyFinding: Hashable, Comparable {
    enum Level: String {
        case error
        case warning
        case note
    }

    let ruleID: String
    let message: String
    let line: Int
    let column: Int
    let level: Level

    init(_ entry: PolicyDecision.Entry, level: Level) {
        self.ruleID = entry.ruleID
        self.message = entry.message
        self.line = entry.line
        self.column = entry.column
        self.level = level
    }

    /// `<file>:<line>:<column>: <level>: <message> [<rule_id>]`, the form
    /// SwiftPM and Xcode show as a diagnostic on that line.
    func diagnostic(in file: String) -> String {
        "\(file):\(line):\(column): \(level.rawValue): \(message) [\(ruleID)]"
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        (lhs.line, lhs.column, lhs.ruleID, lhs.message) < (rhs.line, rhs.column, rhs.ruleID, rhs.message)
    }
}
