import SwiftUI
import HybridColor
/**
 * Preview (iPad / macOS)
 * - Description: This preview serves as a minimalistic reference implementation for the SplitViewContainer, showcasing essential functionalities.
 * - Note: Great example of SplitViewController: https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui
 * - Note: To test window resizing etc. Use simulator. There is an example xcode project that can be used for that purpouse
 * - Note: It's possible to test window resizing by using splitview in simulator. Simulator does not seem to support resizing window atm
 * - Note: We have to add the statusBar remover, to simulate exactly how it looks like in simulator
 * - Fixme: ⚠️️ Hide top bar for macOS? elaborate?
 * - Fixme: ⚠️️ Make a simple debug preview with rectangles etc that has tests for colapse toggle etc? 👈
 * - Fixme: ⚠️️ There seems to be some deault-sizing in the split-view. figure it out!
 */
#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   ExampleView()
      .background(Color.blackOrWhite.opacity(1))
      .environment(\.colorScheme, .dark) // dark
      .statusBar(hidden: true) // Hide the status bar (looks better for demos)
}
