import SwiftUI
/**
 * Define a custom view modifier for the list text style
 */
struct ListTextStyle: ViewModifier {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let color: Color // rename to textColor
   /**
    * - Fixme: ⚠️️ add doc
    */
   func body(content: Content) -> some View {
      HStack {
         content
            .foregroundColor(color)
            .font(.system(size: 24, weight: .regular))
            .padding(.horizontal) // adds left and right padding
         Spacer()
      }
      .padding(.horizontal) // adds left and right padding
   }
}
/**
 * Extension to apply the list text style easily
 */
extension View {
   /**
    * listTextStyle
    */
   func listTextStyle(color: Color) -> some View {
      self.modifier(ListTextStyle(color: color))
   }
}
