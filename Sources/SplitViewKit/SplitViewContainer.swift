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
 * - Note: Lots of useful code for mac navigation: https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4
 * - Note: more navigation and splitview code: https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/
 * - Note: Comprehensive doc on navsplitview: https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/
 * - Note: Pretty gd: https://www.appcoda.com/navigationsplitview-swiftui/
 * Mindset:
 *  small (iPhone, iPad window): [primary w/ tagbar] -> [detail]
 *  medium (iPad portrait): [Compact-SideBar, primary, Detail] (here we might need to just have a reveal btn that shows sidebar etc)
 *  large (iPad, macOS): [SideBar, primary, detail]
 * - Fixme: ⚠️️ We should store the ideal sizes in a typalias? Elaborate?
 * - Fixme: ⚠️️ Rename to `SplitContainerView`? or `SplitViewWrapper`?
 * - Fixme: ⚠️️⚠️️ Move `SplitViewContainer` to own repo? or? add the debug class as well etc
 * - Fixme: ⚠️️ add grayscale debug colors, better for gif for OSS readme etc
 * - Fixme: ⚠️️ Look into TupleView construct?
 */
public struct SplitViewContainer<SideBar: View, Content: View, Detail: View>: View {
   /**
    * Left `side-menu-bar`
    * - Fixme: ⚠️️ add doc, use copilot
    */
   @ViewBuilder var sideBar: SideBarAlias
   /**
    * Center `main-content`
    * - Fixme: ⚠️️ add doc, use copilot
    */
   @ViewBuilder var content: MainAlias
   /**
    * Right side `detail-view`
    * - Fixme: ⚠️️ add doc, use copilot
    */
   @ViewBuilder var detail: DetailAlias
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Environment(\.horizontalSizeClass) var sizeClass: UserInterfaceSizeClass?
   /**
    * - Fixme: ⚠️️ add doc
    */
   @StateObject internal var splitConfig: SplitConfig = .init()
   /**
    * - Fixme: ⚠️️ add doc
    */
   let isDebug: Bool
   /**
    * Init
    * - Fixme: ⚠️️ Add ability set columnVisibility in the init? as a param?
    * - Fixme: ⚠️️ Add ability set preferredCompactColumn in the init? as a param?
    * - Parameters:
    *   - sideBar: menuColumn content closure (left)
    *   - content: mainColumn content closure (center)
    *   - detail: detailColumn content closure (right)
    *   - isDebug: - Fixme: ⚠️️ add doc
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

// 🏀 Continue here
// - Fixme: ⚠️️ Maybe also add a sheet and alert to test them in split, portrait, compact window etc 👈🏀 when we press detail items etc
// - Fixme: ⚠️️ improve doc with cursor
// - Fixme: ⚠️️ Add Github actions for building. and badge for org readme etc. and add gifs for all readmes etc

// later
// - Fixme: ⚠️️ Test to see if macOS still works okay 
