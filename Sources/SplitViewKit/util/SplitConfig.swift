import SwiftUI
/**
 * - Description: Manages configuration settings for the `NavigationSplitView`
 *                in `SplitViewKit`, including visibility and preferred column
 *                in compact mode.
 * - Note: We can detect 70% mode with that custom 70% code and geometryreader etc
 * - Note: We can detect single column mode by checking `sizeclass == .compact`
 * - Fixme: ⚠️️ Consider removing this class. We can pass two params. Thats fine. Less helper code that way
 */
public class SplitConfig: ObservableObject {
   /**
    * I think all, will look strange for landscape 70% split-view, automatic should go to .double at that size, so use auto?
    * - Note: Setting this to .double.. will also work fine. But is not the use case for SplitViewWrapper as of now
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
    */
   @Published public var preferredCompactColumn: NavigationSplitViewColumn
   /**
    * - Description: This property determines the visibility of columns in the
    *                `NavigationSplitView` based on the current device and
    *                orientation. It adjusts between all columns visible, double
    *                column, or detail only views.
    * - Note: Required init for publc classes
    * - Parameters:
    *   - columnVisibility: Specifies the visibility of columns in the NavigationSplitView. It can be set to .all, .doubleColumn, or .singleColumn to control the number of visible columns based on the device's orientation and size.
    *   - preferredCompactColumn: Determines the primary visible column in compact mode. Options include .sidebar, .content, or .detail, allowing explicit control over which column is displayed in a compact environment.
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
    * - Description: Determines if the sidebar is currently visible based on
    *                the column visibility and size class.
    * - Fixme: ⚠️️ Document in which scenario this is used etc
    * - Fixme: ⚠️️ This is also true if 1 col + preferredCompactColumn == .sidebar I think
    * - Parameter sizeClass: The current horizontal size class of the user interface, which determines the layout and visibility of the sidebar.
    * - Returns: A Boolean value indicating whether the sidebar is visible based on the current `columnVisibility` and `sizeClass`.
    */
   public func isShowingSideBar(sizeClass: UserInterfaceSizeClass?) -> Bool {
      let isShowingSideBar = (columnVisibility == .all && sizeClass == .regular) || (preferredCompactColumn == .sidebar && sizeClass == .compact)
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
}
