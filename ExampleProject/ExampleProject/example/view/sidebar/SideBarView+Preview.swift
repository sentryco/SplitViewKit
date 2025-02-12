import SwiftUI
import HybridColor
import SplitViewKit
/**
 * SideBarView preview
 */
#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   SideBarView(
      selectedSideBarIndex: .constant(0),
      sizeClass: .constant(.regular),
      splitConfig: .init()
   )
      .background(Color.blackOrWhite)
      .environment(\.colorScheme, .dark) // dark-mode
}
