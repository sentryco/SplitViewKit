import SwiftUI
import HybridColor
/**
 * Content
 * - Fixme: ⚠️️ Add preview
 */
extension MainView {
   /**
    * Body
    */
   var body: some View {
      vStack
   }
}
/**
 * Components
 */
extension MainView {
   /**
    * Header
    */
   var header: some View {
      MainHeader(
         title: title,
         splitConfig: splitConfig,
         sizeClass: $sizeClass
      )
      .background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
   }
   /**
    * vStack
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         header
         mainList
         Spacer() // pins the stack to the top
      }
      .contentMargins(.horizontal, 0)
      .background(isTest ? .blue.opacity(0.3) : .clear) // ⚠️️ debug

   }
   /**
    * mainList
    */
   var mainList: some View {
      MainList(
         selectedMainIndex: $selectedMainIndex,
         selectedItem: $selectedItem,
         items: items
      )
   }
}
