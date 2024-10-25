import SwiftUI
import SplitViewKit
/**
 * View that is the destination for main
 * - Description: The detail view is the destination for the main view. It is responsible for displaying the detail data and managing the layout and responsiveness based on the current size class and split configuration.
 * - Note: Alternative name: `DetailColumnView`
 * - Note: Adding some kind of overflow in detail would be nic. But maybe best to make min-width for detail etc. simpler. User sees all content at all time.
 * - Fixme: ⚠️️ Add preview 👈
 */
struct DetailView: View {
   /**
    * - Description: This environment property allows the view to dismiss itself, typically used in modal presentations or when navigating back in a navigation stack.
    * - Note: It seems fine to keep this here
    */
   #if os(iOS) 
   @Environment(\.dismiss) var dismiss: DismissAction
   #endif
   /**
    * - Description: This property stores the title of the detail view, which is displayed at the top of the view.
    */
   var title: String
   /**
    * - Description: Stores the detailed data associated with a specific item selected from the main view. This data is used to populate the detail view's content.
    */
   let detailData: DetailData
   /**
    * - Description: Configuration for managing the split view behavior in the detail view, affecting how the view adapts to different screen sizes and orientations.
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
}
/**
 * DetailView init
 */
extension DetailView {
   /**
    * - Description: Initializes a `DetailView` instance using the provided sidebar and main item indices, along with configuration for split view and size class.
    * - Fixme: ⚠️️⚠️️⚠️️ Rework this to regular init 👈
    * - Parameters:
    *   - sideBarItemIndex: The index of the selected item in the sidebar, used to determine which main item list to display.
    *   - mainItemIndex: The index of the selected item in the main list, used to fetch the detailed data for the detail view.
    * - Returns: A `DetailView` configured with the data corresponding to the selected main item.
    */
   static func initiate(sideBarData: SideBarData, sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>/*UserInterfaceSizeClass?*/) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ Use safeArray here, and return optional, add fileprivate helper?
      let mainModel: MainModel = sideBarData[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: mainModel.title,
         detailData: mainModel.content,
         splitConfig: splitConfig, 
         sizeClass: sizeClass
      )
      return detailView
   }
}
