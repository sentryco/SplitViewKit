import SwiftUI
/**
 * Content
 */
extension DetailList {
   /**
    * - Description: This extension provides the layout and behavior for the list of details in the `DetailList` view.
    */
   var body: some View {
      VStack(spacing: .zero) { // Vertical stack
         ForEach(detailData, id: \.self) { (_ title: String) in
            getRow(title: title)
         }
      }
      // - Fixme: ⚠️️ Check if .contentMargins(.vertical, .zero) fixes the issue with 12 not working as padding?
      // - Fixme: ⚠️️ This should be 12. like main and sidebar. not sure why it isnt, figure it out mayb some contentMargin
      .padding(.vertical, 24) // - Fixme: ⚠️️ doc this etc
      .sheet(isPresented: $isSheetPresented) {
         // Content of the sheet goes here
         Button("Dismiss") {
            isSheetPresented.toggle() // - Fixme: ⚠️️ doc this line?
         }
         .toggleButtonStyle // - Fixme: ⚠️️ doc this line?
      }
   }
}
/**
 * Components
 */
extension DetailList {
   /**
    * Get row
    * - Fixme: ⚠️️ add description
    * - Parameter title: - Fixme: ⚠️️ add doc
    * - Returns: - Fixme: ⚠️️ add doc
    */
   func getRow(title: String) -> some View {
      Button {
         isSheetPresented.toggle() // - Fixme: ⚠️️ doc this line
      } label: {
         Text(title)
            .listTextStyle(color: Color.whiteOrBlack.opacity(0.8))
      }
   }
}
