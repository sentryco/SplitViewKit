import SwiftUI
import SplitViewKit
/**
 * Getters - SideBarData
 */
extension SideBarData {
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ Add doc via copilot
    *   - isDetailFullScreen: - Fixme: ⚠️️ Remove this somehow
    * - Returns: - Fixme: ⚠️️ Add doc via copilot
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
    * - Fixme: ⚠️️ use safeArray here, and return optional, add fileprivate helper?
    */
   func getMainModel(sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> DataModel { /*isDetailFullScreen: Binding<Bool>*/
      .init(
         text: self[sideBarItemIndex].content[mainItemIndex].title,
         color: .clear // .red
      )
   }
}
