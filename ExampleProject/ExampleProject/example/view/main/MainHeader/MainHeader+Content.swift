import SwiftUI
/**
 * Content
 */
extension MainHeader {
   /**
    * - Description: The main view of the header, which includes a toggle
    *                button for the sidebar and a title.
    */
   internal var body: some View {
      VStack(spacing: .zero) {
         HStack { // button (top-left)
            button
            Spacer()
         }
         .background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
         HStack { // title (bottom-left)
            titleText
            Spacer()
         }
         .background(isTest ? .purple.opacity(0.5) : .clear) // ⚠️️ debug
      }
      // - Fixme: ⚠️️ Could this cause an issue, is it needed?
      .frame(maxWidth: .infinity) // Forces the view to not shrink to text, but rather expand to it's parent width
      .padding(.horizontal) // Adds left and right padding
      #if os(iOS)
      .padding(.vertical) // Adds top and bottom padding to the VStack.
      #else
      .padding(.top, 32) // We need aditional padding for macOS, because of windowUI in the top
      .padding(.bottom, .zero)
      #endif
   }
}

