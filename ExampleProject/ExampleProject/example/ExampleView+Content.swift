import SwiftUI
import SplitViewKit
/**
 * Body
 * - Fixme: ⚠️️ Does this work for mac? nope, why not? try later
 */
extension ExampleView {
   /**
    * Body
    * - Description: This property represents the visual structure of the ExampleView, organizing it into a three-column layout with sidebar, main content, and detail views. It utilizes the SplitViewContainer to manage these sections dynamically based on the current environment settings such as size class and device orientation.
    * - Fixme: ⚠️️ sizeClass might not need to be a binding
    * - Fixme: ⚠️️ We need custom destination, we can maybe just add one navigation call to root of list if we can inject destination 👈 try some different things out
    */
   public var body: some View {
      SplitViewContainer(
         sideBar: { splitConfig, sizeClass in
            sideBarView(splitConfig: splitConfig, sizeClass: sizeClass) // Add sideBarView
         }, content: { splitConfig, sizeClass in
            mainView(splitConfig: splitConfig, sizeClass: sizeClass) // Add mainView
         }, detail: { splitConfig, sizeClass in
            detailView(splitConfig: splitConfig, sizeClass: sizeClass) // Add DetailView
         },
         columnWidth: CustomColumnWidth(),
         isDebug: true // Adds floating debug analytics
      )
   }
}
/**
 * View
 */
extension ExampleView {
   /**
    * Creates the sidebar view
    * - Description: This method constructs the sidebar view for the application, which allows users to navigate between different sections. The sidebar adapts its behavior and layout based on the current size class and the split view configuration provided.
    * - Note: The selection in the first column affects the second, and the selection in the second column affects the third
    * - Note: ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Fixme: ⚠️️ We need to populate detail on sidebar change, this can be done by setting the initial state, at least if we use navlinkdata construct etc, see production code
    * - Fixme: ⚠️️ Maybe setting detail index to nil in compactmode will avoid moving directly to detailview from sidebar?
    * - Fixme: ⚠️️ Remove index, just use item. it has uuid etc.
    * - Fixme: ⚠️️ Move the event handler into SideBarView scope? mainview should update when we change selectedSideBarIndex etc
    * - Parameters:
    *   - splitConfig: The configuration object for the split view, which determines the layout and interaction behavior of the split view components.
    *   - sizeClass: A binding to the current size class of the user interface, which may affect layout decisions and adaptive behaviors.
    * - Returns: A view that represents the sidebar of the application, configured according to the provided split configuration and size class.
    */
   @ViewBuilder func sideBarView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      SideBarView(
         selectedSideBarIndex: $selectedSideBarIndex, // Selected sidebar index binding
         sizeClass: sizeClass,
         splitConfig: splitConfig
      )
      // - Fixme: ⚠️️ We can also try to move it into sideBar body i think
      #if os(iOS) // For iPhone and iPad
      .toolbar(removing: .sidebarToggle) // this is available from ios 17 I think
      .navigationBarHidden(true) // Removes the top default nav-bar
      #elseif os(macOS) // For macOS apps
      .toolbar(removing: .sidebarToggle) // Hides the sidebar toggle for macos
      .scrollIndicators(.hidden) // Important, or else scrollbar is shown when resizing etc
      #endif
      .onChange(of: selectedSideBarIndex) {
         handleSideBarChange(splitConfig, sizeClass)
      } // Forward state change to handleSideBarChange
   }
   /**
    * Creates the center column view (aka mainview)
    * - Description: This function constructs the main view of the application, which displays a list of items based on the selected sidebar index. It dynamically updates the content based on user interactions with the sidebar.
    * - Fixme: ⚠️️ Move navigationDestination to handleMainSelectionStateChange?
    * - Parameters:
    *   - splitConfig: - Fixme: ⚠️️ add doc
    *   - sizeClass: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder func mainView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      let items: DataModels = DataModel.dataModel.getMainModels(
         sideBarItemIndex: selectedSideBarIndex,
         splitConfig: splitConfig
      )
      MainView(
         title: DataModel.dataModel[selectedSideBarIndex].title,
         selectedMainIndex: $selectedMainIndex,
         items: items,
         selectedItem: $selectedMainItem, 
         splitConfig: splitConfig, 
         sizeClass: sizeClass
      )
      // - Fixme: ⚠️️ Move this into main body
      #if os(iOS)
      .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
      .toolbar(removing: .sidebarToggle) // this available from ios 17 I think, might only be needed in sidebar? scope? probably
      #elseif os(macOS)
      .ignoresSafeArea(.all) // Ignores all safe areas
      #endif
      // - Fixme: ⚠️️ Move this into main body maybe?
      #if os(iOS)
      .navigationDestination(item: $selectedMainItem) { (_ item: DataModel) in // Attach navDest code to view, when selectedMainItem changes, this changes
         detailView(splitConfig: splitConfig, sizeClass: sizeClass)
      }
      #elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
      .navigationDestination(isPresented: rebind) {
         detailView(splitConfig: splitConfig, sizeClass: sizeClass)
      }
      #endif
   }
   /**
    * There is also the option of using binding
    * - Fixme: ⚠️️ Make this a static func with selectionIndex as param?
    * - Description: This function generates the detail view for the selected item. It uses the current sidebar and main item indices to fetch the appropriate data and configures the view based on the current split configuration and size class.
    * - Parameters:
    *   - splitConfig: The configuration for the split view, controlling the layout and behavior.
    *   - sizeClass: A binding to the current size class of the user interface, which may affect layout decisions.
    * - Returns: Returns a view configured as a detail view for the selected item, based on the current split configuration and size class.
    */
   func detailView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      DetailView.initiate( // Generate DetailView via model
         sideBarData: DataModel.dataModel,
         sideBarItemIndex: selectedSideBarIndex,
         mainItemIndex: selectedMainIndex,
         splitConfig: splitConfig, // navSplitConfig
         sizeClass: sizeClass
      )
      // - Fixme: ⚠️️ try to move this into body scope of detailview etc?
      #if os(iOS)
      .toolbar(.hidden, for: .navigationBar) // Removes the top default nav-bar
      #elseif os(macOS)
      // This modifier allows the view to extend into the safe area on all sides, effectively ignoring the safe area insets. This is useful when you want your view to take up the entire screen, including under the status bar, navigation bar, and tab bar.
      .edgesIgnoringSafeArea(.all)
      #endif
   }
}
