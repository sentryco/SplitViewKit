import SwiftUI
import HybridColor
/**
 * Content
 * - Description: The content of the main view
 */
extension MainView {
   /**
    * Body
    */
   internal var body: some View {
      vStack
         #if os(iOS)
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         .toolbar(removing: .sidebarToggle) // This is available from iOS 17 I think, might only be needed in sidebar? scope? probably
         #elseif os(macOS)
         .ignoresSafeArea(.all) // Ignores all safe areas
         #endif
   }
}
