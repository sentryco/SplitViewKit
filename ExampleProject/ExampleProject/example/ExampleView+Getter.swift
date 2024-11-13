import SwiftUI
#if os(macOS) // Fence as macOS only, since this applies only to macOS
/**
 * Getter - model
 */
extension ExampleView {
   /**
    * - Description: Provides a binding to rebind the selected item in macOS
    *                environments where `.navigationDestination(item)` may not
    *                function as expected. This workaround ensures that the UI
    *                updates correctly when the selected item changes.
    * - Important: ⚠️️ Rebinding hack for macOS, because `.navigationDestination(item)` doesn't work for macOS aperantly
    * - Note: Alternative name: selectedItemRebound
    */
   internal var rebind: Binding<Bool> {
      Binding<Bool>(
         get: { // Returns true if there is a selected main item, otherwise false
            $selectedMainItem.wrappedValue != nil
         }, set: { // Only set this if false
            if $0 == false {
               $selectedMainItem.wrappedValue = nil
            }
         }
      )
   }
}
#endif
