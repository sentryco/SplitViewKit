import SwiftUI
import SplitViewKit
/**
 * We use custom struct for header. we don't reuse across columns because each header has different toggle buttons etc
 * - Fixme: ⚠️️ add a fullscreen toggle here. basically setting preferredCompactColumn to detail, and
 * - Fixme: ⚠️️ add doc
 * - Fixme: ⚠️️ add preview
 */
struct DetailHeader: View {
   /**
    * - Fixme: ⚠️️ add doc
    */
   let title: String
   /**
    * - Fixme: ⚠️️ add doc
    */
   var splitConfig: SplitConfig
   /**
    * - Description: Used to detect if app is compact or regular mode etc
    * - Note: Needs to be called from the correct scope. Jumps to compact when it should be regular in the wrong scope etc. so param drilling is probably better to avoid future hard to find bugs
    */
   @Binding var sizeClass: UserInterfaceSizeClass?
   /**
    * - Fixme: ⚠️️ add doc
    */
   @Environment(\.dismiss) internal var dismiss
}
/*@Binding */
