import SwiftUI
/**
 * Optional extension
 */
extension Optional where Wrapped == UserInterfaceSizeClass {
   /**
    * Convenient rebinder (Environtment -> Binding)
    * - Abstract: Provides a binding to the optional `UserInterfaceSizeClass`, enabling dynamic updates to the UI based on size class changes.
    * - Description: Provides a binding to the optional `UserInterfaceSizeClass`
    *                to facilitate the propagation of size class changes through
    *                the view hierarchy.
    * - Note: We rebind sizeClass because environment variables Because you have to apply envirotnment variables to views that are regenerated down the hirarchy. So param drilling is easier to understand etc. less abstract. We removed environmentObject and now do param drill instead, param-drill the sizeClass and splitConfig, environment variables is confusing if its not passed correctly, it can jump to compact in the wrong scope where it should be regular etc, and doesnt attach if views are replaced, like detailview etc. sizeClass needs to be a binding or else UI doesn't react on changes
    * - Note: It seem very tricky to make horizontalSizeClass a two way binding. @Bindable seems to be the best way. But it doesnt work on this environment variable for some reason. There could be a way. update when discovered. for now. we sync on onChange. I think the reason is that this environmental value isnt easily settable in the same scope. Might be a way with more research etc
    */
   internal var reBind: Binding<Self> {
      .init(get: { self }, set: { _ in })
   }
}
#if os(iOS)
/**
 * Helper
 * - Note: macOS does not have size classes. It is possible to recreate it. Check copilot. It might not be needed tho.
 */
extension UserInterfaceSizeClass {
   /**
    * - Abstract: Determines whether the device is in a 70% landscape mode based on window width and orientation.
    * - Description: Determines if the device is in a landscape mode where
    *                the window occupies approximately 70% of the screen width,
    *                typically used for adaptive layouts in larger devices like
    *                iPads.
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
