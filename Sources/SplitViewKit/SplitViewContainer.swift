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
 * - Note: We keep this in it's own class, as it has some standard configs etc, less complexity in the implimentation file etc
 * - Note: We also might change the splitview contraption later, but not the content it consumes etc, so seperation is useful
 * - Note: We use `NavSplitView` over `HSplitView`, because we also Use navSplitview in the ipad, so we can get synergies etc
 * - Note: This has auto-hide when size gets small enough for sidebar
 * - Note: Alternative names for this: `SplitContainerView`? or `SplitViewWrapper`? 
 * Mindset:
 *  small (iPhone, iPad window): [primary w/ tagbar] -> [detail]
 *  medium (iPad portrait): [Compact-SideBar, primary, Detail] (here we might need to just have a reveal btn that shows sidebar etc)
 *  large (iPad, macOS): [SideBar, primary, detail]
 */
public struct SplitViewContainer<SideBar: View, Content: View, Detail: View>: View {
   /**
    * Left `side-menu-bar`
    * - Description: Represents the sidebar component of the split view. This sidebar acts as a navigation or menu column in the split view layout, typically containing navigation links or menu items that control what is displayed in the main content area.
    */
   @ViewBuilder var sideBar: SideBarAlias
   /**
    * Center `main-content`
    * - Description: Represents the central content area of the split view. This is the primary view where the main application content is displayed. It typically contains the bulk of the user interface and interactive elements, serving as the focal point of user engagement within the app.
    */
   @ViewBuilder var content: MainAlias
   /**
    * Right side `detail-view`
    * - Description: Represents the detail component of the split view. This view is typically used to display more detailed information about an item selected from the main content area. It can also serve as a space for secondary actions and insights that complement the primary content.
    */
   @ViewBuilder var detail: DetailAlias
   /**
    * - Abstract: Used to detect if the app is in compact or regular mode.
    * - Description: This environment property helps in determining the horizontal size class of the current environment. It's crucial for adapting the UI elements based on the available space. It should be accessed from the correct scope to ensure accurate detection of the mode, as incorrect scope access can lead to misidentification between compact and regular modes.
    * - Important: ⚠️ Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Environment(\.horizontalSizeClass) var sizeClass: UserInterfaceSizeClass?
   /**
    * State object for managing the configuration of the split view.
    * - Description: `splitConfig` holds the state for various configuration settings of the split view such as column visibility and dimensions. It is crucial for dynamically adjusting the layout based on the device's orientation and size class changes.
    */
   @StateObject internal var splitConfig: SplitConfig = .init()
   /**
    * Indicates whether the split view container should display debugging information.
    * - Description: When set to `true`, the split view container will show additional debugging information that can help in diagnosing layout and state management issues. This can include visual indicators or console outputs detailing the current configuration and behavior of the split view components.
    */
   let isDebug: Bool
   /**
    * Init
    * - Description: Initializes the split view container with the provided views and configuration settings.
    * - Fixme: ⚠️️ Add ability set columnVisibility in the init? as a param?
    * - Fixme: ⚠️️ Add ability set preferredCompactColumn in the init? as a param?
    * - Parameters:
    *   - sideBar: menuColumn content closure (left)
    *   - content: mainColumn content closure (center)
    *   - detail: detailColumn content closure (right)
    *   - isDebug: Indicates if debugging information should be displayed. Useful for development and troubleshooting.
    */
   public init(sideBar: @escaping SideBarAlias,
               content: @escaping MainAlias,
               detail: @escaping DetailAlias,
               isDebug: Bool = false) {
      self.sideBar = sideBar
      self.content = content
      self.detail = detail
      self.isDebug = isDebug
   }
}
