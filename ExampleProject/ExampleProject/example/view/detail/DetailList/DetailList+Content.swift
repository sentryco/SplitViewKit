import SwiftUI
/**
 * Content
 */
extension DetailList {
   /**
    * - Description: This extension provides the layout and behavior for the list of details in the `DetailList` view.
    * - Fixme: ⚠️️ Check if .contentMargins(.vertical, .zero) fixes the issue with 12 not working as padding?
    * - Fixme: ⚠️️ This should be 12. like main and sidebar. not sure why it isnt, figure it out mayb some contentMargin
    */
   internal var body: some View {
      VStack(spacing: .zero) { // Vertical stack
         ForEach(detailData, id: \.self) { (_ title: String) in
            getRow(title: title)
         }
      }
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
