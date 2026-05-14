import Foundation
import SemanticKitBuildPluginsCommandSupport

@main
struct SemanticKitBuildPluginsTool {
    static func main() async {
        let invocation = ToolInvocation(commandLineArguments: Array(CommandLine.arguments.dropFirst()))
        let result = await BuildToolPolicyEvaluator().evaluate(
            packageDirectory: invocation.packageDirectory,
            sourceFile: invocation.sourceFile,
            policyBundleArchive: invocation.policyBundleArchive
        )

        for message in result.messages {
            print(message)
        }

        for diagnostic in result.diagnostics {
            print("""
            \(diagnostic.location): \(diagnostic.severity.rawValue): \(diagnostic.message)
              rule: \(diagnostic.ruleID)
            """)
        }

        Foundation.exit(result.exitCode)
    }
}
