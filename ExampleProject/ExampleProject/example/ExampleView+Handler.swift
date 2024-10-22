import SwiftUI
import SplitViewKit

extension ExampleView {
   /**
    * Handles changes in the sidebar selection.
    * - Description: This function updates the `selectedMainItem` based on the current sidebar index. When `selectedMainItem` is updated, the views are regenerated to reflect the new selection. This mechanism ensures that the view automatically displays the last selected item when the sidebar changes.
    * - Note: This method is not static, because we interact with instance var selectedMainItem
    * - Fixme: ⚠️️ possibly merge switch and guard. ask copilot
    * - Parameters:
    *   - splitConfig: The configuration for the split view, controlling the layout and behavior.
    *   - sizeClass: The current size class of the user interface, which may affect layout decisions.
    */
   func handleSideBarChange(_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) {
      guard let sizeClass: UserInterfaceSizeClass = sizeClass.wrappedValue else { print("⚠️️ error"); return }
      switch sizeClass {
      case .regular: // Only auto select mainitem if all columns are visible etc
         $selectedMainItem.wrappedValue = DataModel.dataModel.getMainModel( // Only do this, if not in compact, because it will open detail mode, and skip main if in compact mode etc
            sideBarItemIndex: selectedSideBarIndex,
            mainItemIndex: selectedMainIndex,
            splitConfig: splitConfig // navsplitconfig binding
         ) // Set selected-item based on selected-indecies
      case .compact: // in compact-mode
         splitConfig.preferredCompactColumn = .content // Move to content mode (⚠️️ this is an API bug fix for apples navigationsplitview)
      default:
         fatalError("⚠️️ not supported")
      }
   }
}
