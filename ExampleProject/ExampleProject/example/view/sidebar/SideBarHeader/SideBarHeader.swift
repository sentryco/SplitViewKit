import SwiftUI
import SplitViewKit
/**
 * - Abstract: sidebar header with custom sideBar btn above title (only show it if sidebar is hidden)
 * - Note: We use custom struct for header. we don't reuse across columns because each header has different toggle buttons etc
 * - Fixme: ⚠️️ move into files and folder etc
 * - Fixme: ⚠️️ there is a bug in sidebar, seems like there is a ghost btn after going from detail full etc, its probably due to back btn shenanigance etc
 */
struct SideBarHeader: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let title: String
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
   /**
    *  - Fixme: ⚠️️ add doc
    */
   /*@Binding */var splitConfig: SplitConfig
}
