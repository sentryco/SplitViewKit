import SwiftUI
/**
 * - Abstract: Manages configuration settings for the `NavigationSplitView`, controlling column visibility and preferred columns based on device size and orientation.
 * - Description: Manages configuration settings for the `NavigationSplitView`
 *                in `SplitViewKit`, including visibility and preferred column
 *                in compact mode.
 * - Note: We can detect 70% mode with that custom 70% code and geometryreader etc
 * - Note: We can detect single column mode by checking `sizeclass == .compact`
 * - Fixme: ⚠️️ Consider removing this class. We can pass two params. Thats fine. Less helper code that way. Or keep it as is, we do pass more params as well, and this class has some getters that are nice to have in this scope etc?
 */
public class SplitConfig: ObservableObject {
   /**
    * - Discussion: I think all, will look strange for landscape 70% split-view, automatic should go to .double at that size, so use auto?
    * - Abstract: Controls the visibility of columns in the NavigationSplitView.
    * - Description: Determines which columns are visible in the `NavigationSplitView`, allowing customization of the user interface by specifying whether to show all columns, specific columns, or let the system decide automatically based on device characteristics.
    * - Note: Setting this to .double.. will also work fine. But is not the use case for SplitViewWrapper as of now
    */
   @Published public var columnVisibility: NavigationSplitViewVisibility
   /**
    * Prfered column when split-view is only 1 column
    * - Abstract: Sets the displayed column in compact mode.
    * - Description: When you have a `NavigationSplitView` running in a compact size class
    *                iPhones, Apple Watch, and any iPad when your app has been resized down
    *                to a small size – SwiftUI attempts to guess which of your split view
    *                columns is the best one to show. This guess is often correct, but you can
    *                control it by setting a 👉preferred-compact-column👈 for your Split-View.
    * - Note: Can be `.sidebar`, `.detail` or `.content` (aka main-column)
    */
   @Published public var preferredCompactColumn: NavigationSplitViewColumn
   /**
    * - Abstract: Initializes a new instance of `SplitConfig` with customizable column visibility and preferred compact column settings, enabling fine-tuned control over the `NavigationSplitView` configuration based on device size and orientation.
    * - Description: This property determines the visibility of columns in the
    *                `NavigationSplitView` based on the current device and
    *                orientation. It adjusts between all columns visible, double
    *                column, or detail only views.
    * - Note: Required init for publc classes
    * - Parameters:
    *   - columnVisibility: Specifies the visibility of columns in the NavigationSplitView. It can be set to .all, .doubleColumn, or .singleColumn to control the number of visible columns based on the device's orientation and size.
    *   - preferredCompactColumn: Determines the primary visible column in compact mode. Options include .sidebar, .content, or .detail, allowing explicit control over which column is displayed in a compact environment.
    */
   public init(
      columnVisibility: NavigationSplitViewVisibility = .all, 
      preferredCompactColumn: NavigationSplitViewColumn = .content
   ) {
      self.columnVisibility = columnVisibility
      self.preferredCompactColumn = preferredCompactColumn
   }
}
