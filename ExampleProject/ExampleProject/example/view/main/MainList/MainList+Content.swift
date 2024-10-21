import SwiftUI
/**
 * Content
 */
extension MainList {
   /**
    * listContainer
    * - Description: Container for the list of items in the MainList view, using a VStack to align items vertically.
    * - Fixme: ⚠️️ we are using vstack not list here so remove the bellow? actually we should probably use list?, because its more suitable for the case
    */
   var body: some View {
      VStack(spacing: 0) {
         rowViews
      }
      .padding(.vertical, 12) // Add top and bottom padding for the list etc
   }
   /**
    * List content
    * - Description: Generates a view for each item in the list, applying specific styles and behaviors.
    * - Fixme: ⚠️️ Move this into MainContent swift file for simplicity?
    * - Fixme: ⚠️️ Put this into a stack or list?
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
    * - Description: Creates a button for each item in the list, which updates the selected index and item when clicked.
    * - Note: Alternative name: rowButton
    * - Parameter i: The index of the item in the list.
    * - Returns: A view representing a button for the item at the specified index.
    */
   func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         selectedMainIndex = i // - Fixme: ⚠️️ this shouldnt be needed, selectItem should be indefiable etc?
         selectedItem = items[i] // triggers detail content change
      }
      .listButtonStyle(
         isSelected: $selectedMainIndex.wrappedValue == i
      )
   }
}
