import SwiftUI
import SplitViewKit
/**
 * Preview for the main view
 */
#Preview {
   let items: DataModels = DataModel.dataModel.getMainModels(
      sideBarItemIndex: 0,
      splitConfig: SplitConfig() // ⚠️️ This will probably crash, maybe store as a state? in a debug container etc?
   )
   return MainView(
      title: DataModel.dataModel[0].title,
      selectedMainIndex: .constant(0), // - Fixme: ⚠️️ Make this state?
      items: items,
      selectedItem: .constant(nil), // - Fixme: ⚠️️ Make this state?
      splitConfig: /*.constant*/(.init()),
      sizeClass: /**/.constant(.regular)
   )
}
