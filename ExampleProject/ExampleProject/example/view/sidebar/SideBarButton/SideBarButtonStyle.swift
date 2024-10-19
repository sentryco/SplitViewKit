import SwiftUI

struct SideBarButtonStyle: ButtonStyle {
   var bgColor: Color
   // toggle selected and unselected color with this etc
   var textColor: Color
   // - Fixme: ⚠️️ add doc
   func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 0) {
         configuration.label // text instance
            .foregroundStyle(textColor)
            .padding(.horizontal)
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
    * Convenient
    */
   func sideBarButtonStyle(bgColor: Color, textColor: Color) -> some View {
      let style = SideBarButtonStyle(bgColor: bgColor, textColor: textColor)
      return self.buttonStyle(style)
   }
}
