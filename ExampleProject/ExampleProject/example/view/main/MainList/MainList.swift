import SwiftUI
/**
 * - Description: Displays a list of items, allowing the user to select an item.
 * - Fixme: ⚠️️ add preview
 */
struct MainList: View {
   /**
    * - Description: Binds the selected index of the main list to the selectedMainIndex property.
    */
   @Binding var selectedMainIndex: Int
   /**
    * - Description: Binds the selected item of the main list to the selectedItem property.
    */
   @Binding var selectedItem: DataModel?
   /**
    * - Description: The list of items to display in the main list.
    */
   var items: DataModels
}
