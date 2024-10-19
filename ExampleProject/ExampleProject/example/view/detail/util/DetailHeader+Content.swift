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
         .padding(.vertical, 6)
         .foregroundColor(Color.whiteOrBlack.opacity(0.8))
         .font(.system(size: 32, weight: .bold))
   }
   /**
    * - Fixme: ⚠️️ We might not need fullscreen toggle
    * - Fixme: ⚠️️ Add ghost btn to keep height etc
    * - Fixme: ⚠️️ Make it possible to disable showing detailfullscreen btn
    * - Fixme: ⚠️️ Remove animation for this button, it looks buggy. Use copilot etc
    * - Fixme: ⚠️️ Rename this button to fullScreenToggleButton?
    */
   var toggleButton: some View {
      let buttonTitleStr: String = splitConfig.isDetailFullScreen ? "Hide fullscreen" : "Show full-screen"
      return Button(buttonTitleStr) {
         Swift.print("isDetailFullScreen: \(splitConfig.isDetailFullScreen)")
         splitConfig.columnVisibility = splitConfig.isDetailFullScreen ? .all : .detailOnly
         // splitConfig.preferredCompactColumn = .detail
         // onButtonAction()
      }
      .toggleButtonStyle
      // Only show if regular sized
      .opacity(sizeClass == .regular ? 1.0 : 0.0) // we use opacity to not change the topbar height to be more narrow etc
   }
   /**
    * Back button
    * - Note: custom back-btn for detail-view, hide default back-btn etc... custom back-btn for detail when in compact mode
    * - Fixme: ⚠️️ improve doc
    */
   var backButton: some View {
      let _ = {
         Swift.print("✨backButton.sizeClass: \(sizeClass)")
      }()
      return Button("Back") {
         dismiss()
      }
      // only show if in compact mode
      .opacity(sizeClass == .compact ? 1.0 : 0.0) // we use opacity to not change the topbar height to be more narrow etc
   }
}
