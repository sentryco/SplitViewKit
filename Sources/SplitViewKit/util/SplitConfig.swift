import SwiftUI
// - Fixme: ⚠️️ move into own file?
// - we can detect single column mode by checking sizeclass == .compact
// - we can detect 70% mode with that custom 70% code and geometryreader etc
public class SplitConfig: ObservableObject {
   /**
    * I think all, will look strange for landscape 70% split-view, automatic should go to .double at that size, so use auto?
    * - Note: Setting this to .double.. will also work fine. 
    */
   @Published public var columnVisibility: NavigationSplitViewVisibility = .all
   /**
    * Prfered column when split-view is only 1 column
    * - Note: Can be `.sidebar`, `.detail` or `.content` (aka main-column)
    * - Description: When you have a `NavigationSplitView` running in a compact size class
    *                iPhones, Apple Watch, and any iPad when your app has been resized down
    *                to a small size – SwiftUI attempts to guess which of your split view
    *                columns is the best one to show. This guess is often correct, but you can
    *                control it by setting a 👉preferred-compact-column👈 for your Split-View.
    * - Fixme: ⚠️️ Figure out how this behaves later
    * - Fixme: ⚠️️ Maybe set this in init? or? I think it is, so remove the value here
    * - Fixme: ⚠️️ Add abstract description
    * - Fixme: ⚠️️ Consider renaming to focusedColumnn? or not?
    */
   @Published public var preferredCompactColumn: NavigationSplitViewColumn = .content
}
/**
 * Getter
 */
extension SplitConfig{
   // - Fixme: ⚠️️ add doc
   // - Fixme: ⚠️️ his is also true if 1 col + preferredCompactColumn == .sidebar I think
   // - Fixme: ⚠️️ rename to to something else?
   public func isShowingSideBar(sizeClass: UserInterfaceSizeClass?) -> Bool {
      Swift.print("SplitConfig - isShowingSideBar sizeClass:  \(String(describing: sizeClass))")
      let isShowingSideBar = (columnVisibility == .all && sizeClass == .regular) || (preferredCompactColumn == .sidebar && sizeClass == .compact)
      Swift.print("SplitConfig - isShowingSideBar:  \(isShowingSideBar)")
      return isShowingSideBar
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   public var isDetailFullScreen: Bool {
      columnVisibility == .detailOnly
   }
}
