import SwiftUI
/**
 * Content
 */
extension MainList {
   /**
    * listContainer
    * - Fixme: ⚠️️ add doc
    */
   var body: some View {
      VStack(spacing: 0) {
         rowViews
      }
      .padding(.vertical, 12) // Add top and bottom padding for the list etc
   }
   /**
    * List content
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ move this into MainContent swift file for simplicity?
    */
   @ViewBuilder var rowViews: some View {
      // - Fixme: ⚠️️ put this into a stack or list?
      ForEach(Array(items.enumerated()), id: \.offset) {  i, _ in
         rowItem(i: i)
      }
      #if os(iOS)
      .listRowSpacing(.zero) // ⚠️️ only available for iOS
      #endif
      .listRowInsets(.init())
   }
   /**
    * rowItem
    * - Fixme: ⚠️️ Rename to rowButton? or keep?
    * - Fixme: ⚠️️ Add doc
    */
   func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         $selectedMainIndex.wrappedValue = i
         $selectedItem.wrappedValue = items[i] // set navigation on action
      }
      .listButtonStyle(isSelected: $selectedMainIndex.wrappedValue == i)
   }
}
