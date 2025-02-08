import SwiftUI
/**
 * - Description: Displays a list of items, allowing the user to select an item.
 * - Fixme: ⚠️️ Add preview, use copilot
 * fixme: why do we have selectedMainIndex and selectedItem?
 */
internal struct MainList: View {
   /**
    * - Description: Binds the selected index of the main list to the selectedMainIndex property.
    */
   @Binding internal var selectedMainIndex: Int
   /**
    * - Description: Binds the selected item of the main list to the selectedItem property.
    */
   @Binding internal var selectedItem: DataModel?
   /**
    * - Description: The list of items to display in the main list.
    */
   internal var items: DataModels
}
// Fixme: Move to its own file
#Preview {
   MainList(
      selectedMainIndex: .constant(0),
      selectedItem: .constant(nil),
      items: [DataModel(text: "Example Item")]
   )
}