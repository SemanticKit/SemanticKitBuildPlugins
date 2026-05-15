import Foundation

public struct PolicyPlanArchive: Equatable, Sendable {
    public var archive: URL
    public var query: String

    public init(archive: URL, query: String) {
        self.archive = archive
        self.query = query
    }
}
