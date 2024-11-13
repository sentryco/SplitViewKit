import SwiftUI
import HybridColor
/**
 * content
 * - Description: The main content of the sidebar, which includes the
 *                header and the list of items.
 */
extension SideBarView {
   /**
    * Body
    * - Description: Represents the visual structure of the SideBarView,
    *                defining its layout and behavior across different platforms.
    */
   internal var body: some View {
      vStack
      #if os(iOS) // For iPhone and iPad
      .toolbar(removing: .sidebarToggle) // This is available from iOS 17 I think
      .navigationBarHidden(true) // Removes the top default nav-bar
      #elseif os(macOS) // For macOS apps
      .toolbar(removing: .sidebarToggle) // Hides the sidebar toggle for macos
      .scrollIndicators(.hidden) // Important, or else scrollbar is shown when resizing etc
      .ignoresSafeArea(.container, edges: .top) // this removes the offset in the sidebar for macos
      #endif
   }
}

