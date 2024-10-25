import SwiftUI
/**
 * MainViewModifier
 * - Description: This struct is a ViewModifier that modifies the main view of the application. It is responsible for setting the width of the main column in the split view according to the width of the window. It also handles the display of the toolbar and navigation split view column width for different operating systems (iOS and macOS).
 */
fileprivate struct MainViewModifier: ViewModifier {
   /**
    * - Description: The width of the window. This value is used to calculate the width of the main column in the split view.
    */
   let winWidth: CGFloat
   /**
    * - Description: The `ColumnWidthKind` protocol instance that provides custom width settings for the main column based on the window width.
    */
   let columnWidth: ColumnWidthKind
   /**
    * Body
    * - Description: This function modifies the view by applying a custom
    *                width to the main column of the navigation split view
    *                based on the window width. It uses the `ColumnWidthKind`
    *                protocol to determine the appropriate widths.
    */
   func body(content: Content) -> some View {
      if let columnWidth = columnWidth.mainColumn(winWidth: winWidth) {
         content
            .navigationSplitViewColumnWidth( // Sets the width of the navigation split view column
               min: columnWidth.min,  // Sets the minimum width of the navigation split view column
               ideal:columnWidth.ideal, // Sets the ideal width of the navigation split view column
               max: columnWidth.max // Sets the maximum width of the navigation split view column
            )  
      } else {
         content // If there is no columnWidth, we use native default column widths etc
      }
   }
}
/**
 * Ext
 */
extension View {
   /**
    * Convenient
    * - Description: This method applies a main view modifier that adjusts
    *                the main column's width according to the window width
    *                using the provided `ColumnWidthKind` instance.
    * - Parameters:
    *   - winWidth: The width of the window.
    *   - columnWidth: An instance conforming to the `ColumnWidthKind` protocol, which provides custom width settings for the main column based on the window width.
    * - Returns: A View with the main view modifier applied.
    */
   internal func mainViewModifier(winWidth: CGFloat, columnWidth: any ColumnWidthKind) -> some View {
      let modifier = MainViewModifier(
         winWidth: winWidth,
         columnWidth: columnWidth
      )
      return self.modifier(modifier)
   }
}
