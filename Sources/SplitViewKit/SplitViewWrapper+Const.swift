import SwiftUI
/**
 * Signatures for the splitview column closures
 * - Description: Defines type aliases for closure signatures used in the split view wrapper, facilitating the creation of the sidebar, content, detail, and overlay views with consistent parameters.
 * - Important: ⚠️️ These aliases needs to stay inside this cope. as they use generics from the scope
 * - Fixme: ⚠️️ Why is split-config not a binding here? I guess because it's an ObservedObject and they don't need to be bindings, the bindings are encapsulated within the instance? look into it. ask copilot etc
 */
extension SplitViewWrapper {
   /**
    * Alias for a closure that returns a "Sidebar view"
    * - Abstract: A closure type that returns a Sidebar view configured with SplitConfig and sizeClass.
    * - Description: Defines a closure type for creating a sidebar view,
    *                which is dynamically configured based on the provided
    *                `SplitConfig` and `sizeClass`
    */
   public typealias SideBarAlias = (
      _ splitConfig: SplitConfig,
      _ sizeClass: Binding<UserInterfaceSizeClass?>
   ) -> SideBar
   /**
    * Alias for a closure that returns a "Content view" (aka Main view) with a toggleColumn binding.
    * - Abstract: An alias for a closure that returns the main content view, configured with `SplitConfig` and `sizeClass`.
    * - Description: Defines a closure type for creating a main content view,
    *                dynamically configured based on the provided `SplitConfig`
    *                and `sizeClass`
    * - Note: We inject the bidning so it can be controlled by a button
    * - Note: alternative name: `MainColumnAlias`
    */
   public typealias MainAlias = (
      _ splitConfig: SplitConfig,
      _ sizeClass: Binding<UserInterfaceSizeClass?>
   ) -> Content
   /**
    * Alias for a closure that returns a "Detail view" with a toggleColumn binding.
    * - Abstract: A closure type that returns a Detail view configured with SplitConfig and sizeClass.
    * - Description: Provides a closure type for creating a "Detail view" which can be toggled via a binding.
    * - Note: We inject the bidning so it can be controlled by a button
    */
   public typealias DetailAlias = (
      _ splitConfig: SplitConfig,
      _ sizeClass: Binding<UserInterfaceSizeClass?>
   ) -> Detail
   /**
    * Alias for a closure that returns an optional "Overlay view".
    * - Description: Defines a closure type for creating an "Overlay view"
    *                which can be conditionally displayed over the main content
    *                based on the provided `SplitConfig` and `sizeClass`
    * - Note: suitable for debugging or floating UI that can change the splitview UI, since we get the splitview bindings etc
    */
   public typealias OverlayAlias = (
      _ splitConfig: SplitConfig,
      _ sizeClass: Binding<UserInterfaceSizeClass?>
   ) -> OverlayView?
}
