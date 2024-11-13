import SwiftUI
/**
 * - Description: This struct is a ViewModifier that modifies the detail view in a split view setup. It adjusts the width of the navigation split view column based on the window width.
 */
fileprivate struct DetailViewModifier: ViewModifier {
   /**
    * The width of the window in which the detail view is displayed.
    */
   fileprivate let winWidth: CGFloat
   /**
    * The `ColumnWidthKind` protocol instance that provides custom width settings for the detail column based on the window width.
    */
   fileprivate let columnWidth: ColumnWidthKind
   /**
    * Body
    * - Description: This function modifies the view by applying a custom
    *                width to the detail column of the navigation split view
    *                based on the window width. It uses the `ColumnWidthKind`
    *                protocol to determine the appropriate widths.
    * - Note: There is also: `navigationSplitViewColumnWidth`
    */
   fileprivate func body(content: Content) -> some View {
      if let columnWidth = columnWidth.detailColumn(winWidth: winWidth) {
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
    * Convenient
    * - Description: This method applies a detail view modifier that adjusts
    *                the detail column's width according to the window width
    *                using the provided `ColumnWidthKind` instance.
    * - Parameters:
    *   - winWidth: The width of the window in which the detail view is displayed.
    *   - columnWidth: An instance conforming to the `ColumnWidthKind` protocol, which provides custom width settings for the detail column based on the window width.
    * - Returns: A View with the detail view modifier applied.
    */
   internal func detailViewModifier(winWidth: CGFloat, columnWidth: ColumnWidthKind) -> some View {
      let modifier = DetailViewModifier(
         winWidth: winWidth,
         columnWidth: columnWidth
      )
      return self.modifier(modifier)
   }
}
