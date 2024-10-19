#if DEBUG
import SwiftUI
/**
 * - Fixme: ⚠️️ remove animated effect when tapping main items, ask copilot etc
 */
struct MainRowButtonStyle: ButtonStyle {
   var bgColor: Color
   // 
   var textColor: Color
   /**
    * - Fixme: ⚠️️ add doc
    */
   func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 0) {
         configuration.label
            .foregroundStyle(textColor)
         // - Fixme: ⚠️️ move to liststyle etc?
            .font(.system(size: 24, weight: .regular))
            .padding(.horizontal)
         Spacer()
      }
      .padding(.vertical, 8)
      .background(bgColor)
   }
}
/**
 * - Fixme: ⚠️️ add doc
 */
extension Button {
   /**
    * - Fixme: ⚠️️ add doc
    */
   func mainRowButtonStyle(bgColor: Color, textColor: Color) -> some View {
      let style = MainRowButtonStyle(bgColor: bgColor, textColor: textColor)
      return self.buttonStyle(style)
   }
}

#endif
