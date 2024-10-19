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
   static func getDetailView(sideBarData: DataModel.SideBarData, sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
      let mainModel: DataModel.MainModel = sideBarData[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: mainModel.title//,
         /*isDetailFullScreen: isDetailFullScreen*/
      ) { // (mainRowModel: mainRowModel) // detailView(mainRowModel: mainRowModel[i]) //                Text("it works: \(i)")
         // detail content
         // - Fixme: ⚠️️ move into a vstack ?
         VStack(spacing: 0) {
            ForEach(mainModel.content, id: \.self) { (_ title: String) in
               HStack {
                  Text(title)
                     .foregroundStyle(Color.whiteOrBlack.opacity(0.8))
                     .font(.system(size: 24, weight: .regular))
                  Spacer()
               }
               .padding(.horizontal) // adds left and right padding
            }
         }
         .padding(.vertical, 12)
      }
      return detailView
      // - Fixme: ⚠️️ remove the bellow, do param drilling instead
         .environmentObject(splitConfig) // we have to reapply the environmentobject when we create new detailviews etc
   }
}
/**
 * Getters - DataModel.SideBarData
 */
extension DataModel.SideBarData {
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - isDetailFullScreen: - Fixme: ⚠️️ remove this somehow
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    */
   func getMainModels(sideBarItemIndex: Int, splitConfig: SplitConfig) -> DataModels {
      self.enumerated().map { (_ offset: Int, _ element: Element) in
         getMainModel(
            sideBarItemIndex: sideBarItemIndex,
            mainItemIndex: offset,
            splitConfig: splitConfig // navsplitconfig
         )
      }
   }
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - mainItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - isDetailFullScreen: - Fixme: ⚠️️ remove this
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    */
   func getMainModel(sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> DataModel { /*isDetailFullScreen: Binding<Bool>*/
      .init(
         // - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
         text: self[sideBarItemIndex].content[mainItemIndex].title,
         //         detailDestination: {
         //            AnyView(
         //               getDetailView(
         //                  sideBarItemIndex: sideBarItemIndex,
         //                  mainItemIndex: mainItemIndex,
         //                  splitConfig: splitConfig/*isDetailFullScreen: isDetailFullScreen*/
         //               )
         //            )
         //         },
         color: .clear // .red
      )
   }
}
