import SwiftUI
/**
 * Determines if the device is in a landscape orientation.
 * - Returns: A Boolean value indicating whether the device orientation is landscape.
 * - Note: On macOS, it always returns true as macOS windows are typically considered landscape.
 * - Fixme: ⚠️️ rename to something less generic. isDevice.. is...Orientation or something
 */
public var isLandscape: Bool {
   #if os(macOS)
   true
   #elseif os(iOS)
   getDeviceOrientation().isLandscape
   #endif
}
#if os(iOS)
/**
 * - Description: Retrieves the current orientation of the device using UIDevice.current.orientation and validates it against the interface orientation from the window scene.
 * - Note: because using: UIApplication.shared.statusBarOrientation.isLandscape results in this message: 'statusBarOrientation' was deprecated in iOS 13.0: Use the interfaceOrientation property of the window scene instead.
 * - Note: Some notes on this: https://stackoverflow.com/questions/65573508/swiftui-determining-current-device-and-orientation?noredirect=1&lq=1
 * - Note: Rotating to a new orientation does not update the view, but it works if we use GeometryReader. to instantiate a new view 
 * - Fixme: ⚠️️ Aperantly this can also be used: UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation
 * - Fixme: ⚠️️ This is only relevant for iOS, fence it as such
 * - Fixme: ⚠️️ Move it into UIDeviceOrientation+Extensio scope 👈
 */
internal func getDeviceOrientation() -> UIDeviceOrientation {
   var orientation = UIDevice.current.orientation
   // Get the interface orientation incase the UIDevice Orientation doesn't exist.
   let interfaceOrientation: UIInterfaceOrientation?
   if #available(iOS 15, *) {
      interfaceOrientation = UIApplication.shared.connectedScenes
      // Keep only the first `UIWindowScene`
         .first(where: { $0 is UIWindowScene })
      // Get its associated windows
         .flatMap({ $0 as? UIWindowScene })?.interfaceOrientation
   } else {
      interfaceOrientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
   }
   guard interfaceOrientation != nil else {
      //      debugPrint("\(identifier)  \(DebuggingIdentifiers.actionOrEventFailed) UIApplication Orientation does not exist. This should never happen. measured orientation \(interfaceOrientation)")
      return orientation
   }
   // Initially the orientation is unknown so we need to check based on the application window orientation.
   if !orientation.isValidInterfaceOrientation {
      //      debugPrint("\(identifier)  \(DebuggingIdentifiers.actionOrEventFailed) Orientation is unknown.")
      //      debugPrint("\(identifier)  \(DebuggingIdentifiers.actionOrEventInProgress) Trying through the window orientation \(interfaceOrientation) \(DebuggingIdentifiers.actionOrEventInProgress)")
      // Notice that UIDeviceOrientation.landscapeRight is assigned to UIInterfaceOrientation.landscapeLeft and UIDeviceOrientation.landscapeLeft is assigned to UIInterfaceOrientation.landscapeRight. The reason for this is that rotating the device requires rotating the content in the opposite direction.
      // Reference : https://developer.apple.com/documentation/uikit/uiinterfaceorientation
      switch interfaceOrientation {
      case .portrait:
         orientation = .portrait
         break
      case .landscapeRight:
         orientation = .landscapeLeft
         break
      case .landscapeLeft:
         orientation = .landscapeRight
         break
      case .portraitUpsideDown:
         orientation = .portraitUpsideDown
         break
      default:
         orientation = .unknown
         break
      }
   }
   return orientation
}
#endif
