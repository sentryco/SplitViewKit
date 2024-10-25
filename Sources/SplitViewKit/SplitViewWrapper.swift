import SwiftUI
/**
 * A reusable container for multi column apps (iPad / macOS)
 * - Abstract: `SplitViewContainer` is a wrapper for `NavigationSplitView` to make it simpler to use
 * - Description: The `SplitViewContainer` struct provides a three-column layout for building 
 *                adaptive and responsive user interfaces suitable for iPad and macOS applications.
 *                It simplifies the usage of `NavigationSplitView` by encapsulating common
 *                configurations and behaviors, allowing for a more streamlined implementation
 *                in the consuming code. The container supports dynamic column visibility and is
 *                designed to accommodate various device sizes and orientations, ensuring a consistent
 *                user experience across different platforms.
 * - Note: We keep this as a wrapper over `NavigationSplitView`, as it has some standard configs etc, less complexity in the implimentation file etc 
 * Mindset:
 *  small (iPhone, iPad window): [primary w/ tagbar] -> [detail]
 *  medium (iPad portrait): [Compact-SideBar, primary, Detail] (here we might need to just have a reveal btn that shows sidebar etc)
 *  large (iPad, macOS): [SideBar, primary, detail]
 */
public struct SplitViewWrapper<SideBar: View, Content: View, Detail: View, OverlayView: View>: View {
   /**
    * Left `side-menu-bar`
    * - Description: Represents the sidebar component of the split view. This sidebar acts as a navigation or menu column in the split view layout, typically containing navigation links or menu items that control what is displayed in the main content area.
    */
   @ViewBuilder internal var sideBar: SideBarAlias
   /**
    * Center `main-content`
    * - Description: Represents the central content area of the split view. This is the primary view where the main application content is displayed. It typically contains the bulk of the user interface and interactive elements, serving as the focal point of user engagement within the app.
    */
   @ViewBuilder internal var content: MainAlias
   /**
    * Right side `detail-view`
    * - Description: Represents the detail component of the split view. This view is typically used to display more detailed information about an item selected from the main content area. It can also serve as a space for secondary actions and insights that complement the primary content.
    */
   @ViewBuilder internal var detail: DetailAlias
   /**
    * Indicates whether the split view container should display debugging information
    * - Description: When not nil, the split view container can show additional debugging information that can help in diagnosing layout and state management issues. This can include visual indicators or console outputs detailing the current configuration and behavior of the split view components.
    */
   @ViewBuilder internal var overlay: OverlayAlias
   /**
    * - Abstract: Used to detect if the app is in compact or regular mode.
    * - Description: This environment property helps in determining the horizontal size class of the current environment. It's crucial for adapting the UI elements based on the available space. It should be accessed from the correct scope to ensure accurate detection of the mode, as incorrect scope access can lead to misidentification between compact and regular modes.
    * - Important: ⚠️ Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Environment(\.horizontalSizeClass) internal var sizeClass: UserInterfaceSizeClass?
   /**
    * State object for managing the configuration of the split view.
    * - Description: `splitConfig` holds the state for various configuration settings of the split view such as column visibility and dimensions. It is crucial for dynamically adjusting the layout based on the device's orientation and size class changes.
    * - Fixme: ⚠️️ could we make this optional?
    * - Fixme: ⚠️️⚠️️⚠️️ remove this as well. we can pass two params. thats fine. less helper code that way
    */
   @StateObject internal var splitConfig: SplitConfig
   /**
    * - Description: Used to store responsive break-points for iPad. And default columnwidths for mac etc.
    * - Note: The implimenter can setup userdefaults for the mac app in order to persist last used columnwidths etc. if needed etc
    */
   internal let columnWidth: ColumnWidthKind
   /**
    * - Abstract: Clever way to regenerate window on `window-resize` (iPad)
    * - Note: As a last resort, you can force a view to redraw by changing it's identity
    * - Note: using a refreshID is less invasive than using a state for winWidth. We dont have an init winWidth for instance. and more bindings might be required etc. it would also cause aditional redraws with zero as the value etc. I think
    * - Note: it might make more sense to use size state if we deside you use a sizetracker. 
    * - Fixme: ⚠️️ there might be other was than using refreshID. Try to refactor it out later
    */
   @State internal var refreshID = UUID()
   /**
    * Init
    * - Description: Initializes the split view container with the provided views and configuration settings.
    * - Parameters:
    *   - sideBar: menuColumn content closure (left)
    *   - content: mainColumn content closure (center)
    *   - detail: detailColumn content closure (right)
    *   - columnWidth: Bring your own responsive break-points for splitview
    *   - splitConfig: Allows us to set initial config state (Not intended for injecting another state elsewhere)
    *   - debug: Can be used to overlay debug consol or UI to control splitview
    */
   public init(sideBar: @escaping SideBarAlias,
               content: @escaping MainAlias,
               detail: @escaping DetailAlias,
               overlay: @escaping OverlayAlias = { _,_ in nil }, // - Fixme: ⚠️️ move empty closure to default const?
               columnWidth: ColumnWidthKind = DefaultColumnWidth(),
               splitConfig: SplitConfig = .init()) {
      self.sideBar = sideBar
      self.content = content
      self.detail = detail
      self.overlay = overlay
      self.columnWidth = columnWidth
      self._splitConfig = .init(wrappedValue: splitConfig)
   }
}
