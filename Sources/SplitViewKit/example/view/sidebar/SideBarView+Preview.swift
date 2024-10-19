import SwiftUI

#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   SideBarView(
      selectedSideBarIndex: .constant(0)//,
      /*isSideBarShown: .constant(false),*/
//      preferredCompactColumn: .constant(.sidebar)
   )
      .background(Color.black/*blackOrWhite*/.opacity(1))
      .environment(\.colorScheme, .dark) // dark
}
