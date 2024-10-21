import SwiftUI
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
public struct ColumnWidth {
   public let min: CGFloat?
   public let ideal: CGFloat
   public let max: CGFloat?
   /**
    * - Parameters:
    *   - min: - Fixme: ⚠️️ add doc
    *   - ideal: - Fixme: ⚠️️ add doc
    *   - max: - Fixme: ⚠️️ add doc
    */
   public init(min: CGFloat?, ideal: CGFloat, max: CGFloat?) {
      self.min = min
      self.ideal = ideal
      self.max = max
   }
}
