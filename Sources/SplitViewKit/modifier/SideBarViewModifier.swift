import SwiftUI
/**
 * SideBarViewModifier
 * - Fixme: ⚠️️ doc why this exists etc
 * - Fixme: ⚠️️ Move to own files +ViewModifier ?
 * - Fixme: ⚠️️ Doc what this does etc?
 * - Fixme: ⚠️️ Also possibly pass the sizes as consts in the init etc?
 */
fileprivate struct SideBarViewModifier: ViewModifier {
   /**
    * - Description: The width of the window.
    */
   let winWidth: CGFloat
   /**
    * - Fixme: ⚠️️ add doc
    */
   let columnWidth: ColumnWidthKind
   /**
    * - Description: This function modifies the view by setting the toolbar, navigation bar, and scroll indicators according to the platform (iOS or macOS). It also sets the width of the navigation split view column based on the window width.
    * - Note: regarding `.toolbar(removing: .sidebarToggle)` ref: https://stackoverflow.com/a/78889492
    * - Fixme: ⚠️️ add description
    */
   func body(content: Content) -> some View {
      // - Fixme: ⚠️️ Remove the optionality bellow
      if let columnWidth = columnWidth.sideBarColumn(winWidth: winWidth) {
         content
            .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
               min: columnWidth.min,  // Sets the minimum width of the navigation split view column
               ideal:columnWidth.ideal, // Sets the ideal width of the navigation split view column
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
    * - Parameter winWidth: The width of the window in which the sidebar view is displayed.
    * - Returns: A View with the sidebar view modifier applied.
    */
   internal func sideBarViewModifier(winWidth: CGFloat, columnWidth: ColumnWidthKind) -> some View {
      let modifier = SideBarViewModifier(winWidth: winWidth, columnWidth: columnWidth)
      return self.modifier(modifier)
   }
}
