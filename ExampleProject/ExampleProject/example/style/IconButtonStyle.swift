import SwiftUI
import HybridColor
// square.lefthalf.fill
// square.righthalf.fill
// chevron.left
// make one for left arrow, right arrow, full_screen, back_chevron_icon,
// make it animate transperancy on showing / hiding

// 1. make IconButtonStyle which should be a button style
// 2. use apple system icon: "square.lefthalf.fill"
// 3. have rounded corners 4px
// 4. have a background color that is darkGray
// 5. have a fill color for icon that is lightGray
// 6. icon should be 16px width and height
// 7. icon should have 4px padding all arround
// 8. the icon should be settable from extension iconButtonStyle(iconName: "")

// Implementing IconButtonStyle
//  IconButtonStyle Structure: This defines a custom ButtonStyle where you can pass the icon name dynamically.
struct IconButtonStyle: ButtonStyle {
   var iconName: String
   var bgColor: Color = Color.darkGray//.opacity(0.8)
   var fillColor: Color = Color.whiteOrBlack.opacity(0.8)
   // makeBody Method: This method sets up the view for the button. It uses an Image view with the system icon name provided. The icon's foreground color, font size, padding, background color, and corner radius are set according to the instructions.
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
// Extension to set icon name easily
// Extension on ButtonStyle: This extension adds a static method iconButtonStyle(iconName:) which allows you to create an IconButtonStyle with a specific icon name. This method simplifies the process of setting the icon name when applying the button style.
extension Button {
   /**
    * - Description: Applies the action button style to the button, enhancing the appearance of the action button.
    */
   func iconButtonStyle(iconName: String) -> some View {
      let style = IconButtonStyle(iconName: iconName)
      return self.buttonStyle(style)
   }
}
// Usage example
// Usage Example: An example usage of IconButtonStyle is shown in the toggleButton variable within the SideBarHeader extension. Here, the button style is applied with the icon name "square.lefthalf.fill".
#Preview {
   Button(action: {
      // Action for the button
   }) {}
   .iconButtonStyle(iconName: "square.lefthalf.fill")
   .environment(\.colorScheme, .dark) // dark
}
