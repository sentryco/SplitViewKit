import SwiftUI
import SplitViewKit

// @main: Marks the entry point of the SwiftUI application.
// we have a xcode project so we can test with simulator and compact mode etc
// - Fixme: ⚠️️ test with iphone and mac as well etc
@main
struct ExampleProjectApp: App {
   // App Protocol: Conforms to the App protocol which is required for SwiftUI apps.
   var body: some Scene {
      // WindowGroup: A scene type used for apps that manage one or more windows on a platform.
      WindowGroup {
         ExampleView()
         // .previewLayout(.sizeThatFits)
         // .padding()
            .background(Color.black/*blackOrWhite*/.opacity(1))
            .environment(\.colorScheme, .dark) // dark
//         ContentView()
      }
   }
}

// ContentView: A basic SwiftUI view displaying a simple text.
//struct ContentView: View {
//   var body: some View {
//      Text("Hello, SwiftUI!")
//         .padding()
//   }
//}
//
//#Preview {
//   ContentView()
//}
