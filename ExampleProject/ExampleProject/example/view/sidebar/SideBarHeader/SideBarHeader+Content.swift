import SwiftUI
import HybridColor
/**
 * Content
 */
extension SideBarHeader {
   /**
    * - Description: The header of the sidebar, which includes the title and a size class indicator.
    */
   internal var body: some View {
      VStack(spacing: .zero) {
         HStack {
            sideBarToggleButton // Top-left
            Spacer()
         }
         //.background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
         HStack {
            titleText // Bottom-left
            Spacer()
         }
        //.background(isTest ? .purple.opacity(0.5) : .clear) // ⚠️️ debug
      }
      .padding(.horizontal) // Adds left and right padding
      #if os(iOS)
      .padding(.vertical) // Adds top and bottom padding to the VStack.
      #else
      .padding(.top, 32) // We need aditional padding for macOS, because of windowUI in the top
      .padding(.bottom, .zero)
      #endif
   }
}
