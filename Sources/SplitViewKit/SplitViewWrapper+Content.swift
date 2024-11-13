import SwiftUI
/**
 * Content
 * - Important: ⚠️️ The task is to redraw navSplitView on size,sizeclass and orientation change. Doing bindings on columnWidth values etc, doesnt update the navsplitview
 */
extension SplitViewWrapper {
   /**
    * Body
    * - Description: This is the main body of the `SplitViewContainer`. It
    *                manages the layout and state of the navigation split view,
    *                handling orientation changes and view updates.
    */
   public var body: some View {
      splitViewContainer
         .overlay { // We add overlay if debug closure returns a view, if not its skipped
            if let overlayView = self.overlay(splitConfig, sizeClass.reBind) {
               overlayView
            }
         }
   }
}
