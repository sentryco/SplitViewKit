import SwiftUI
import HybridColor
/**
 * Preview (iPad / macOS)
 * - Description: This preview serves as a minimalistic reference
 *                implementation for the `SplitViewWrapper`, showcasing
 *                essential functionalities.
 * - Important: ⚠️️ Sheets cannot be shown when using preview with macOS target. Works fine for iPad as target
 * - Note: Great example of `NavigationSplitViewController` https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui
 * - Note: To test window resizing etc. Use simulator. There is an example xcode project that can be used for that purpouse
 * - Note: Preview does not seem to support resizing window atm
 * - Note: We have to add the statusBar remover for this preview, to simulate exactly how it looks like in simulator etc
 */
#Preview(traits: .fixedLayout(width: 800, height: 500)) {
   ExampleView()
      .environment(\.colorScheme, .dark) // dark
      #if os(iOS)
      .background(Color.blackOrWhite.opacity(1))
      .statusBar(hidden: true) // Hide the status bar (looks better for demos) (Not available on macOS)
      #endif
}
