import Foundation
import SemanticKitBuildPluginsProfiles

public struct MigrationReporter: Sendable {
    public init() {}

    public func report() -> CommandResult {
        let messages = SemanticKitConformanceProfiles.all.map { profile in
            let legacy = profile.legacyScriptPath ?? "none"
            return "\(profile.identifier): \(profile.status.rawValue) (legacy: \(legacy))"
        }

        return CommandResult(exitCode: 0, messages: messages)
    }
}
