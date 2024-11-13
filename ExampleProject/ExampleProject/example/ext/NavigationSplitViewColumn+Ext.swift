import SwiftUI
/**
 * - Description: This extension provides additional functionality to the
 *                NavigationSplitViewColumn enumeration. It adds a computed
 *                property that returns a string representation of the column,
 *                which can be useful for debugging and logging purposes.
 * - Note: this is how you navigate to different columns: https://useyourloaf.com/blog/swiftui-splitview-compact-column-control/
 */
extension NavigationSplitViewColumn {
   /**
    * - Description: This computed property provides a textual description
    *                of the NavigationSplitViewColumn. It is useful for
    *                debugging and logging purposes.
    * - Returns: A string representing the column. It returns "sidebar" for the sidebar column, "main" for the content column, and "detail" for the detail column. If the column is not supported, it returns "Not supported".
    * - Note: We keep this in the example project to keep the kit code as small as possible
    */
   internal var description: String {
      switch self {
      case NavigationSplitViewColumn.sidebar: "sidebar"
      case NavigationSplitViewColumn.content: "main"
      case NavigationSplitViewColumn.detail: "detail"
      default: "Not supported"
      }
   }
}
