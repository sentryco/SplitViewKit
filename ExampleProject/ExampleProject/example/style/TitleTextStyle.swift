import SwiftUI
import HybridColor
/**
 * Define a custom view modifier for the title text style
 */
struct TitleTextStyle: ViewModifier {
   /**
    * - Fixme: ⚠️️ add doc
    */
   func body(content: Content) -> some View {
      content
         .foregroundColor(Color.whiteOrBlack.opacity(0.8))
         .font(.system(size: 32, weight: .bold))
   }
}
/**
 * Extension to apply the title text style easily
 */
extension View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   var titleTextStyle: some View {
      self.modifier(TitleTextStyle())
   }
}
