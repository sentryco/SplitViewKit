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
         HStack { // button (top-left)
            button
            Spacer()
         }
         HStack { // title (bottom-left)
            titleText
            Spacer()
         }
      }
      // - Fixme: ⚠️️ Could this cause an issue, is it needed?
      .frame(maxWidth: .infinity) // ⚠️️ Forces the view to not shrink to text, but rather expand to its parent width
      .padding(.horizontal) // Adds left and right padding
      .padding(.vertical) 
   }
}
/**
 * Components
 */
extension MainHeader {
   /**
    * SideBarToggleButton or backbutton
    */
   @ViewBuilder var button: some View {
      if sizeClass == .regular {
         toggleButton
      } else { // if compact
         backButton
      }
   }
   /**
    * - Description: A button that toggles the visibility of the sidebar depending on the current size class.
    * - Note: We should show this if in compact mode, Show this only if toggle is true
    * - Note: Ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Fixme: ⚠️️ Try to move anim and opacity into the button style
    * - Fixme: ⚠️️ Add abstract
    * - Fixme: ⚠️️ Rename to sideBarToggleButton
    */
   var toggleButton: some View {
      Button(action: { // Show sidebar
         splitConfig.columnVisibility = .all // shows all 3 columns
      }) {}
         .iconButtonStyle(iconName: "square.righthalf.fill") // - Fixme: ⚠️️ describe what this icon looks like
      .opacity(splitConfig.isShowingSideBar(sizeClass: sizeClass) ? 0.0 : 1.0) // Only show this if sidebar is hidden
      // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
      .animation(.easeInOut(duration: 0.3), value: splitConfig.isShowingSideBar(sizeClass: sizeClass))
   }
   /**
    * Back button
    * - Description: Provides a custom back button when in compact mode, which allows users to navigate back to the previous view. This button is visible only in compact mode to enhance usability on smaller screens.
    */
   var backButton: some View {
      Button(action: {
         dismiss() // (⚠️️ API bug) this is how we consistantly can go back to sidebar in compact mode
      }) {}
         .iconButtonStyle(iconName: "chevron.left")
      // Only show if in compact mode
         .opacity(sizeClass == .compact ? 1.0 : 0.0) // We use opacity to not change the topbar height to be more narrow etc
         .animation(.easeInOut(duration: 0.3), value: sizeClass == .compact)
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
