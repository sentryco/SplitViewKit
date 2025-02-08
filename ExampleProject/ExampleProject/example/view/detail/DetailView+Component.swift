import SwiftUI
import SplitViewKit
/**
 * Components
 */
extension DetailView {
   /**
    * Provides a vertical stack layout for the detail view components.
    * - Description: Constructs the primary vertical stack layout used in the
    *                DetailView, organizing the header, list, and spacing.
    */
   internal var vStack: some View {
      VStack(spacing: .zero) {
         detailHeader(title: title)
         list
         Spacer() // Pins the content to the top (needed for vstack, not for list)
      }
      .contentMargins(.vertical, .zero) // ⚠️️ Seems like this is key for the detail list only, or else we get a big gap at the top
      .contentMargins(.horizontal, .zero) // Sets horizontal content margins to zero, ensuring the content extends fully from left to right without any padding.
      .background(isTest ? .orange.opacity(0.3) : .whiteOrBlack.opacity(0.06)) // ⚠️️ Debug - has effect only if we add .scrollContentBackground(.hidden)
   }
   /**
    * Detail header
    * - Description: Creates a header for the detail view, which includes the
    *                title and manages layout responsiveness based on the current
    *                size class and split configuration.
    * - Parameters:
    *   - title: The text to be displayed in the header of the detail view.
    */
   internal func detailHeader(title: String) -> some View {
      DetailHeader(
         title: title, // The title for the DetailHeader, representing the main text displayed at the top.
         splitConfig: splitConfig, // Configuration object that manages the split view behavior, adapting to different screen sizes and orientations.
         sizeClass: sizeClass // Represents the current size class of the user interface, used to adjust UI elements accordingly.
      )
      .background(isTest ? .indigo.opacity(0.5) : .whiteOrBlack.opacity(0.06))
   }
   /**
    * List
    * - Description: Displays the list of detail data in the detail view.
    */
   internal var list: some View {
      DetailList(detailData: detailData)
   }
}
