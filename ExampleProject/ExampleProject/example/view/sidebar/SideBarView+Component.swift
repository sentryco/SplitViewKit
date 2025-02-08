import SwiftUI
import HybridColor
/**
 * Components
 */
extension SideBarView {
   /**
    * vstack
    * - Description: The main vertical stack that contains the sidebar header and the list of items.
    */
   internal var vStack: some View {
      VStack(spacing: .zero) {
         sideBarHeader // Displays the sidebar header with title, size class, and split configuration.
         list // Displays the list of sidebar items, allowing selection handling.
      }
      #if os(iOS)
      .background(isTest ? .teal.opacity(0.3) : .whiteOrBlack.opacity(0.1)) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
      #else
      .background(isTest ? .teal.opacity(0.3) : .blackOrWhite.opacity(0.1)) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
      #endif
   }
   /**
    * Header
    * - Description: The header of the sidebar, which includes the title and a size class indicator.
    * - Note: Headers are pushed down slightly because of native safe-frame etc
    * - Fixme: ⚠️️ Add more info about safe-area and how it affects header content etc, use copilot?
    */
   fileprivate var sideBarHeader: some View {
      SideBarHeader(
         title: "Sidebar", // The title displayed at the top of the sidebar.
         sizeClass: $sizeClass, // The size class that adjusts the sidebar's layout based on the available space.
         splitConfig: splitConfig // Configuration details for the split view behavior in the sidebar.
      )
      #if os(iOS)
      .background(isTest ? .green.opacity(0.5) : .whiteOrBlack.opacity(0.1)) // ⚠️️ debug
      #else
      .background(isTest ? .green.opacity(0.5) : .whiteOrBlack.opacity(0.05)) // ⚠️️ debug
      #endif
   }
   /**
    * - Description: The list of items in the sidebar.
    */
   fileprivate var list: some View {
      SideBarList(
         selectedSideBarIndex: $selectedSideBarIndex // Binds the selected index to the sidebar list, allowing for state management of the selected item.
      )
   }
}
