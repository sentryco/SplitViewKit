import SwiftUI
/**
 * - Fixme: ⚠️️ Change name to to ..Credential...
 * - Fixme: ⚠️️ Add preview
 * - Fixme: ⚠️️⚠️️⚠️️ Rename to MainView? 👈 - Fixme: ⚠️️ rename to MainColumn? MainColumnView? or keep?
 */
struct MainView: View {
   // - Fixme: ⚠️️ add doc
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
}

