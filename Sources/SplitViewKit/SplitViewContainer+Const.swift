import SwiftUI
/**
 * Const - typealias
 * - Description: Signatures for the splitview column closures
 * - Note: sizeClass needs to be a binding or else UI doesnt react on changes. 
 * - Important: ⚠️️ These aliases needs to stay inside this cope. as they use generics from the scope
 * - Fixme: ⚠️️ why is not splitconfig a binding here? I guess because its an ObservedObject and they dont need to be bindings? look into it
 */
extension SplitViewContainer {
   /**
    * Alias for a closure that returns a "Sidebar view"
    */
   public typealias SideBarAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> SideBar
   /**
    * Alias for a closure that returns a "Content view" (aka Main view) with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Note: alternative name: `MainColumnAlias`
    * - Fixme: ⚠️️ The toggle may not be needed for macOS, as we do it with a selector etc, elaborate?
    */
   public typealias MainAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Content
   /**
    * Alias for a closure that returns a "Detail view" with a toggleColumn binding.
    * - Note: We inject the bidning so it can be controlled by a button
    * - Description: Provides a closure type for creating a "Detail view" which can be toggled via a binding.
    */
   public typealias DetailAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Detail
   /**
    * - Fixme: ⚠️️ add doc
    * - Note: suitable for debugging or floating UI that can change the splitview UI, since we get the splitview bindings etc
    */
   public typealias OverlayAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> OverlayView?
}

