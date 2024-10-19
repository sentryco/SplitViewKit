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
      // - Fixme: ⚠️️ we are using vstack not list here so remove the bellow? actually we should probably use list?, because its more suitable for the case
      // .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
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
    * - Parameter i: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         $selectedMainIndex.wrappedValue = i // - Fixme: ⚠️️ this shouldnt be needed, selectItem should be indefiable etc?
         $selectedItem.wrappedValue = items[i] // triggers detail content change
      }
      .listButtonStyle(
         isSelected: $selectedMainIndex.wrappedValue == i
      )
   }
}
