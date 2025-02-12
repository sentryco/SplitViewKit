import SwiftUI
import HybridColor
import SplitViewKit
/**
 * Content
 * - Description: This section of the code defines the content view for
 *                the DetailHeader component in the SwiftUI view hierarchy.
 */
extension DetailHeader {
   /**
    * Body
    */
   var body: some View {
      VStack(spacing: .zero) {
         HStack { // hstack
            backButton // btn to left
            Spacer()
            fullScreenToggleButton // btn to right
         }
         // .background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
         HStack { // hstack with title to left
            titleText
            Spacer()
         }
         // .background(isTest ? .purple.opacity(0.5) : .clear) // ⚠️️ debug
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
