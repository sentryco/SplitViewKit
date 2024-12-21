import Foundation
import SplitViewKit
/**
 * CustomColumnWidth
 * - Description: A struct conforming to ColumnWidthKind, used to define custom column widths for a SplitView.
 *                It provides methods to calculate the appropriate widths for sidebar, main, and detail columns
 *                based on the window width and device orientation.
 * - Fixme: ⚠️️ Add support for storing columnwidths in userdefault, esp for macOS, for ipad the columns are fixed when using native swiftui navsplitview see: https://github.com/stevengharris/SplitView#using-userdefaults-for-split-state etc
 * - Fixme: ⚠️️ Maybe store "section-fraction" size in userdefault (also check out how we did this in legacy code)
 */
internal struct CustomColumnWidth: ColumnWidthKind {}
#if os(iOS)
extension CustomColumnWidth {
   /**
    * - Description: Calculates the appropriate width for the sidebar column
    *                based on the window width and device orientation.
    * - Parameters:
    *   - winWidth: The current width of the window which is used to determine the column width.
    * - Returns: Optional means use native default values
    */
   internal func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         isLandscape: isOrientationLandscape, // Determines if the device orientation is landscape
         winWidth: winWidth // Specifies the current width of the window
      )
      let width = ColumnWidth(
         min: nil, // The minimum width is not set, allowing the sidebar to shrink as needed based on the SplitView's default behavior.
         ideal: isNarrow ? 200 : 340, // The ideal width of the sidebar changes based on the device orientation: 200 points in narrow (portrait) mode and 340 points in wide (landscape) mode.
         max: nil // The maximum width is not set, allowing the sidebar to expand as needed based on the SplitView's default behavior.
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
         isLandscape: isOrientationLandscape, // Determines if the device orientation is landscape, affecting column width calculations.
         winWidth: winWidth // Specifies the current width of the window, used to adjust column widths dynamically.
      )
      let width: ColumnWidth = .init(
         min: nil, // The minimum width is not set, allowing the main column to shrink as needed based on the SplitView's default behavior.
         ideal: isNarrow ? 240 : 300, // The ideal width of the main column changes based on the device orientation: 240 points in narrow (portrait) mode and 300 points in wide (landscape) mode.
         max: nil // The maximum width is not set, allowing the main column to expand as needed based on the SplitView's default behavior.
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
         min: nil, // The minimum width is not set, allowing the detail column to shrink as needed based on the SplitView's default behavior.
         ideal: 500, // The ideal width for the detail column is set to 500 points, providing sufficient space for content display.
         max: nil // The maximum width is not set, allowing the detail column to expand as needed based on the SplitView's default behavior.
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
