import SwiftUI
/**
 * Content
 */
extension MainHeader {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var body: some View {
      VStack {
         HStack { // button
            toggleButton // top-left
            Spacer()
         }
         HStack { // title
            titleText // bottom-left
            Spacer()
         }
      }
      // - Fixme: ⚠️️ could this cause an issue, is it needed?
      .frame(maxWidth: .infinity) // ⚠️️ forces the view to not shrink to text, but rather expand to its parent width
      .padding(.horizontal) // adds left and right padding
   }
}
/**
 * Components
 */
extension MainHeader {
   /**
    * - Fixme: ⚠️️ We need to add
    * - Fixme: ⚠️️ Add doc
    * - Note: ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    */
   @ViewBuilder var toggleButton: some View {
      // We should show this if in compact mode
      // Show this only if toggle is true
      Button("Show sidebar") {
         // Action for the button
         Swift.print("Toggle")
         // - Fixme: ⚠️️ use switch here
         if sizeClass == .regular {
            splitConfig.columnVisibility = .all // shows all 3 columns
         } else { // if compact
            // splitConfig.preferredCompactColumn = .sidebar // set focused
            dismiss() // (⚠️️ api bug) this is how we consistantly can go back to sidebar in compact mode
         }
      }
      .toggleButtonStyle
      // Only show this if sidebar is hidden
      .opacity(splitConfig.isShowingSideBar(sizeClass: sizeClass) ? 0.0 : 1.0) // - Fixme: ⚠️️ could we just toggle the opacity on one button instead?
   }
   /**
    * Title text
    */
   var titleText: some View {
      Text(title) // center
         .titleTextStyle
         .padding(.vertical, 6)
   }
}
