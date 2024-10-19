import SwiftUI
/**
 * ContentViewModifier
 * - Fixme: ⚠️️⚠️️⚠️️ rename to MainViewModifier? 👈👈ball  
 */
fileprivate struct MainViewModifier: ViewModifier {
   let winWidth: CGFloat
   /**
    * Body
    */
   func body(content: Content) -> some View {
      let view = content
         #if os(iOS)
      // - Fixme: ⚠️️ try to remove the bellow, see how things look etc. make own custom version?
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         .toolbar(removing: .sidebarToggle) // this available from ios 17 I think, might only be needed in sidebar? scope? probably
      // - Fixme: ⚠️️ also add the bellow?
      //.navigationBarHidden(true) // Removes the top default nav-bar
         #elseif os(macOS)
         .ignoresSafeArea(.all) // Ignores all safe areas
         #endif
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
    */
   internal func mainViewModifier(winWidth: CGFloat) -> some View {
      let modifier = MainViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
//         .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
//            min: 250, // Sets the minimum width of the navigation split view column
//            ideal: 300, // Sets the ideal width of the navigation split view column
//            max: 400 // Sets the maximum width of the navigation split view column
//         ) // .navigationSplitViewColumnWidth(200)
//         .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
//            min: 100, // Sets the minimum width of the navigation split view column
//            ideal: 400, // Sets the ideal width of the navigation split view column
//            max: 300 // Sets the maximum width of the navigation split view column
//         ) // proposed and constrains
