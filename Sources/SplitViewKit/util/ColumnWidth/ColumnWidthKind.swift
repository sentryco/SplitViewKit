import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * Extend this to customize column widths
 * - Note: Kind must implement these calls
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add default implementation that just returns nil which then uses the default column width
 */
public protocol ColumnWidthKind {
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func sideBarColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func mainColumn(winWidth: CGFloat) -> ColumnWidth?
   /**
    * - Fixme: ⚠️️ add doc
    * - Parameter winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func detailColumn(winWidth: CGFloat) -> ColumnWidth?
}
/**
 * Defaults
 */
extension ColumnWidthKind {
   public func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   public func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
   public func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      nil
   }
}
// Default ColumnWidths
// - Fixme: ⚠️️ rename to default etc. rename the other to Custom. and move to example scope etc
// - Fixme: ⚠️️ move into own file etc
public struct NativeColumnWidth: ColumnWidthKind {
   public init() {}
}
/**
 * Helper
 */
extension ColumnWidthKind {
   /**
    * - Fixme: ⚠️️ rename to isNarrowFit or isSnugFit?
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ move into UIDeviceOrientation scope? or some scope
    * - Description: This function checks if the window is considered narrow based on the device orientation and window width.
    * - Parameters:
    *   - winWidth: The width of the window.
    *   - isLandscape: A Boolean value indicating whether the device is in landscape orientation.
    * - Returns: A Boolean value indicating whether the window is considered narrow.
    */
   func isNarrow(isLandscape: Bool = true, winWidth: CGFloat) -> Bool { /*deviceOrientation: UIDeviceOrientation*/
      #if os(iOS)
      let isWindowWidthLessThanScreenWidth: Bool = winWidth < UIScreen.main.bounds.width
      return !isLandscape || isWindowWidthLessThanScreenWidth // deviceOrientation.isPortrait
      #elseif os(macOS)
      return false // - Fixme: ⚠️️ doc this
      #endif
   }
}
