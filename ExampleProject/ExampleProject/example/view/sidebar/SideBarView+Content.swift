import SwiftUI
import HybridColor
/**
 * content
 * - Description: The main content of the sidebar, which includes the header and the list of items.
 */
extension SideBarView {
   /**
    * Body
    */
   public var body: some View {
      vStack
      #if os(iOS) // For iPhone and iPad
      .toolbar(removing: .sidebarToggle) // This is available from iOS 17 I think
      .navigationBarHidden(true) // Removes the top default nav-bar
      #elseif os(macOS) // For macOS apps
      .toolbar(removing: .sidebarToggle) // Hides the sidebar toggle for macos
      .scrollIndicators(.hidden) // Important, or else scrollbar is shown when resizing etc
      #endif
   }
}
/**
 * Components
 */
extension SideBarView {
   /**
    * vstack
    */
   var vStack: some View {
      VStack(spacing: 0) {
         sideBarHeader
         list
      }
      .background(isTest ? .teal.opacity(0.3) : .whiteOrBlack.opacity(0.1)) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
   }
   /**
    * Header
    * - Description: The header of the sidebar, which includes the title and a size class indicator.
    * - Note: headers are pushed down slightly because of native safe-frame etc
    * - Fixme: ⚠️️ Add more info about safe-area and how it affects header content etc
    */
   var sideBarHeader: some View {
      SideBarHeader(
         title: "Sidebar",
         sizeClass: $sizeClass,
         splitConfig: splitConfig
      )
      .background(isTest ? .green.opacity(0.5) : .whiteOrBlack.opacity(0.1)) // ⚠️️ debug
   }
   /**
    * - Description: The list of items in the sidebar.
    */
   var list: some View {
      SideBarList(
         selectedSideBarIndex: $selectedSideBarIndex // - Fixme: ⚠️️ doc this
      )
   }
}
