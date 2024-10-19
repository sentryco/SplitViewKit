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
         sideBar: { (_ splitConfig: SplitConfig) in
            sideBarView(splitConfig: splitConfig) // Add sideBarView
         }, content: { (_ splitConfig: SplitConfig) in
            mainView(splitConfig: splitConfig) // Add mainView
         }, detail: { (_ splitConfig: SplitConfig) in
            detailView(splitConfig: splitConfig) // Add DetailView
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
    * - Parameter splitConfig: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   @ViewBuilder func sideBarView(splitConfig: SplitConfig) -> some View {
      SideBarView(
         selectedSideBarIndex: $selectedSideBarIndex
      )
      // - Fixme: ⚠️️ move the bellow into SideBarView scope?
      // - Fixme: ⚠️️ get rid of index, just use item. it has uuid etc
      // when we cahnge index, the selecteItem is set
      // when this state selectedMainItem changes, view are regenerated
         .onChange(of: selectedSideBarIndex) { _, _ in // Attach the on change code (I think this auto shows the last selected item etc, elaborate?)
             Swift.print("selectedSideBarIndex: \(selectedSideBarIndex)")
            switch sizeClass { 
            case .regular: // Only auto select mainitem if all columns are visible etc
               $selectedMainItem.wrappedValue = DataModel.dataModel.getMainModel( // Only do this, if not in compact, because it will open detail mode, and skip main if in compact mode etc
                  sideBarItemIndex: selectedSideBarIndex,
                  mainItemIndex: selectedMainIndex,
                  splitConfig: splitConfig // navsplitconfig binding
               ) // Set selected-item based on selected-indecies
            case .compact: // in compact
               splitConfig.preferredCompactColumn = .content // Move to content mode (⚠️️ this is an API bug fix for apples navigationsplitview)
            default:
              fatalError("⚠️️ not supported")
            }
         }
   }
   /**
    * Creates the center column view (aka mainview)
    * - Parameters:
    *   - splitConfig: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ Add doc
    */
   @ViewBuilder func mainView(splitConfig: SplitConfig) -> some View {
      let items: DataModels = DataModel.dataModel.getMainModels(
         sideBarItemIndex: selectedSideBarIndex,
         splitConfig: splitConfig
      )
      MainView(
         title: DataModel.dataModel[selectedSideBarIndex].title,
         selectedMainIndex: $selectedMainIndex,
         items: items,
         selectedItem: $selectedMainItem
      )
      // Attach navDest code to view
      // when selectedMainItem changes, this changes
      #if os(iOS)
      .navigationDestination(item: $selectedMainItem) { (_ item: DataModel) in
//         let _ = {
//            Swift.print("MainView.navigationDestination - selectedMainIndex: \(selectedMainIndex)")
//         }()
         detailView(splitConfig: splitConfig)
//         item.detailDestination()
         // - Fixme: ⚠️️ generate DetailView via model instead 👈
      }
      #elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
      .navigationDestination(isPresented: rebind) {
//          Swift.print("navigationDestination")
         detailView(splitConfig: splitConfig)
      }
      #endif
   }
   /**
    * There is also the option of using binding
    * - Fixme: ⚠️️ Make this a static func with selectionIndex as param?
    * - Parameter splitConfig: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func detailView(splitConfig: SplitConfig) -> some View {
      DataModel.getDetailView(
         sideBarData: DataModel.dataModel,
         sideBarItemIndex: selectedSideBarIndex,
         mainItemIndex: selectedMainIndex,
         splitConfig: splitConfig // navSplitConfig
      )
   }
}
