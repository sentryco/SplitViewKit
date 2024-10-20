import SwiftUI
import SplitViewKit
/**
 * Body
 * - Fixme: ⚠️️ Does this work for mac? nope, why not? try later
 */
extension ExampleView {
   /**
    * Body
    * - Fixme: ⚠️️ sizeClass might not need to be a binding
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ We need custom destination, we can maybe just add one navigation call to root of list if we can inject destination 👈 try some different things out
    */
   public var body: some View {
      SplitViewContainer(
         sideBar: { (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) in
            sideBarView(splitConfig: splitConfig, sizeClass: sizeClass) // Add sideBarView
         }, content: { (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) in
            mainView(splitConfig: splitConfig, sizeClass: sizeClass) // Add mainView
         }, detail: { (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) in
            detailView(splitConfig: splitConfig, sizeClass: sizeClass) // Add DetailView
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
    * - Fixme: ⚠️️ Maybe setting detail index to nil in compactmode will avoid moving directly to detailview from sidebar?
    * - Fixme: ⚠️️ Get rid of index, just use item. it has uuid etc
    * - Fixme: ⚠️️ Move the bellow into SideBarView scope?
    * - Fixme: ⚠️️ Move onChange to own method?
    * - Fixme: ⚠️️ Add more doc
    * - Parameters:
    *   - splitConfig: - Fixme: ⚠️️ add doc
    *   - sizeClass: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   @ViewBuilder func sideBarView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      SideBarView(
         selectedSideBarIndex: $selectedSideBarIndex, // selected sidebar index binding
         sizeClass: sizeClass,
         splitConfig: splitConfig
      )
      // - Fixme: ⚠️️ make handleSideBarChange ?
      .onChange(of: selectedSideBarIndex) { handleSideBarChange(splitConfig, sizeClass) }
   }
   
   /**
    * Creates the center column view (aka mainview)
    * - Fixme: ⚠️️ add doc
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
      // - Fixme: ⚠️️ move to handleMainSelectionStateChange?
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
    * - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - splitConfig: - Fixme: ⚠️️ add doc
    *   - sizeClass: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func detailView(splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {
      DetailView.initiate( // Generate DetailView via model
         sideBarData: DataModel.dataModel,
         sideBarItemIndex: selectedSideBarIndex,
         mainItemIndex: selectedMainIndex,
         splitConfig: splitConfig, // navSplitConfig
         sizeClass: sizeClass
      )
   }
}
