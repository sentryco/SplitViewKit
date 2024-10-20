import SwiftUI
import SplitViewKit

extension ExampleView {
   /**
    * When we change index, the selecteItem is set, when this state selectedMainItem changes, view are regenerated, Attach the on change code (I think this auto shows the last selected item etc, elaborate?)
    */
   func handleSideBarChange(_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) {
      guard let sizeClass = sizeClass.wrappedValue else { print("⚠️️ error"); return }
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
