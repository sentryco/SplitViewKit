import Foundation
import SplitViewKit
/**
 * - Fixme: ⚠️️ add doc
 */
struct SideBarModel {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let title: String
   /**
    * - Fixme: ⚠️️ add doc
    */
   let content: MainData
}
/**
 * Getters
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
/**
 * Const
 */
extension DataModel {
   /**
    * Model structure
    * - Note: Sorted dictionary based on array of tuples
    * - Fixme: ⚠️️ Add more
    * - Fixme: ⚠️️ Use structs here
    * - Fixme: ⚠️️ Also maybe add more interesting content to detail?
    */
   static let dataModel: SideBarData = [accounts, settings]
   /**
    * Accounts
    */
   static fileprivate let accounts: SideBarModel = {
      SideBarModel(title: "Accounts", content: [// sidebar-item
         MainModel(
            title: "Account one", // main-item
            content: [
               "User A" // detail-item
            ]
         ),
         MainModel(
            title: "Account two",
            content: [
               "User B"
            ]
         )                                     ])
   }()
   /**
    * Settings
    */
   static fileprivate let settings: SideBarModel = {
      SideBarModel(title: "Settings", content: [
         MainModel(
            title: "Setting 1",
            content: [
               "a",
               "b",
               "c"
            ]
         ),
         MainModel(
            title: "Setting 2",
            content: [
               "1",
               "2",
               "3"
            ]
         )
      ])
   }()
}
/**
 * - Note: We keep these in the MainModel scope
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ rename to ...array
 */
typealias SideBarData = [SideBarModel]
