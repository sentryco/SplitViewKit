import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * Extend this to customize column widths
 * - Abstract: Protocol for customizing column widths in a split view according to window size.
 * - Description: Defines a protocol for customizing the widths of columns in
 *                a split view layout. Implement this protocol to specify
 *                different widths for sidebar, main, and detail columns based
 *                on the window width.
 * - Note: Kind must implement these calls
 */
public protocol ColumnWidthKind {
   /**
    * Specifies the width for the sidebar column based on the given window width.
    * - Description: Specifies custom width settings for the sidebar column in a `NavigationSplitView`, based on the current window width. Implement this method to return a `ColumnWidth` object that provides the minimum, ideal, and maximum widths for the sidebar column. This allows for responsive and adaptive layouts across different devices and orientations.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width.
    * - Returns: An optional `ColumnWidth` object specifying the width of the sidebar column. If nil, the default width is used.
    */
   func sideBarColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * Specifies the width for the main content column based on the given window width.
    * - Description: Returns a `ColumnWidth` instance specifying the minimum, ideal, and maximum widths for the main content column based on the provided window width. This allows for customization and responsive design of the main content area in a split view.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width for the main content area.
    * - Returns: An optional `ColumnWidth` object specifying the width of the main content column. If nil, the default width is used.
    */
   func mainColumn(winWidth: CGFloat) -> ColumnWidth?

   /**
    * Specifies the width for the detail column based on the given window width, allowing customization for different screen sizes and orientations.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width for the detail area.
    * - Returns: An optional `ColumnWidth` object specifying the width of the detail column. If nil, the default width is used.
    */
   func detailColumn(winWidth: CGFloat) -> ColumnWidth?
}
/**
 * Defaults (overriden by implementer)
 * Abstract: Provides default implementations for the `ColumnWidthKind` protocol methods, returning nil to apply default native column widths when no custom implementations are provided by the conforming types.
 * - Description: If no implementation is added by the implementer, nil is
 *                returned and default native column widths are applied.
 * - Note: By not using custom column-widths. DetailView will look too narrow in 70% landscape mode for iPad
 */
extension ColumnWidthKind {
   /**
    * Provides a default implementation for the `sideBarColumn(winWidth:)` method.
    * - Description: Returns `nil` to indicate that the sidebar column should use SwiftUI's native default widths.
    * - Note: Implementers can override this method to provide custom column width settings based on the window width.
    */
   public func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   /**
    * Default sideBarColumn implementation
    * Description: Provides custom width settings for the main content column in a `NavigationSplitView` based on the current window width. Implement this method to return a `ColumnWidth` object that defines the minimum, ideal, and maximum widths for the main content column. This enables responsive and adaptive layouts across different devices and orientations.
    */
   public func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   /**
    * Provides a default implementation for the `detailColumn(winWidth:)` method.
    * - Description: Returns `nil` to indicate that the detail column should use SwiftUI's native default widths.
    * - Note: Implementers can override this method to provide custom column width settings based on the window width.
    */
   public func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
}
/**
 * If a window is in splitmode or in portrait. the window is considered narrow
 * - Description: This function checks if the window is considered narrow
 *                based on the device orientation and window width.
 * - Note: Alternative names: `isNarrowFit` or `isSnugFit`
 * - Fixme: ⚠️️ Move into `UIDeviceOrientation` scope? or some scope? or not?
 * - Parameters:
 *   - winWidth: The width of the window
 *   - isLandscape: A Boolean value indicating whether the device is in landscape orientation.
 * - Returns: A Boolean value indicating whether the window is considered narrow.
 */
public func isNarrow(isLandscape: Bool = true, winWidth: CGFloat) -> Bool {
   #if os(iOS)
   let isWindowWidthLessThanScreenWidth: Bool = winWidth < UIScreen.main.bounds.width
   return !isOrientationLandscape || isWindowWidthLessThanScreenWidth
   #elseif os(macOS)
   return false // macOS has no need for detecting narrow mode
   #endif
}
