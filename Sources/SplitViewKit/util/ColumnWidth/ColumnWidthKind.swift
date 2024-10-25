import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * Extend this to customize column widths
 * - Note: Kind must implement these calls
 * - Description: Defines a protocol for customizing the widths of columns in
 *                a split view layout. Implement this protocol to specify
 *                different widths for sidebar, main, and detail columns based
 *                on the window width.
 */
public protocol ColumnWidthKind {
   /**
    * - Description: Specifies the width for the sidebar column based on the given window width.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width.
    * - Returns: An optional `ColumnWidth` object specifying the width of the sidebar column. If nil, the default width is used.
    */
   func sideBarColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * Specifies the width for the main content column based on the given window width.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width for the main content area.
    * - Returns: An optional `ColumnWidth` object specifying the width of the main content column. If nil, the default width is used.
    */
   func mainColumn(winWidth: CGFloat) -> ColumnWidth?

   /**
    * Specifies the width for the detail column based on the given window width.
    * - Parameter winWidth: The width of the window which is used to determine the appropriate column width for the detail area.
    * - Returns: An optional `ColumnWidth` object specifying the width of the detail column. If nil, the default width is used.
    */
   func detailColumn(winWidth: CGFloat) -> ColumnWidth?
}
/**
 * Defaults (overriden by implementer)
 * - Description: If no implementation is added by the implementer, nil is
 *                returned and default native column widths are applied.
 * - Note: By not using custom column-widths. DetailView will look too narrow in 70% landscape mode for iPad
 */
extension ColumnWidthKind {
   /**
    * Default sideBarColumn implementation
    */
   public func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   /**
    * Default sideBarColumn implementation
    */
   public func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   /**
    * Default sideBarColumn implementation
    */
   public func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
}
/**
 * - Abstract: If a window is in splitmode or in portrait. the window is considered narrow
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
