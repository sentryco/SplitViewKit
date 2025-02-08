import SwiftUI
/**
 * SideBarViewModifier
 * - Abstract. We apply columnwidth to the column with this modifier
 * - Description: This modifier is used to apply custom width settings to
 *                the sidebar of a navigation split view based on the window
 *                width.
 */
fileprivate struct SideBarViewModifier: ViewModifier {
   /**
     * The width of the window in which the sidebar view is displayed.
     * - Description: This value is used to calculate the width of the sidebar column in the split view.
    */
   fileprivate let winWidth: CGFloat
   /**
    * - Abstract: Specifies the width parameters for the sidebar column in the split view, adapting to the window's width.
    * - Description: The `ColumnWidthKind` protocol instance that provides
    *                custom width settings for the sidebar based on the window
    *                width.
    */
   fileprivate let columnWidth: ColumnWidthKind
   /**
    * - Abstract: Modifies the view by applying a custom width to the sidebar of the navigation split view based on the window width.
    * - Description: This function modifies the view by setting the toolbar,
    *                navigation bar, and scroll indicators according to the
    *                platform (iOS or macOS). It also sets the width of the
    *                navigation split view column based on the window width.
    * - Note: Regarding `.toolbar(removing: .sidebarToggle)` ref: https://stackoverflow.com/a/78889492
    * - Note: if ColumnWidth is nil, default native columnwidths are used instead
    */
   fileprivate func body(content: Content) -> some View {
      if let columnWidth: ColumnWidth = columnWidth.sideBarColumn(winWidth: winWidth) {
         content
            .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
               min: columnWidth.min,  // Sets the minimum width of the navigation split view column
               ideal: columnWidth.ideal, // Sets the ideal width of the navigation split view column
               max: columnWidth.max // Sets the maximum width of the navigation split view column
            )
      } else {
         content // If there is no columnwidth, we use native default column widths etc
      }
   }
}
/**
 * Ext
 */
extension View {
   /**
    * Applies the SideBarViewModifier to the view.
    * - Abstract: A View extension that applies the SideBarViewModifier to adjust the sidebar's width in a navigation split view based on the window width.
    * - Description: This method applies a sidebar view modifier that adjusts
    *                the sidebar's width according to the window width using the
    *                provided `ColumnWidthKind` instance.
    * - Parameters:
    *   - winWidth: The width of the window in which the sidebar view is displayed.
    *   - columnWidth: An instance conforming to the `ColumnWidthKind` protocol, which provides custom width settings for the sidebar based on the window width.
    * - Returns: A View with the sidebar view modifier applied.
    */
   internal func sideBarViewModifier(winWidth: CGFloat, columnWidth: ColumnWidthKind) -> some View {
      let modifier = SideBarViewModifier(
         winWidth: winWidth,
         columnWidth: columnWidth
      )
      return self.modifier(modifier)
   }
}
