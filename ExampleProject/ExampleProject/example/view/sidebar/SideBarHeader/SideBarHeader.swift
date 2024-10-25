import SwiftUI
import SplitViewKit
/**
 * - Abstract: Sidebar header with custom sideBar btn above title (only show it if sidebar is hidden)
 * - Description: Represents the visual header component of the sidebar,
 *                which includes a toggle button to show or hide the sidebar
 *                based on its current visibility state.
 * - Note: We use custom struct for header. We don't reuse across
 *         columns because each header has different toggle buttons etc
 */
struct SideBarHeader: View {
   /**
    * - Description: The title text of the sidebar header
    */
   let title: String
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact
    *         when it should be regular in the wrong scope etc. so param
    *         drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
   /**
    * - Description: The split configuration of the sidebar
    */
   var splitConfig: SplitConfig
}
