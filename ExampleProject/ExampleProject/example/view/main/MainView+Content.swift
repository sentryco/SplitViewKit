import SwiftUI
import HybridColor
/**
 * Content
 * - Fixme: ⚠️️ add preview
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
         title: selectedItem?.text ?? "Placeholder"
         /*isSideBarShown: $isSidebarShown,*/
         /*preferredCompactColumn: $preferredCompactColumn*/
      )
      .background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
   }
   /**
    * listContainer
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         header
         mainList
         Spacer() // pins the stack to the top
      }
      .contentMargins(.horizontal, 0)
      // .scrollContentBackground(.hidden) // ⚠️️ Debug
      // .background(.clear) // ⚠️️ Debug - has effect only if we add .scrollContentBackground(.hidden)
      .background(isTest ? .blue.opacity(0.3) : .clear) // ⚠️️ debug
      // - Fixme: ⚠️️ we are using vstack not list here so remove the bellow? actually we should probably use list?, because its more suitable for the case
      // .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
   }
   /**
    * mainList
    */
   var mainList: some View {
      MainList.init(
         selectedMainIndex: $selectedMainIndex,
         selectedItem: $selectedItem,
         items: items
      )
   }
}
/**
 * Helper
 */
//extension MainView {
   /**
    * - Fixme: ⚠️️ add doc
    */
//   fileprivate func getSelected(index: Int) -> Binding<Bool> {
//      Binding<Bool>(get: { // We need to rebind
//         $mainSelectedIndex.wrappedValue == index
//      }, set: { _ in
//         $mainSelectedIndex.wrappedValue = index
//      })
//   }
//}

