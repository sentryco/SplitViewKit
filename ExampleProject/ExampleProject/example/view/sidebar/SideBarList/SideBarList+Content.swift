import SwiftUI
/**
 * Extension
 */
extension SideBarList {
   /**
    * List
    * - Description: The list of items in the sidebar.
    */
   var body: some View {
      List {
         sideBarListContent
            #if os(iOS) // - Fixme: ⚠️️ remove this? added twice etc?
            .listRowSpacing(.zero) // ⚠️️ Only available for iOS
            #endif
            .listRowInsets(.init()) // Sets the insets for each row in the list to zero, effectively removing any default padding or margins.
      }
      .scrollContentBackground(.hidden) // remove list bg
      .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
      .contentMargins(.vertical, .zero) // ⚠️️ key to removeing top margin, we cant use .contentMargins(.horizontal, .zero) as it will remove the rounded backgrounds for the section
      .contentMargins(.horizontal, .zero) // Sets the horizontal content margins to zero, removing any default horizontal spacing.
      .padding(.vertical, 12) // Adds vertical padding of 12 points to the list, enhancing visual separation between elements.
   }
   /**
    * List content
    * - Description: The content of the list of items in the sidebar.
    * - Fixme: ⚠️️ Get model from init param instead?
    * - Fixme: ⚠️️ Use enumerated on the ForEach instead?
    */
   var sideBarListContent: some View {
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
      .listRowInsets(.init()) // Sets the insets for each row in the list to zero, effectively removing any default padding or margins around the list items.
   }
}
