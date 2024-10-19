import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview
 */
struct DetailList<Content: View>: View {
   @ViewBuilder public var content: Content
   public init(@ViewBuilder content: () -> Content) {
      self.content = content()
   }
}
