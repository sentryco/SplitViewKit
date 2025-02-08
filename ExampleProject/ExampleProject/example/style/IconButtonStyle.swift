import SwiftUI
import HybridColor
/**
 * Implementing IconButtonStyle
 * - Abstract: This defines a custom ButtonStyle where you can pass the icon name dynamically.
 * - Description: Define IconButtonStyle as a ButtonStyle with customizable
 *                icon, rounded corners, background and fill colors, icon size,
 *                and padding.
 * - Note: There is one for left arrow, `right_arrow`, `full_screen`, `back_chevron_icon`
 * - Fixme: ⚠️️ Make it animate transperancy on showing / hiding (add via copilot)
 */
fileprivate struct IconButtonStyle: ButtonStyle {
   /**
    * The name of the system icon to be used for the button.
    */
   fileprivate var iconName: String
   /**
    * The background color of the button.
    */
   fileprivate var bgColor: Color
   /**
    * The color of the icon.
    */
   fileprivate var fillColor: Color
   /**
    * This method sets up the view for the button. It uses an Image view with the system icon name provided. The icon's foreground color, font size, padding, background color, and corner radius are set according to the instructions.
    * - Note: Square Background: The ZStack ensures the background is uniformly square (40x40 in this case).
    * - Note: Icon Aspect Ratio: By using .aspectRatio(contentMode: .fit) and constraining the icon's maximum size (frame(maxWidth: 24, maxHeight: 24)), the icon will maintain its aspect ratio and fit within the square.
    * - Note: Background: The bgColor background is defined as a square with rounded corners using .clipShape(RoundedRectangle(cornerRadius: 8)).
    * - Note: Now, no matter what the shape of the icon is, the background will always be square, and the icon will fit neatly within that square. You can adjust the frame(width: height:) values to make the background larger or smaller as needed.
    * - Fixme: ⚠️️ Try to make all this relativly sized etc, confer with copilot
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      ZStack {
         // Ensuring the background is always square
         bgColor
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(width: 36, height: 36) // Background is square
         // Icon with aspect ratio maintained
         Image(systemName: iconName)
            .foregroundColor(fillColor)
            .font(.system(size: 20)) // Icon size
            .aspectRatio(contentMode: .fit) // Maintain aspect ratio for the icon
            .frame(maxWidth: 20, maxHeight: 20) // Limit the icon's size within the square
      }
      .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
      .animation(.easeInOut, value: configuration.isPressed) // Optional: animation for press effect
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
   internal func iconButtonStyle(iconName: String, bgColor: Color = Color.darkGray, fillColor: Color = Color.whiteOrBlack.opacity(0.8)) -> some View {
      let style = IconButtonStyle(
         iconName: iconName,
         bgColor: bgColor,
         fillColor: fillColor
      )
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
   }) {
   }
   .iconButtonStyle(iconName: "arrow.left.and.right")
   .padding()
   .environment(\.colorScheme, .dark) // dark-mode
}
