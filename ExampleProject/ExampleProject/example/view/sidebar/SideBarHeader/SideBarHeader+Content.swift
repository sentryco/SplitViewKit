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
      .padding(.vertical)
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
         .padding(.vertical, 6)
   }
   /**
    * - Description: The toggle button of the sidebar header
    * - Note: We always show this button. We never hide it
    */
   @ViewBuilder var toggleButton: some View {
      Button(action: { // Hide sidebar
         if sizeClass == .regular { // If 3 column
            splitConfig.columnVisibility = .doubleColumn // Go to double column
         } // else compact. switch to main
         splitConfig.preferredCompactColumn = .content
      }) {}
         .iconButtonStyle(iconName: "square.lefthalf.fill")
   }
}

