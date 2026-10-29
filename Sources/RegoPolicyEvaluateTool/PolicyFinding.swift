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

    static func < (lhs: Self, rhs: Self) -> Bool {
        (lhs.line, lhs.column, lhs.ruleID, lhs.message) < (rhs.line, rhs.column, rhs.ruleID, rhs.message)
    }
}
