import SwiftUI

#Preview {
   MainHeader(
      title: "Accounts"
      /*isSideBarShown: .constant(false),*/
      /*preferredCompactColumn: .constant(.content)*/
   )
   .background(Color.black/*blackOrWhite*/.opacity(1))
   .environment(\.colorScheme, .dark) // dark
}
