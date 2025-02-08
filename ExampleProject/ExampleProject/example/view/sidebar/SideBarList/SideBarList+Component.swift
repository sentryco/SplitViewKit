import SwiftUI
/**
 * Component
 */
extension SideBarList {
   /**
    * List content
    * - Description: The content of the list of items in the sidebar.
    * - Fixme: ⚠️️ Get model from init param instead? yes possibly, and make this static instead? or figure out how to use a model view approache?
    * - Fixme: ⚠️️ Use enumerated on the ForEach instead?
    */
   internal var sideBarListContent: some View {
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
