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
         .toolbar(removing: .sidebarToggle) // This is available from iOS 17 I think, might only be needed in sidebar? scope? probably
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
         title: title, // - Fixme: ⚠️️ doc this line
         splitConfig: splitConfig, // - Fixme: ⚠️️ doc this line
         sizeClass: $sizeClass // - Fixme: ⚠️️ doc this line
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
      .background(isTest ? .blue.opacity(0.3) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
   }
   /**
    * mainList
    * - Description: The list of items in the main view
    */
   var mainList: some View {
      MainList(
         selectedMainIndex: $selectedMainIndex, // - Fixme: ⚠️️ doc this line
         selectedItem: $selectedItem, // - Fixme: ⚠️️ doc this line
         items: items // - Fixme: ⚠️️ doc this line
      )
   }
}
