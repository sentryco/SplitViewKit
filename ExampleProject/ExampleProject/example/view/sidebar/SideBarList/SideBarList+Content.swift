import SwiftUI
/**
 * Extension
 */
extension SideBarList {
   /**
    * List
    * - Description: The list of items in the sidebar.
    */
   internal var body: some View {
      List {
         sideBarListContent
            #if os(iOS) // - Fixme: ⚠️️ remove this? added twice etc?
            .listRowSpacing(.zero) // ⚠️️ Only available for iOS
            #endif
            .listRowInsets(.init()) // Sets the insets for each row in the list to zero, effectively removing any default padding or margins.
      }
      .scrollContentBackground(.hidden) // remove list bg
      .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
      #if os(iOS) // these seem to have no effect for macOS
      .contentMargins(.vertical, .zero) // ⚠️️ key to removeing top margin, we cant use .contentMargins(.horizontal, .zero) as it will remove the rounded backgrounds for the section
      .contentMargins(.horizontal, .zero) // Sets the horizontal content margins to zero, removing any default horizontal spacing.
      #endif
      .padding(.vertical, 12) // Adds vertical padding of 12 points to the list, enhancing visual separation between elements.
   }
}
