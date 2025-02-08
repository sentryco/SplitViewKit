import SwiftUI
/**
 * Content
 */
extension MainList {
   /**
    * listContainer
    * - Description: Container for the list of items in the MainList view, using a VStack to align items vertically.
    * - Fixme: ⚠️️ We should probably use list?, because its more suitable for the case etc, use copilot
    */
   internal var body: some View {
      VStack(spacing: .zero) {
         rowViews
      }
      .padding(.vertical, 12) // Add top and bottom padding for the list etc
      .padding(.horizontal) // Adds horizontal padding
   }
}
