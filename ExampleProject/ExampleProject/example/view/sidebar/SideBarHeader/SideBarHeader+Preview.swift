import SwiftUI
import HybridColor
import SplitViewKit
/**
 * Prevew for sidebar header
 */
#Preview(traits: .fixedLayout(width: 700, height: 300)) {
   SideBarHeader(
      title: "Sidebar",
      sizeClass: /*.*/.constant(.regular),
      splitConfig: .init()
   )
   .background(Color.black/*blackOrWhite*/.opacity(1))
   .environment(\.colorScheme, .dark) // dark
}
