import SwiftUI
/**
 * We use custom struct for header. we don't reuse across columns because each header has different toggle buttons etc
 * - Fixme: ⚠️️ main header should have back button maybe, if we cant get back to sidebar in compact mode etc? if so, we must hide show-side menu. so flip these etc
 */
struct MainHeader: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let title: String
   // var onButtonAction: () -> Void = {}
   /**
    * - Fixme: ⚠️️ add doc
    * - Fixme: ⚠️️ make this ObeervedObject later
    */
   @EnvironmentObject var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Environment(\.horizontalSizeClass) var sizeClass: UserInterfaceSizeClass?
   // - Fixme: ⚠️️ add doc
   @Environment(\.dismiss) internal var dismiss
   // @Environment(\.presentationMode) var presentationMode
   // presentationMode.wrappedValue.dismiss()
}
