import SwiftUI
import HybridColor
import SplitViewKit
/**
 * Content
 * - Fixme: ⚠️️ move to own file etc 👈
 */
extension DetailHeader {
   /**
    * Body
    */
   var body: some View {
      VStack {
         HStack { // hstack
            backButton // btn to left
            Spacer()
            toggleButton // btn to right
         }
         HStack { // hstack with title to left
            titleText
            Spacer()
         }
      }
      // .padding(.vertical, 6)
      .padding(.horizontal) // Adds left and right padding
      // .background(.pink) // ⚠️️ debug
   }
}
/**
 * Components
 */
extension DetailHeader {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var titleText: some View {
      Text(title) // - Fixme: ⚠️️ Toggle this somehow between accounts and Settings?
         .titleTextStyle
         .padding(.vertical, 6)
   }
   /**
    * - Note: detailfullscreen btn is here to show how we can go fullscreen with detail
    * - Note: Its a niche usecase. Not needed for most uses.
    * - Fixme: ⚠️️ Remove animation for this button, it looks buggy. Use copilot etc
    * - Fixme: ⚠️️ Rename this button to fullScreenToggleButton? 👈
    */
   var toggleButton: some View {
      let buttonTitleStr: String = splitConfig.isDetailFullScreen ? "Hide fullscreen" : "Show full-screen"
      return Button(buttonTitleStr) {
         // Swift.print("isDetailFullScreen: \(splitConfig.isDetailFullScreen)")
         // - Fixme: ⚠️️ doc the code bellow
         splitConfig.columnVisibility = splitConfig.isDetailFullScreen ? .all : .detailOnly
      }
      .toggleButtonStyle
      // Only show if regular sized
      .opacity(sizeClass == .regular ? 1.0 : 0.0) // We use opacity to not change the topbar height to be more narrow etc
   }
   /**
    * Back button
    * - Note: custom back-btn for detail-view, hide default back-btn etc... custom back-btn for detail when in compact mode
    */
   var backButton: some View {
      return Button("Back") {
         dismiss()
      }
      // Only show if in compact mode
      .opacity(sizeClass == .compact ? 1.0 : 0.0) // we use opacity to not change the topbar height to be more narrow etc
   }
}
