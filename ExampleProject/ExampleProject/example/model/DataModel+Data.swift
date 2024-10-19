import SwiftUI
/**
 * Typealias
 */
extension DataModel {
   // - Fixme: ⚠️️ add doc
   typealias SideBarModel = (title: String, content: MainData)
   /**
    * - Note: We keep these in the MainModel scope
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ rename to ...array
    */
   typealias SideBarData = [SideBarModel]
   // - Fixme: ⚠️️ add doc
   typealias MainModel = (title: String, content: DetailData)
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ rename to ...array
    */
   typealias MainData = [MainModel]
   /**
    * - Fixme: ⚠️️ add doc
    */
   typealias DetailData = [String]
}
/**
 * Const
 */
extension DataModel {
   /**
    * Model structure
    * - Note: Sorted dictionary based on array of tuples
    * - Fixme: ⚠️️ add more
    */
   static let dataModel: SideBarData = [
      ("Accounts", [// sidebar-item
         (
            "account one", // main-item
            [
               "acc1" // detail-item
            ]
         ),
         (
            "account two",
            [
               "acc2"
            ]
         )
      ]),
      ("Settings", [
         (
            "setting 1", 
            [
               "a",
               "b",
               "c"
            ]
         ),
         (
            "setting 2", 
            [
               "1",
               "2",
               "3"
            ]
         )
      ])
   ]
}
