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
      .padding(.vertical, 24) // Applies vertical padding of 24 points to the VStack to ensure consistent spacing around the content.
      .sheet(isPresented: $isSheetPresented) {
         // Content of the sheet goes here
         Button("Dismiss") {
            isSheetPresented.toggle() // Toggles the state of `isSheetDetailPresented` to show or hide the detail sheet.
         }
         .buttonStyle(ActionButtonStyle()) // Applies the `ActionButtonStyle` to the button for a consistent toggle effect.
      }
   }
}
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
   func getRow(title: String) -> some View {
      Button {
         isSheetPresented.toggle() // Toggles the state of `isSheetPresented` to show or hide the sheet.
      } label: {
         Text(title)
            .listTextStyle(color: Color.whiteOrBlack.opacity(0.8))
      }
   }
}
