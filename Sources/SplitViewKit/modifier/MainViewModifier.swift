import SwiftUI
/**
 * MainViewModifier
 * - Description: This struct is a ViewModifier that modifies the main view of the application. It is responsible for setting the width of the main column in the split view according to the width of the window. It also handles the display of the toolbar and navigation split view column width for different operating systems (iOS and macOS).
 * - Fixme: ⚠️️⚠️️⚠️️ rename to MainViewModifier? 👈👈ball
 */
fileprivate struct MainViewModifier: ViewModifier {
   /**
    * - Description: The width of the window. This value is used to calculate the width of the main column in the split view.
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
    * - Parameter winWidth: The width of the window.
    * - Returns: A View with the main view modifier applied.
    */
   internal func mainViewModifier(winWidth: CGFloat) -> some View {
      let modifier = MainViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
