import SwiftUI
import HybridColor
/**
 * Preview (iPad / macOS)
 * - Description: This preview serves as a minimalistic reference implementation for the `SplitViewWrapper`, showcasing essential functionalities.
 * - Note: Great example of `NavigationSplitViewController` https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui
 * - Note: To test window resizing etc. Use simulator. There is an example xcode project that can be used for that purpouse
 * - Note: Preview does not seem to support resizing window atm
 * - Note: We have to add the statusBar remover for this preview, to simulate exactly how it looks like in simulator etc
 */
#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   ExampleView()
      .background(Color.blackOrWhite.opacity(1))
      .environment(\.colorScheme, .dark) // dark
      .statusBar(hidden: true) // Hide the status bar (looks better for demos)
}
