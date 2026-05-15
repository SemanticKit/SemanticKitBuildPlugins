import Foundation
import SemanticKitBuildPluginsCommandSupport

@main
struct SemanticKitBuildPluginsTool {
    static func main() async {
        let invocation = ToolInvocation(commandLineArguments: Array(CommandLine.arguments.dropFirst()))
        if !invocation.argumentErrors.isEmpty {
            for error in invocation.argumentErrors {
                print("error: \(error)")
            }
            Foundation.exit(1)
        }

        let result = await BuildToolPolicyEvaluator().evaluate(
            packageDirectory: invocation.packageDirectory,
            sourceFiles: invocation.sourceFiles,
            policyPlanArchives: invocation.policyPlanArchives
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
