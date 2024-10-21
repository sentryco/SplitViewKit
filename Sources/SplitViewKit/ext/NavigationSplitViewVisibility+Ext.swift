import SwiftUI
/**
 * - Description: Extension to add descriptive functionality to NavigationSplitViewVisibility.
 * - Fixme: ⚠️️ move to own file etc
 */
extension NavigationSplitViewVisibility {
   /**
    * - Description: This computed property provides a textual description of the NavigationSplitViewVisibility. It is useful for understanding the visibility state of different columns in a NavigationSplitView.
    * - Note: `.detailOnly` let detail fill up all spae(doesn't work on macos, just shows same as .all) - Fixme: ⚠️️ is this correct?
    * - Note: `.doubleColumn` shows main and detail  (no sidebar)
    * - Note: `.all` (3 panes) sideBar, main, detail
    * - Note: `.automatic` the system decides the best view based on the device and its orientation. Remember, the columnVisibility uses a binding because it updates automatically when the user interacts with your app.
    */
   var description: String {
      switch self {
      case NavigationSplitViewVisibility.all: "all 3 columns"
      case NavigationSplitViewVisibility.doubleColumn: "double-column"
      case NavigationSplitViewVisibility.detailOnly: "detail-only"
      case NavigationSplitViewVisibility.automatic: "automatic"
      default: "Not supported"
      }
   }
}
