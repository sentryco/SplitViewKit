import SwiftUI
/**
 * - Fixme: ⚠️️ Make this rounded corners, like capsule, and only as wide as its content with some inner padding etc, use copilot todo it etc
 * - Fixme: ⚠️️ Fence this as debug, show only when testing? also add isTest bool?
 * - Fixme: ⚠️️ add assert for 70% mode window
 * - Fixme: ⚠️️ add orientation debug label: "portrait", "landscape"
 * - Note: Bottom center container
 * - Note: 2 texts with columnConfig: 3-col, 2-col, 1-col, focusedColumn: sidebar, main, detail
 * - Note: We get debug data from the states of: `NavigationSplitViewColumn` `NavigationSplitViewVisibility`
 */
struct DebugContainer: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   /*@Binding var*/let splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   /*@Binding var*/let sizeClass: UserInterfaceSizeClass?
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
            Text("config: \(splitConfig.columnVisibility.description)")
               .foregroundColor(Color.white)
               .padding(.horizontal, 4)
               .font(.system(size: 14))
            Text("column: \(splitConfig.preferredCompactColumn.description)")
               .foregroundColor(Color.white)
               .padding(.horizontal, 4)
               .font(.system(size: 14))
            Text("hor-size: \(sizeClass?.description ?? "")")
               .foregroundColor(Color.white)
               .padding(.horizontal, 4)
               .font(.system(size: 14))
            Spacer() // Pins content to center
         }
         // I think the bellow is done automtically by the native safe area etc
         // .padding(.vertical, 16) // Move a bit up from the bottom
         .background(Color.black.opacity(0.6))
      }
   }
}
