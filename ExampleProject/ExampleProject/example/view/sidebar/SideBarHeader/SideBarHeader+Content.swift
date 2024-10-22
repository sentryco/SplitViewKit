import SwiftUI
import HybridColor
/**
 * Content
 */
extension SideBarHeader {
   /**
    * - Description: The header of the sidebar, which includes the title and a size class indicator.
    * - Fixme: ⚠️️ We should hide the toggle button if column is sidebar, and size is compact, etc. deal with it later
    */
   var body: some View {
      VStack {
         HStack {
            toggleButton // Top-left
            Spacer()
         }
         HStack {
            titleText // Bottom-left
            Spacer()
         }
      }
      .padding(.horizontal) // Adds left and right padding
      .padding(.vertical) // - Fixme: ⚠️️ doc this
   }
}
/**
 * Component
 */
extension SideBarHeader {
   /**
    * - Description: The title text of the sidebar header
    */
   var titleText: some View {
      Text(title) // - Fixme: ⚠️️ Toggle this somehow between accounts and Settings?
         .titleTextStyle
         .padding(.vertical, 6) // - Fixme: ⚠️️ doc this
   }
   /**
    * - Description: The toggle button of the sidebar header
    * - Note: We animate the hiding showing of sidebar toggle button because it looks nice
    * - Note: "70% splitview mode" for iPad is considered regular
    * - Note: The animation is only really visible If we drag the sidebar to visibility. Very subtle, but looks better when accounted for
    */
   @ViewBuilder var toggleButton: some View {
      Button(action: { // Hide sidebar
         if sizeClass == .regular { // If 3 column
            splitConfig.columnVisibility = .doubleColumn // Go to double column, this effectivly hides sidebar
         } // else we are in compact mode. So just switch to main
         splitConfig.preferredCompactColumn = .content
      }) {}
         .iconButtonStyle(iconName: "square.lefthalf.fill") // - Fixme: ⚠️️ describe what this icon looks like
         .opacity(splitConfig.columnVisibility == .all ? 1.0 : 0.0) // Only show this if sidebar is hidden
         // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
         .animation(.easeInOut(duration: 0.3), value: splitConfig.columnVisibility == .all)
   }
}
