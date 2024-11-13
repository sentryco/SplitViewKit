import SwiftUI
/**
 * Components
 */
extension DetailList {
   /**
    * Get row
    * - Description: Creates a button styled row for each title in the detail list.
    * - Parameter title: The text to be displayed on the button within the list.
    * - Returns: A view representing a row in the list, which is a button containing the title text.
    */
   internal func getRow(title: String) -> some View {
      Button {
         isSheetPresented.toggle() // Toggles the state of `isSheetPresented` to show or hide the sheet.
      } label: {
         Text(title)
            .listTextStyle(color: Color.whiteOrBlack.opacity(0.8))
      }
      #if os(macOS)
      .buttonStyle(PlainButtonStyle()) // Apply plain button style to remove default macOS styling
      #endif
   }
}
