import SwiftUI
/**
 * Components
 */
extension SplitViewWrapper {
   /**
    * splitViewContainer
    * - Abstract: Constructs a `NavigationSplitView` with the provided configuration and views, adapting the layout based on the window width and orientation.
    * - Description: This view manages the layout of the split view container
    *                based on the device's orientation and window size. It uses
    *                a GeometryReader to dynamically adjust the views and their
    *                properties such as width and visibility.
    * - Note: The `GeometryReader` solution was found here: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
    * - Note: The issue is that since we are in regular and move to full. the sizeclass has not changed. so no view update happens. as such we need to rely on detecting winSize change and for that we use geomreader. GeomReader fires when moving from 70% to full. (iPad) SizeClass does not fire when moving from 70% to fullscreen.
    * - Note: We can also use geometry reader on a clear pixel, but that requires an extra state for size. unless using geomreader on entire stack has performance issues, we keep it as is. See SizeTracker code in the swift tips post on eon.codes etc
    * - Fixme: ⚠️️ Maybe toggle on OS. macOS doesn't need geometry-reader, skip using it in that case etc? I guess leave it for now. This is only relevant for iOS / iPad, so we could skip the geomreader for macos, check with copilot?
    * - Fixme: ⚠️️ consider doing != .compact as that carries with it support for macOS. Altho may not be needed for macOS, check with copilot?
    */
   internal var splitViewContainer: some View {
      GeometryReader { geometry in // Utilizes GeometryReader to dynamically obtain the current view size
         navigationSplitView(geometry.size.width) // Passes the current width to the navigationSplitView function
            .id(refreshID) // Used to refresh view when sizeClass change, and winSize change
            .onChange(of: geometry.size) { oldSize, newSize in // Triggers a view refresh when the geometry size changes
               if sizeClass == .regular && oldSize != newSize { // ⚠️️ Only redraw view if size has actually changed, avoids infinite loop etc, we only need this in regular mode, it causes issues with popup sheet in compact mode
                  refreshID = UUID() // Re-generates view
               }
            }
      }
   }
   /**
    * Create navigationSplitView
    * - Abstract: Constructs a `NavigationSplitView` with dynamic configuration, adjusting its components and layout according to the current window width.
    * - Description: Creates a `NavigationSplitView` with the provided
    *                configuration and views. It dynamically adjusts the layout
    *                based on the window width and orientation.
    * - Note: We use `NavSplitView` over `HSplitView`, because we also Use navSplitview in the ipad, so we can get synergies etc
    * - Note: We use `Navigationsplitview`, since it's now supported for macOS as well, and because it is more capable than HSplitView etc? https://developer.apple.com/documentation/swiftui/navigationsplitview
    * - Note: We use `.balanced` as `navigationSplitViewStyle` we could do slideout as well. but it has its own limitations. UX isnt great etc.
    * - Parameter winWidth: window width (from geomtry-reader) needed to calculate / evalute correct columnwidths
    * - Returns: Nav-split-view
    */
   fileprivate func navigationSplitView(_ winWidth: CGFloat) -> some View {
      NavigationSplitView( // Initializes a NavigationSplitView
         columnVisibility: $splitConfig.columnVisibility, // Binding to control column arrangement
         preferredCompactColumn: $splitConfig.preferredCompactColumn // Binding to set the preferred visible column in compact mode
      ) {
         sideBar(splitConfig, sizeClass.reBind)  // Provides the sidebar view, binding the split configuration and size class for dynamic updates.
            .sideBarViewModifier(winWidth: winWidth, columnWidth: columnWidth) // Applies visual modifications to the sidebar based on window width and column width settings.
      } content: {
         content(splitConfig, sizeClass.reBind)  // Displays the main content view, with bindings for split configuration and size class for responsiveness.
            .mainViewModifier(winWidth: winWidth, columnWidth: columnWidth) // Modifies the main view's appearance based on the current window width and predefined column widths.
      } detail: {
         detail(splitConfig, sizeClass.reBind) // Renders the detail view, using bindings to adapt to changes in split configuration and size class.
            .detailViewModifier(winWidth: winWidth, columnWidth: columnWidth) // Adjusts the detail view's layout and styling based on window width and column width.
      }
      .navigationSplitViewStyle(.balanced)
   }
}
