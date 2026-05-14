import Foundation
import SwiftParser
import SwiftSyntax

struct SwiftSyntaxInput {
    var packageDirectory: URL

    func jsonData(for sourceFile: URL?) throws -> Data {
        guard let sourceFile, sourceFile.pathExtension.lowercased() == "swift" else {
            return Data(#"{"sourceFile":null,"swiftSyntax":null}"#.utf8)
        }

        let source = try Array(Data(contentsOf: sourceFile))
        let tree = source.withUnsafeBufferPointer { sourceBuffer in
            Parser.parse(source: sourceBuffer)
        }
        let converter = SourceLocationConverter(fileName: sourceFile.path, tree: tree)
        let payload = Payload(
            sourceFile: relativeArtifactPath(fileURL: sourceFile),
            swiftSyntax: Node(Syntax(tree), converter: converter)
        )

        return try JSONEncoder().encode(payload)
    }

    private func relativeArtifactPath(fileURL: URL) -> String {
        let packagePath = packageDirectory.standardizedFileURL.path
        let filePath = fileURL.standardizedFileURL.path
        if filePath.hasPrefix(packagePath + "/") {
            return String(filePath.dropFirst(packagePath.count + 1))
        }
        return fileURL.lastPathComponent
    }
}

private struct Payload: Encodable {
    var sourceFile: String?
    var swiftSyntax: Node?
}

private struct Node: Encodable {
    var type: String
    var range: SourceRangePayload
    var token: Token?
    var children: [Node]

    init(_ node: Syntax, converter: SourceLocationConverter) {
        let startLocation = converter.location(for: node.positionAfterSkippingLeadingTrivia)
        let endLocation = converter.location(for: node.endPositionBeforeTrailingTrivia)
        let token = node.as(TokenSyntax.self)

        self.type = String(describing: node.syntaxNodeType)
        self.range = SourceRangePayload(start: Location(startLocation), end: Location(endLocation))
        self.token = token.map { Token(kind: String(describing: $0.tokenKind), text: $0.text) }
        self.children = node.children(viewMode: .all).map { Node($0, converter: converter) }
    }
}

private struct SourceRangePayload: Encodable {
    var start: Location
    var end: Location
}

private struct Token: Encodable {
    var kind: String
    var text: String
}

private struct Location: Encodable {
    var line: Int
    var column: Int

    init(_ location: SourceLocation) {
        self.line = location.line
        self.column = location.column
    }
}
