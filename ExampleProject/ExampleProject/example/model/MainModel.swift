import Foundation
/**
 * - Description: Represents a main model, which is a container for a title and detailed content.
 */
struct MainModel {
   /**
    * The title of the main model, used as a heading or label.
    */
   let title: String
   /**
    * The detailed content of the main model, which holds the primary data displayed.
    */
   let content: DetailData
}
/**
 * - Description: Represents an array of `MainModel`, used to structure
 *                the main-data in the application.
 * - Fixme: ⚠️️ Rename to ...array
 */
typealias MainData = [MainModel]
