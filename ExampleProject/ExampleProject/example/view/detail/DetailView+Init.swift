import SwiftUI
import SplitViewKit
/**
 * DetailView init
 */
extension DetailView {
   /**
    * - Description: Initializes a `DetailView` instance using the provided
    *                sidebar and main item indices, along with configuration for
    *                split view and size class.
    * - Fixme: ⚠️️️ Rework this to regular init 👈 check with copilot etc
    * - Parameters:
    *   - sideBarItemIndex: The index of the selected item in the sidebar, used to determine which main item list to display.
    *   - mainItemIndex: The index of the selected item in the main list, used to fetch the detailed data for the detail view.
    * - Returns: A `DetailView` configured with the data corresponding to the selected main item.
    */
   internal static func initiate(sideBarData: SideBarData, sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>/*UserInterfaceSizeClass?*/) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ Use safeArray here, and return optional, add fileprivate helper?
      let mainModel: MainModel = sideBarData[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: mainModel.title,
         detailData: mainModel.content,
         splitConfig: splitConfig,
         sizeClass: sizeClass
      )
      return detailView
   }
}
