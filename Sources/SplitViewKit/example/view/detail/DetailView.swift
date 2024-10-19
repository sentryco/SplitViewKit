#if DEBUG
import SwiftUI
/**
 * View that is the destination for main
 * - Fixme: ⚠️️ Experiment with nav-coordinator and wrapper etc from stack https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/
 * - Fixme: ⚠️️ Rename to DetailColumnView?
 * - Fixme: ⚠️️ Also store selected index?
 * - Fixme: ⚠️️ maybe there is a way to overflow in detail? Do some reseach. other apps overflow, so must be possible I think. Maybe best to make min-width for detail etc. simpler
 * - Fixme: ⚠️️ try to figure out how detail can have compression resistance? to avoid getting too squashed? the idea is that navsplitview should manage this part. simpler that way etc
 * - Fixme: ⚠️️ add preview
 */
public struct DetailView<Content: View>: View {
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
    * The content view of the DebugDetailView
    * - Note: This view is responsible for displaying the content of the detail view.
    * - Fixme: ⚠️️ Add description, use copilot
    */
   @ViewBuilder public var content: Content
   /**
    * - Fixme: ⚠️️ Add doc, use copilot
    * - Fixme: ⚠️️ Rename title to headerTitle?
    * - Parameters:
    *   - title: title for header
    *   - content: Detail-list content (injected)
    */
   public init(title: String, @ViewBuilder content: () -> Content) {
      self.title = title
      self.content = content()
   }
}
#endif
