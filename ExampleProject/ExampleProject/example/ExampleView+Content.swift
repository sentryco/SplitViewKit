import SwiftUI
import SplitViewKit
/**
 * Body
 */
extension ExampleView {
   /**
    * Body
    * - Description: This property represents the visual structure of the
    *                ExampleView, organizing it into a three-column layout with
    *                sidebar, main content, and detail views. It utilizes the
    *                SplitViewContainer to manage these sections dynamically
    *                based on the current environment settings such as size class
    *                and device orientation.
    */
   public var body: some View {
      SplitViewWrapper(
         sideBar: { splitConfig, sizeClass in
            // Provides the sidebar view configured with the current split view configuration and size class.
            sideBarView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, content: { splitConfig, sizeClass in
            // Provides the main content view configured with the current split view configuration and size class.
            mainView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, detail: { splitConfig, sizeClass in
            // Provides the detail view configured with the current split view configuration and size class.
            detailView(splitConfig: splitConfig, sizeClass: sizeClass)
         }, overlay: { splitConfig, sizeClass in
            // Provides a floating debug view configured with the current split view configuration and size class.
            debugContainer(splitConfig: splitConfig, sizeClass: sizeClass)
         },
         columnWidth: CustomColumnWidth() // Specifies custom widths for the columns in the split view.
      )
   }
}
/**
 * View
 */
extension ExampleView {
   /**
    * Creates the sidebar view
    * - Description: This method constructs the sidebar view for the
    *                application, which allows users to navigate between
    *                different sections. The sidebar adapts its behavior and
    *                layout based on the current size class and the split view
    *                configuration provided.
    * - Note: The selection in the first column affects the second, and the selection in the second column affects the third
    * - Note: Ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Fixme: ⚠️️ Consider moving the event-handler into SideBarView scope? mainview should update when we change selectedSideBarIndex etc
    * - Parameters:
    *   - splitConfig: The configuration object for the split view, which determines the layout and interaction behavior of the split view components.
    *   - sizeClass: A binding to the current size class of the user interface, which may affect layout decisions and adaptive behaviors.
    * - Returns: A view that represents the sidebar of the application, configured according to the provided split configuration and size class.
    */
   @ViewBuilder func sideBarView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      SideBarView(
         selectedSideBarIndex: $selectedSideBarIndex, // Selected-sidebar-index binding
         sizeClass: sizeClass,
         splitConfig: splitConfig
      )
      .onChange(of: selectedSideBarIndex) { oldIndex, newIndex in // Responds to changes in the selected sidebar index to update dependent views or states.
         handleSideBarChange(splitConfig, sizeClass)
      } // Forward state change to handleSideBarChange
   }
   /**
    * Creates the center column view (aka mainview)
    * - Description: This function constructs the main view of the application,
    *                which displays a list of items based on the selected sidebar
    *                index. It dynamically updates the content based on user
    *                interactions with the sidebar.
    * - Fixme: ⚠️️ Move navigationDestination to a handleMainSelectionStateChange method?
    * - Parameters:
    *   - splitConfig: The configuration object for the split view, which determines the layout and interaction behavior of the split view components.
    *   - sizeClass: A binding to the current size class of the user interface, which may affect layout decisions and adaptive behaviors.
    * - Returns: A view that represents the main content area of the application, configured according to the provided split configuration and size class.
    */
   @ViewBuilder func mainView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>/*UserInterfaceSizeClass? */ ) -> some View {
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
      // - Fixme: ⚠️️ Move this into main body maybe? if it makes sense?
      #if os(iOS)
      .navigationDestination(item: $selectedMainItem) { (_ item: DataModel) in // Attach navDest code to view, when selectedMainItem changes, this changes
         detailView(splitConfig: splitConfig, sizeClass: sizeClass)
      }
      #elseif os(macOS) // ⚠️️ Hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
      .navigationDestination(isPresented: rebind) {
         detailView(splitConfig: splitConfig, sizeClass: sizeClass)
      }
      #endif
   }
   /**
    * There is also the option of using binding
    * - Description: This function generates the detail view for the selected
    *                item. It uses the current sidebar and main item indices to
    *                fetch the appropriate data and configures the view based on
    *                the current split configuration and size class.
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
         splitConfig: splitConfig,
         sizeClass: sizeClass
      )
   }
   /**
    * Adds floating debug-text that informs the viewer about column-config, focused-column
    * - Description: Displays a floating debug container that provides real-time
    *                information about the current configuration of the navigation
    *                split view, including the focused column and column
    *                configuration settings.
    * - Parameters:
    *   - splitConfig: The configuration object for the split view, which determines the layout and interaction behavior of the split view components.
    *   - sizeClass: A binding to the current size class of the user interface, which may affect layout decisions and adaptive behaviors.
    * - Returns: A view that displays debugging information about the current configuration of the navigation split view, including the focused column and column configuration settings.
    */
   func debugContainer(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      DebugContainer(
         splitConfig: splitConfig, // nav-split-view config
         sizeClass: sizeClass // Passes the current user interface size class to the debug container.
      )
   }
}
