import SwiftUI
/**
 * Content
 * - Important: ⚠️️ The task is to redraw navSplitView on size,sizeclass and orientation change. Doing bindings on columnWidth values etc, doesnt update the navsplitview
 * - Note: We use navigationsplitview, since it's now supported for macOS as well, and because it is more capable than HSplitView etc? https://developer.apple.com/documentation/swiftui/navigationsplitview
 * - Note: `navSplitView` might have built in support for resizing on iPad etc, so we don't have to build it etc. a problem might be navbar, that we opt not to use,
 */
extension SplitViewContainer {
   /**
    * Body
    * - Description: This is the main body of the `SplitViewContainer`. It manages the layout and state of the navigation split view, handling orientation changes and view updates.
    * - Note: The `GeometryReader` solution was found here: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
    * - Note: It's also possible to do this with `.onRotation` and then toggle the two views. the clue is to load a new view. But using geomreader, there is less need for a state variable etc
    * - Note: Here is a way to track rotation change (it does not rerender view, you need geomreader for that): https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
    * - Fixme: ⚠️️⚠️️ Maybe somehow make a view-modifier for this geomtry reader, and TupleView to inject the views? ask coilot?
    * - Fixme: ⚠️️ We can play with min / max / ideal etc, also consider making detail have an 👉 internal overflow 👈 etc
    * - Fixme: ⚠️️ Add the toggle main / detail btn (figure out how this should look etc)
    *
    */
   public var body: some View {
      splitViewContainer
         .onChange(of: sizeClass) { oldValue, newValue in // This works when we move from compact to regular or regular to compact.
            Swift.print("onChange - oldValue: \(String(describing: oldValue)) newValue: \(String(describing: newValue))")
            refreshID = UUID() // Force redraw of navSplitView
         }
         .overlay { // We add overlay if debug closure returns a view, if not its skipped
            if let debugView = self.debug(splitConfig, sizeClass.reBind) {
               debugView
            }
         }
   }
}
/**
 * Components
 */
extension SplitViewContainer {
   /**
    * splitViewContainer
    * - Description: This view is responsible for managing the layout of the split view container based on the device's orientation and window size. It uses a GeometryReader to dynamically adjust the views and their properties such as width and visibility.
    * - Note: The issue is that since we are in regular and move to full. the sizeclass has not changed. so no view update happens. as such we need to rely on detecting winSize change and for that we use geomreader
    * - Note: GeomReader fires when moving from 70% to full. (iPad)
    * - Note: SizeClass does not fire when moving from 70% to fullscreen.
    * - Note: We can also use geometry reader on a clear pixel, but that requires an extra state for size. unless using geomreader on entire stack has performance issues, we keep it as is
    * - Fixme: ⚠️️ Maybe toggle on OS. macOS doesn't need geomreader, skip using it in that case etc?
    * - Fixme: ⚠️️ This is only relevant for iOS / iPad, so we could skip the geomreader for macos 👈
    */
   var splitViewContainer: some View {
      GeometryReader { geometry in
         navigationSplitView(geometry.size.width)
            .id(refreshID) // used to refresh view when sizeClass change, and winSize change
            .onChange(of: geometry.size) { oldSize, newSize in // - Fixme: ⚠️️ add doc
               if oldSize != newSize { // only repaint view if size has actually changed, avoids infinite loop etc
                  Swift.print("size is new")
                  refreshID = UUID() // regenerate view
               }
            }
      }
   }
   /**
    * Create navigationSplitView
    * - Description: Creates a `NavigationSplitView` with the provided configuration and views. It dynamically adjusts the layout based on the window width and orientation.
    * - Fixme: ⚠️️ Try to find a different way to pass horizontalSizeClass 👈 rebinding!
    * - Fixme: ⚠️️ Make a binding `navigationSplitViewStyle: NavigationSplitViewStyle
    * - Fixme: ⚠️️ try to figure out a better way to use sizeClass with out rebinding it etc
    * - Fixme: ⚠️️ we might need to wrap detail in `NavigationStack` in some cases where presenting became an issue. or not. if not. remove this fixme
    * - Note: We use `.balanced` as `navigationSplitViewStyle` in this case, as `.prominent` breaks the excpected UX a bit
    * - Note: We got rid of environmentObject and now do param drill instead, param-drill the sizeClass and splitConfig, environment variables is confusing if its not passed correctly, it can jump to compact in the wrong scope where it should be regular etc, and doesnt attach if views are replaced, like detailview etc 
    * - Parameter winWidth: window width (from geomtry-reader) needed to calculate / evalute correct columnwidths
    * - Returns: Nav-split-view
    */
   func navigationSplitView(_ winWidth: CGFloat) -> some View {
      NavigationSplitView( // Initializes a NavigationSplitView
         columnVisibility: $splitConfig.columnVisibility, // Binding to control column arrangement
         preferredCompactColumn: $splitConfig.preferredCompactColumn // Binding to set the preferred visible column in compact mode
      ) {
         sideBar(splitConfig, sizeClass.reBind)
            .sideBarViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      } content: {
         content(splitConfig, sizeClass.reBind)
            .mainViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      } detail: { // ⚠️️ Caution, this isn't called, if we use NavLink to present detail, to use this you have to not use navlink and instead use manual binding to show hide content etc (this caution might not be relevant anymore)
         detail(splitConfig, sizeClass.reBind) // .constant(false) // - Fixme: ⚠️️ Doc what the .constant(false) means
            .detailViewModifier(winWidth: winWidth, columnWidth: columnWidth) // - Fixme: ⚠️️ Doc this line, use copilot
      }
      .navigationSplitViewStyle(.balanced) // `.automatic will use switch between ballanced and detailProminent, .detailProminent will make detail fullscreen, and other columns hover over. (automatic is easy to implement, balanced looks better, but you have to account for responsive break-points your self, setting minWidth to children just gets clipped, no effect on parent column etc)
   }
}
