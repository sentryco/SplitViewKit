import SwiftUI
/**
 * Const
 */
extension DataModel {
   /**
    * Model structure
    * - Note: Sorted dictionary based on array of tuples
    * - Fixme: ⚠️️ add more
    * - Fixme: ⚠️️ use structs here
    */
   static let dataModel: SideBarData = [accounts, settings]
   /**
    * Accounts
    */
   static fileprivate let accounts: SideBarModel = {
      SideBarModel(title: "Accounts", content: [// sidebar-item
         MainModel(
            title: "account one", // main-item
            content: [
               "acc1" // detail-item
            ]
         ),
         MainModel(
            title: "account two",
            content: [
               "acc2"
            ]
         )
      ])
   }()
   /**
    * Settings
    */
   static fileprivate let settings: SideBarModel = {
      SideBarModel(title: "Settings", content: [
         MainModel(
            title: "setting 1",
            content: [
               "a",
               "b",
               "c"
            ]
         ),
         MainModel(
            title: "setting 2",
            content: [
               "1",
               "2",
               "3"
            ]
         )
      ])
   }()
}
