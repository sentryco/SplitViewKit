import SwiftUI
// - Fixme: ⚠️️ add doc
// - Fixme: ⚠️️ we might be able to make this a stateobject and use the DeviceOrientation
// - Fixme: ⚠️️ move to columWidth file?
func geometryChange(isLandscape: Bool, sizeClass: UserInterfaceSizeClass?, winWidth: CGFloat, closure: (_ winWidth: CGFloat) -> some View) -> some View {
   switch true {
   case isLandscape: 
      Swift.print("👉 isLandscape")
      return closure(winWidth)
   case sizeClass == .compact:
      Swift.print("👉 compact")
      return closure(winWidth)
   case /*columnWidth.*/isNarrow(isLandscape: isLandscape, winWidth: winWidth):
      Swift.print("👉 isNarrow")
      return closure(winWidth)
   default:
      Swift.print("👉 default")
      return closure(winWidth) // else regular, not narrow, not landscape
   }
}

//         let _  = geometry.size.width > geometry.size.height // ⚠️️ For some reason we have to have this here, elaborate?: I thinkn its just because we have to reference geomtryreader to activate some internal mechanism etc
// - Fixme: ⚠️️ maybe if we load new view on size change?
//         if isLandscape { // - Fixme: ⚠️️ Add doc
//            if sizeClass == .compact { // this fixes things going into compact. but not 70% to regular
//               navigationSplitView(winWidth: geometry.size.width) // ⚠️️ This is the same as the other, but it refreshes the view, and recalculates columnwidths etc, which is what we need
//            } else { // if sizeClass == .regular
//               if columnWidth.isNarrow(isLandscape: isLandscape, winWidth: geometry.size.width) {
//                  navigationSplitView(winWidth: geometry.size.width) // ⚠️️ This is the same as the other, but it refreshes the view, and recalculates columnwidths etc, which is what we need
//               } else {
//                  navigationSplitView(winWidth: geometry.size.width) // ⚠️️ This is the same as the other, but it refreshes the view, and recalculates columnwidths etc, which is what we need
//               }
//            }
//         } else {
//            navigationSplitView(winWidth: geometry.size.width) // ⚠️️ We can't load the same variable, or else it will not refresh. so we reference it again like this to referesh. seems strange but it is what it is, there might be another solution to this stange behaviour, more exploration could be ideal
//         }


//internal struct GeometryChange: Equatable {
//   internal let sizeClass: UserInterfaceSizeClass?
//   internal let isLandscape: Bool
//   internal let winSize: CGSize
//}
//internal enum GeomChange {
//   case sizeClass
//   case orientation
//   case winSize
//}
