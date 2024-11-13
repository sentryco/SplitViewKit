import SwiftUI
import SplitViewKit
/**
 * Body
 */
extension ExampleView {
   /**
    * Body
    * - Description: This property represents the visual structure of the
    *                ExampleView, organizing it into a three-column layout with
    *                sidebar, main content, and detail views. It utilizes the
    *                SplitViewContainer to manage these sections dynamically
    *                based on the current environment settings such as size class
    *                and device orientation.
    */
   public var body: some View {
      SplitViewWrapper(
         sideBar: { splitConfig, sizeClass in
            // Provides the sidebar view configured with the current split view configuration and size class.
            sideBarView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, content: { splitConfig, sizeClass in
            // Provides the main content view configured with the current split view configuration and size class.
            mainView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, detail: { splitConfig, sizeClass in
            // Provides the detail view configured with the current split view configuration and size class.
            detailView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, overlay: { splitConfig, sizeClass in
            // Provides a floating debug view configured with the current split view configuration and size class.
            debugContainer(splitConfig: splitConfig, sizeClass: sizeClass)
         },
         columnWidth: CustomColumnWidth() // Specifies custom widths for the columns in the split view.
      )
   }
}
