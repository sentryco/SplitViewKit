import SwiftUI
import SplitViewKit
/**
 * View that is the destination for main
 * - Description: The detail view is the destination for the main view. It is
 *                responsible for displaying the detail data and managing the
 *                layout and responsiveness based on the current size class and
 *                split configuration.
 * - Note: Alternative name: `DetailColumnView`
 * - Note: Adding some kind of overflow in detail would be nic. But maybe best to make min-width for detail etc. simpler. User sees all content at all time.
 * - Fixme: ⚠️️ Add preview 👈
 */
internal struct DetailView: View {
   /**
    * - Description: This environment property allows the view to dismiss
    *                itself, typically used in modal presentations or when
    *                navigating back in a navigation stack.
    * - Note: It seems fine to keep this here
    */
   #if os(iOS)
   @Environment(\.dismiss) internal var dismiss: DismissAction
   #endif
   /**
    * - Description: This property stores the title of the detail view,
    *                which is displayed at the top of the view.
    */
   internal var title: String
   /**
    * - Description: Stores the detailed data associated with a specific item
    *                selected from the main view. This data is used to populate
    *                the detail view's content.
    */
   internal let detailData: DetailData
   /**
    * - Description: Configuration for managing the split view behavior in the
    *                detail view, affecting how the view adapts to different
    *                screen sizes and orientations.
    */
   internal var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when
    *         it should be regular in the wrong scope etc. so param drilling is
    *         probably better to avoid future hard to find bugs
    */
   @Binding internal var sizeClass: UserInterfaceSizeClass?
}
