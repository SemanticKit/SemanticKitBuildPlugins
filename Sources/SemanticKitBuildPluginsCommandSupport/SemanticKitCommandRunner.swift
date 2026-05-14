import Foundation

public struct ToolExecutionContext: Sendable {
    public var arguments: [String]
    public var packageDirectory: URL

    public init(arguments: [String], packageDirectory: URL) {
        self.arguments = arguments
        self.packageDirectory = packageDirectory
    }
}

public struct SemanticKitCommandRunner {
    private let evaluator: BuildToolPolicyEvaluator

    public init(evaluator: BuildToolPolicyEvaluator = BuildToolPolicyEvaluator()) {
        self.evaluator = evaluator
    }

    public func run(context: ToolExecutionContext) async -> CommandResult {
        do {
            let options = ParsedOptions(arguments: context.arguments)
            guard options.isBuildToolInvocation else {
                return CommandResult(exitCode: 2, messages: [Self.helpText])
            }

            return try await runBuildToolValidation(
                context: context,
                outputDirectory: options.outputDirectory,
                policyBundleArchive: options.policyBundleArchive,
                sourceFiles: options.sourceFiles
            )
        } catch {
            return CommandResult(exitCode: 2, messages: ["Build policy tool error: \(error)"])
        }
    }

    private func runBuildToolValidation(
        context: ToolExecutionContext,
        outputDirectory: URL?,
        policyBundleArchive: URL?,
        sourceFiles: [URL]
    ) async throws -> CommandResult {
        let result = await evaluator.evaluate(
            packageDirectory: context.packageDirectory,
            sourceFiles: sourceFiles,
            policyBundleArchive: policyBundleArchive
        )
        guard let outputDirectory else {
            return result
        }

        try FileManager.default.createDirectory(at: outputDirectory, withIntermediateDirectories: true)
        let reportURL = outputDirectory.appendingPathComponent("policy-validation.txt")
        let body = (result.messages + result.diagnostics.map { diagnostic in
            diagnostic.buildLogMessage
        }).joined(separator: "\n") + "\n"
        try body.write(to: reportURL, atomically: true, encoding: .utf8)
        return result
    }

    public static let helpText = """
    Usage: SemanticKitBuildPluginsTool build-tool [options]

    Options:
      --output-directory DIR Build-tool validation output directory.
      --policy-bundle FILE   Prebuilt OPA bundle archive produced by the build-tool plugin.
      --swift-source FILE    Swift source file provided by the active build target.
    """
}

private struct ParsedOptions {
    var isBuildToolInvocation: Bool
    var outputDirectory: URL?
    var policyBundleArchive: URL?
    var sourceFiles: [URL]

    init(arguments: [String]) {
        isBuildToolInvocation = false
        outputDirectory = nil
        policyBundleArchive = nil
        sourceFiles = []

        var index = 0
        while index < arguments.count {
            let argument = arguments[index]
            switch argument {
            case "build-tool":
                isBuildToolInvocation = true
            case "--output-directory":
                if arguments.indices.contains(index + 1) {
                    outputDirectory = URL(fileURLWithPath: arguments[index + 1])
                    index += 1
                }
            case "--policy-bundle":
                if arguments.indices.contains(index + 1) {
                    policyBundleArchive = URL(fileURLWithPath: arguments[index + 1])
                    index += 1
                }
            case "--swift-source":
                if arguments.indices.contains(index + 1) {
                    sourceFiles.append(URL(fileURLWithPath: arguments[index + 1]))
                    index += 1
                }
            default:
                break
            }
            index += 1
        }
    }
}
