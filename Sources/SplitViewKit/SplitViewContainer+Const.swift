import SwiftUI
/**
 * Const - typealias
 * - Description: Signatures for the splitview column closures
 * - Fixme: ⚠️️ why is not splitconfig a binding here? i guess because its an ObservedObject and they dont need to be bindings? look into it
 */
extension SplitViewContainer {
   /**
    * Alias for a closure that returns a "Sidebar view"
    */
   public typealias SideBarAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> SideBar
   /**
    * Alias for a closure that returns a "Content view" (aka Main view) with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Fixme: ⚠️️ The toggle may not be needed for macOS, as we do it with a selector etc, elaborate?
    * - Fixme: ⚠️️ Rename to MainColumnAlias?
    */
   public typealias MainAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Content
   /**
    * Alias for a closure that returns a "Detail view" with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Fixme: ⚠️️ Add doc regarding which column this is etc
    */
   public typealias DetailAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Detail
}

