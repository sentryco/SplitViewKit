import SwiftUI
/**
 * - Fixme: ⚠️️ Add description
 * - Important: ⚠️️ To resize columns when the app is running, you have to force reload the navigationsplitview view. Refreshing the state is not enough. The best way is to toggle two navsplitviews in a geometryreader.
 * - Note: Only some platforms enable resizing columns. If you specify a width that the current presentation environment doesn’t support, SwiftUI may use a different width for your column.
 * - Note: More doc here: https://developer.apple.com/documentation/swiftui/view/navigationsplitviewcolumnwidth(_:)
 * - Note: There is a suggestion we have to use UIKIt to get dynamic widths after rotation working: https://www.perplexity.ai/search/i-need-to-update-navigationspl-LShSqv4.Txa02kNQFk7Uqg#4
 * - Note: min and max are optional. Nil means no min size when resizing for macOS
 * - Note: For iPad 13" we should use a bit less narrow widths for narrow mode. Or even use values that relative to the win-size / app-size
 */
public struct ColumnWidth {
   /**
    * Min size
    * - Note: Behaves differently for macOS and iPad
    */
   public let min: CGFloat?
   /**
    * Default size used
    * - Note: Behaves differently for macOS and iPad
    */
   public let ideal: CGFloat
   /**
    * Max size
    * - Note: Behaves differently for macOS and iPad
    */
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
