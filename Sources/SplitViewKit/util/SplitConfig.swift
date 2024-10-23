import SwiftUI
/**
 * - Description: Manages configuration settings for the `NavigationSplitView` in `SplitViewKit`, including visibility and preferred column in compact mode.
 * - Note: We can detect 70% mode with that custom 70% code and geometryreader etc
 * - Note: We can detect single column mode by checking `sizeclass == .compact`
 */
public class SplitConfig: ObservableObject {
   /**
    * I think all, will look strange for landscape 70% split-view, automatic should go to .double at that size, so use auto?
    * - Note: Setting this to .double.. will also work fine. 
    */
   @Published public var columnVisibility: NavigationSplitViewVisibility
   /**
    * Prfered column when split-view is only 1 column
    * - Abstract: Sets the displayed column in compact mode.
    * - Description: When you have a `NavigationSplitView` running in a compact size class
    *                iPhones, Apple Watch, and any iPad when your app has been resized down
    *                to a small size – SwiftUI attempts to guess which of your split view
    *                columns is the best one to show. This guess is often correct, but you can
    *                control it by setting a 👉preferred-compact-column👈 for your Split-View.
    * - Note: Can be `.sidebar`, `.detail` or `.content` (aka main-column)
    * - Fixme: ⚠️️ Consider renaming to focusedColumnn? or not?
    */
   @Published public var preferredCompactColumn: NavigationSplitViewColumn
   /**
    * - Description: This property determines the visibility of columns in the `NavigationSplitView` based on the current device and orientation. It adjusts between all columns visible, double column, or detail only views.
    * - Note: Required init for publc classes
    * - Parameters:
    *   - columnVisibility: - Fixme: ⚠️️ add doc
    *   - preferredCompactColumn: - Fixme: ⚠️️ add doc
    */
   public init(columnVisibility: NavigationSplitViewVisibility = .all, preferredCompactColumn: NavigationSplitViewColumn = .content) {
      self.columnVisibility = columnVisibility
      self.preferredCompactColumn = preferredCompactColumn
   }
}
/**
 * Getter
 */
extension SplitConfig { 
   /**
    * - Description: Determines if the sidebar is currently visible based on the column visibility and size class.
    * - Fixme: ⚠️️ Rename to to something else?
    * - Fixme: ⚠️️ His is also true if 1 col + preferredCompactColumn == .sidebar I think
    * - Parameter sizeClass: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   public func isShowingSideBar(sizeClass: UserInterfaceSizeClass?) -> Bool {
      // Swift.print("SplitConfig - isShowingSideBar sizeClass:  \(String(describing: sizeClass))")
      let isShowingSideBar = (columnVisibility == .all && sizeClass == .regular) || (preferredCompactColumn == .sidebar && sizeClass == .compact)
      // Swift.print("SplitConfig - isShowingSideBar:  \(isShowingSideBar)")
      return isShowingSideBar
   }
   /**
    * - Description: A computed property that checks if the detail view is in full screen mode.
    *                It returns true if the column visibility is set to .detailOnly, indicating that
    *                only the detail view is visible and hence, is in full screen mode.
    */
   public var isDetailFullScreen: Bool {
      columnVisibility == .detailOnly
   }
   /**
    * Convenient rebinder
    * - Fixme: ⚠️️ Add description
    */
   internal var reBind: Binding<SplitConfig> {
      .init(get: { self }, set: { _ in })
   }
}
