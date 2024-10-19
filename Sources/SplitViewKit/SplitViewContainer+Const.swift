import SwiftUI
/**
 * Const - typealias
 */
extension SplitViewContainer {
   /**
    * Alias for a closure that returns a Sidebar view. (convenient)
    */
   public typealias SideBarAlias = (_ splitConfig: SplitConfig) -> SideBar /*_ isSideBarShown: Binding<Bool>, _ preferredCompactColumn: Binding<NavigationSplitViewColumn>*/
   /**
    * Alias for a closure that returns a Content view with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Fixme: ⚠️️ The toggle may not be needed for macOS, as we do it with a selector etc, elaborate?
    * - Fixme: ⚠️️ Add doc regarding which column this is etc
    * - Fixme: ⚠️️ Rename to MainColumnAlias?
    */
   public typealias MainAlias = (_ splitConfig: SplitConfig) -> Content /*_ isSideBarShown: Binding<Bool>, _ preferredCompactColumn: Binding<NavigationSplitViewColumn>*/
   /**
    * Alias for a closure that returns a Detail view with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Fixme: ⚠️️ Add doc regarding which column this is etc
    * - Fixme: ⚠️️⚠️️⚠️️ Replace this with `columnVisibility: Binding<NavigationSplitViewVisibility>`
    */
   public typealias DetailAlias = (_ splitConfig: SplitConfig) -> Detail /*_ isDetailFullScreen: Binding<Bool>*/
}

