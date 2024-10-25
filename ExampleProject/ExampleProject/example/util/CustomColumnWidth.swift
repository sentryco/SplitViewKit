import Foundation
import SplitViewKit
/**
 * Const
 * - Fixme: ⚠️️ Add support for storing columnwidths in userdefault, esp for macOS, for ipad the columns are fixed when using native swiftui navsplitview see: https://github.com/stevengharris/SplitView#using-userdefaults-for-split-state etc
 * - Fixme: ⚠️️ Maybe store "section-fraction" size in userdefault (also check out how we did this in legacy code)
 */
internal struct CustomColumnWidth: ColumnWidthKind {}
#if os(iOS)
extension CustomColumnWidth {
   /**
    * - Fixme: ⚠️️ add description
    * - Parameters:
    *   - winWidth: - Fixme: ⚠️️ add doc
    * - Returns: Optional means use native default values
    */
   internal func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         isOrientationLandscape: isOrientationLandscape, // - Fixme: ⚠️️ doc this line
         winWidth: winWidth // - Fixme: ⚠️️ doc this line
      )
      let width = ColumnWidth(
         min: nil, // - Fixme: ⚠️️ doc this line
         ideal: isNarrow ? 200 : 340, // - Fixme: ⚠️️ doc this line
         max: nil // - Fixme: ⚠️️ doc this line
      )
      return width
   }
   /**
    * Returns a `ColumnWidth` instance for the main column based on the device orientation and window width.
    * - Parameters:
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set based on whether the device is in narrow mode. The minimum and maximum widths are not set (nil).
    */
   internal func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         isOrientationLandscape: isOrientationLandscape, // - Fixme: ⚠️️ doc this line
         winWidth: winWidth // - Fixme: ⚠️️ doc this line
      )
      let width: ColumnWidth = .init(
         min: nil, // - Fixme: ⚠️️ doc this line
         ideal: isNarrow ? 240 : 300, // - Fixme: ⚠️️ doc this line
         max: nil // - Fixme: ⚠️️ doc this line
      )
      return width
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView.
    * - Parameters:
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set to 500. The minimum and maximum widths are not set (nil).
    */
   internal func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      let width = ColumnWidth(
         min: nil, // - Fixme: ⚠️️ doc this line
         ideal: 500, // - Fixme: ⚠️️ doc this line
         max: nil // - Fixme: ⚠️️ doc this line
      )
      return width
   }
}
#elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
extension CustomColumnWidth {
   /**
    * This function generates a `ColumnWidth` instance for the sidebar column of the SplitView on macOS.
    * - Parameters:
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum and ideal width set to 250 and the maximum width set to 400.
    */
   internal func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 250, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the main column of the SplitView on macOS.
    * - Parameters:
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 250, the ideal width set to 300, and the maximum width set to 400.
    */
   internal func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 300, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView on macOS.
    * - Parameters:
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 200, the ideal width set to 250, and the maximum width not set (nil).
    */
   internal func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 200, ideal: 250, max: nil)
   }
}
#endif
