#if DEBUG
import SwiftUI
/**
 * DebugExampleView
 * - Note: Has an interesting NavigationWrapper (but uses de-precated API,
 *         but can be used for inspo): https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/
 * - Fixme: ⚠️️ Add navigation view, isn't that done?
 * - Fixme: ⚠️️ Try to style the list. We can style mainlist fine, but not prefsmainlist, why is that? still relevant?
 * - Fixme: ⚠️️ Maybe we do the prefsmain manually, and not with ListContainer, what?
 * - Fixme: ⚠️️ Make sure things work for iPhone and mac as well 👈
 * - Fixme: ⚠️️ Add description, use copilot 👈
 * - Fixme: ⚠️️ rename to MainView? or AppView? or is ExampleView fine?
 * - Fixme: ⚠️️ clearify around selected index and selected item etc. unify?
 */
public struct ExampleView: View {
   /**
    * State variable to track the selected index in the sidebar
    * - Description: Used to track the current sidebar item selection
    * - Fixme: ⚠️️ Add description, use copilot
    */
   @State public var selectedSideBarIndex: Int = 0
   /**
    * This state variable is defined at this scope because it is required by both the main and detail views.
    * - Description: Used to track the current main item selection
    * - Note: We keep this at this scope, because both main and detail needs it
    *         we could store it in main, and have a binding here, but for now this is how it is
    * - Fixme: ⚠️️ Add description, use copilot
    * - Fixme: ⚠️️ Rename to mainSelectedIndex?
    * - Fixme: ⚠️️ make this optional as well, no selection etc
    */
   @State public var selectedMainIndex: Int = 0
   /**
    * State variable to track the currently selected item
    * - Note: When this is set, mainview changes
    * - Fixme: ⚠️️ Add description, use copilot
    * - Fixme: ⚠️️ Rename to selectedModel 👈
    */
   @State public var selectedMainItem: DataModel?
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Environment(\.horizontalSizeClass) var sizeClass: UserInterfaceSizeClass?
   /**
    * - Note: Needed for public to work
    * - Fixme: ⚠️️ add description
    * - Parameters:
    *   - selectedSideBarIndex:  - Fixme: ⚠️️ add doc
    *   - selectedMainIndex:  - Fixme: ⚠️️ add doc
    *   - selectedMainItem:  - Fixme: ⚠️️ add doc
    */
   public init(selectedSideBarIndex: Int = 0, selectedMainIndex: Int = 0, selectedMainItem: DataModel? = nil) {
      self.selectedSideBarIndex = selectedSideBarIndex
      self.selectedMainIndex = selectedMainIndex
      self.selectedMainItem = selectedMainItem
   }
}
#endif
