import SwiftUI
/**
 * Used for SideBar and MainColumn items
 * - Fixme: ⚠️️ Add abstract
 * - Fixme: ⚠️️ should we make this identifiable as well or?
 * - Fixme: ⚠️️ Rename MainModel, maybe
 * - Fixme: ⚠️️⚠️️ Use NavLinkData instead of this? elaborate?
 * - Fixme: ⚠️️ maybe structure sidebar model like this: ref: https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/
 * - Description: Represents a model for debugging account information in the application.
 *                It includes properties for unique identification, display text,
 *                navigation destination, and color.
 */
 struct DataModel: Hashable { // hashable is needed for the presentNavigation value to work
   /**
    * UUID is needed for hashable
    */
    let uuid: UUID = .init()
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ This is the title I suppose? 👈
    */
    let text: String
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ remove this, not in use
    */
    let color: Color
}
/**
 * Hashable implementation
 */
extension DataModel {
   /**
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ Move to ext?
    */
   public static func == (lhs: DataModel, rhs: DataModel) -> Bool {
      lhs.uuid == rhs.uuid
   }
   /**
    * Implementing hash(into:) for conformance to Hashable
    * - Fixme: ⚠️️ Move to ext
    */
   public func hash(into hasher: inout Hasher) {
      hasher.combine(uuid)
   }
}
/**
 * - Fixme: ⚠️️ move to own file etc?
 */
internal typealias DataModels = [DataModel]
