import SwiftUI
import SplitViewKit
/**
 * Body
 * - Fixme: ⚠️️⚠️️⚠️️ Store selectOnIndexState for accounts and settings in this scope, so we can persist them etc
 * - Fixme: ⚠️️ Add solution to main app
 * - Fixme: ⚠️️ Does this work for mac? nope, why not?
 */
extension ExampleView {
   /**
    * Body
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ We need custom destination, we can maybe just add one navigation call to root of list if we can inject destination 👈 try some different things out
    */
   public var body: some View {
      SplitViewContainer(
         sideBar: { (_ splitConfig: SplitConfig) in /*(_ isSidebarShown: Binding<Bool>, _ preferredCompactColumn: Binding<NavigationSplitViewColumn>) in*/
            sideBarView(splitConfig: splitConfig) // Add sideBarView /*isSidebarShown: isSidebarShown, preferredCompactColumn: preferredCompactColumn*/
         }, content: { (_ splitConfig: SplitConfig) in /* (_ isSidebarShown: Binding<Bool>, _ preferredCompactColumn: Binding<NavigationSplitViewColumn>) in*/
            mainView(splitConfig: splitConfig) // Add mainView /*isSidebarShown: isSidebarShown, preferredCompactColumn: preferredCompactColumn*/
         }, detail: { (_ splitConfig: SplitConfig) in /*_ isDetailFullScreen: Binding<Bool>*/
            detailView(splitConfig: splitConfig/*isDetailFullScreen: isDetailFullScreen*/) // Add DetailView
         }
      )
   }
}
/**
 * View
 */
extension ExampleView {
   /**
    * Creates the sidebar view
    * - Note: The selection in the first column affects the second, and the selection in the second column affects the third
    * - Note: ref the apple bug: https://forums.developer.apple.com/forums/thread/708721
    * - Fixme: ⚠️️ We need to populate detail on sidebar change, this can be done by setting the initial state, at least if we use navlinkdata construct etc, see production code
    * - Fixme: ⚠️️ maybe setting detail index to nil in compactmode will avoid moving directly to detailview from sidebar?
    * - Parameter toggleColumn: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   @ViewBuilder func sideBarView(splitConfig: SplitConfig/*isSidebarShown: Binding<Bool>, preferredCompactColumn: Binding<NavigationSplitViewColumn>*/) -> some View {
      SideBarView(
         selectedSideBarIndex: $selectedSideBarIndex
      )
      // - Fixme: ⚠️️ move the bellow into SideBarView scope?
         // Attach the on change code (I think this auto shows the last selected item etc, elaborate?)
         .onChange(of: selectedSideBarIndex) { _, _ in // ⚠️️ debug
             Swift.print("selectedSideBarIndex: \(selectedSideBarIndex)")
            // Only do this, if not in compact, because it will open detail mode, and skip main if in compact mode etc
            // - Fixme: ⚠️️ use switch on the bellow
            if sizeClass == .regular { // Only auto select mainitem if all columns are visible etc
               $selectedMainItem.wrappedValue = DataModel.dataModel.getMainModel(
                  sideBarItemIndex: selectedSideBarIndex,
                  mainItemIndex: selectedMainIndex,
                  splitConfig: splitConfig
//                  isDetailFullScreen: .constant(false) // ⚠️️ not important
               ) // Set selected-item based on selected-indecies
            } else { // in compact
               splitConfig.preferredCompactColumn = .content // ⚠️️ this is an api bug fix
            }
         }
   }
   /**
    * Creates the center column view (aka mainview)
    * - Parameters:
    *   - toggleColumn: - Fixme: ⚠️️ Add doc
    *   - isSidebarShown: - Fixme: ⚠️️ add doc
    *   - preferredCompactColumn: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder func mainView(splitConfig: SplitConfig/*isSidebarShown: Binding<Bool>, preferredCompactColumn: Binding<NavigationSplitViewColumn>*/) -> some View {
      let items = DataModel.dataModel.getMainModels(
         sideBarItemIndex: selectedSideBarIndex,
         splitConfig: splitConfig
      )
      let view = MainView(
         items: items,
         selectedItem: $selectedMainItem
      )
      // Attach navDest code to view
      // - Fixme: ⚠️️ fix the bellow somehow. elaborate?
      // - Fixme: ⚠️️ add more doc for the bellow etc
      #if os(iOS)
      view.navigationDestination(item: $selectedMainItem) { (_ item: DataModel) in
         Swift.print("MainView.navigationDestination")
         return item.detailDestination()
      }
      #elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
      view.navigationDestination(isPresented: rebind) {
         // Swift.print("navigationDestination")
         $selectedItem.wrappedValue?.detailDestination()
      }
      #endif
   }
   /**
    * There is also the option of using binding
    * - Fixme: ⚠️️ Make this a static func with selectionIndex as param?
    * - Parameter isDetailFullScreen: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   @ViewBuilder func detailView(splitConfig: SplitConfig) -> some View {
      // - Fixme: ⚠️️ add type to bellow
      let model = DataModel.dataModel.getMainModel(
         sideBarItemIndex: selectedSideBarIndex,
         mainItemIndex: selectedMainIndex,
         splitConfig: splitConfig
         // isDetailFullScreen: isDetailFullScreen
      )
      model.detailDestination()
   }
}

 
