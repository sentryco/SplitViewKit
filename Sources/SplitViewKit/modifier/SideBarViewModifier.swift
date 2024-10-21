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
    * - Description: This function modifies the view by setting the toolbar, navigation bar, and scroll indicators according to the platform (iOS or macOS). It also sets the width of the navigation split view column based on the window width.
    * - Note: regarding `.toolbar(removing: .sidebarToggle)` ref: https://stackoverflow.com/a/78889492
    * - Fixme: ⚠️️ Should we only customize scrollIndicators in the caller code?
    */
   func body(content: Content) -> some View {
      let view = content
         #if os(iOS) // for iPhone and iPad
         .toolbar(removing: .sidebarToggle) // this is available from ios 17 I think
         .navigationBarHidden(true) // Removes the top default nav-bar
         #elseif os(macOS) // For macOS apps
         .toolbar(removing: .sidebarToggle) // Hides the sidebar toggle for macos
         .scrollIndicators(.hidden) // Important, or else scrollbar is shown when resizing etc
         #endif
      // - Fixme: ⚠️️ remove the optionality bellow
      if let columnWidth = ColumnWidth.sideBarColumn(winWidth: winWidth) {
         view
            .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
               min: columnWidth.min,  // Sets the minimum width of the navigation split view column
               ideal:columnWidth.ideal, // Sets the ideal width of the navigation split view column
               max: columnWidth.max // Sets the maximum width of the navigation split view column
            )
      } else {
         view
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
   internal func sideBarViewModifier(winWidth: CGFloat) -> some View {
      let modifier = SideBarViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
