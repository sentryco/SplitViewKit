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
    * - Fixme: ⚠️️ add doc
    */
   let winWidth: CGFloat
   /**
    * - Note: regarding `.toolbar(removing: .sidebarToggle)` ref: https://stackoverflow.com/a/78889492
    * - Fixme: ⚠️️ add doc
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
    * Convenient
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   internal func sideBarViewModifier(winWidth: CGFloat) -> some View {
      let modifier = SideBarViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
// .toolbar(.hidden, for: .navigationBar) // Hides default navbar
// - Fixme: ⚠️️ Disable removing the bellow. or make own version of it?
// - Fixme: ⚠️️ Move column widths to const / userdefault
