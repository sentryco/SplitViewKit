import SwiftUI
/**
 * Getter
 */
extension SplitConfig {
   /**
    * - Abstract: Determines the visibility of the sidebar in the `NavigationSplitView` based on the current column visibility and user interface size class.
    * - Description: Determines if the sidebar is currently visible based on
    *                the column visibility and size class.
    * - Note: `UserInterfaceSizeClass` does not work for macOS
    * - Note: On mac `preferredCompactColumn` isn't relevant
    * - Fixme: ⚠️️ Document in which scenario this is used etc, use copilot?
    * - Fixme: ⚠️️ This is also true if 1 col + preferredCompactColumn == .sidebar I think?
    * - Parameter sizeClass: The current horizontal size class of the user interface, which determines the layout and visibility of the sidebar.
    * - Returns: A Boolean value indicating whether the sidebar is visible based on the current `columnVisibility` and `sizeClass`.
    */
   public func isShowingSideBar(sizeClass: UserInterfaceSizeClass?) -> Bool {
      #if os(iOS)
      (columnVisibility == .all && sizeClass == .regular) || (preferredCompactColumn == .sidebar && sizeClass == .compact)
      #else // macOS
      columnVisibility == .all
      #endif
   }
   /**
    * - Abstract: Determines if the sidebar is visible based on the `columnVisibility` and `sizeClass` properties.
    * - Description: A computed property that checks if the detail view is in full screen mode.
    *                It returns true if the column visibility is set to .detailOnly, indicating that
    *                only the detail view is visible and hence, is in full screen mode.
    * - Fixme: ⚠️️ Add note regarding if this is relevant for macOS
    */
   public var isDetailFullScreen: Bool {
      columnVisibility == .detailOnly
   }
}
