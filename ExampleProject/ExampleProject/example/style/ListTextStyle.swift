import SwiftUI
/**
 * Define a custom view modifier for the list text style
 */
struct ListTextStyle: ViewModifier {
   /**
    * - Description: The color of the list text.
    */
   let color: Color // Rename to textColor
   /**
    * - Description: Applies the list text style to the view, enhancing the appearance of the list text.
    */
   func body(content: Content) -> some View {
      HStack {
         content
            .foregroundColor(color)
            .font(.system(size: 24, weight: .regular))
         Spacer()
      }
      .padding(.horizontal) // Adds left and right padding
   }
}
/**
 * Extension to apply the list text style easily
 */
extension View {
   /**
    * Applies the list text style to the view, enhancing the appearance of the list text.
    * - Parameter color: The color to apply to the list text.
    * - Returns: A view modified with the list text style.
    */
   func listTextStyle(color: Color) -> some View {
      self.modifier(ListTextStyle(color: color))
   }
}
