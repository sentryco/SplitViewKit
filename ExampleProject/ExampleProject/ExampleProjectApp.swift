import SwiftUI
import SplitViewKit
import HybridColor
/**
 * We use this xcode project to test with simulator and compact mode etc
 * - Note: To hide the title bar for a macOS app in SwiftUI, you can use the .windowStyle() modifier on the WindowGroup within your App structure. Specifically, you can apply the HiddenTitleBarWindowStyle() to achieve this effect. This will remove the title bar from the window, giving your app a more modern, clean appearance.
 * - Note: More info regarding windowStyle: https://developer.apple.com/documentation/swiftui/windowgroup/windowstyle(_:)
 * - Note: More info regarding windowStyle: https://stackoverflow.com/questions/70501890/how-can-i-hide-title-bar-in-swiftui-for-macos-app
 * - Note: The Xcode preview doesn't accurately reflect the hidden title bar. However, when you build and run the project, the title bar should be hidden as expected
 */
@main
struct ExampleProjectApp: App { // App Protocol: Conforms to the App protocol which is required for SwiftUI apps.
   var body: some Scene {
      WindowGroup {  // WindowGroup: A scene type used for apps that manage one or more windows on a platform.
         ExampleView()
            .background(Color.blackOrWhite.opacity(1))
            #if os(iOS)
            // .environment(\.colorScheme, .dark) // dark
            .statusBar(hidden: true) // Hide the status bar (looks better for demos) (Not available on macOS)
            #endif
            // .persistentSystemOverlays(.hidden) // Hide the Home Indicator (looks better for demos)
      }
      // This line applies the HiddenTitleBarWindowStyle to the window, effectively hiding the title bar when the app runs on macOS.
      #if os(macOS) // Not available on macOS
      .windowStyle(HiddenTitleBarWindowStyle()) // Apply hidden title bar style
      #endif
   }
}
/**
 * Debugging with background colors
 * - Description: This section is used for debugging purposes, allowing
 *                developers to visually identify different areas of the
 *                interface by applying distinct background colors.
 */
internal var isTest: Bool = false
