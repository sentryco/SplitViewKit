import SwiftUI
import HybridColor
/**
 * Content
 */
extension SideBarHeader {
   /**
    * - Fixme: ⚠️️ Add doc
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
   }
}
/**
 * Component
 */
extension SideBarHeader {
   /**
    * - Fixme: ⚠️️ Add doc
    */
   var titleText: some View {
      Text(title) // - Fixme: ⚠️️ Toggle this somehow between accounts and Settings?
         .titleTextStyle
         .padding(.vertical, 6)
   }
   /**
    * Always show this
    */
   @ViewBuilder var toggleButton: some View {
      Button("Hide sidebar") {
//         Swift.print("toggle") // Action for the button
         if sizeClass == .regular { // if 3 column
            splitConfig.columnVisibility = .doubleColumn // go to double column
         } // else compact. switch to main
         splitConfig.preferredCompactColumn = .content
      }
      .toggleButtonStyle
   }
}
