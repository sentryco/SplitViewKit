import SwiftUI
/**
 * Content
 */
extension DetailList {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var body: some View {
      VStack(spacing: .zero) {
         ForEach(detailData, id: \.self) { (_ title: String) in
            getRow(title: title)
         }
      }
      .padding(.vertical, 12)
   }
}
/**
 * Components
 */
extension DetailList {
   /**
    * Get row
    */
   func getRow(title: String) -> some View {
      Text(title)
         .listTextStyle(color: Color.whiteOrBlack.opacity(0.8))
   }
}
