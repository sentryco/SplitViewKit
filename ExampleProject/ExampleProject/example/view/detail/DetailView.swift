import SwiftUI
import SplitViewKit
/**
 * View that is the destination for main
 * - Fixme: ⚠️️ Experiment with nav-coordinator and wrapper etc from stack https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/
 * - Fixme: ⚠️️ Rename to DetailColumnView? or keep as is?
 * - Fixme: ⚠️️ Also store selected index? why?
 * - Fixme: ⚠️️ Maybe there is a way to overflow in detail? Do some reseach. other apps overflow, so must be possible I think. Maybe best to make min-width for detail etc. simpler
 * - Fixme: ⚠️️ Try to figure out how detail can have compression resistance? to avoid getting too squashed? the idea is that navsplitview should manage this part. simpler that way etc
 * - Fixme: ⚠️️ Add preview 👈
 * - Fixme: ⚠️️⚠️️⚠️️ Make this internal 👈
 */
public struct DetailView: View { // <Content: View>
   /**
    * - Note: It seems fine to keep this here
    * - Fixme: ⚠️️ add doc regarding what it does etc
    */
   #if os(iOS) 
   @Environment(\.dismiss) var dismiss: DismissAction
   #endif
   /**
    * - Fixme: ⚠️️ add doc, use copilot
    */
   public var title: String
   /**
    * - Fixme: ⚠️️ Add description, use copilot
    */
   let detailData: DetailData
   /**
    * - Fixme: ⚠️️ add doc
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
    * - Fixme: ⚠️️ Add doc
    * - Fixme: ⚠️️ Move somewhere else?
    * - Fixme: ⚠️️⚠️️⚠️️ rework this to regular init
    * - Parameters:
    *   - sideBarItemIndex: - Fixme: ⚠️️ add doc via copilot
    *   - mainItemIndex: - Fixme: ⚠️️ add doc via copilot
    * - Returns: - Fixme: ⚠️️ add doc via copilot
    */
   static func initiate(sideBarData: SideBarData, sideBarItemIndex: Int, mainItemIndex: Int, splitConfig: SplitConfig, sizeClass: Binding<UserInterfaceSizeClass?>) -> some View {  /*<ObservableObject>*//*, isDetailFullScreen: Binding<Bool>*/
      // - Fixme: ⚠️️ Use safeArray here, and return optional, add fileprivate helper?
      let mainModel: MainModel = sideBarData[sideBarItemIndex].content[mainItemIndex]
      let detailView = DetailView(
         title: mainModel.title,
         detailData: mainModel.content,
         splitConfig: splitConfig, 
         sizeClass: sizeClass
      )
      return detailView
      // - Fixme: ⚠️️ remove the bellow, do param drilling instead
         .environmentObject(splitConfig) // We have to reapply the environmentobject when we create new detailviews etc
   }
}
// { // (mainRowModel: mainRowModel) // detailView(mainRowModel: mainRowModel[i]) //                Text("it works: \(i)")
// detail content
// - Fixme: ⚠️️ move into a vstack ?
//      }
//,
/*isDetailFullScreen: isDetailFullScreen*/
/**
 * - Fixme: ⚠️️ Add doc, use copilot
 * - Fixme: ⚠️️ Rename title to headerTitle?
 * - Fixme: ⚠️️ add model content instead?
 * - Parameters:
 *   - title: title for header
 *   - content: Detail-list content (injected)
 */
//   init(title: String, detailData: DetailData) { /*@ViewBuilder content: @escaping () -> Content*/
//      self.title = title
//      // self.content = content
//      self.detailData = detailData
//   }
