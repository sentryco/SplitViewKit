//import SwiftUI
//
//struct SizeTracker: ViewModifier {
//   @State private var previousSize: CGSize = .zero
//   @State private var currentSize: CGSize = .zero
//   var onSizeChange: (CGSize, CGSize) -> Void
//   
//   func body(content: Content) -> some View {
//      content
//         .background(
//            GeometryReader { geometry in
//               Color.clear
////                  .onAppear {
////                     currentSize = geometry.size
////                  }
//                  .onChange(of: geometry.size) { oldSize, newSize in
//                     previousSize = currentSize
//                     currentSize = newSize
//                     onSizeChange(previousSize, currentSize)
//                  }
//            }
//         )
//   }
//}
//extension View {
//   func trackSize(onChange: @escaping (CGSize, CGSize) -> Void) -> some View {
//      self.modifier(SizeTracker(onSizeChange: onChange))
//   }
//}
//// Usage
//struct ContentView: View {
//   var body: some View {
//      Text("Hello, World!")
//         .frame(width: 200, height: 100)
//         .trackSize { oldSize, newSize in
//            if oldSize != newSize {
//               print("Size changed from \(oldSize) to \(newSize)")
//            }
//         }
//   }
//}
