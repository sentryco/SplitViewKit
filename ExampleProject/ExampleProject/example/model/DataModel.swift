import SwiftUI
/**
 * Used for SideBar and MainColumn items
 * - Abstract: This model serves as a fundamental unit for representing and managing navigational and display data within the sidebar and main column of the application. It encapsulates the essential attributes required for identifying and rendering each item uniquely.
 * - Description: Represents a model for debugging account information in the application.
 *                It includes properties for unique identification, display text,
 *                navigation destination, and color.
 * - Note: Alternative name: `MainModel`
 * - Note: Hashable is needed for the presentNavigation value to work
 * - Fixme: ⚠️️ Should we make this identifiable as well or?
 * - Fixme: ⚠️️ Maybe structure sidebar model like this: ref: https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/
 * - Fixme: ⚠️️ A better model: https://medium.com/@jpmtech/swiftui-navigationsplitview-30ce87b5de03
 * - Fixme: ⚠️️ Remove mainIndex -> the "main index" and "main model" uuid does duplicate index keeping
 */
 struct DataModel: Hashable {
   /**
    * UUID is needed for hashable
    * - Description: A universally unique identifier (UUID) used to uniquely identify each instance of the `DataModel`.
    */
    let uuid: UUID = .init()
   /**
    * - Description: The text displayed for the data model, representing the title or label of the item.
    * - Fixme: ⚠️️ rename to title?
    */
    let text: String
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
    * - Description: Combines the UUID of the `DataModel` into the hasher
    *                to ensure uniqueness.
    */
   public func hash(into hasher: inout Hasher) {
      hasher.combine(uuid)
   }
}
/**
 * - Description: Represents an array of `DataModel`, used to structure
 *                the data models in the application.
 */
internal typealias DataModels = [DataModel]
