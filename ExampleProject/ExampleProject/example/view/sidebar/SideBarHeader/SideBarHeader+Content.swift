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
    */
   @ViewBuilder var toggleButton: some View {
      Button("Hide sidebar") {
         if sizeClass == .regular { // If 3 column
            splitConfig.columnVisibility = .doubleColumn // Go to double column
         } // else compact. switch to main
         splitConfig.preferredCompactColumn = .content
      }
      .toggleButtonStyle
   }
}
// - Fixme: ⚠️️ add IconButtonStyle which should be a button style
// use apple system icon: left_arrow
// have rounded corners 4px
// have a background color that is darkGray / lightGray
// have a fill color for icon that is white / black .opacity(0.6)
// icon should be 16px w/h
// icon should have 4px padding all arround
// the icon should be settable from extension iconButtonStyle(iconName: "")
// make one for left arrow, right arrow, full_screen, back_chevron_icon,
// make it animate transperancy on showing / hiding
