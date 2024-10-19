import SwiftUI

struct DetailViewModifier: ViewModifier {
   let winWidth: CGFloat
   /**
    * Body
    * - Note: there is also: navigationSplitViewColumnWidth
    */
   func body(content: Content) -> some View {
      let view = content
         #if os(iOS)
         // - Fixme: ⚠️️ try to remove the bellow, see how it works etc. make own custom version?
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
//         .navigationBarHidden(true)
         // - Fixme: ⚠️️ remove the back btn somehow, figure it out, replace with custom back btn etc
         #elseif os(macOS)
      // This modifier allows the view to extend into the safe area on all sides,
      // effectively ignoring the safe area insets. This is useful when you want
      // your view to take up the entire screen, including under the status bar,
      // navigation bar, and tab bar.
         .edgesIgnoringSafeArea(.all)
         #endif
      if let columnWidth = ColumnWidth.detailColumn(winWidth: winWidth) { // - Fixme: ⚠️️ add doc regarding why this is optional
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
   internal func detailViewModifier(winWidth: CGFloat) -> some View{
      let modifier = DetailViewModifier(winWidth: winWidth)
      return self.modifier(modifier)
   }
}
