import SwiftUI
/**
 * creates a ToggleButonStyle for Button.
 * - Description: The button should have rounded corners, have white text, and dark gray background,  it should have a little bit more padding horisontally than vertically. also make a preview
 * - Fixme: ⚠️️ turn the above into doc, use copilot
 */
struct ActionButtonStyle: ButtonStyle {
   /**
    * - Fixme: ⚠️️ add doc
    */
    func makeBody(configuration: Configuration) -> some View {
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
    * - Fixme: ⚠️️ add doc
    */
   var toggleButtonStyle: some View {
      self.buttonStyle(ActionButtonStyle())
   }
}
/**
 * Preview of the CustomToggleButtonStyle
 */
 #Preview {
    Button("Toggle") {
        // Action for the button
        print("hello")
    }
    .buttonStyle(ActionButtonStyle())
}
