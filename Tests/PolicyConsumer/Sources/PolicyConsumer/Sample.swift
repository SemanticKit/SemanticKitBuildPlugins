// Parsed by the policies, never compiled: SwiftSyntax reads every #if branch.
#if false
struct ContentView: View {
    var body: some View {
        VStack {
            Button("OK") { }
            Text("Click here")
            Image(systemName: "star").accessibilityHidden(true)
            Text("Hi").help("Open route planning controls and show detailed guidance for every available route option")
        }
        .ignoresSafeArea()
        .frame(width: 32, height: 32)
    }
}
#endif
