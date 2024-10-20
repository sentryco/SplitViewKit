import SwiftUI
import HybridColor

#Preview {
   MainHeader(
      title: "Accounts",
      splitConfig: .init(),// .constant()
      sizeClass: .constant(.regular)
      /*isSideBarShown: .constant(false),*/
      /*preferredCompactColumn: .constant(.content)*/
   )
   .background(Color.blackOrWhite/**/.opacity(1))
   .environment(\.colorScheme, .dark) // dark
}
