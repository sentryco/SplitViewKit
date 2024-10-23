import SwiftUI
import SplitViewKit
import HybridColor
/**
 * We have a xcode project so we can test with simulator and compact mode etc
 * - Fixme: ⚠️️ test with iphone and mac as well etc
 */
@main
struct ExampleProjectApp: App { // App Protocol: Conforms to the App protocol which is required for SwiftUI apps.
   var body: some Scene {
      WindowGroup {  // WindowGroup: A scene type used for apps that manage one or more windows on a platform.
         ExampleView()
            .background(Color.blackOrWhite.opacity(1))
            .environment(\.colorScheme, .dark) // dark
            .statusBar(hidden: true) // Hide the status bar (looks better for demos)
//            .persistentSystemOverlays(.hidden) // Hide the Home Indicator (looks better for demos)
      }
   }
}
