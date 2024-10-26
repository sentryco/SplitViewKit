import SwiftUI
/**
 * Content
 */
extension MainList {
   /**
    * listContainer
    * - Description: Container for the list of items in the MainList view, using a VStack to align items vertically.
    * - Fixme: ⚠️️ We should probably use list?, because its more suitable for the case
    */
   var body: some View {
      VStack(spacing: .zero) {
         rowViews
      }
      .padding(.vertical, 12) // Add top and bottom padding for the list etc
      .padding(.horizontal) // Adds horizontal padding
   }
   /**
    * List content
    * - Description: Generates a view for each item in the list, applying specific styles and behaviors.
    */
   @ViewBuilder var rowViews: some View {
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
    *                updating the selected index and item upon interaction.
    * - Note: Alternative name: rowButton
    * - Parameter i: The index of the item in the list.
    * - Returns: A view representing a button for the item at the specified index.
    */
   func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         selectedMainIndex = i // - Fixme: ⚠️️ this shouldn't be needed, selectItem should be indefiable etc?
         selectedItem = items[i] // triggers detail content change
      }
      .listButtonStyle(
         isSelected: $selectedMainIndex.wrappedValue == i
      )
   }
}
