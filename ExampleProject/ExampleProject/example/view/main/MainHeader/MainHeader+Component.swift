import SwiftUI
/**
 * Components
 */
extension MainHeader {
   /**
    * SideBarToggleButton or backbutton
    * - Fixme: ⚠️️ Show ghost buttons for main headers, see sidebar-header regarding how to do it
    */
   @ViewBuilder internal var button: some View {
      if !splitConfig.isShowingSideBar(sizeClass: sizeClass) { // if regular-mode
         sideBarToggleButton
      } else { // if compact-mode
         backButton
      }
   }
   /**
    * - Description: A button that toggles the visibility of the sidebar depending on the current size class.
    * - Note: We should show this if in compact mode, Show this only if toggle is true
    * - Note: Ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Note: We could also do `sizeClass != .compact`. to toggle opacity etc, It would work for mac and ipad
    * - Fixme: ⚠️️ Try to move anim and opacity into the button style, use copilot etc
    */
   internal var sideBarToggleButton: some View {
      Button(action: { // Show sidebar
         #if os(macOS)
         withAnimation(.easeInOut(duration: 0.3)) {
            splitConfig.columnVisibility = .all // Shows all 3 columns
         }
         #else
         splitConfig.columnVisibility = .all // Shows all 3 columns without animation for other platforms
         #endif
      }) {}
      .iconButtonStyle(iconName: "square.righthalf.fill")  
      .opacity(splitConfig.isShowingSideBar(sizeClass: sizeClass) ? 0.0 : 1.0) // Only show this if sidebar is hidden
      // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
      .animation(.easeInOut(duration: 0.3), value: splitConfig.isShowingSideBar(sizeClass: sizeClass))
   }
   /**
    * Back button
    * - Description: Provides a custom back button when in compact mode,
    *                which allows users to navigate back to the previous view.
    *                This button is visible only in compact mode to enhance
    *                usability on smaller screens.
    */
   internal var backButton: some View {
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
   internal var titleText: some View {
      Text(title) // Center
         .titleTextStyle
         .padding(.vertical, 6)
   }
}
