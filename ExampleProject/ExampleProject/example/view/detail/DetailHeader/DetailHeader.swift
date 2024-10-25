import SwiftUI
import SplitViewKit
/**
 * We use custom struct for header. we don't reuse across columns because each header has different toggle buttons etc
 * - Description: This struct represents the header view for the detail view in the application. It includes a title, manages the split view configuration, and adapts to different size classes. The header also provides a dismiss action to navigate back.
 * - Fixme: ⚠️️ Add preview
 */
struct DetailHeader: View {
   /**
    * The title displayed in the header of the detail view.
    * - Description: The title of the detail view, which is displayed in the header.
    */
   let title: String
   /**
    * Configuration for managing the split view behavior in the header view, affecting how the view adapts to different screen sizes and orientations.
    * - Description: The configuration for managing the split view behavior in the header view, affecting how the view adapts to different screen sizes and orientations.
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   var sizeClass: UserInterfaceSizeClass?
   /**
    * - Description: The environment dismiss action to navigate back to the previous view.
    */
   @Environment(\.dismiss) internal var dismiss
}
