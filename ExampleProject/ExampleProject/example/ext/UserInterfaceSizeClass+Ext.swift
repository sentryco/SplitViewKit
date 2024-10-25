import SwiftUI
/**
 * - Fixme: ⚠️️ add description
 * - Note: The iPad will use regular for both portrait and landscape when it's running full screen
 * - Note: For SlideOver modes, it becomes compact for all sizes except for when the app is using 70% width in Landscape.
 */
extension UserInterfaceSizeClass {
   /**
    * - Note: 100% landscape -> regular
    * - Note: 70% landscape -> regular
    * - Note: 30% 50% -> Compact
    * - Fixme: ⚠️️ double check if portrait 100% is regular as well?
    */
   public var description: String {
      switch self {
      case .compact: "compact"
      case .regular: "regular"
      @unknown default:
         fatalError("⚠️️ not supported")
      }
   }
}
