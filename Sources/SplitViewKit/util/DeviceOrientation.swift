//import SwiftUI
//
//final class DeviceOrientation: ObservableObject {
//   enum Orientation { case portrait, landscape }
//   @Published var orientation: Orientation = .portrait
//   
//   private var listener: AnyCancellable?
//   
//   init() {
//      orientation = UIDevice.current.orientation.isLandscape ? .landscape : .portrait
//      
//      listener = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
//         .compactMap { ($0.object as? UIDevice)?.orientation }
//         .sink { deviceOrientation in
//            self.orientation = deviceOrientation ?? .portrait
//         }
//   }
//   
//   deinit {
//      listener?.cancel()
//   }
//}
//
//struct ContentView: View {
//   @StateObject private var orientationInfo = DeviceOrientation()
//   
//   var body: some View {
//      Text("Current orientation: \(orientationInfo.orientation == .portrait ? "portrait" : "landscape")")
//   }
//}

// test the bellow if it works on ipad, simpler than using UIDevice orientation etc?


//struct SizeClassView: View {
//   @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
//   @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
//   
//   var body: some View {
//      if horizontalSizeClass == .compact && verticalSizeClass == .regular {
//         Text("iPhone Portrait")
//      } else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
//         Text("iPhone Landscape")
//      } else if horizontalSizeClass == .regular && verticalSizeClass == .regular {
//         Text("iPad Portrait/Landscape")
//      }
//   }
//}
