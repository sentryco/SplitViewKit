import SwiftUI
/**
 * Components
 */
extension MainList {
   /**
    * List content
    * - Description: Generates a view for each item in the list, applying specific styles and behaviors.
    */
   @ViewBuilder internal var rowViews: some View {
      ForEach(Array(items.enumerated()), id: \.offset) {  i, _ in
         rowItem(i: i)
      }
      #if os(iOS)
      .listRowSpacing(.zero) // ⚠️️ Only available for iOS
      #endif
      .listRowInsets(.init())
   }
   /**
    * rowItem
    * - Description: Generates a button for each item in the list,
    *                updating the selected index and item upon interaction
    * - Note: Alternative name: rowButton
    * - Parameter i: The index of the item in the list
    * - Returns: A view representing a button for the item at the specified index
    */
   internal func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         selectedMainIndex = i // - Fixme: ⚠️️ This shouldn't be needed, selectItem should be indefiable etc?
         selectedItem = items[i] // Triggers detail content change
      }
      .listButtonStyle(
         isSelected: $selectedMainIndex.wrappedValue == i
      )
   }
}
