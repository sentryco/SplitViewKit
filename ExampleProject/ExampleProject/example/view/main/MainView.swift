import SwiftUI
import SplitViewKit
/**
 * - Description: MainView is the primary view component in the application, responsible for displaying the main content area including a list of items and detailed view based on user selection.
 * - Note: Alternative names: `MainColumn` or `MainColumnView`
 */
internal struct MainView: View {
   /**
    * - Description: The title of the MainView which is displayed as the header.
    */
   internal var title: String
   /**
    * - Description: The index of the currently selected main item in the list.
    * - Note: This index is used to manage the state of the selected item across different components of the application.
    */
   @Binding internal var selectedMainIndex: Int
   /**
    * - Description: Represents a collection of data models used in the MainView.
    * - Note: This property holds all the items that can be selected in the main list.
    * - Note: Alternative name: `mainModels` 
    */
   internal let items: DataModels
   /**
    * - Description: Represents the currently selected item in the MainView, allowing for detailed interaction and data presentation based on user selection.
    * - Note: Alternative name: `selectedDetailModel`, `selectedModel` or `selectedMainItem`
    */
   @Binding internal var selectedItem: DataModel?
   /**
    * - Description: Used to configure the split view behavior in the MainView.
    * - Note: This property allows for customization of the split view behavior, enabling or disabling the split view based on user interaction or application state.
    * - Fixme: ⚠️️ Make this ObservedObject later, figure out pros and const first, use copilot
    */
   internal var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding internal var sizeClass: UserInterfaceSizeClass?
}
