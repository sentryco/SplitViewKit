import SwiftUI
/**
 * - Description: Extension to add descriptive functionality to NavigationSplitViewVisibility.
 */
extension NavigationSplitViewVisibility {
   /**
    * - Description: This computed property provides a textual description of the NavigationSplitViewVisibility. It is useful for understanding the visibility state of different columns in a NavigationSplitView.
    * - Note: `.detailOnly` let detail fill up all spae(doesn't work on macos, just shows same as .all) - Fixme: ⚠️️ is this correct?
    * - Note: `.doubleColumn` shows main and detail  (no sidebar)
    * - Note: `.all` (3 panes) sideBar, main, detail
    * - Note: `.automatic` the system decides the best view based on the device and its orientation. Remember, the columnVisibility uses a binding because it updates automatically when the user interacts with your app.
    * - Note: We keep this in the example project to keep the kit code as small as possible
    */
   internal var description: String {
      switch self {
         // - Fixme: ⚠️️ add doc for this case
      case NavigationSplitViewVisibility.all: "all 3 columns"
         // - `.doubleColumn` – Show the content column and detail area of a three-column navigation split view.
      case NavigationSplitViewVisibility.doubleColumn: "double-column"
         // - `.detailOnly` – Hide the leading two columns of a three-column split view. In other words, only the detail area shows.
      case NavigationSplitViewVisibility.detailOnly: "detail-only"
         // - `.automatic` – Use the default leading column visibility for the current device. This is the default setting.
      case NavigationSplitViewVisibility.automatic: "automatic"
      default: "Not supported"
      }
   }
}
