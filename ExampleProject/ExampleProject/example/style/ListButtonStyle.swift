import SwiftUI
/**
 * - Fixme: ⚠️️ remove animated effect when tapping main items, ask copilot etc
 */
struct ListButtonStyle: ButtonStyle {
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
    * - Fixme: ⚠️️ add doc
    */
   func listButtonStyle(isSelected: Bool) -> some View {
      self.listButtonStyle(
         bgColor: .clear,
         textColor: Color.whiteOrBlack.opacity(isSelected ? 0.8 : 0.5) // set selected color
      )
   }
   /**
    * Convenient
    */
   fileprivate func listButtonStyle(bgColor: Color, textColor: Color) -> some View {
      let style = ListButtonStyle(bgColor: bgColor, textColor: textColor)
      return self.buttonStyle(style)
   }
}
