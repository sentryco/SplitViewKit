import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * Extend this to customize column widths
 * - Note: Kind must implement these calls
 * - Fixme: ⚠️️ add description
 */
public protocol ColumnWidthKind {
   /**
    * - Fixme: ⚠️️ add description
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func sideBarColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * - Fixme: ⚠️️ add description
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func mainColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * - Fixme: ⚠️️ add description
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func detailColumn(winWidth: CGFloat) -> ColumnWidth?
}
/**
 * Defaults (overriden by implementer)
 * - Description: If no implementation is added by the implementer. nil is returned and default native columnwidths are applied
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
 * - Description: This function checks if the window is considered narrow based on the device orientation and window width.
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
