import SwiftUI
/**
 * DebugExampleView
 * - Description: This view serves as the primary interface for the ExampleProject, orchestrating the interaction between sidebar, main content, and detail views. It manages state and navigation, ensuring a cohesive user experience across different device sizes and orientations.
 * - Note: Has an interesting NavigationWrapper (but uses de-precated API,
 *         but can be used for inspo): https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/
 * - Note: We manage selection state in this implementation scope, and not in the helper splitview scope
 * - Note: I guess we manage all selection states here, as the columns can move into singular column mode in compact mode, or double etc
 * - Fixme: ⚠️️ Add navigation view, isn't that done?
 * - Fixme: ⚠️️ Try to style the list. We can style mainlist fine, but not prefsmainlist, why is that? still relevant?
 * - Fixme: ⚠️️ Maybe we do the prefsmain manually, and not with ListContainer, what?
 * - Fixme: ⚠️️ Make sure things work for iPhone and mac as well 👈
 * - Fixme: ⚠️️ Rename to MainView? or AppView? or is ExampleView fine? yepp keep as is
 * - Fixme: ⚠️️ Clearify around selected index and selected item etc. unify? its unclear atm why we have both etc
 * - Fixme: ⚠️️ Consider adding placeholder views when there is no selection etc (currently there is always a selection)
 */
struct ExampleView: View {
   /**
    * State variable to track the selected index in the sidebar
    * - Description: Used to track the current sidebar item selection
    * - Fixme: ⚠️️ Add description, use copilot
    */
   @State var selectedSideBarIndex: Int = 0
   /**
    * This state variable is defined at this scope because it is required by both the main and detail views.
    * - Description: Used to track the current main item selection
    * - Note: We keep this at this scope, because both main and detail needs it
    *         we could store it in main, and have a binding here, but for now this is how it is
    * - Fixme: ⚠️️ Add description, use copilot
    * - Fixme: ⚠️️ Rename to mainSelectedIndex? or keep as is?
    * - Fixme: ⚠️️ Make this optional as well, no selection etc
    * - Fixme: ⚠️️ it's possible to remove this. will require parsing with uuid etc, and passing main-model into detail. do it later
    */
   @State var selectedMainIndex: Int = 0
   /**
    * State variable to track the currently selected item
    * - Description: Tracks the currently selected item in the main view, which triggers updates to the detail view when changed.
    * - Note: When this is set, mainview changes
    * - Fixme: ⚠️️ Rename to selectedModel 👈 or keep as is?
    */
   @State var selectedMainItem: DataModel?
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    * - Fixme: ⚠️️ Make this non-optional?
    */
   @Environment(\.horizontalSizeClass) var sizeClass: UserInterfaceSizeClass?
   /**
    * - Description: Initializes the ExampleView with optional predefined selections for sidebar, main content, and detail views. This allows for restoring state or direct navigation to specific content when the view is created.
    * - Parameters:
    *   - selectedSideBarIndex: The index of the currently selected item in the sidebar. This index helps in determining which main content to display.
    *   - selectedMainIndex: The index of the currently selected item in the main view. This index is crucial for determining which detail view to show.
    *   - selectedMainItem: The data model of the item currently selected in the main view. This model is used to populate the detail view with specific item details.
    */
   init(selectedSideBarIndex: Int = 0, selectedMainIndex: Int = 0, selectedMainItem: DataModel? = nil) {
      self.selectedSideBarIndex = selectedSideBarIndex
      self.selectedMainIndex = selectedMainIndex
      self.selectedMainItem = selectedMainItem
   }
}
/**
 * Debugging with background colors
 * - Description: This section is used for debugging purposes, allowing developers to visually identify different areas of the interface by applying distinct background colors.
 */
internal var isTest: Bool = false
