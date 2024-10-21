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
    * - Note: Ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Fixme: ⚠️️ Try to move anim and opacity into the button style
    */
   @ViewBuilder var toggleButton: some View {
      Button(action: { // Show sidebar
         if sizeClass == .regular {
            splitConfig.columnVisibility = .all // shows all 3 columns
         } else { // if compact
            dismiss() // (⚠️️ API bug) this is how we consistantly can go back to sidebar in compact mode
         }
      }) {}
         .iconButtonStyle(iconName: "square.righthalf.fill")
      .opacity(splitConfig.isShowingSideBar(sizeClass: sizeClass) ? 0.0 : 1.0) // Only show this if sidebar is hidden
      // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
      .animation(.easeInOut(duration: 0.3), value: splitConfig.isShowingSideBar(sizeClass: sizeClass))
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
