#if DEBUG
import SwiftUI
/**
 * Model
 * - Fixme: ⚠️️ add abstract
 * - Fixme: ⚠️️ should we make this identifiable as well or?
 * - Fixme: ⚠️️ Rename MainModel
 * - Fixme: ⚠️️⚠️️ Use NavLinkData instead of this? elaborate?
 * - Description: Represents a model for debugging account information in the application.
 *                It includes properties for unique identification, display text,
 *                navigation destination, and color.
 */
public struct DataModel: Hashable { // hashable is needed for the presentNavigation value to work
   /**
    * UUID is needed for hashable
    */
   public let uuid: UUID = .init()
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ This is the title I suppose?
    */
   public let text: String
   /**
    * - Fixme: ⚠️️ We can probably make this some View or something generic? ask copilot?
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to detailDestination?
    */
   public let destination: () -> AnyView
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    */
   public let color: Color
}
#endif

// - Fixme: ⚠️️ maybe structure sidebar model like this: ref: https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/
//enum SideBarItem: String, Identifiable, CaseIterable {
//   var id: String { rawValue }
//   
//   case users
//   case animals
//   case food
//}

//enum DetailItem: Hashable {
//   case user(DDUser)
//   case animal(DDAnimal)
//   case food(DDFood)
//}
