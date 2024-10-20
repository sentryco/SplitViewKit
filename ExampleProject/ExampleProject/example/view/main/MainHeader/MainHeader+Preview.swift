import SwiftUI
import HybridColor

#Preview {
   MainHeader(
      title: "Accounts",
      splitConfig: .init(),// .constant()
      sizeClass: .constant(.regular)
   )
   .background(Color.blackOrWhite/**/.opacity(1))
   .environment(\.colorScheme, .dark) // dark
}
/*isSideBarShown: .constant(false),*/
/*preferredCompactColumn: .constant(.content)*/
