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
      VStack(spacing: 0) {
         sideBarHeader
         list
      }
      .contentMargins(.horizontal, .zero)
      // - Fixme: ⚠️️⚠️️⚠️️ move this to list scope?
      .scrollContentBackground(.hidden) // ⚠️️ debug
      // - Fixme: ⚠️️ move this to list scope?
      .background(isTest ? .teal.opacity(0.3) : .whiteOrBlack.opacity(0.1)) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
      // - Fixme: ⚠️️⚠️️⚠️️ move this to list scope? 👈
      .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
      .contentMargins(.vertical, .zero) // ⚠️️ key to removeing top margin, we cant use .contentMargins(.horizontal, .zero) as it will remove the rounded backgrounds for the section
   }
}
/**
 * Components
 */
extension SideBarView {
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
