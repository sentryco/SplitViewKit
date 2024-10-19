#if DEBUG
import Foundation
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
#endif
