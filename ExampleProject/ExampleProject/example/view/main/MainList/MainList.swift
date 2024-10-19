import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview
 */
struct MainList: View {
   @Binding var selectedMainIndex: Int
   @Binding var selectedItem: DataModel?
   var items: [DataModel]
}
