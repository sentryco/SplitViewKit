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
         let button = Button("Dismiss") {
            isSheetPresented.toggle() // Toggles the state of `isSheetDetailPresented` to show or hide the detail sheet.
         }
         .actionButtonStyle // Applies the `ActionButtonStyle` to the button for a consistent toggle effect.
         #if os(macOS) // Sheets needs some sizng for macOS. These are just fixed sizes.
         // Makes sheet sizing for macOS. Dynamic / Responsive
         let screenSize = NSApplication.shared.windows.first?.frame.size ?? CGSize(width: 600, height: 400)
         button.frame(width: screenSize.width * 0.6, height: screenSize.height * 0.6)
         #else
         button // No sizing needed for iPad
         #endif
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
      #if os(macOS)
      .buttonStyle(PlainButtonStyle()) // Apply plain button style to remove default macOS styling
      #endif
   }
}
