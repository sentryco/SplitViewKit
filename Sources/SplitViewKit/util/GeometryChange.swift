import SwiftUI
// - Fixme: ⚠️️ add doc
// - Fixme: ⚠️️ we might be able to make this a stateobject and use the DeviceOrientation
//internal enum GeometryChange {
//   case sizeClass
//   case orientation
//   case winSize
//}
internal struct GeometryChange: Equatable {
   internal let sizeClass: UserInterfaceSizeClass?
   internal let isLandscape: Bool
   internal let winSize: CGSize
}
//extension GeometryChange {
//   // - Fixme: ⚠️️ add doc
//   func geometryChange(isLandscape: Bool, sizeClass: UserInterfaceSizeClass?, winSize: CGSize) -> Self {
//
//   }
//}
