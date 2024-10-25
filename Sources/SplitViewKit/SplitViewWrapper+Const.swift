import SwiftUI
/**
 * Const - typealias
 * - Description: Signatures for the splitview column closures
 * - Important: ⚠️️ These aliases needs to stay inside this cope. as they use generics from the scope
 * - Fixme: ⚠️️ Why is not splitconfig a binding here? I guess because its an ObservedObject and they dont need to be bindings, the bindings are encapsulated within the instance? look into it. ask copilot etc
 */
extension SplitViewWrapper {
   /**
    * Alias for a closure that returns a "Sidebar view"
    * - Fixme: ⚠️️ add description
    */
   public typealias SideBarAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> SideBar
   /**
    * Alias for a closure that returns a "Content view" (aka Main view) with a toggleColumn binding.
    * - Fixme: ⚠️️ add description
    * - Note: We inject the bidning so it can be controlled by a button
    * - Note: alternative name: `MainColumnAlias`
    */
   public typealias MainAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Content
   /**
    * Alias for a closure that returns a "Detail view" with a toggleColumn binding.
    * - Description: Provides a closure type for creating a "Detail view" which can be toggled via a binding.
    * - Note: We inject the bidning so it can be controlled by a button
    */
   public typealias DetailAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> Detail
   /**
    * - Fixme: ⚠️️ add description
    * - Note: suitable for debugging or floating UI that can change the splitview UI, since we get the splitview bindings etc
    */
   public typealias OverlayAlias = (_ splitConfig: SplitConfig, _ sizeClass: Binding<UserInterfaceSizeClass?>) -> OverlayView?
}

