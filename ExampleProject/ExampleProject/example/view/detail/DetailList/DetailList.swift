import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview 👈
 */
struct DetailList: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let detailData: DetailData
   /**
    * - Fixme: ⚠️️ add doc
    */
   @State internal var isSheetPresented = false
   /**
    * - Fixme: ⚠️️ add doc
    */
   public init(detailData: DetailData) {
      self.detailData = detailData
   }
}
/*<Content: View>*/
//      self.content = content()
/*@ViewBuilder content: () -> Content*/
//   @ViewBuilder public var content: Content
