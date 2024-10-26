import SwiftUI
import HybridColor
import SplitViewKit
/**
 * - Abstract: SplitView analytics
 * - Description: This section provides an overview of the DebugContainer,
 *                which is used for displaying debug information related to
 *                the SplitView configuration and state.
 * - Note: We have to add debug container to the splitviewcontainer view, as we need access to the spliconfig state, which can only be acccessed inside splitviewcontainer or its injected descendants
 * - Note: Bottom center container
 * - Note: 2 texts with columnConfig: 3-col, 2-col, 1-col, focusedColumn: sidebar, main, detail
 * - Note: We get debug data from the states of: `NavigationSplitViewColumn` and `NavigationSplitViewVisibility`
 * - Fixme: ⚠️️ Add 70% mode window indication?
 */
struct DebugContainer: View {
   /**
    * - Description: A binding to the SplitConfig object, which holds the configuration state for the SplitView.
    * - Note: This binding allows the DebugContainer to access and display the current configuration of the SplitView.
    * - Fixme: ⚠️️ Make this ObservedObject instead? Or?
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
}
/**
 * Content
 */
extension DebugContainer {
   /**
    * - Description: The body property of the DebugContainer, which defines the view hierarchy for displaying debug information.
    * - Note: This view is structured to pin its content to the bottom center of the screen, utilizing a VStack and HStack for layout.
    */
   var body: some View {
      VStack {
         Spacer() // Pins content to the bottom
         HStack {
            Spacer() // Pins content to center
            DebugView(splitConfig: splitConfig, sizeClass: $sizeClass)
            Spacer() // Pins content to center
         }
      }
      #if os(macOS)
      .padding(.vertical) // Add space up from the bottom for macOS, not needed for iOS as safe-area does the same thing for iOS
      #endif
   }
}
/**
 * DebugView
 */
extension DebugContainer {
   /**
    * - Description: This is a subview within the DebugContainer that displays
    *                the current configuration of the SplitView, including the
    *                column visibility, preferred compact column, size class, and
    *                device orientation.
    */
   struct DebugView: View {
      static let fontSize: CGFloat = 18
      static let hSpacing: CGFloat = 12
      static let vSpacing: CGFloat = 8
      /**
       * - Description: A binding to the SplitConfig object, which holds the configuration state for the SplitView.
       */
      var splitConfig: SplitConfig
      /**
       * - Description: Used to detect if app is compact or regular mode etc
       */
      @Binding var sizeClass: UserInterfaceSizeClass?
      var body: some View {
         VStack(spacing: Self.vSpacing) {
            HStack(spacing: Self.hSpacing) {
               configView
               columnView
            }
            HStack(spacing: Self.hSpacing) {
               #if os(iOS)
               sizeView // sizeclass is only available for iOS
               #endif
               orientationView
            }
         }
         .padding(.horizontal, 24) // Padding
         .padding(.vertical, 16) // Padding
         .background(Color.whiteOrBlack.opacity(0.1)) // Black background
         .cornerRadius(10) // Rounded corners
      }
      /**
       * - Description: Displays the current configuration of the SplitView, including the column visibility, preferred compact column, size class, and device orientation.
       */
      var configView: some View {
         Group {
            Text("Config: ").foregroundColor(Color.white) +
            Text("\(splitConfig.columnVisibility.description)").foregroundColor(Color.white.opacity(0.7))
         }
         .font(.system(size: Self.fontSize))
      }
      /**
       * - Description: Displays the current preferred compact column of the SplitView.
       */
      var columnView: some View {
         Group {
            Text("Column: ").foregroundColor(Color.white) +
            Text("\(splitConfig.preferredCompactColumn.description)").foregroundColor(Color.white.opacity(0.7))
         }
         .font(.system(size: Self.fontSize))
      }
      /**
       * - Description: Displays the current size class of the SplitView.
       */
      var sizeView: some View {
         Group {
            Text("Size: ").foregroundColor(Color.white) +
            Text("\(sizeClass?.description ?? "")").foregroundColor(Color.white.opacity(0.7))
         }
         .font(.system(size: Self.fontSize))
      }
      /**
       * - Description: Displays the current orientation of the SplitView.
       */
      var orientationView: some View {
         Group {
            Text("Orientation: ").foregroundColor(Color.white) +
            Text("\(isOrientationLandscape ? "landscape" : "portrait")").foregroundColor(Color.white.opacity(0.7))
         }
         .font(.system(size: Self.fontSize))
      }
   }
}
/**
 * Debug view
 * - Description: Pin the preiew to test this only etc
 * - Fixme: ⚠️️ Add darkmode and previewcontainer etc
 * - Fixme: ⚠️️ Test with light-mode etc
 */
#Preview {
   let splitConfig = SplitConfig(
      columnVisibility: .all,
      preferredCompactColumn: .content
   )
   return ZStack {
      Color.darkGray.opacity(0.4).edgesIgnoringSafeArea(.all) // Gray background view covering entire screen
      DebugContainer.DebugView(
         splitConfig: (splitConfig),
         sizeClass: .constant(.regular)
      )
      .environment(\.colorScheme, .dark)
   }
}
/**
 * - Description: Preview for the DebugContainer
 */
#Preview {
   let splitConfig = SplitConfig(
      columnVisibility: .all,
      preferredCompactColumn: .content
   )
   return ZStack {
      Color.darkGray.opacity(0.4).edgesIgnoringSafeArea(.all) // Gray background view covering entire screen
      DebugContainer(
         splitConfig: splitConfig,
         sizeClass: .constant(.regular)
      )
      .environment(\.colorScheme, .dark)
   }
}
