import SwiftUI
import HybridColor
/**
 * Components
 */
extension MainView {
   /**
    * vStack
    * - Description: The main stack of the main view
    */
   internal var vStack: some View {
      VStack(spacing: .zero) {
         header
         mainList
         Spacer() // Pins the stack to the top
      }
      #if os(iOS)
      .background(isTest ? .blue.opacity(0.3) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
      #else
      .background(isTest ? .blue.opacity(0.3) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
      #endif
   }
   /**
    * Header
    * - Description: The header of the main view
    */
   fileprivate var header: some View {
      MainHeader(
         title: title, // The title of the main view, displayed in the header.
         splitConfig: splitConfig, // Configuration for the split view behavior in the main view.
         sizeClass: $sizeClass // A binding to the size class, used to adapt the UI for different device sizes.
      )
      #if os(iOS)
      .background(isTest ? .pink.opacity(0.5) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
      #else
      .background(isTest ? .pink.opacity(0.5) : .whiteOrBlack.opacity(0.07)) // ⚠️️ debug
      #endif
   }
   /**
    * mainList
    * - Description: The list of items in the main view
    */
   fileprivate var mainList: some View {
      MainList(
         selectedMainIndex: $selectedMainIndex, // A binding to the currently selected index in the main list.
         selectedItem: $selectedItem, // A binding to the currently selected item in the main list.
         items: items // The collection of items to be displayed in the main list.
      )
   }
}
