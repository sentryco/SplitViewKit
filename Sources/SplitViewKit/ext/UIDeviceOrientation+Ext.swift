import SwiftUI
/**
 * - Note: because using: UIApplication.shared.statusBarOrientation.isLandscape results in this message: 'statusBarOrientation' was deprecated in iOS 13.0: Use the interfaceOrientation property of the window scene instead.
 * - Note: Some notes on this: https://stackoverflow.com/questions/65573508/swiftui-determining-current-device-and-orientation?noredirect=1&lq=1
 * - Fixme: ⚠️️ rotating to a new orientation does not update the view, figure out a solution 🏀
 * - Fixme: ⚠️️ fix later
 * - Fixme: ⚠️️ aperantly this can also be used: UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation
 * - Fixme: ⚠️️ add doc and abstract
 */
internal func getDeviceOrientation() -> UIDeviceOrientation {
   //   let identifier: String = "getDeviceOrientation"
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
         //         debugPrint("\(identifier) \(DebuggingIdentifiers.actionOrEventSucceded) Setting orientation to portrait.")
         orientation = .portrait
         break
      case .landscapeRight:
         //         debugPrint("\(identifier) \(DebuggingIdentifiers.actionOrEventSucceded) Setting orientation to landscape left, as UIDeviceOrientation.landscapeRight is assigned to UIInterfaceOrientation.landscapeLeft.")
         orientation = .landscapeLeft
         break
      case .landscapeLeft:
         //         debugPrint("\(identifier) \(DebuggingIdentifiers.actionOrEventSucceded) Setting orientation to landscape right, as UIDeviceOrientation.landscapeLeft is assigned to UIInterfaceOrientation.landscapeRight.")
         orientation = .landscapeRight
         break
      case .portraitUpsideDown:
         //         debugPrint("\(identifier) \(DebuggingIdentifiers.actionOrEventSucceded) Setting orientation to portrait upside down.")
         orientation = .portraitUpsideDown
         break
      default:
         //         debugPrint("\(identifier)  \(DebuggingIdentifiers.actionOrEventFailed) Orientation is unknown.")
         orientation = .unknown
         break
      }
   }
   
   return orientation
}
