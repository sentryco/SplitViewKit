import SwiftUI
/**
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview
 */
struct DetailList: View { /*<Content: View>*/
   let detailData: DetailData
//   @ViewBuilder public var content: Content
   public init(detailData: DetailData) { /*@ViewBuilder content: () -> Content*/
//      self.content = content()
      self.detailData = detailData
   }
}
