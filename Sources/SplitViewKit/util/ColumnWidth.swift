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
   static func sideBarColumn(deviceOrientation: UIDeviceOrientation = getDeviceOrientation(), winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         deviceOrientation: deviceOrientation,
         winWidth: winWidth
      )
      return .init(
         min: nil,
         ideal: isNarrow ? 200 : 340,
         max: nil
      )
   }
   /**
    * - Fixme: ⚠️️ add param doc
    */
   static func mainColumn(deviceOrientation: UIDeviceOrientation = getDeviceOrientation(), winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(
         deviceOrientation: deviceOrientation,
         winWidth: winWidth
      )
      return .init(
         min: nil,
         ideal: isNarrow ? 200 : 300,
         max: nil
      )
   }
   // - Fixme: ⚠️️ maybe set this to more for min to avoid narrow look and feel.
   // - Fixme: ⚠️️ maybe we can add overflow?
   // - Fixme: ⚠️️ maybe we can make view resist shrinking?
   // - Fixme: ⚠️️ add doc
   static func detailColumn(deviceOrientation: UIDeviceOrientation = getDeviceOrientation(), winWidth: CGFloat) -> ColumnWidth? {
      .init(
         min: nil, //deviceOrientation.isLandscape ? 500 : 400,
         ideal: 500,
         max: nil
      )
   }
   #elseif os(macOS) // ⚠️️ hack for macOS, because .navigationDestination(item doesn't work for macOS aperantly
   /**
    * - Fixme: ⚠️️ add doc
    */
   static func sideBarColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 250, max: 400)
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   static func mainColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 300, max: 400)
   }
   /**
    * - Fixme: ⚠️️ add doc
    */
   static func detailColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 200, ideal: 250, max: nil)
   }
   #endif
}
/**
 * - Fixme: ⚠️️ rename to isNarrowFit or isSnugFit?
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ move into UIDeviceOrientation scope?
 * - Parameters:
 *   - deviceOrientation: - Fixme: ⚠️️ add doc
 *   - winWidth: - Fixme: ⚠️️ add doc
 * - Returns: - Fixme: ⚠️️ add doc
 */
func isNarrow(deviceOrientation: UIDeviceOrientation, winWidth: CGFloat) -> Bool {
   let isWindowWidthLessThanScreenWidth: Bool = winWidth < UIScreen.main.bounds.width
   return deviceOrientation.isPortrait || isWindowWidthLessThanScreenWidth
}
