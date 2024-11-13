import SwiftUI
import SplitViewKit
/**
 * Content
 */
extension DetailView {
   /**
    * Body
    * - Description: Defines the main content structure of the DetailView,
    *                which includes a custom vertical stack layout to organize
    *                various components such as the detail header and list.
    */
   public var body: some View {
      vStack
         #if os(iOS)
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         #elseif os(macOS)
         // This modifier allows the view to extend into the safe area on all sides, effectively ignoring the safe area insets. This is useful when you want your view to take up the entire screen, including under the status bar, navigation bar, and tab bar.
         .edgesIgnoringSafeArea(.all) // This modifier allows the view to extend into the safe area on all sides, effectively ignoring the safe area insets. Useful for views that need to utilize the entire screen space.
         .navigationBarBackButtonHidden(true) // Hide the back button text
         .ignoresSafeArea(.all) // This modifier ensures that the view ignores the safe area entirely, allowing the view's content to extend to all edges of the screen.
         // .toolbar(.hidden, for: .navigationBar) // Hides default navbar (⚠️️ seems like this is needed here aswell, move to outside os fencing?)
         #endif
   }
}
