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
      Button {
         isSheetPresented = true
         Swift.print("Open sheet: \(title)")
      } label: {
         Text(title)
            .listTextStyle(color: Color.whiteOrBlack.opacity(0.8))
      }
      .sheet(isPresented: $isSheetPresented) {
         // Content of the sheet goes here
         Button("Dismiss") {
            isSheetPresented.toggle()
         }
         .toggleButtonStyle
      }
   }
}
