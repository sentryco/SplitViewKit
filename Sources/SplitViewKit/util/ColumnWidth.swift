import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * - Important: ⚠️️ To resize columns when the app is running, you have to force reload the navigationsplitview view. Refreshing the state is not enough. The best way is to toggle two navsplitviews in a geometryreader.
 * - Note: Only some platforms enable resizing columns. If you specify a width that the current presentation environment doesn’t support, SwiftUI may use a different width for your column.
 * - Note: More doc here: https://developer.apple.com/documentation/swiftui/view/navigationsplitviewcolumnwidth(_:)
 * - Fixme: ⚠️️ add more doc
 * - Fixme: ⚠️️ add support for storing columnwidths in userdefault, esp for macOS, for ipad the columns are fixed when using native swiftui navsplitview
 * - Fixme: ⚠️️ there is a suggestion we have to use UIKIt to get dynamic widths after rotation working: https://www.perplexity.ai/search/i-need-to-update-navigationspl-LShSqv4.Txa02kNQFk7Uqg#4
 */
struct ColumnWidth {
    let min: CGFloat?
    let ideal: CGFloat
    let max: CGFloat?
    // - Fixme: ⚠️️ add doc
   // - Fixme: ⚠️️ add doc regarding why mac and min are optional etc
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
 */
extension ColumnWidth {
   #if os(iOS)
   // - Fixme: ⚠️️ add doc
   static func sideBarColumn(deviceOrientation: UIDeviceOrientation = getDeviceOrientation(), winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(deviceOrientation: deviceOrientation, winWidth: winWidth)
      return .init(
         min: nil,
         ideal: isNarrow ? 200 : 340,
         max: nil
      )
   }
   // - Fixme: ⚠️️ add param doc
   static func mainColumn(deviceOrientation: UIDeviceOrientation = getDeviceOrientation(), winWidth: CGFloat) -> ColumnWidth? {
      let isNarrow: Bool = isNarrow(deviceOrientation: deviceOrientation, winWidth: winWidth)
      return .init(
         min: nil,
         ideal: isNarrow ? 240 : 300,
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
   static func sideBarColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 250, max: 400)
   }
   static func mainColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 250, ideal: 300, max: 400)
   }
   static func detailColumn(deviceOrientation: UIDeviceOrientation = .landscapeLeft, winWidth: CGFloat) -> ColumnWidth? {
      .init(min: 200, ideal: 250, max: nil)
   }
   #endif
}
// - Fixme: ⚠️️ add doc
func isNarrow(deviceOrientation: UIDeviceOrientation, winWidth: CGFloat) -> Bool {
   let isWindowWidthLessThanScreenWidth: Bool = winWidth < UIScreen.main.bounds.width
   return deviceOrientation.isPortrait || isWindowWidthLessThanScreenWidth
}
