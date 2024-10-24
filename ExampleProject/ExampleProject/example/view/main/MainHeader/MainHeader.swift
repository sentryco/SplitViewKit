import SwiftUI
import SplitViewKit
/**
 * - Description: A custom struct for the header of the main view.
 * - Note: We use custom struct for header. we don't reuse across columns because each header has different toggle buttons etc
 * - Fixme: ⚠️️ Main header should have back button maybe, if we cant get back to sidebar in compact mode etc? if so, we must hide show-side menu. so flip these etc
 */
struct MainHeader: View {
   /**
    * - Description: The title of the MainHeader, which is displayed prominently at the top of the view.
    */
   let title: String
   /**
    * - Description: Configuration for the split view behavior in the header, affecting how the view adapts to different screen sizes and orientations.
    * - Fixme: ⚠️️ Make this ObservedObject later
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
   /**
    * - Description: Dismisses the current view, typically used to navigate back in the navigation stack.
    */
   @Environment(\.dismiss) internal var dismiss
}
