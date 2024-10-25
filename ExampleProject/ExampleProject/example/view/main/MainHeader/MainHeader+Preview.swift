import SwiftUI
import HybridColor

#Preview {
   MainHeader(
      title: "Accounts",
      splitConfig: .init(),
      sizeClass: .constant(.regular)
   )
   .background(Color.blackOrWhite.opacity(1))
   .environment(\.colorScheme, .dark) // dark-mode
}
