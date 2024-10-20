import SwiftUI
/**
 * Getter - model
 */
extension ExampleView {
   /**
    * - Important: ⚠️️ Rebinding hack for macOS, because `.navigationDestination(item)` doesn't work for macOS aperantly
    * - Fixme: ⚠️️ Double check main code, if there isn't another way for macOS than this hack?
    * - Fixme: ⚠️️ Rename to selectedItemRebound ? maybe
    * - Fixme: ⚠️️ Add more doc how this works etc 👈
    * - Fixme: ⚠️️ Fence as macOS only
    */
   var rebind: Binding<Bool> {
      Binding<Bool>(
         get: { $selectedMainItem.wrappedValue != nil }, // - Fixme: ⚠️️ Add doc
         set: { if $0 == false { $selectedMainItem.wrappedValue = nil } } // Only set this if false
      )
   }
}

