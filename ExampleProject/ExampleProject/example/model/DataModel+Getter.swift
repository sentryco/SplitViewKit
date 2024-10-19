import SwiftUI
import HybridColor
/**
 * Getters
 */
extension DataModel.SideBarData {
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameter sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    * - Parameter isDetailFullScreen: - Fixme: ⚠️️ remove this somehow
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    * - Fixme: ⚠️️ rename to detailToggle
    */
   func getMainModels(sideBarItemIndex: Int, splitConfig: SplitConfig) -> [DataModel] { // isDetailFullScreen: Binding<Bool>
      self.enumerated().map { (_ offset: Int, _ element: Element) in
         getMainModel(
            sideBarItemIndex: sideBarItemIndex,
            mainItemIndex: offset,
            splitConfig: splitConfig
//            isDetailFullScreen: isDetailFullScreen
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
    * - Fixme: ⚠️️ rename to detailToggle
    */
   func getMainModel(sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> DataModel { /*isDetailFullScreen: Binding<Bool>*/
      .init(
         // - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
         text: self[sideBarItemIndex].content[mainItemIndex].title,
         destination: {
            AnyView(
               getDetailView(
                  sideBarItemIndex: sideBarItemIndex,
                  mainItemIndex: mainItemIndex,
                  splitConfig: splitConfig/*isDetailFullScreen: isDetailFullScreen*/
               )
            )
         },
         color: .clear // .red
      )
   }
   /**
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ Move somewhere else?
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - mainItemIndex: - Fixme: ⚠️️ add doc via copilot
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    * - Fixme: ⚠️️ rename to detailToggle
    */
   func getDetailView(sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
      let detailModel = self[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: detailModel.title//,
         /*isDetailFullScreen: isDetailFullScreen*/
      ) { // (mainRowModel: mainRowModel) // detailView(mainRowModel: mainRowModel[i]) //                Text("it works: \(i)")
         // detail content
         // - Fixme: ⚠️️ move into a vstack ?
         VStack.init(spacing: 0) {
            ForEach(detailModel.content, id: \.self) { (_ title: String) in
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
