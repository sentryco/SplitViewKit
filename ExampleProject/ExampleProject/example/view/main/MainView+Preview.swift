import SwiftUI
import SplitViewKit

#Preview {
   let items: DataModels = DataModel.dataModel.getMainModels(
      sideBarItemIndex: 0,
      splitConfig: SplitConfig() // ⚠️️ this will probably crash, maybe store as a state? in a debug container etc?
      // isDetailFullScreen: .constant(false)
   )
   return MainView(
      title: DataModel.dataModel[0].title,
      selectedMainIndex: .constant(0), // - Fixme: ⚠️️ make this state
      items: items,
      selectedItem: .constant(nil) // - Fixme: ⚠️️ make this state
      /* isSidebarShown: .constant(false), */
      // preferredCompactColumn: .constant(.content)
   )
}
