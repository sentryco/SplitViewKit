import SwiftUI
import SplitViewKit
/**
 * - Description: The sidebar view, which includes the header and the list of items.
 */
public struct SideBarView: View {
   /**
    * - Description: The selected index of the sidebar item.
    */
   @Binding var selectedSideBarIndex: Int
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   /* */@Binding var sizeClass: UserInterfaceSizeClass?
   /**
    * - Description: The split configuration of the sidebar.
    */
   var splitConfig: SplitConfig
}

