import SwiftUI
import HybridColor
/**
 * Preview (iPad / macOS)
 * - Description: This is the bare-bone reference design for SplitViewContainer
 * - Note: Great example of SplitViewController: https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui
 * - Note: To test window resizing etc. Use simulator. There is an example xcode project that can be used for that purpouse
 * - Note: It's possible to test window resizing by using splitview in simulator. Simulator does not seem to support resizing window atm
 * - Fixme: ⚠️️ Hide top bar for macOS? elaborate?
 * - Fixme: ⚠️️ Make a simple debug preview with rectangles etc that has tests for colapse toggle etc? 👈
 */
#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   // - Fixme: ⚠️️ There seems to be some deault-sizing in the split-view. figure it out!
   ExampleView()
   // .previewLayout(.sizeThatFits)
   // .padding()
      .background(Color.blackOrWhite.opacity(1))
      .environment(\.colorScheme, .dark) // dark
}
// swiftui: I want to use a smaller sideBar for portait, and wider sideBar for landscape mode for ipad
