import SwiftUI
import SplitViewKit
/**
 * Content
 */
extension DetailView {
   /**
    * Body
    * - Fixme: ⚠️️ Add description
    */
   public var body: some View {
      vStack
         #if os(iOS)
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         #elseif os(macOS)
         // This modifier allows the view to extend into the safe area on all sides, effectively ignoring the safe area insets. This is useful when you want your view to take up the entire screen, including under the status bar, navigation bar, and tab bar.
         .edgesIgnoringSafeArea(.all) // - Fixme: ⚠️️ Doc this line
         .navigationBarBackButtonHidden(true) // Hide the back button text
         .ignoresSafeArea(.all) // - Fixme: ⚠️️ Doc this line
         // .toolbar(.hidden, for: .navigationBar) // Hides default navbar (⚠️️ seems like this is needed here aswell, move to outside os fencing?)
         #endif
   }
}
/**
 * Components
 */
extension DetailView {
   /**
    * Provides a vertical stack layout for the detail view components.
    * - Fixme: ⚠️️ add description
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         detailHeader(title: title)
         list
         Spacer() // Pins the content to the top (needed for vstack, not for list)
      }
      .contentMargins(.vertical, .zero) // ⚠️️ Seems like this is key for the detail list only, or else we get a big gap at the top
      .contentMargins(.horizontal, .zero) // - Fixme: ⚠️️ doc this line
      .background(isTest ? .orange.opacity(0.3) : .whiteOrBlack.opacity(0.06)) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
   }
   /**
    * Detail header
    * - Description: Creates a header for the detail view, which includes the title and manages layout responsiveness based on the current size class and split configuration.
    * - Parameters:
    *   - title: The text to be displayed in the header of the detail view.
    */
   func detailHeader(title: String) -> some View {
      DetailHeader(
         title: title, // - Fixme: ⚠️️ doc this line
         splitConfig: splitConfig, // - Fixme: ⚠️️ doc this line
         sizeClass: sizeClass // - Fixme: ⚠️️ doc this line
      )
         .background(isTest ? .indigo.opacity(0.5) : .whiteOrBlack.opacity(0.06))
   }
   /**
    * List
    * - Description: Displays the list of detail data in the detail view.
    */
   var list: some View {
      DetailList(detailData: detailData)
   }
}
