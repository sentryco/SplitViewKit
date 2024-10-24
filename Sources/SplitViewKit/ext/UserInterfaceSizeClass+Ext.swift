import SwiftUI
/**
 * - Note: The iPad will use regular for both portrait and landscape when it's running full screen
 * - Note: For SlideOver modes, it becomes compact for all sizes except for when the app is using 70% width in Landscape.
 */
extension UserInterfaceSizeClass {
   /**
    * - Note: 70% landscape -> regular
    * - Note: 50% -> Compact
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
/**
 * Optional extension
 */
extension Optional where Wrapped == UserInterfaceSizeClass {
   /**
    * Convenient rebinder (Environtment -> Binding)
    * - Note: We rebind sizeClass because environment variables Because you have to apply envirotnment variables to views that are regenerated down the hirarchy. So param drilling is easier to understand etc. less abstract
    * - Note: We removed environmentObject and now do param drill instead, param-drill the sizeClass and splitConfig, environment variables is confusing if its not passed correctly, it can jump to compact in the wrong scope where it should be regular etc, and doesnt attach if views are replaced, like detailview etc
    * - Note: It seem very tricky to make horizontalSizeClass a two way binding. @Bindable seems to be the best way. But it doesnt work on this environment variable for some reason. There could be a way. update when discovered. for now. we sync on onChange.
    * - Fixme: ⚠️️ Add description
    */
   var reBind: Binding<Self> {
      .init(get: { self }, set: { _ in })
   }
}
#if os(iOS)
/**
 * Helper
 */
extension UserInterfaceSizeClass {
   /**
    * - Note: The way we can detect landscape_70_percentage_mode is if: sizeClass == .regular && orientation == .landscape && winWidth < appWidth
    * - Note: if 70% mode. use double or adjust column sizes. get is70percentage bool to work etc
    * - Parameter winWidth: The width of the window in points.
    * - Returns: A Boolean indicating whether the device is in a 70% landscape mode.
    */
   func is_landscape_70_percentage_mode(winWidth: CGFloat) -> Bool {
      let orientation = getDeviceOrientation()
      let screenWidth = UIScreen.main.bounds.width
      return self == .regular && orientation.isLandscape && winWidth < screenWidth
   }
}
#endif
