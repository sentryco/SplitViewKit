import SwiftUI

extension UserInterfaceSizeClass {
   /**
    * - Note: 70% landscape -> regular
    * - Note: 50% -> Compact
    */
   var description: String {
      switch self {
      case .compact: "compact"
      case .regular: "regular"
      @unknown default:
         fatalError("⚠️️ not supported")
      }
   }
}
/**
 * Helper
 */
extension UserInterfaceSizeClass {
   /**
    * - Note: The way we can detect landscape_70_percentage_mode is if: sizeClass == .regular && orientation == .landscape && winWidth < appWidth
    * - Note: if 70% mode. use double or adjust column sizes. get is70percentage bool to work etc
    */
   func is_landscape_70_percentage_mode(winWidth: CGFloat) -> Bool {
      let orientation = getDeviceOrientation()
      let screenWidth = UIScreen.main.bounds.width
      return self == .regular && orientation.isLandscape && winWidth < screenWidth
   }
}
