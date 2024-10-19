#if DEBUG
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
    * listContainer
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         header
         VStack(spacing: 0) {
            rowViews
         }
         .padding(.vertical, 12) // Add top and bottom padding for the stack etc
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
    * List content
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ move this into MainContent swift file for simplicity?
    */
   @ViewBuilder var rowViews: some View {
      // - Fixme: ⚠️️ put this into a stack or list?
      ForEach(Array(items.enumerated()), id: \.offset) {  i, _ in
         rowItem(i: i)
      }
      #if os(iOS)
      .listRowSpacing(.zero) // ⚠️️ only available for iOS
      #endif
      .listRowInsets(.init())
   }
   /**
    * rowItem
    * - Fixme: ⚠️️ Rename to rowButton? or keep?
    * - Fixme: ⚠️️ Add doc
    */
   func rowItem(i: Int) -> some View {
      Button(items[i].text) {
         $selectedMainIndex.wrappedValue = i
         $selectedItem.wrappedValue = items[i] // set navigation on action
      }.mainRowButtonStyle(
         bgColor: items[i].color,
         textColor: Color.whiteOrBlack.opacity(($selectedMainIndex.wrappedValue == i) ? 0.8 : 0.5) // set selected color
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
#endif
