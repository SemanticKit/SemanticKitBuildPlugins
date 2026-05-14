import Foundation
import SwiftParser
import SwiftSyntax

public struct SwiftCallFact: Codable, Equatable, Sendable {
    public var artifact: String
    public var line: Int
    public var column: Int
    public var calledExpression: String
    public var baseName: String
    public var memberName: String
    public var argumentLabels: [String]
    public var stringArguments: [String]
    public var numericArguments: [String]

    public init(
        artifact: String,
        line: Int,
        column: Int,
        calledExpression: String,
        baseName: String,
        memberName: String,
        argumentLabels: [String],
        stringArguments: [String],
        numericArguments: [String]
    ) {
        self.artifact = artifact
        self.line = line
        self.column = column
        self.calledExpression = calledExpression
        self.baseName = baseName
        self.memberName = memberName
        self.argumentLabels = argumentLabels
        self.stringArguments = stringArguments
        self.numericArguments = numericArguments
    }
}

public struct SwiftSourceFacts: Codable, Equatable, Sendable {
    public var callFacts: [SwiftCallFact]

    public init(callFacts: [SwiftCallFact] = []) {
        self.callFacts = callFacts
    }
}

public struct SwiftSourceFactCollector {
    public init() {}

    public func collect(sourceFiles: [URL], packageDirectory: URL) throws -> SwiftSourceFacts {
        var callFacts: [SwiftCallFact] = []
        for fileURL in sourceFiles.sorted(by: { $0.path < $1.path }) {
            guard fileURL.pathExtension.lowercased() == "swift" else { continue }
            let source = try String(contentsOf: fileURL, encoding: .utf8)
            let tree = Parser.parse(source: source)
            let converter = SourceLocationConverter(fileName: fileURL.path, tree: tree)
            let artifact = relativeArtifactPath(fileURL: fileURL, packageDirectory: packageDirectory)
            let visitor = SwiftSourceFactVisitor(converter: converter, artifact: artifact)
            callFacts.append(contentsOf: visitor.collect(from: tree).callFacts)
        }

        return SwiftSourceFacts(
            callFacts: callFacts.sorted { ($0.artifact, $0.line, $0.column) < ($1.artifact, $1.line, $1.column) }
        )
    }

    private func relativeArtifactPath(fileURL: URL, packageDirectory: URL) -> String {
        let packagePath = packageDirectory.standardizedFileURL.path
        let filePath = fileURL.standardizedFileURL.path
        if filePath.hasPrefix(packagePath + "/") {
            return String(filePath.dropFirst(packagePath.count + 1))
        }
        return fileURL.lastPathComponent
    }
}

private final class SwiftSourceFactVisitor: SyntaxVisitor {
    private let converter: SourceLocationConverter
    private let artifact: String
    private var callFacts: [SwiftCallFact] = []

    init(converter: SourceLocationConverter, artifact: String) {
        self.converter = converter
        self.artifact = artifact
        super.init(viewMode: .sourceAccurate)
    }

    func collect(from tree: some SyntaxProtocol) -> SwiftSourceFacts {
        walk(Syntax(tree))
        return SwiftSourceFacts(callFacts: callFacts)
    }

    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        let location = converter.location(for: callLocationPosition(for: node.calledExpression))
        callFacts.append(
            SwiftCallFact(
                artifact: artifact,
                line: location.line,
                column: location.column,
                calledExpression: normalizedCalledExpression(node.calledExpression),
                baseName: callBaseName(for: node.calledExpression),
                memberName: callMemberName(for: node.calledExpression) ?? "",
                argumentLabels: node.arguments.map { $0.label?.text ?? "_" },
                stringArguments: node.arguments.flatMap { literalStringArguments(from: $0.expression) },
                numericArguments: node.arguments.compactMap { literalNumericArgument(from: $0.expression) }
            )
        )
        return .visitChildren
    }

    private func normalizedCalledExpression(_ expression: ExprSyntax) -> String {
        expression.trimmedDescription.components(separatedBy: .whitespacesAndNewlines).joined()
    }

    private func callBaseName(for expression: ExprSyntax) -> String {
        if let memberAccess = expression.as(MemberAccessExprSyntax.self) {
            return memberAccess.declName.baseName.text
        }
        if let declReference = expression.as(DeclReferenceExprSyntax.self) {
            return declReference.baseName.text
        }
        if let genericSpecialization = expression.as(GenericSpecializationExprSyntax.self) {
            return callBaseName(for: genericSpecialization.expression)
        }
        return normalizedCalledExpression(expression)
    }

    private func callMemberName(for expression: ExprSyntax) -> String? {
        if let memberAccess = expression.as(MemberAccessExprSyntax.self) {
            return memberAccess.declName.baseName.text
        }
        if let genericSpecialization = expression.as(GenericSpecializationExprSyntax.self) {
            return callMemberName(for: genericSpecialization.expression)
        }
        return nil
    }

    private func callLocationPosition(for expression: ExprSyntax) -> AbsolutePosition {
        if let memberAccess = expression.as(MemberAccessExprSyntax.self) {
            return memberAccess.declName.baseName.positionAfterSkippingLeadingTrivia
        }
        if let declReference = expression.as(DeclReferenceExprSyntax.self) {
            return declReference.baseName.positionAfterSkippingLeadingTrivia
        }
        if let genericSpecialization = expression.as(GenericSpecializationExprSyntax.self) {
            return callLocationPosition(for: genericSpecialization.expression)
        }
        return expression.positionAfterSkippingLeadingTrivia
    }

    private func literalStringArguments(from expression: ExprSyntax) -> [String] {
        if let stringLiteral = expression.as(StringLiteralExprSyntax.self) {
            return literalStringArgument(from: stringLiteral).map { [$0] } ?? []
        }

        if let array = expression.as(ArrayExprSyntax.self) {
            return array.elements.flatMap { literalStringArguments(from: $0.expression) }
        }

        return []
    }

    private func literalStringArgument(from stringLiteral: StringLiteralExprSyntax) -> String? {
        var value = ""
        for segment in stringLiteral.segments {
            guard let stringSegment = segment.as(StringSegmentSyntax.self) else {
                return nil
            }
            value += stringSegment.content.text
        }
        return value
    }

    private func literalNumericArgument(from expression: ExprSyntax) -> String? {
        if let integerLiteral = expression.as(IntegerLiteralExprSyntax.self) {
            return integerLiteral.literal.text
        }
        if let floatLiteral = expression.as(FloatLiteralExprSyntax.self) {
            return floatLiteral.literal.text
        }
        if let prefixOperator = expression.as(PrefixOperatorExprSyntax.self) {
            let operatorText = prefixOperator.`operator`.text
            guard operatorText == "-" || operatorText == "+" else {
                return nil
            }
            return literalNumericArgument(from: prefixOperator.expression).map { operatorText + $0 }
        }
        return nil
    }
}
