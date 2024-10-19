import SwiftUI
import HybridColor
import SplitViewKit

#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   SideBarHeader(
      title: "Sidebar"//,
      /*isSideBarShown: .constant(false),*/
//      preferredCompactColumn: .constant(.sidebar)
   )
   .background(Color.black/*blackOrWhite*/.opacity(1))
   .environment(\.colorScheme, .dark) // dark
}
