import SwiftUI
import SplitViewKit
/**
 * Content
 */
extension DetailView {
   /**
    * Body
    */
   public var body: some View {
      // - Fixme: ⚠️️ move to own var. vstack?
      vStack
      // - Fixme: ⚠️️ doc this, use copilot
      // - Fixme: ⚠️️ does not seem to have an effect on iPad, maybe macOS only?
      .contentMargins(.vertical, .zero) // ⚠️️ Seems like this is key for the detail list only, or else we get a big gap at the top
      // .cleanList()
      .contentMargins(.horizontal, .zero) // - Fixme: ⚠️️ doc this
      // - Fixme: ⚠️️ doc this
      // .scrollContentBackground(.hidden) // ⚠️️ debug
      .background(isTest ? .orange.opacity(0.3) : .clear) // ⚠️️ debug - has effect only if we add .scrollContentBackground(.hidden)
      // - Fixme: ⚠️️ is this needed?
      // .environment(\.defaultMinListRowHeight, .zero) // ⚠️️ key to resetting topSpacer in the Listcontainer
      // #if os(iOS) // We hide this in splitview for iPad as well
      .toolbar(.hidden, for: .navigationBar) // Hides default navbar (⚠️️ seems like this is needed here aswell)
      #if os(macOS) // #elseif
      .navigationBarBackButtonHidden(true) // Hide the back button text
      .ignoresSafeArea(.all)
      #endif
   }
}
/**
 * Components
 */
extension DetailView {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var vStack: some View {
      VStack(spacing: .zero) {
         detailHeader(title: title)
         list
         Spacer() // pins the content to the top (needed for vstack, not for list)
      }
   }
   /**
    * Detail header
    * - Fixme: ⚠️️ add doc
    */
   func detailHeader(title: String) -> some View {
      DetailHeader(
         title: title,
         splitConfig: splitConfig,
         sizeClass: $sizeClass
      )
         .background(isTest ? .indigo.opacity(0.5) : .clear) // warn    debug
   }
   /**
    * List
    */
   var list: some View {
      DetailList(detailData: detailData) // content is injected
   }
}
