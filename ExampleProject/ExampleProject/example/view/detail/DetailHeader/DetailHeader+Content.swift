import SwiftUI
import HybridColor
import SplitViewKit
/**
 * Content
 * - Description: This section of the code defines the content view for the DetailHeader component in the SwiftUI view hierarchy.
 */
extension DetailHeader {
   /**
    * Body
    */
   var body: some View {
      VStack {
         HStack { // hstack
            backButton // btn to left
            Spacer()
            fullScreenToggleButton // btn to right
         }
         HStack { // hstack with title to left
            titleText
            Spacer()
         }
      }
      .padding(.horizontal) // Adds left and right padding
      .padding(.vertical)
   }
}
/**
 * Components
 */
extension DetailHeader {
   /**
    * - Description: Displays the title of the detail view.
    */
   var titleText: some View {
      Text(title) 
         .titleTextStyle
         .padding(.vertical, 6)
   }
   /**
    * - Description: Toggles the detail view between full-screen and regular mode.
    * - Note: detailfullscreen btn is here to show how we can go fullscreen with detail
    * - Note: It's a niche usecase. Not needed for most uses.
    * - Fixme: ⚠️️ Remove default animation for this button, it looks buggy. Use copilot etc
    * - Fixme: ⚠️️ Find minimize icon
    */
   var fullScreenToggleButton: some View {
      let iconName: String = splitConfig.isDetailFullScreen ? "arrow.left.and.right" : "arrow.left.and.right"
      return Button(action: { // Hide / Show fullscreen
         // This line toggles the visibility of columns based on whether the detail view is currently in full-screen mode.
         // If in full-screen mode, it shows all columns; otherwise, it shows only the detail column.
         splitConfig.columnVisibility = splitConfig.isDetailFullScreen ? .all : .detailOnly
      }) {}
         .iconButtonStyle(iconName: iconName)
         .opacity(sizeClass == .regular ? 1.0 : 0.0) // We use opacity to not change the topbar height to be more narrow etc
         // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
         .animation(.easeInOut(duration: 0.3), value: sizeClass == .regular)
   }
   /**
    * Back button
    * - Description: Provides a custom back button for the detail view, which allows users to navigate back to the previous view. This button is visible only in compact mode to enhance usability on smaller screens.
    * - Note: Custom back-btn for detail-view, hide default back-btn etc... custom back-btn for detail when in compact mode
    */
   var backButton: some View {
      Button(action: {
         dismiss()
      }) {}
         .iconButtonStyle(iconName: "chevron.left")
      // Only show if in compact mode
      .opacity(sizeClass == .compact ? 1.0 : 0.0) // We use opacity to not change the topbar height to be more narrow etc
      .animation(.easeInOut(duration: 0.3), value: sizeClass == .compact)
   }
}
