import SwiftUI
/**
 * - Fixme: ⚠️️ Change name to to ..Credential...
 * - Fixme: ⚠️️ Add preview
 * - Fixme: ⚠️️⚠️️⚠️️ Rename to MainView? 👈 - Fixme: ⚠️️ rename to MainColumn? MainColumnView? or keep?
 */
struct MainView: View {
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    */
   @Binding var selectedMainIndex: Int// = 0
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to detailModels? or models or? or keep as is?
    */
   var items: DataModels
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to selectedDetailModel? or selectedModel
    */
   @Binding var selectedItem: DataModel?
}

