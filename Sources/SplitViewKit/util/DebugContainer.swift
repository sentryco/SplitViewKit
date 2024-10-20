import SwiftUI
import HybridColor
/**
 * - Abstract: SplitView analytics
 * - Note: We have to add debug container to the splitviewcontainer view, as we need access to the spliconfig state, which can only be acccessed inside splitviewcontainer or its injected descendants
 * - Note: Bottom center container
 * - Note: 2 texts with columnConfig: 3-col, 2-col, 1-col, focusedColumn: sidebar, main, detail
 * - Note: We get debug data from the states of: `NavigationSplitViewColumn` `NavigationSplitViewVisibility`
 * - Fixme: ⚠️️ Make this rounded corners, like capsule, and only as wide as its content with some inner padding etc, use copilot todo it etc
 * - Fixme: ⚠️️ Fence this as debug, show only when testing? also add isTest bool?
 * - Fixme: ⚠️️ add assert for 70% mode window
 * - Fixme: ⚠️️ add orientation debug label: "portrait", "landscape"
 * - Fixme: ⚠️️ fence as debug
 */
struct DebugContainer: View {
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ make this ObservedObject instead? etc that would avoid rebinding etc
    */
   @Binding var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    * - Fixme: ⚠️️ figure out how to avoid rebinding on environment variable?
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
}
/**
 * Content
 */
extension DebugContainer {
   /**
    * - Fixme: ⚠️️ Move to own ext?
    */
   var body: some View {
      VStack {
         Spacer() // Pins content to the bottom
         HStack {
            Spacer() // Pins content to center
            DebugView(splitConfig: $splitConfig, sizeClass: $sizeClass)
            Spacer() // Pins content to center
         }
         // I think the bellow is done automtically by the native safe area etc
         // .padding(.vertical, 16) // Move a bit up from the bottom
//         .background(Color.black.opacity(0.6))
      }
      //.padding(.vertical, 16) // Padding
   }
}
extension DebugContainer {
   /**
    * - Fixme: ⚠️️ add doc
    */
   struct DebugView: View {
      static let fontSize: CGFloat = 18
      static let hSpacing: CGFloat = 12
      static let vSpacing: CGFloat = 8
      // - Fixme: ⚠️️ add doc
      @Binding var splitConfig: SplitConfig
      // - Fixme: ⚠️️ add doc
      @Binding var sizeClass: UserInterfaceSizeClass?
      var body: some View {
         VStack(spacing: Self.vSpacing) {
            HStack(spacing: Self.hSpacing) {
               configView
               columnView
            }
            HStack(spacing: Self.hSpacing) {
               sizeView
               orientationView
            }
         }
         .padding(.horizontal, 24) // Padding
         .padding(.vertical, 16) // Padding
         .background(Color.whiteOrBlack.opacity(0.1)) // Black background
         .cornerRadius(10) // Rounded corners
      }
      var configView: some View {
         Group {
            Text("Config: ").foregroundColor(Color.white) +
            Text("\(splitConfig.columnVisibility.description)").foregroundColor(Color.white.opacity(0.7))
         }
//            .padding(.horizontal, 4)
            .font(.system(size: Self.fontSize))
      }
      var columnView: some View {
         Group {
            Text("Column: ").foregroundColor(Color.white) +
            Text("\(splitConfig.preferredCompactColumn.description)").foregroundColor(Color.white.opacity(0.7))
         }
//            .padding(.horizontal, 4)
            .font(.system(size: Self.fontSize))
      }
      var sizeView: some View {
         Group {
            Text("Size: ").foregroundColor(Color.white) +
            Text("\(sizeClass?.description ?? "")").foregroundColor(Color.white.opacity(0.7))
         }
//            .padding(.horizontal, 4)
            .font(.system(size: Self.fontSize))
      }
      var orientationView: some View {
         Group {
            Text("Orientation: ").foregroundColor(Color.white) +
            Text("\(/*getDeviceOrientation().*/isLandscape ? "landscape" : "portrait")").foregroundColor(Color.white.opacity(0.7))
         }
//            .foregroundColor(Color.white)
//            .padding(.horizontal, 4)
            .font(.system(size: Self.fontSize))
      }
   }
}
/**
 * Debug view
 * pin the preiew to test this only etc
 * - Fixme: ⚠️️ add darkmode and previewcontainer etc
 * - Fixme: ⚠️️ test at smaller sizes as well
 */
#Preview {
   let splitConfig = SplitConfig(
      columnVisibility: .all,
      preferredCompactColumn: .content
   )
   return ZStack {
      Color.darkGray.opacity(0.4).edgesIgnoringSafeArea(.all) // Gray background view covering entire screen
      DebugContainer.DebugView(
         splitConfig: .constant(splitConfig),
         sizeClass: .constant(.regular)
      )
      // .frame(maxWidth: .infinity)
      // .background(Color.blackOrWhite)
      .environment(\.colorScheme, .dark)
   }
}
// debug container
// to make sure debug-container looks good
#Preview {
   let splitConfig = SplitConfig(
      columnVisibility: .all,
      preferredCompactColumn: .content
   )
   return ZStack {
      Color.darkGray.opacity(0.4).edgesIgnoringSafeArea(.all) // Gray background view covering entire screen
      DebugContainer(
         splitConfig: .constant(splitConfig),
         sizeClass: .constant(.regular)
      )
      // .frame(maxWidth: .infinity)
      // .background(Color.blackOrWhite)
      .environment(\.colorScheme, .dark)
   }
}
