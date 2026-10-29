
$plan

## Build Plugins

### as a developer when I am writing code in Swift, whether I'm in Swift, package manager or Xcode when I click build or run swift build, I expect targets to be processed.

#### Given policy agent files written in `Rego` `*.rego`

- Expect: 


For local project documentation, never write or interpret docs as the source of truth for current repo state. Current state lives in code, manifests, tests, and build output. Docs
describe intent: the workflow we want, the behavior we are designing toward, and the constraints that should guide implementation. Before using a doc to make an implementation
decision, verify current state from the code. If the doc and code differ, treat the code as current reality and ask the user for direction and cleanly describe to the user the divergence between the state of code and the documentation in a simple format formatted in a markdown block.
