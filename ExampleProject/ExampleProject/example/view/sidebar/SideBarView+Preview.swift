import SwiftUI
import HybridColor

#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   SideBarView(
      selectedSideBarIndex: .constant(0),
      sizeClass: .constant(.regular),
      splitConfig: .constant(.init())
   )
      .background(Color.blackOrWhite.opacity(1))
      .environment(\.colorScheme, .dark) // dark
}
