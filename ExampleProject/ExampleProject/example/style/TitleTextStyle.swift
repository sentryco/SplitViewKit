import SwiftUI
import HybridColor
/**
 * Define a custom view modifier for the title text style
 */
fileprivate struct TitleTextStyle: ViewModifier {
   /**
    * - Description: Applies the title text style to the view, enhancing the appearance of the title text.
    */
   fileprivate func body(content: Content) -> some View {
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
    * - Description: Applies the title text style to the view, enhancing the appearance of the title text.
    */
   internal var titleTextStyle: some View {
      let style = TitleTextStyle()
      return self.modifier(style)
   }
}
