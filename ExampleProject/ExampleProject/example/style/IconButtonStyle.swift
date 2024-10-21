import SwiftUI
import HybridColor
/**
 * Implementing IconButtonStyle
 * - Abstract: This defines a custom ButtonStyle where you can pass the icon name dynamically.
 * - Description: Define IconButtonStyle as a ButtonStyle with customizable icon, rounded corners, background and fill colors, icon size, and padding.
 * - Note: There is one for left arrow, right arrow, full_screen, back_chevron_icon,
 * - Fixme: ⚠️️ make it animate transperancy on showing / hiding
 */
struct IconButtonStyle: ButtonStyle {
   var iconName: String
   var bgColor: Color //.opacity(0.8)
   var fillColor: Color
   /**
    * makeBody Method: This method sets up the view for the button. It uses an Image view with the system icon name provided. The icon's foreground color, font size, padding, background color, and corner radius are set according to the instructions.
    */
   func makeBody(configuration: Configuration) -> some View {
      Image(systemName: iconName)
         .foregroundColor(fillColor) // Icon fill color
         .font(.system(size: 24)) // Icon size
         .padding(4) // Padding around icon
         .background(bgColor) // Background color
         .clipShape(RoundedRectangle(cornerRadius: 8)) // Rounded corners
         .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
   }
}
/**
 * Extension on ButtonStyle: This extension adds a static method iconButtonStyle(iconName:) which allows you to create an IconButtonStyle with a specific icon name. This method simplifies the process of setting the icon name when applying the button style.
 */
extension Button {
   /**
    * - Description: Applies the IconButtonStyle to the button, enhancing its appearance with a custom icon and colors.
    * - Parameters:
    *   - iconName: The name of the system icon to be used for the button.
    *   - bgColor: The background color of the button.
    *   - fillColor: The color of the icon.
    * - Returns: A view modifier that applies the specified IconButtonStyle to the button.
    */
   func iconButtonStyle(iconName: String, bgColor: Color = Color.darkGray, fillColor: Color = Color.whiteOrBlack.opacity(0.8)) -> some View {
      let style = IconButtonStyle(iconName: iconName, bgColor: bgColor, fillColor: fillColor)
      return self.buttonStyle(style)
   }
}
/**
 * Usage Example: An example usage of IconButtonStyle is shown in the toggleButton variable within the SideBarHeader extension. Here, the button style is applied with the icon name "square.lefthalf.fill".
 * - Note: Alt icons: square.lefthalf.fill, square.righthalf.fill, chevron.left, arrow.left.and.right
 */
#Preview {
   Button(action: {
      Swift.print("press")
   }) {}
   .iconButtonStyle(iconName: "square.lefthalf.fill")
   .environment(\.colorScheme, .dark) // dark
}
