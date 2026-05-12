import Foundation
import SemanticKitBuildPluginsCore

public struct CommandResult: Equatable, Sendable {
    public var exitCode: Int32
    public var messages: [String]
    public var diagnostics: [ValidationDiagnostic]

    public init(exitCode: Int32, messages: [String] = [], diagnostics: [ValidationDiagnostic] = []) {
        self.exitCode = exitCode
        self.messages = messages
        self.diagnostics = diagnostics
    }
}
