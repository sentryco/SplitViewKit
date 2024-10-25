import SwiftUI
/**
 * Content
 * - Important: ⚠️️ The task is to redraw navSplitView on size,sizeclass and orientation change. Doing bindings on columnWidth values etc, doesnt update the navsplitview
 */
extension SplitViewWrapper {
   /**
    * Body
    * - Description: This is the main body of the `SplitViewContainer`. It manages the layout and state of the navigation split view, handling orientation changes and view updates.
    */
   public var body: some View {
      splitViewContainer
         .overlay { // We add overlay if debug closure returns a view, if not its skipped
            if let overlayView = self.overlay(splitConfig, sizeClass.reBind) {
               overlayView
            }
         }
   }
}
/**
 * Components
 */
extension SplitViewWrapper {
   /**
    * splitViewContainer
    * - Description: This view is responsible for managing the layout of the split view container based on the device's orientation and window size. It uses a GeometryReader to dynamically adjust the views and their properties such as width and visibility.
    * - Note: The `GeometryReader` solution was found here: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
    * - Note: The issue is that since we are in regular and move to full. the sizeclass has not changed. so no view update happens. as such we need to rely on detecting winSize change and for that we use geomreader. GeomReader fires when moving from 70% to full. (iPad) SizeClass does not fire when moving from 70% to fullscreen.
    * - Note: We can also use geometry reader on a clear pixel, but that requires an extra state for size. unless using geomreader on entire stack has performance issues, we keep it as is. See SizeTracker code in the swift tips post on eon.codes etc
    * - Fixme: ⚠️️ Maybe toggle on OS. macOS doesn't need geomreader, skip using it in that case etc? i guess leave it for now. This is only relevant for iOS / iPad, so we could skip the geomreader for macos
    */
   var splitViewContainer: some View {
      GeometryReader { geometry in // - Fixme: ⚠️️ doc this line
         navigationSplitView(geometry.size.width) // - Fixme: ⚠️️ doc this line
            .id(refreshID) // Used to refresh view when sizeClass change, and winSize change
            .onChange(of: geometry.size) { oldSize, newSize in // - Fixme: ⚠️️ Add doc
               if sizeClass == .regular && oldSize != newSize { // ⚠️️ Only repaint view if size has actually changed, avoids infinite loop etc, we only need this in regular mode, it causes issues with popup sheet in compact mode
                  refreshID = UUID() // Re-generates view
               }
            }
      }
   }
   /**
    * Create navigationSplitView
    * - Description: Creates a `NavigationSplitView` with the provided configuration and views. It dynamically adjusts the layout based on the window width and orientation.
    * - Note: We use `NavSplitView` over `HSplitView`, because we also Use navSplitview in the ipad, so we can get synergies etc
    * - Note: We use `Navigationsplitview`, since it's now supported for macOS as well, and because it is more capable than HSplitView etc? https://developer.apple.com/documentation/swiftui/navigationsplitview
    * - Note: We use `.balanced` as `navigationSplitViewStyle` we could do slideout as well. but it has its own limitations. UX isnt great etc.
    * - Parameter winWidth: window width (from geomtry-reader) needed to calculate / evalute correct columnwidths
    * - Returns: Nav-split-view
    */
   func navigationSplitView(_ winWidth: CGFloat) -> some View {
      NavigationSplitView( // Initializes a NavigationSplitView
         columnVisibility: $splitConfig.columnVisibility, // Binding to control column arrangement
         preferredCompactColumn: $splitConfig.preferredCompactColumn // Binding to set the preferred visible column in compact mode
      ) {
         sideBar(splitConfig, sizeClass.reBind)  // - Fixme: ⚠️️ Doc this line
            .sideBarViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      } content: {
         content(splitConfig, sizeClass.reBind)  // - Fixme: ⚠️️ Doc this line
            .mainViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      } detail: {
         detail(splitConfig, sizeClass.reBind) // - Fixme: ⚠️️ Doc this line
            .detailViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      }
      .navigationSplitViewStyle(.balanced)
   }
}
