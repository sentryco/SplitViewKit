import SwiftUI
import HybridColor
import SplitViewKit
/**
 * Getters - DataModel
 */
extension DataModel {
   /**
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ Move somewhere else?
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - mainItemIndex: - Fixme: ⚠️️ add doc via copilot
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    */
   static func getDetailView(sideBarData: SideBarData, sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
      let mainModel: MainModel = sideBarData[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: mainModel.title,
         detailData: mainModel.content//,
         /*isDetailFullScreen: isDetailFullScreen*/
      ) 
//      { // (mainRowModel: mainRowModel) // detailView(mainRowModel: mainRowModel[i]) //                Text("it works: \(i)")
         // detail content
         // - Fixme: ⚠️️ move into a vstack ?
         
//      }
      return detailView
      // - Fixme: ⚠️️ remove the bellow, do param drilling instead
         .environmentObject(splitConfig) // we have to reapply the environmentobject when we create new detailviews etc
   }
}
