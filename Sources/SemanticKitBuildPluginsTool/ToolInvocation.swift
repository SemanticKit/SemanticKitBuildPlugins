import Foundation
import SemanticKitBuildPluginsCommandSupport

struct ToolInvocation {
    var packageDirectory: URL
    var sourceFiles: [URL]
    var policyPlanArchives: [PolicyPlanArchive]
    var argumentErrors: [String]

    init(commandLineArguments: [String]) {
        var packageDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        var sourceFiles: [URL] = []
        var policyPlanArchives: [PolicyPlanArchive] = []
        var argumentErrors: [String] = []
        var index = 0

        while index < commandLineArguments.count {
            let argument = commandLineArguments[index]
            switch argument {
            case "--package-directory" where commandLineArguments.indices.contains(index + 1):
                packageDirectory = URL(fileURLWithPath: commandLineArguments[index + 1])
                index += 2
                continue
            case "--swift-source" where commandLineArguments.indices.contains(index + 1):
                sourceFiles.append(URL(fileURLWithPath: commandLineArguments[index + 1]))
                index += 2
                continue
            case "--policy-bundle" where commandLineArguments.indices.contains(index + 1):
                let archive = URL(fileURLWithPath: commandLineArguments[index + 1])
                if commandLineArguments.indices.contains(index + 3),
                   commandLineArguments[index + 2] == "--policy-query" {
                    policyPlanArchives.append(PolicyPlanArchive(archive: archive, query: commandLineArguments[index + 3]))
                    index += 4
                } else {
                    argumentErrors.append("--policy-bundle requires a following --policy-query argument.")
                    index += 2
                }
                continue
            default:
                index += 1
            }
        }

        self.packageDirectory = packageDirectory
        self.sourceFiles = sourceFiles
        self.policyPlanArchives = policyPlanArchives
        self.argumentErrors = argumentErrors
    }
}
