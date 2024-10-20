import SwiftUI
/**
 * ContentViewModifier
 * - Fixme: ⚠️️ doc why this exists etc
 * - Fixme: ⚠️️⚠️️⚠️️ rename to MainViewModifier? 👈👈ball
 */
fileprivate struct MainViewModifier: ViewModifier {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let winWidth: CGFloat
   /**
    * Body
    */
   func body(content: Content) -> some View {
      let view = content
         #if os(iOS)
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         .toolbar(removing: .sidebarToggle) // this available from ios 17 I think, might only be needed in sidebar? scope? probably
         #elseif os(macOS)
         .ignoresSafeArea(.all) // Ignores all safe areas
         #endif
      // - Fixme: ⚠️️ remove the optionality bellow
      if let columnWidth = ColumnWidth.mainColumn(winWidth: winWidth) {
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
   internal func mainViewModifier(winWidth: CGFloat) -> some View {
      let modifier = MainViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
