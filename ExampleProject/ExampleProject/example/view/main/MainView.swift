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
   @State var selectedMainIndex: Int = 0
   //   @Binding var selectedMainIndex: Int
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to detailModels? or models or? or keep as is?
    */
   var items: [DataModel]
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename to selectedDetailModel? or selectedModel
    */
   @Binding var selectedItem: DataModel?
}

