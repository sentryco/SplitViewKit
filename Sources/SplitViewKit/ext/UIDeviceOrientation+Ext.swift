import SwiftUI
/**
 * Determines if the device is in a landscape orientation.
 * - Note: On macOS, it always returns true as macOS windows are typically considered landscape.
 * - Note: The variable name is rather long so doesn't conflict with implementer API etc
 * - Note: This can't be in the `UIDeviceOrientation` scope. Because it only exists for iOS. So we put it in the global scope
 * - Fixme: ⚠️️ add description
 * - Returns: A Boolean value indicating whether the device orientation is landscape.
 */
public var isOrientationLandscape: Bool {
   #if os(iOS)
   getDeviceOrientation().isLandscape
   #elseif os(macOS)
   true
   #endif
}
#if os(iOS)
/**
 * - Description: Retrieves the current orientation of the device using UIDevice.current.orientation and validates it against the interface orientation from the window scene.
 * - Important: ⚠️️ This is only relevant for iOS, fenced as such
 * - Note: Because using: UIApplication.shared.statusBarOrientation.isLandscape results in this message: 'statusBarOrientation' was deprecated in iOS 13.0: Use the interfaceOrientation property of the window scene instead.
 * - Note: Some more notes here: https://stackoverflow.com/questions/65573508/swiftui-determining-current-device-and-orientation?noredirect=1&lq=1
 * - Note: Rotating to a new orientation does not update the view, but it works if we use GeometryReader. to instantiate a new view
 * - Note: ⚠️️ This can also be used: `UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation` look into it
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
      // print("\(identifier)  \(DebuggingIdentifiers.actionOrEventFailed) UIApplication Orientation does not exist. This should never happen. measured orientation \(interfaceOrientation)")
      return orientation
   }
   // Initially the orientation is unknown so we need to check based on the application window orientation.
   if !orientation.isValidInterfaceOrientation {
      // print("\(identifier)  \(DebuggingIdentifiers.actionOrEventFailed) Orientation is unknown.")
      // print("\(identifier)  \(DebuggingIdentifiers.actionOrEventInProgress) Trying through the window orientation \(interfaceOrientation) \(DebuggingIdentifiers.actionOrEventInProgress)")
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
