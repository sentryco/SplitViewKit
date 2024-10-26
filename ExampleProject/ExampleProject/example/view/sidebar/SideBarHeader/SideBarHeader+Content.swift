import SwiftUI
import HybridColor
/**
 * Content
 */
extension SideBarHeader {
   /**
    * - Description: The header of the sidebar, which includes the title and a size class indicator.
    */
   var body: some View {
      VStack(/**/spacing: .zero) {
         HStack {
            sideBarToggleButton // Top-left
            Spacer()
         }
         .background(isTest ? .pink.opacity(0.5) : .clear) // ⚠️️ debug
         HStack {
            titleText // Bottom-left
            Spacer()
         }
         .background(isTest ? .purple.opacity(0.5) : .clear) // ⚠️️ debug
      }
      .padding(.horizontal) // Adds left and right padding
      #if os(iOS)
      .padding(.vertical) // Adds top and bottom padding to the VStack.
      #else
      .padding(.top, 32) // We need aditional padding for macOS, because of windowUI in the top
      .padding(.bottom, .zero)
      #endif
   }
}
/**
 * Component
 */
extension SideBarHeader {
   /**
    * - Description: The title text of the sidebar header
    */
   var titleText: some View {
      Text(title) // - Fixme: ⚠️️ Toggle this somehow between accounts and Settings?
         .titleTextStyle // Applies a predefined style for title text in the sidebar header.
         .padding(.vertical, 6) // Adds vertical padding of 6 points to the title text for better visual separation.
   }
   /**
    * - Abstract: The toggle button of the sidebar header
    * - Description: A button that toggles the visibility of the sidebar, switching between single and double column views.
    * - Note: We animate the hiding showing of sidebar toggle button because it looks nice
    * - Note: "70% splitview mode" for iPad is considered regular
    * - Note: The animation is only really visible If we drag the sidebar to visibility. Very subtle, but looks better when accounted for
    * - Note: We could also do sizeClass != .compact. to toggle opacity etc, It would work for mac and ipad
    */
   @ViewBuilder var sideBarToggleButton: some View {
      let button = Button(action: { // Hide sidebar
         // - Fixme: ⚠️️ animate this transition, but only for macOS
         #if os(macOS)
         let animation = Animation.easeInOut(duration: 0.3)
         withAnimation(animation) {
            splitConfig.columnVisibility = .doubleColumn // Go to double column, this effectively hides the sidebar
         }
         #else
         splitConfig.columnVisibility = .doubleColumn // Change without animation for other platforms
         #endif
      }) {}
      if splitConfig.isShowingSideBar(sizeClass: sizeClass)/*sizeClass == .regular*/ { // If 3 column
         button
            .iconButtonStyle(iconName: "square.lefthalf.fill") // Applies an icon style with a half-filled square, indicating a partial collapse or expansion state.
            .opacity(splitConfig.columnVisibility == .all ? 1.0 : 0.0) // Only show this if sidebar is hidden
         // Animate opacity changes smoothly with .easeInOut(duration: 0.3) based on sidebar visibility.
            .animation(.easeInOut(duration: 0.3), value: splitConfig.columnVisibility == .all)
      } else { // hide button in compact mode
         (isTest ? Color.blue : Color.clear) // Creates a ghost area, to avoid collapsing the space when button is hidden
            .frame(width: 36, height: 36)
      }
   }
}
