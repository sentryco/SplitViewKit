import SwiftUI

extension NavigationSplitViewStyle {
   /**
    * Used to debug navigationSplitViewStyle (not in use atm)
    * - Note: `.automatic` will use switch between ballanced and detailProminent, .detailProminent will make detail fullscreen, and other columns hover over. (automatic is easy to implement, balanced looks better, but you have to account for responsive break-points your self, setting minWidth to children just gets clipped, no effect on parent column etc)
    * - Note: We don't use navigationSplitViewStyle as a state because we only set it at setup.
    * - Note: We keep this in the example project to keep the kit code as small as possible
    */
   internal var description: String {
      switch true {
         // **Balanced**: This style reduces the size of the detail view to accommodate the leading columns side-by-side.
      case self is BalancedNavigationSplitViewStyle: "balanced"
         // **Prominent Detail**: This style maintains the size of the detail view, with the leading columns overlayed on top of it.
      case self is ProminentDetailNavigationSplitViewStyle: "prominent"
         // **Automatic**: This is the default setting, providing a context-specific style.
      case self is AutomaticNavigationSplitViewStyle: "automatic"
      default: "Case not covered"
      }
   }
}
