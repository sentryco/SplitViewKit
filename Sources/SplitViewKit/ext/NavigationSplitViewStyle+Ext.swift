import SwiftUI

extension NavigationSplitViewStyle {
   /**
    * - Fixme: ⚠️️ add doc
    */
   public var description: String {
      switch true {
         // **Balanced**: This style reduces the size of the detail view to accommodate the leading columns side-by-side.
      case self is BalancedNavigationSplitViewStyle: ""
         // **Prominent Detail**: This style maintains the size of the detail view, with the leading columns overlayed on top of it.
      case self is ProminentDetailNavigationSplitViewStyle: ""
         // **Automatic**: This is the default setting, providing a context-specific style.
      case self is AutomaticNavigationSplitViewStyle: ""
      default: "Case not covered"
      }
   }
}
