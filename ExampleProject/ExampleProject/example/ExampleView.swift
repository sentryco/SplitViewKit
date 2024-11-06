import SwiftUI
/**
 * DebugExampleView
 * - Description: This view serves as the primary interface for the
 *                `ExampleProject`, orchestrating the interaction between
 *                "sidebar", "main content", and "detail views". It manages
 *                state and navigation, ensuring a cohesive user experience
 *                across different device sizes and orientations.
 * - Note: Has an interesting NavigationWrapper (but uses de-precated API,
 *         but can be used for inspo): https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/
 * - Note: We manage selection-state in this implementation scope, and not in the helper SplitViewWrapper
 * - Note: Consider adding placeholder views when there is no selection etc (currently there is always a selection)
 * - Note: When going into compact mode. Selections should not be visible, but persisted in the binding. so that when mode turns to regular. the selections show in the UI
 * - Fixme: ⚠️️ Spread index binding into the respective views, instead of storing them here?
 * - Fixme: ⚠️️ Clearify around "selected-index" and "selected-item" etc. unify? its unclear atm why we have both etc
 */
struct ExampleView: View {
   /**
    * State variable to track the selected index in the sidebar
    * - Abstract: Used to track the current sidebar item selection
    * - Description: Represents the index of the currently selected sidebar
    *                item, used to manage user interactions and state within
    *                the sidebar.
    */
   @State var selectedSideBarIndex: Int = 0
   /**
    * This state variable is defined at this scope because it is required by both the main and detail views.
    * - Abstract: Used to track the current main item selection
    * - Description: Maintains the index of the currently selected item in
    *                the main view, which is used to manage state between
    *                the main and detail views.
    * - Note: We keep this at this scope, because both main and detail needs it
    *         we could store it in main, and have a binding here, but for now this is how it is
    * - Note: We can make this optional. But that requires placeholder views for main and detail
    * - Fixme: ⚠️️ It's possible to remove this and just use selectedMainItem. will require parsing with uuid etc, and passing main-model into detail. do it later
    */
   @State var selectedMainIndex: Int = 0
   /**
    * State variable to track the currently selected item
    * - Description: Tracks the currently selected item in the main view,
    *                which triggers updates to the detail view when changed.
    * - Note: When this is set, mainview changes
    */
   @State var selectedMainItem: DataModel?
   /**
    * - Description: Initializes the ExampleView with optional predefined
    *                selections for sidebar, main content, and detail views.
    *                This allows for restoring state or direct navigation to
    *                specific content when the view is created.
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
