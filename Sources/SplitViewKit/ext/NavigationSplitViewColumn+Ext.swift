import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ move to own file etc
 * - Note: this is how you navigate to different columns: https://useyourloaf.com/blog/swiftui-splitview-compact-column-control/
 */
extension NavigationSplitViewColumn {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var description: String {
      switch self {
      case NavigationSplitViewColumn.sidebar: "sidebar"
      case NavigationSplitViewColumn.content: "main"
      case NavigationSplitViewColumn.detail: "detail"
      default: "Not supported"
      }
   }
}
