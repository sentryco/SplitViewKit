import SwiftUI
/**
 * - Abstract: Defines the structure for managing column widths in a `NavigationSplitView`, allowing customization of minimum, ideal, and maximum widths to ensure responsive and adaptive user interfaces across different devices and orientations.
 * - Description: This file defines the `ColumnWidth` struct which is used to
 *                specify the minimum, ideal, and maximum widths for columns
 *                within a `NavigationSplitView`. This allows for flexible and
 *                adaptive UI layouts across different devices and orientations.
 * - Important: ⚠️️ To resize columns when the app is running, you have to force reload the navigationsplitview view. Refreshing the state is not enough. The best way is to toggle two navsplitviews in a geometryreader.
 * - Note: Here is how we can easily persist columnWidths with userdefault: https://github.com/stevengharris/SplitView#using-userdefaults-for-split-state
 * - Note: Only some platforms enable resizing columns. If you specify a width that the current presentation environment doesn’t support, SwiftUI may use a different width for your column.
 * - Note: More doc here: https://developer.apple.com/documentation/swiftui/view/navigationsplitviewcolumnwidth(_:)
 * - Note: There is a suggestion we have to use UIKIt to get dynamic widths after rotation working: https://www.perplexity.ai/search/i-need-to-update-navigationspl-LShSqv4.Txa02kNQFk7Uqg#4
 * - Note: min and max are optional. Nil means no min size when resizing for macOS
 * - Note: For iPad 13" we should use a bit less narrow widths for narrow mode. Or even use values that relative to the win-size / app-size
 * - Fixme: ⚠️️ Try to figure out how detail can have compression resistance? to avoid getting too squashed? the idea is that navsplitview should manage this part. simpler that way etc? Might be worth researching?
 */
public struct ColumnWidth {
   /**
    * Min size
    * - Description: The minimum width of the column. If set to `nil`, the column width is not constrained on the lower end.
    * - Note: Behaves differently for macOS and iPad
    */
   public let min: CGFloat?
   /**
    * Default size used
    * - Description: Ideal size for the column. This value represents the preferred width that the column should occupy when possible, within the constraints of the minimum and maximum widths.
    * - Note: Behaves differently for macOS and iPad
    */
   public let ideal: CGFloat
   /**
    * Max size
    * - Description: The maximum width of the column. If set to `nil`, the column width is not constrained on the upper end.
    * - Note: Behaves differently for macOS and iPad
    */
   public let max: CGFloat?
   /**
    * Initializes a new `ColumnWidth` instance with the specified minimum, ideal, and maximum widths for a column.
    * This configuration allows for flexible and adaptive layouts within a `NavigationSplitView`, accommodating different devices and orientations.
    * - Parameters:
    *   - min: The minimum width of the column. If nil, the column width is not constrained on the lower end.
    *   - ideal: The recommended width of the column. This width is used when possible within the constraints of the minimum and maximum widths.
    *   - max: The maximum width of the column. If nil, the column width is not constrained on the upper end.
    */
   public init(min: CGFloat?, ideal: CGFloat, max: CGFloat?) {
      self.min = min
      self.ideal = ideal
      self.max = max
   }
}
