import SwiftUI
/**
 * Content
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
    * - Fixme: ⚠️️ This is only relevant for iOS, so we could skip the geomreader for macos 👈
    * - Fixme: ⚠️️⚠️️ maybe toggle on isDebug and not create the ZStack etc
    */
   public var body: some View {
      ZStack {
         splitViewContainer // Bellow debug container
         debugContainer // Floats above navSplitView
      }
      // - Fixme: ⚠️️ keep in mind 70% splitview is still regular, try to see if there is an event still from regular to regular
      .onChange(of: sizeClass) { oldValue, newValue in // This works when we move from compact to regular or regular to compact.
         if newValue == .compact {
            print("👉 Switched to compact size class")
         } else if newValue == .regular {
            print("👉 Switched to regular size class")
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
    * - Note: GeomReader fires when moving from 70% to full. (iPad)
    * - Note: SizeClass does not fire when moving from 70% to fullscreen.
    * - Fixme: ⚠️️⚠️️ Maybe toggle on OS. macOS doesnt need geomreader, skip using it in that case etc?
    */
   var splitViewContainer: some View {
      GeometryReader { (_ geometry: GeometryProxy) in // ⚠️️ Geom-reader refreshes view on orientation change etc,  needed to refresh columnwidths, there seem to be no other way to do that for swiftui based splitnavview etc
         let _ = {
            Swift.print("📐 Geometry changed: \(geometry.size) ")
         }()
         let _  = geometry.size.width > geometry.size.height // ⚠️️ For some reason we have to have this here, elaborate?: I thinkn its just because we have to reference geomtryreader to activate some internal mechanism etc
         // - Fixme: ⚠️️ maybe if we load new view on size change?
         if isLandscape { // - Fixme: ⚠️️ Add doc
            navigationSplitView(winWidth: geometry.size.width) // ⚠️️ This is the same as the other, but it refreshes the view, and recalculates columnwidths etc, which is what we need
         } else {
            navigationSplitView(winWidth: geometry.size.width) // ⚠️️ We can't load the same variable, or else it will not refresh. so we reference it again like this to referesh. seems strange but it is what it is, there might be another solution to this stange behaviour, more exploration could be ideal
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
   func navigationSplitView(winWidth: CGFloat) -> some View {
      let _ = {
         Swift.print("refresh navigationSplitView")
      }()
      return NavigationSplitView( // Initializes a NavigationSplitView
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
      .navigationSplitViewStyle(.balanced) // `.automatic will slide detail to the side, .prominent will make detail fullscreen, and other columns hover over
   }
   /**
    * Adds floating debug-text that informs the viewer about column-config, focused-column
    * - Description: Displays a floating debug container that provides real-time information about the current configuration of the navigation split view, including the focused column and column configuration settings.
    * - Fixme: ⚠️️ try to avoid rebinding these? or move them into object scope etc?
    */
   @ViewBuilder var debugContainer: some View {
      if isDebug {
         DebugContainer(
            splitConfig: splitConfig.reBind, // nav-split-view config
            sizeClass: sizeClass.reBind
         )
      } // else nothing
   }
}
