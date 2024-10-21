import SwiftUI
/**
 * Content
 */
extension MainHeader {
   /**
    * - Description: The main view of the header, which includes a toggle button for the sidebar and a title.
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
      .padding(.vertical)
   }
}
/**
 * Components
 */
extension MainHeader {
   /**
    * - Description: A button that toggles the visibility of the sidebar depending on the current size class.
    * - Note: We should show this if in compact mode, Show this only if toggle is true
    * - Note: ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    */
   @ViewBuilder var toggleButton: some View {
      Button("Show sidebar") { // Action for the button
         if sizeClass == .regular {
            splitConfig.columnVisibility = .all // shows all 3 columns
         } else { // if compact
            dismiss() // (⚠️️ API bug) this is how we consistantly can go back to sidebar in compact mode
         }
      }
      .toggleButtonStyle
      .opacity(splitConfig.isShowingSideBar(sizeClass: sizeClass) ? 0.0 : 1.0) // Only show this if sidebar is hidden
   }
   /**
    * Title text
    * - Description: The title of the header, which is displayed prominently at the top of the view.
    */
   var titleText: some View {
      Text(title) // center
         .titleTextStyle
         .padding(.vertical, 6)
   }
}
