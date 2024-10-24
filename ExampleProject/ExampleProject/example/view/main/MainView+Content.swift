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
   var body: some View {
      vStack
         #if os(iOS)
         .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
         .toolbar(removing: .sidebarToggle) // this available from ios 17 I think, might only be needed in sidebar? scope? probably
         #elseif os(macOS)
         .ignoresSafeArea(.all) // Ignores all safe areas
         #endif
   }
}
/**
 * Components
 */
extension MainView {
   /**
    * Header
    * - Description: The header of the main view
    */
   var header: some View {
      MainHeader(
         title: title,
         splitConfig: splitConfig,
         sizeClass: /*$*/sizeClass
      )
      .background(isTest ? .pink.opacity(0.5) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
   }
   /**
    * vStack
    * - Description: The main stack of the main view
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         header
         mainList
         Spacer() // Pins the stack to the top
      }
//      .contentMargins(.horizontal, .zero) // Sets the horizontal margins of the content to zero, effectively aligning the content flush with the horizontal edges of its container.
      .background(isTest ? .blue.opacity(0.3) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug

   }
   /**
    * mainList
    * - Description: The list of items in the main view
    */
   var mainList: some View {
      MainList(
         selectedMainIndex: $selectedMainIndex,
         selectedItem: $selectedItem,
         items: items
      )
   }
}
