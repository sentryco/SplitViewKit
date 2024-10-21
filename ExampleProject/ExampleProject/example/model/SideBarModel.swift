import Foundation
import SplitViewKit
/**
 * Represents the model for the sidebar in the application, containing a title and associated main content.
 */
struct SideBarModel {
   /**
    * The title of the sidebar, used as a heading or label.
    */
   let title: String
   /**
    * The main content of the sidebar, which holds the primary data displayed in the sidebar.
    */
   let content: MainData
}
/**
 * Getters
 */
extension SideBarData {
   /**
    * Retrieves the main models for the sidebar.
    * - Parameters:
    *   - sideBarItemIndex: The index of the sidebar item to retrieve the main models for.
    *   - splitConfig: The configuration for the split view.
    * - Returns: An array of DataModel objects representing the main content of the sidebar.
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
    * Retrieves a specific main model from the sidebar data based on the provided indices.
    * - Parameters:
    *   - sideBarItemIndex: The index of the sidebar item from which to retrieve the main model.
    *   - mainItemIndex: The index of the main item within the sidebar item to retrieve.
    *   - splitConfig: The configuration for the split view, affecting how the view adapts to different screen sizes and orientations.
    * - Returns: An optional DataModel if indices are within the range, otherwise nil.
    */
   func getMainModel(sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig) -> DataModel { /*isDetailFullScreen: Binding<Bool>*/
      .init(
         text: self[sideBarItemIndex].content[mainItemIndex].title//,
//         color: .clear
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
    * - Description: Represents a static dictionary that maps sidebar titles to their respective content models, facilitating easy access and management of sidebar data.
    * - Fixme: ⚠️️ Use structs here?
    * - Fixme: ⚠️️ Also maybe add more interesting content to detail?
    */
   static let dataModel: SideBarData = [accounts, settings]
   /**
    * Accounts
    * - Description: Represents the "Accounts" section in the sidebar, containing individual account information.
    */
   static fileprivate let accounts: SideBarModel = {
      SideBarModel(title: "Accounts", content: [ // sidebar-item
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
         )
      ])
   }()
   /**
    * Settings
    * - Description: Represents the "Settings" section in the sidebar, containing settings information.
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
 * - Description: This typealias represents an array of `SideBarModel` used to structure the sidebar data in the application.
 * - Fixme: ⚠️️ rename to ...array
 */
typealias SideBarData = [SideBarModel]
