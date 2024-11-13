import SwiftUI
/**
 * Creates a ToggleButonStyle for Button
 * - Description: The button should have rounded corners, have white text, and
 *                dark gray background, it should have a little bit more padding
 *                horizontally than vertically. also make a preview
 */
fileprivate struct ActionButtonStyle: ButtonStyle {
   /**
    * - Description: Applies the action button style to the view, enhancing the appearance of the action button.
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 4)
            .padding(.vertical, 6)
            .background(Color.secondary.opacity(0.4))
            .foregroundColor(.primary)
            .cornerRadius(10)
    }
}
extension Button {
   /**
    * - Description: Applies the action button style to the button, enhancing the appearance of the action button.
    */
   internal var actionButtonStyle: some View {
      let style = ActionButtonStyle()
      return self.buttonStyle(style)
   }
}
/**
 * Preview of the CustomToggleButtonStyle
 */
#Preview {
    Button("Toggle") {
        print("hello") // Action for the button
    }
    .actionButtonStyle
    .padding()
}
