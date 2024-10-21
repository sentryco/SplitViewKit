import SwiftUI
/**
 * Used for SideBar and MainColumn items
 * - Abstract: This model serves as a fundamental unit for representing and managing navigational and display data within the sidebar and main column of the application. It encapsulates the essential attributes required for identifying and rendering each item uniquely.
 * - Description: Represents a model for debugging account information in the application.
 *                It includes properties for unique identification, display text,
 *                navigation destination, and color.
 * - Fixme: ⚠️️ should we make this identifiable as well or?
 * - Fixme: ⚠️️ Rename MainModel, maybe
 * - Fixme: ⚠️️⚠️️ Use NavLinkData instead of this? elaborate?
 * - Fixme: ⚠️️ Maybe structure sidebar model like this: ref: https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/
 */
 struct DataModel: Hashable { // hashable is needed for the presentNavigation value to work
   /**
    * UUID is needed for hashable
    * - Description: A universally unique identifier (UUID) used to uniquely identify each instance of the `DataModel`.
    */
    let uuid: UUID = .init()
   /**
    * - Description: The text displayed for the data model, representing the title or label of the item.
    * - Fixme: ⚠️️ This is the title I suppose? 👈
    */
    let text: String
   /**
    * - Description: The color used to style the text of the data model, enhancing its visual distinction.
    * - Fixme: ⚠️️⚠️️⚠️️ remove this, not in use
    */
    let color: Color
}
/**
 * Hashable implementation
 */
extension DataModel {
   /**
    * - Description: Compares two `DataModel` instances for equality based on their UUID.
    */
   public static func == (lhs: DataModel, rhs: DataModel) -> Bool {
      lhs.uuid == rhs.uuid
   }
   /**
    * Implementing hash(into:) for conformance to Hashable
    * - Description: Combines the UUID of the `DataModel` into the hasher to ensure uniqueness.
    */
   public func hash(into hasher: inout Hasher) {
      hasher.combine(uuid)
   }
}
/**
 * - Description: Represents an array of `DataModel`, used to structure the data models in the application.
 */
internal typealias DataModels = [DataModel]
