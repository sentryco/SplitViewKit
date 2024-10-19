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
         // .frame(maxWidth: .infinity)
         .padding(.vertical, 6)
         .foregroundColor(Color.whiteOrBlack.opacity(0.8))
         .font(.system(size: 32, weight: .bold))
   }
   /**
    * - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder var toggleButton: some View {
      // We should not show this, if in compact mode
      // Show this only if toggle is true
      let _ = {
         Swift.print("SideBarHeader.sizeClass: \(sizeClass)")
      }()
      // ⚠️️ always show this
      Button("Hide sidebar") {
         print("toggle") // Action for the button
         //
         if sizeClass == .regular { // if 3 column.
            splitConfig.columnVisibility = .doubleColumn // go to double column
         } // else compact. switch to main
         splitConfig.preferredCompactColumn = .content
      }
      .toggleButtonStyle
   }
}
