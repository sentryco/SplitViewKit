[![Tests](https://github.com/sentryco/SplitViewKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/SplitViewKit/actions/workflows/Tests.yml)

# SplitViewKit

> Easily config multi-column apps (iPad and macOS)

<img width="436" alt="img" src="https://s1.gifyu.com/images/SOKpX.gif">

# Table of Contents

1. [Problem](#problems)
2. [Solution](#solution)
3. [Example Usage](#example-usage)
4. [Installation](#installation)
5. [Gotchas](#gotchas)
6. [References](#references)
7. [Resources](#resources)
8. [Todo](#todo)
9. [Future Improvements](#future-improvements)

## Problem:

1. `NavigationSplitView` Is fairly easy to setup. But has many edge cases to account for.
2. Managing column widths for different modes is a challenge.
3. Managing the navigation UI in different modes is a challenge 

## Solution:

1. There is an `Example-project` included in this package, that makes it easier to understand how to work with `NavigationSplitView`
2. The framework supports providing your own `column-width` calculations 
3. The framework supports providing your own navigation UI for the different modes 

## Example:

- To use `SplitViewContainer`, you need to provide three SwiftUI views: `SideBar`, `Content`, and `Detail`. These views represent the left side menu-bar, the center main content, and the right side detail-view. 
- You can control the column visibility and preferred compact column through the `columnVisibility` and `preferredCompactColumn` properties in the SplitConfig struct.
- There is also a comprehensive example project included in this package. See the xcode project for more details.

```swift
import SwiftUI
import SplitViewKit

struct ContentView: View {
    var body: some View {
        // Interact and react to splitview via splitConfig and sizeClass parameters
        SplitViewContainer(
            sideBar: { splitConfig, sizeClass in Color.red }, // Set your sidebar content here
            content: { splitConfig, sizeClass in Color.green }, // Set your center content here
            detail: { splitConfig, sizeClass in Color.blue }, // Set your detail content here
            columnWidth: DefaultColumnWidth(), // Set custom column widths here
            splitConfig: SplitConfig() // set initial column arrangment here
        )
    }
}
```

## Installation

Add this to xcode or your SPM package file:

```swift
.package(url: "https://github.com/sentryco/SplitViewKit", branch: "main")
```
 
## Gotchas:

- In SplitView, when in Portrait it can either occupy 40% of 60% of the screen ("Slide-over-mode" on iPad is the same as 30% split-view)
- In Landscape it can occupy 30%, 50%, and 70% of the screen
- There are some bugs in `NavigationSplitView` [https://forums.developer.apple.com/forums/thread/708721](https://forums.developer.apple.com/forums/thread/708721) 
- Using `NavigationSplitView` is highly recommended over building your own SplitView with HStack etc. As a lot of features come toll free with `NavigationSplitView` 

## References

Here are some general tutorials and articles on how to use `NavigationSplitView` that was useful to read while building this framework.

- Stack Navigation on macOS [https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4](https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4)
- SwiftUI macOS Navigation Basics [https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/](https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/)
- Comprehensive SplitNavigationView [https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/](https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/) 
- WWDC video on navigationsplitview: [https://developer.apple.com/videos/play/wwdc2022/10054/?ref=appcoda.com](https://developer.apple.com/videos/play/wwdc2022/10054/?ref=appcoda.com)
- Very comprehensive custom split-view completely built from the ground up: [https://github.com/stevengharris/SplitView](https://github.com/stevengharris/SplitView)
- Pretty gd: [https://www.appcoda.com/navigationsplitview-swiftui/](https://www.appcoda.com/navigationsplitview-swiftui/)

## Resources:

These are some of the resources that was founds when solving edge cases for the `NavigationSplitView`

- SwiftUI Repaint View Components on Device Rotation [https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation](https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation)
- NavigationSplitView Documentation [https://developer.apple.com/documentation/swiftui/navigationsplitview](https://developer.apple.com/documentation/swiftui/navigationsplitview)
- Different Forms of Navigation in SwiftUI [https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/](https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/)
- Developer Forums Thread on Navigation Issues [https://forums.developer.apple.com/forums/thread/708721](https://forums.developer.apple.com/forums/thread/708721)
- NavigationStack inside NavigationSplitView Detail in SwiftUI [https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui](https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui)
- SwiftUI macOS Navigation Basics [https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/](https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/)
- How to Detect Device Rotation in SwiftUI [https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation](https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation)
- Stack Overflow Answer on Device Orientation [https://stackoverflow.com/a/78889492](https://stackoverflow.com/a/78889492)
- UIKit UIInterfaceOrientation Documentation [https://developer.apple.com/documentation/uikit/uiinterfaceorientation](https://developer.apple.com/documentation/uikit/uiinterfaceorientation)
- SwiftUI SplitView Compact Column Control [https://useyourloaf.com/blog/swiftui-splitview-compact-column-control/](https://useyourloaf.com/blog/swiftui-splitview-compact-column-control/)
- SwiftUI on iPad: Organize your interface: [https://developer.apple.com/videos/play/wwdc2022/10058/https://developer.apple.com/videos/play/wwdc2022/10058/](https://developer.apple.com/videos/play/wwdc2022/10058/https://developer.apple.com/videos/play/wwdc2022/10058/)

## Compact mode demo:

<img width="436" alt="img" src="https://s11.gifyu.com/images/SOKpP.gif">

## Todo:
 

- we need a clever way to regen window on orientation, sizeclass and window resize. do research on forcing view to update. these now work. but the refresh code should be one call. use copilot to figure it out etc. 


- Print columnwidths to see if they are being updated correctly 🏀

- check with copilot if anything changed with NavigationSplitView from ios 17 to ios 18

- Also consider showing back button instead of sidebar toggle button in compact mode 👈👈👈

- Consider using automatic instead of ballanced. If things can be simpler. Look into it. 

- Figure out how to avoid subduing the colors in compact mode (maybe because of hybrid color?, try pure black etc?) 

- Test support for dark / lightmode (make different b/w gifs etc) 

- Test to see if macOS works out of the box 

- Remove hybridcolor dep from debugcontainer. 

- or maybe add debug container through init wrapper

- Format the description comments to be 80 character wide

- Complete comment doc etc 

- Figure out how to remove the ability to create multiple windows of the same app on iPad. Write a note about it in the readme

- add new gif where it starts in 30% then 70% then 100%

## Future improvements:

- Consider adding better support for 2-coulmn working right out of the box. Or add notes on how to do it
- Consider experimenting with overflow working in detail column (maybe not, better to contain content)
- Consider adding buttons that toggle different split-view modes? (explore how this should look first etc)
- Consider improving the datamodel in the example project. Make it simpler
- Consider looking into using TupleView ? Research how it works etc. And how it might fit in here?
- Consider adding an option for 70% landscape mode could be to not use .all, and use .double instead
- Consider adding basic implementation on how to retain column-widths with user-default for macOS
- Consider adding sidebar / main / detail column widths to debug container