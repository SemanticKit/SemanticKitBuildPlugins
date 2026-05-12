import Foundation

public struct GeneratedFile: Equatable, Sendable {
    public var relativePath: String
    public var contents: String

    public init(relativePath: String, contents: String) {
        self.relativePath = relativePath
        self.contents = contents
    }
}

public enum WriteMode: Equatable, Sendable {
    case dryRun
    case write
}
