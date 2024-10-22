import SwiftUI
/**
 * - Description: This struct is a ViewModifier that modifies the detail view in a split view setup. It adjusts the width of the navigation split view column based on the window width.
 */
struct DetailViewModifier: ViewModifier {
   /**
    * The width of the window in which the detail view is displayed.
    */
   let winWidth: CGFloat
   // - Fixme: ⚠️️ add doc
   let columnWidth: ColumnWidthKind
   /**
    * Body
    * - Note: there is also: `navigationSplitViewColumnWidth`
    * - Fixme: ⚠️️ remove the optionality in columnWidth
    * - Fixme: ⚠️️ add doc regarding why columnWidth is optional
    * - Fixme: ⚠️️ add description
    */
   func body(content: Content) -> some View {
      if let columnWidth = columnWidth.detailColumn(winWidth: winWidth) {
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
    * Convenient
    * - Parameter winWidth: The width of the window in which the detail view is displayed.
    * - Returns: A View with the detail view modifier applied.
    */
   internal func detailViewModifier(winWidth: CGFloat, columnWidth: ColumnWidthKind) -> some View{
      let modifier = DetailViewModifier(winWidth: winWidth, columnWidth: columnWidth)
      return self.modifier(modifier)
   }
}
