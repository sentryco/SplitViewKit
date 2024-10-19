import SwiftUI
/**
 * SideBarViewModifier
 * - Fixme: ⚠️️ Move to own files +ViewModifier ?
 * - Fixme: ⚠️️ Doc what this does etc?
 * - Fixme: ⚠️️ Also possibly pass the sizes as consts in the init etc?
 */
fileprivate struct SideBarViewModifier: ViewModifier {
   let winWidth: CGFloat
   /**
    * - Fixme: ⚠️️ add doc
    * - Note: regarding `.toolbar(removing: .sidebarToggle)` ref: https://stackoverflow.com/a/78889492
    */
   func body(content: Content) -> some View {
      let view = content
         #if os(iOS) // for iPhone and iPad
         .toolbar(removing: .sidebarToggle) // this available from ios 17 I think
      // - Fixme: ⚠️️ Disable removing the bellow. or make own version of it?
         .navigationBarHidden(true) // Removes the top default nav-bar
//         .toolbar(.hidden, for: .navigationBar) // Hides default navbar
      // - Fixme: ⚠️️ Move column widths to const / userdefault
         #elseif os(macOS) // For macOS apps
         .toolbar(removing: .sidebarToggle) // Hides the sidebar toggle for macos
      // - Fixme: ⚠️️ Should we only customize this in the caller code?
         .scrollIndicators(.hidden) // Important, or else scrollbar is shown when resizing etc
         #endif
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
    */
   internal func sideBarViewModifier(winWidth: CGFloat) -> some View {
      let modifier = SideBarViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
