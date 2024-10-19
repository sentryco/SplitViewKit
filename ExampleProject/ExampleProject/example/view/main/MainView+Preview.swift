import SwiftUI
import SplitViewKit

#Preview {
   let items = DataModel.dataModel.getMainModels(
      sideBarItemIndex: 0,
      splitConfig: SplitConfig() // ⚠️️ this will probably crash, maybe store as a state? in a debug container etc?
//      isDetailFullScreen: .constant(false)
   )
   return MainView(
      items: items, 
      selectedItem: .constant(nil)//,
      /*isSidebarShown: .constant(false), */
//      preferredCompactColumn: .constant(.content)
   )
}
