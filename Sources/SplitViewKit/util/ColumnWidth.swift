import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * - Important: ⚠️️ To resize columns when the app is running, you have to force reload the navigationsplitview view. Refreshing the state is not enough. The best way is to toggle two navsplitviews in a geometryreader.
 * - Note: Only some platforms enable resizing columns. If you specify a width that the current presentation environment doesn’t support, SwiftUI may use a different width for your column.
 * - Note: More doc here: https://developer.apple.com/documentation/swiftui/view/navigationsplitviewcolumnwidth(_:)
 * - Fixme: ⚠️️ Add more doc
 * - Fixme: ⚠️️ Add support for storing columnwidths in userdefault, esp for macOS, for ipad the columns are fixed when using native swiftui navsplitview
 * - Fixme: ⚠️️ There is a suggestion we have to use UIKIt to get dynamic widths after rotation working: https://www.perplexity.ai/search/i-need-to-update-navigationspl-LShSqv4.Txa02kNQFk7Uqg#4
 * - Fixme: ⚠️️ Maybe store "section-fraction" size in userdefault (also check out how we did this in legacy code): https://github.com/stevengharris/SplitView#using-userdefaults-for-split-state
 * - Fixme: ⚠️️ add doc regarding why max and min are optional etc
 * - Fixme: ⚠️️ make this public?
 * - Fixme: ⚠️️ for iPad 13" we should use a bit less narrow widths for narrow mode
 */
struct ColumnWidth {
   let min: CGFloat?
   let ideal: CGFloat
   let max: CGFloat?
   /**
    * - Parameters:
    *   - min: - Fixme: ⚠️️ add doc
    *   - ideal: - Fixme: ⚠️️ add doc
    *   - max: - Fixme: ⚠️️ add doc
    */
   init(min: CGFloat?, ideal: CGFloat, max: CGFloat?) {
      self.min = min
      self.ideal = ideal
      self.max = max
   }
}
/**
 * Const
 * - Fixme: ⚠️️ add support for serving different values for landscape and portraite mode, ask copilot how etc
 * - Fixme: ⚠️️ add support for inserting these from the splitviewcontainer init
 * - Fixme: ⚠️️ we also have to account for compact size of navsplitview here
 * - Fixme: ⚠️️⚠️️⚠️️ why are these calls return optional?
 */
extension ColumnWidth {
   #if os(iOS)
   /**
    * - Fixme: ⚠️️ add doc
    */
   static func sideBarColumn(isLandScape: Bool = isLandscape, winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = getDeviceOrientation()*/ /*getDeviceOrientation().*/
      let isNarrow: Bool = isNarrow(
         isLandscape: isLandscape,
         winWidth: winWidth
      )
      return .init(
         min: nil,
         ideal: isNarrow ? 200 : 340,
         max: nil
      )
   }
   /**
    * Returns a `ColumnWidth` instance for the main column based on the device orientation and window width.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is the current device orientation.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set based on whether the device is in narrow mode. The minimum and maximum widths are not set (nil).
    */
   static func mainColumn(isLandScape: Bool = isLandscape, winWidth: CGFloat) -> ColumnWidth? { /*getDeviceOrientation().*/
      let isNarrow: Bool = isNarrow(
         isLandscape: isLandscape,
         winWidth: winWidth
      )
      return .init(
         min: nil,
         ideal: isNarrow ? 240 : 300,
         max: nil
      )
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is the current device orientation.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the ideal width set to 500. The minimum and maximum widths are not set (nil).
    */
   static func detailColumn(isLandScape: Bool = /*getDeviceOrientation().*/isLandscape, winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = */
      .init(
         min: nil, //deviceOrientation.isLandscape ? 500 : 400,
         ideal: 500,
         max: nil
      )
   }
   #elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
   /**
    * This function generates a `ColumnWidth` instance for the sidebar column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum and ideal width set to 250 and the maximum width set to 400.
    */
   static func sideBarColumn(isLandScape: Bool = true, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 250, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the main column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 250, the ideal width set to 300, and the maximum width set to 400.
    */
   static func mainColumn(isLandScape: Bool = true, winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = .landscapeLeft*/
      .init(min: 250, ideal: 300, max: 400)
   }
   /**
    * This function generates a `ColumnWidth` instance for the detail column of the SplitView on macOS.
    * - Parameters:
    *   - isLandScape: A Boolean value indicating whether the device is in landscape orientation. Default value is true.
    *   - winWidth: The width of the window.
    * - Returns: A `ColumnWidth` instance with the minimum width set to 200, the ideal width set to 250, and the maximum width not set (nil).
    */
   static func detailColumn(isLandScape: Bool = true, winWidth: CGFloat) -> ColumnWidth? { /*deviceOrientation: UIDeviceOrientation = .landscapeLeft*/
      .init(min: 200, ideal: 250, max: nil)
   }
   #endif
}
/**
 * - Fixme: ⚠️️ rename to isNarrowFit or isSnugFit?
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ move into UIDeviceOrientation scope?
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
