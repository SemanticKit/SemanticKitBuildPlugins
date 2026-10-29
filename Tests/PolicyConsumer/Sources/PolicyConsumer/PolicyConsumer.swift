/// Compiled code with nothing for the policies to report.
public struct RouteSummary: Sendable {
    public let name: String
    public let distance: Double

    public init(name: String, distance: Double) {
        self.name = name
        self.distance = distance
    }
}
