import SwiftUI
import SplitViewKit
/**
 * - Fixme: ⚠️️ Change name to to ..Credential...
 * - Fixme: ⚠️️ Add preview
 * - Fixme: ⚠️️⚠️️⚠️️ Rename to MainView? 👈 - Fixme: ⚠️️ rename to MainColumn? MainColumnView? or keep?
 */
struct MainView: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var title: String
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    */
   @Binding var selectedMainIndex: Int // = 0
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to detailModels? or models or? or keep as is?
    */
   let items: DataModels
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to selectedDetailModel? or selectedModel or selectedMainItem?
    */
   @Binding var selectedItem: DataModel?
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ make this ObeervedObject later
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
}

