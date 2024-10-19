#if DEBUG
import SwiftUI
import HybridColor
/**
 * content
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
      // - Fixme: ⚠️️ move this to list scope?
      .scrollContentBackground(.hidden) // ⚠️️ debug
      // - Fixme: ⚠️️ move this to list scope?
      .background(isTest ? .teal.opacity(0.3) : .clear) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
      // - Fixme: ⚠️️ move this to list scope?
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
    * - Note: headers are pushed down slightly because of native safe-frame etc
    * - Fixme: ⚠️️ add more info about safe-area and how it affects header content etc
    */
   var sideBarHeader: some View {
      SideBarHeader(
         title: "Sidebar"
      )
         .background(isTest ? .green.opacity(0.5) : .clear) // ⚠️️ debug
   }
   /**
    * List
    * - Fixme: ⚠️️ move into own file etc?
    */
   var list: some View {
      List {
         sideBarListContent
            #if os(iOS) // - Fixme: ⚠️️ remove this? added twice etc?
            .listRowSpacing(.zero) // ⚠️️ Only available for iOS
            #endif
            .listRowInsets(.init())
      }
      .padding(.vertical, 12)
   }
   /**
    * List content
    * - Fixme: ⚠️️ Move into own struct / swift file?
    */
   var sideBarListContent: some View {
      // - Fixme: ⚠️️ use enumerated on the bellow instead
      ForEach(0..<DataModel.dataModel.count, id: \.self) { (_ i: Int) in
         Button(DataModel.dataModel[i].title) {
            // triggers change in main-view content to switch
            self.$selectedSideBarIndex.wrappedValue = i
         }
         .sideBarButtonStyle(
            bgColor: .clear,
            textColor: Color.whiteOrBlack.opacity(($selectedSideBarIndex.wrappedValue == i) ? 0.8 : 0.5) // set selected color
         )
      }
      #if os(iOS)
      .listRowSpacing(.zero) // ⚠️️ Only available for iOS
      #endif
      .listRowInsets(.init())
   }
}
#endif
