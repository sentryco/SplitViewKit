import SwiftUI
/**
 * Content
 * - Note: We use navigationsplitview, since it's now supported for macOS as well, and because it is more capable than HSplitView etc? https://developer.apple.com/documentation/swiftui/navigationsplitview
 * - Note: `navSplitView` might have built in support for resizing on ipad etc, so we don't have to build it etc. a problem might be navbar, that we opt not to use,
 */
extension SplitViewContainer {
   /**
    * Body
    * - Note: The `GeometryReader` solution was found here: https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation
    * - Note: It's also possible to do this with .onRotation and then toggle the two views. the clue is to load a new view. But using geomreader, there is less need for a state variable etc
    * - Note: Here is a way to track rotation change (it does not rerender view, you need geomreader for that): https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
    * - Fixme: ⚠️️⚠️️ Maybe somehow make a view-modifier for this geomtry reader, and TupleView to inject the views? ask coilot?
    * - Fixme: ⚠️️ We can play with min / max / ideal etc, also consider making detail have an 👉 internal overflow 👈 etc
    * - Fixme: ⚠️️ Add the toggle main / detail btn (figure out how this should look etc)
    */
   public var body: some View {
      ZStack {
         navigationSplitViewContainer // bellow debug container
         debugContainer // floats above navSplitView
      }
   }
}
/**
 * Components
 */
extension SplitViewContainer{
   /**
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ This is only relevant for iOS, so we could skip the geomreader for macos 👈
    */
   var navigationSplitViewContainer: some View {
      GeometryReader { (_ geometry: GeometryProxy) in // ⚠️️ Geom-reader refreshes view on orientation change etc,  needed to refresh columnwidths, there seem to be no other way to do that for swiftui based splitnavview etc
         let _  = geometry.size.width > geometry.size.height // ⚠️️ For some reason we have to have this here, elaborate?: I thinkn its just because we have to reference geomtryreader to activate some internal mechanism etc
         if getDeviceOrientation().isLandscape { // macOS always reads as landscape
            navigationSplitView(winWidth: geometry.size.width) // ⚠️️ This is the same as the other, but it refreshes the view, and recalculates columnwidths etc, which is what we need
         } else {
            navigationSplitView(winWidth: geometry.size.width) // ⚠️️ We can't load the same variable, or else it will not refresh. so we reference it again like this to referesh. seems strange but it is what it is, there might be another solution to this stange behaviour, more exploration could be ideal
         }
      }
   }
   /**
    * Create navigationSplitView
    * - Fixme: ⚠️️ Try to find a different way to pass horizontalSizeClass 👈 rebinding!
    * - Fixme: ⚠️️ Make a binding navigationSplitViewStyle: NavigationSplitViewStyle
    * - Fixme: ⚠️️ try to get rid of the forced unwrap
    * - Fixme: ⚠️️ try to figure out a better way to use sizeClass with out rebinding it etc
    * - Note: We use `.balanced` as `navigationSplitViewStyle` in this case, as `.prominent` breaks the excpected UX a bit
    * - Parameter winWidth: window width (from geomtry-reader)
    * - Returns: Nav-split-view
    */
   func navigationSplitView(winWidth: CGFloat) -> some View {
      return NavigationSplitView( // Initializes a NavigationSplitView
         columnVisibility: $splitConfig.columnVisibility, // Binding to control column arrangement
         preferredCompactColumn: $splitConfig.preferredCompactColumn // Binding to set the preferred visible column in compact mode
      ) {
         sideBar(splitConfig, .init(get: { sizeClass }, set: { _ in }))
            .sideBarViewModifier(winWidth: winWidth) // - Fixme: ⚠️️ Doc this line, use copilot
            //.environment(\.horizontalSizeClass, sizeClass) // ⚠️️ Doesn't work if applied to navsplitview
         // - Fixme: ⚠️️ We have to do param drilling after all, because we load views via interaction later, then the environment variable isnt reapplied. and the app crashes
            //.environmentObject(splitConfig)// - Fixme: ⚠️️ Get rid of environmentObject soon, param drill instead
      } content: {
         content(splitConfig, .init(get: { sizeClass }, set: { _ in }))
            .mainViewModifier(winWidth: winWidth) // - Fixme: ⚠️️ Doc this line, use copilot
//            .environment(\.horizontalSizeClass, sizeClass) // ⚠️️ doesn't work if applied to navsplitview
//            .environmentObject(splitConfig) // - Fixme: ⚠️️ get rid of environmentObject soon, param drill instead
      } detail: { // ⚠️️ Caution, this isn't called, if we use NavLink to present detail, to use this you have to not use navlink and instead use manual binding to show hide content etc
         // NavigationStack { // ⚠️️ Seem to fix things a little, but is presenting is the issue, figure it out
         detail(splitConfig, .init(get: { sizeClass }, set: { _ in })) // .constant(false) // - Fixme: ⚠️️ Doc what the .constant(false) means
            .detailViewModifier(winWidth: winWidth) // - Fixme: ⚠️️ Doc this line, use copilot
         // }
      }
      .navigationSplitViewStyle(.balanced) // .automatic will slide detail to the side, .prominent will make detail fullscreen, and other columns hover over
   }
   /**
    * Adds floating debug-text that informs the viewer about column-config, focused-column
    * - Fixme: ⚠️️ Add more doc
    * - Fixme: ⚠️️ try to avoid rebinding these? or move them into object scope etc?
    */
   var debugContainer: some View {
      DebugContainer(
         splitConfig: .init(get: { splitConfig }, set: { _ in }), // nav-split-view config
         sizeClass: .init(get: { sizeClass }, set: { _ in })
      )
   }
}
