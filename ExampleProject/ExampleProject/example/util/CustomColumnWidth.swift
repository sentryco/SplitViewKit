import Foundation
import SplitViewKit
/**
 * Const
 * - Note: Must be public to be initiatable in init
 * - Fixme: ⚠️️ Add support for serving different values for landscape and portraite mode, ask copilot how etc
 * - Fixme: ⚠️️ Add support for inserting these from the splitviewcontainer init
 * - Fixme: ⚠️️ We also have to account for compact size of navsplitview here
 * - Fixme: ⚠️️⚠️️⚠️️ Why are these calls return optional?
 */
public struct CustomColumnWidth: ColumnWidthKind {
   /**
    * - Note: Must be present when struct is public
    */
   public init() {}
}
#if os(iOS)
extension CustomColumnWidth {
   /**
    * - Fixme: ⚠️️ add description
    * - Parameters:
    *   - isLandScape: - Fixme: ⚠️️ add doc
    *   - winWidth: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   public func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         isLandscape: isLandscape,
         winWidth: winWidth
      )
      let width = ColumnWidth(
         min: nil,
         ideal: isNarrow ? 200 : 340,
         max: nil
      )
      Swift.print("✨ sideBarColumn - isNarrow:  \(isNarrow) - isLandscape: \(isLandscape) width: \(width)")
      return width
   }
   /**
    * Returns a `ColumnWidth` instance for the main column based on the device orientation and window width.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is the current device orientation.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set based on whether the device is in narrow mode. The minimum and maximum widths are not set (nil).
    */
   public func mainColumn(winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         isLandscape: isLandscape,
         winWidth: winWidth
      )
      let width: ColumnWidth = .init(
         min: nil,
         ideal: isNarrow ? 240 : 300,
         max: nil
      )
      Swift.print("✨ mainColumn - isNarrow: \(isNarrow) isLandscape: \(isLandscape) width: \(width)")
      return width
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is the current device orientation.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set to 500. The minimum and maximum widths are not set (nil).
    */
   public func detailColumn(winWidth: CGFloat) -> ColumnWidth? {
      let width = ColumnWidth(
         min: nil,
         ideal: 500,
         max: nil
      )
      Swift.print("✨ detailColumn: \(winWidth) isLandscape: \(isLandscape) width: \(width)")
      return width
   }
}
#elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
extension CustomColumnWidth {
   /**
    * This function generates a `ColumnWidth` instance for the sidebar column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum and ideal width set to 250 and the maximum width set to 400.
    */
   public func sideBarColumn(winWidth: CGFloat) -> ColumnWidth? { /*isLandScape: Bool = true, */
      .init(min: 250, ideal: 250, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the main column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 250, the ideal width set to 300, and the maximum width set to 400.
    */
   public func mainColumn(winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = .landscapeLeft*/ /*isLandScape: Bool = true, */
      .init(min: 250, ideal: 300, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 200, the ideal width set to 250, and the maximum width not set (nil).
    */
   public func detailColumn(winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = .landscapeLeft*/ /*isLandScape: Bool = true, */
      .init(min: 200, ideal: 250, max: nil)
   }
}
#endif
