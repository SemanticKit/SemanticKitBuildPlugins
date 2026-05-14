import Foundation
import SemanticKitBuildPluginsCommandSupport

let parsedInvocation = ToolInvocation(commandLineArguments: Array(CommandLine.arguments.dropFirst()))
let context = ToolExecutionContext(
    arguments: parsedInvocation.arguments,
    packageDirectory: parsedInvocation.packageDirectory
)
let result = await SemanticKitCommandRunner().run(context: context)

for message in result.messages {
    print(message)
}

for diagnostic in result.diagnostics {
    print(diagnostic.buildLogMessage)
}

Foundation.exit(result.exitCode)

struct ToolInvocation {
    var arguments: [String]
    var packageDirectory: URL

    init(commandLineArguments: [String]) {
        var remaining: [String] = []
        var packageDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        var index = 0

        while index < commandLineArguments.count {
            let argument = commandLineArguments[index]
            if argument == "--package-directory", commandLineArguments.indices.contains(index + 1) {
                packageDirectory = URL(fileURLWithPath: commandLineArguments[index + 1])
                index += 2
                continue
            }
            remaining.append(argument)
            index += 1
        }

        self.arguments = remaining
        self.packageDirectory = packageDirectory
    }
}
