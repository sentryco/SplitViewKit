import SwiftUI
/**
 * Extension
 */
extension SideBarList {
   /**
    * List
    * - Fixme: ⚠️️ move into own file etc?
    */
   var body: some View {
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
    * - Fixme: ⚠️️ - Fixme: ⚠️️ get model from init param instead?
    */
   var sideBarListContent: some View {
      // - Fixme: ⚠️️ use enumerated on the bellow instead
      ForEach(0..<DataModel.dataModel.count, id: \.self) { (_ i: Int) in
         Button(DataModel.dataModel[i].title) {
            // Triggers change in main-view content to switch
            self.$selectedSideBarIndex.wrappedValue = i
         }
         .listButtonStyle(isSelected: $selectedSideBarIndex.wrappedValue == i)
      }
      #if os(iOS)
      .listRowSpacing(.zero) // ⚠️️ Only available for iOS
      #endif
      .listRowInsets(.init())
   }
}
