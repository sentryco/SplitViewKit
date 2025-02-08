import SwiftUI
/**
 * - Description: Applies the list button style to the view, enhancing the appearance of the list button.
 * - Fixme: ⚠️️ Remove animated effect when tapping main items, check with copilot etc
 * - Fixme: ⚠️️ Add preview, use copilot
 */
fileprivate  struct ListButtonStyle: ButtonStyle {
   /**
    * The background color of the button.
    * - Description: The background color of the button.
    */
   fileprivate var bgColor: Color
   /**
    * The text color of the button.
    * - Description: Toggle selected and unselected color with this etc
    */
   fileprivate var textColor: Color
   /**
    * - Description: Applies the list button style to the view, enhancing the appearance of the list button.
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 0) {
         configuration.label // text instance
            .foregroundStyle(textColor)
            .font(.system(size: 24, weight: .regular))
         Spacer()
      }
      .padding(.vertical, 8) // top and bottom padding
      .background(bgColor)
   }
}
/**
 * Ext
 */
extension Button {
   /**
    * Applies the list button style to the button, enhancing the appearance based on selection state.
    * - Parameter isSelected: A Boolean value that determines the opacity of the text color. If true, the opacity is set to 0.8, otherwise it is set to 0.5.
    * - Returns: A view modified with the list button style.
    */
   internal func listButtonStyle(isSelected: Bool) -> some View {
      self.listButtonStyle(
         bgColor: .clear,
         textColor: Color.whiteOrBlack.opacity(isSelected ? 0.8 : 0.5) // set selected color
      )
   }
   /**
    * Applies the custom list button style to a button.
    * - Parameters:
    *   - bgColor: The background color of the button.
    *   - textColor: The text color of the button.
    * - Returns: A view representing the button styled with the specified background and text colors.
    */
   fileprivate func listButtonStyle(bgColor: Color, textColor: Color) -> some View {
      let style = ListButtonStyle(bgColor: bgColor, textColor: textColor)
      return self.buttonStyle(style)
   }
}
