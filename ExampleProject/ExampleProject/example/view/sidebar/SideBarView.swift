import SwiftUI
import SplitViewKit
/**
 * - Fixme: ⚠️️ Add doc
 */
public struct SideBarView: View {
   /**
    * - Fixme: ⚠️️ Add doc
    */
   @Binding var selectedSideBarIndex: Int
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
   /**
    *  - Fixme: ⚠️️ add doc
    */
   @Binding var splitConfig: SplitConfig
}

