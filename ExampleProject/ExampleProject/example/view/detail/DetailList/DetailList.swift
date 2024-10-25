import SwiftUI
/**
 * - Description: This view represents a list of details, where each item can be interacted with to present more information in a modal sheet.
 * - Note: Alt names: `DetailStack` or `DetailContainer`
 * - Fixme: ⚠️️ add preview 👈
 */
struct DetailList: View {
   /**
    * Stores the detail-data associated with a specific item-selected from the main-view.
    */
   let detailData: DetailData
   /**
    * Tracks whether the detail-modal-sheet is presented
    *  - Fixme: ⚠️️ Add alert for settings items in the example code
    */
   @State internal var isSheetPresented = false
   /**
    * Initializes a `DetailList` with the specified detail data.
    * - Parameter detailData: The data to display in the list.
    */
   public init(detailData: DetailData) {
      self.detailData = detailData
   }
}
