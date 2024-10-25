import Foundation
/**
 * Default ColumnWidths
 * - Description: Default implementation that just returns nil which then
 *                uses the default column width
 * - Note: Detail-column looks squashed in portrait for iPad using 3-columns and the ballanced option, to avoid this, provide your own columnwidth struct with less narrow detail column-width etc
 * - Note: We can also set responsive break points for iPad
 * - Note: we can also use userdefaults to persist columnwidths for macos
 * - Note: And adjust columnwidths to be more narrow in landscape 70% split mode for iPad
 */
public struct DefaultColumnWidth: ColumnWidthKind {
   /**
    * - Note: Required init for publc classes
    */
   public init() {}
}
