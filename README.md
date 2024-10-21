[![Tests](https://github.com/sentryco/SplitViewKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/SplitViewKit/actions/workflows/Tests.yml)

# SplitViewKit

> Easily config multi-column apps (iPad and macOS)

<img width="436" alt="img" src="https://s1.gifyu.com/images/SOKpX.gif">


## Problems:

- 🧩 There is a lot of edge-cases when implementing `NavigationSplitView` to fit your needs
- 🔄 Updating column width based on device orientation. Not possible by default as columnWidths does not update after init.
- 📐 Manage column arrangement, 3-1 columns, when resizing to smaller windows / changing device-orientation (iPad)
- 👀 Making sure portrait, landscape, smaller windows look good. (iPad)
- 📱 Use the same `NavigationSplitView` for iPad and macOS (iPhone uses NavStack)
- 🚪 Ensure that side-bar can be revealed and got to from main and detail 
- 🖥️ Ensure "70% window in landscape" has enough space for each column, or toggle to double etc
- 🎬 Ensure moving detail to fullscreen works 
- 📏 Detect windows in `.regular` mode or `.compact` mode (iPad)
- 🗺️ `navigationDestination` works differently for iPad and macOS 
- 🍎 You are sort of forced to use Apple's hovering sidebar icon, which might break your design
- 💥 Apple has left countless bugs in the `navigationsplitview` API that has not been fixed. 
- 📏 Aligning column header height, can be a challenge because of Apple's inconsistent header API conventions across OSes
- 📱 Different iPads need different column widths to look really good  (iPad mini / iPad 11 / iPad 13) 
- 🗒️ Ensure that sheets and popups work in different orientations and compact windows
- 🐛 Debugging is a challenge because of the many edge cases to account for

## Solution:

- 🔍 Variables to access `sizeClass` to detect `.regular` or `.compact` mode
- 📏 Assert "70% landscape mode" precisely. Not detectable via sizeClass alone.
- 🐞 Easily debug "focused column", "column arrangement" and "current window-mode" (regular / compact)
- 🔁 Convenient `rebind` method for the `navigationDestination` support in macOS (mac and ios have different conventions)
- 🔄 Assert Device-orientation "Portrait" / "Landscape" 
- 📐 Device orientation helpers based on GeometryReader. This is the only way to customize "column-widths" on "device-rotation" event.
- 📏 Set custom sizes for "column-widths" based on: `column-arrangement-config`, `OS`, `device-orientation`, `window-mode` (regular / compact)
- 🚪 Ready-made "side-bar" toggle bindings that work in all orientations, and sizeClasses
- 🐜 Workarounds for known Apple unfixed "navsplitview" API bugs
- 📖 Example project to find your bearings and find edge cases outside your own project

## Mindset:

- 📏 3-column split-view (works for 2-column as well, but requires some tweaks)
- 🔄 Support for Portrait / Landscape
- 📱 iPad / macOS (iPhone uses NavStack)
- 🖥️ Support for split-screen and "resized-windows" for iPad
- 🎧 Bring-your-own header nav (apples header nav also works)
- 📦 Bring-your-own column content

## Usage

To use `SplitViewContainer`, you need to provide three SwiftUI views: `SideBar`, `Content`, and `Detail`. These views represent the left side menu-bar, the center main content, and the right side detail-view respectively.

```swift
SplitViewContainer<SideBar: View, Content: View, Detail: View>(sideBar: SideBar, content: Content, detail: Detail)
```

You can control the column visibility and preferred compact column through the `columnVisibility` and `preferredCompactColumn` properties respectively.

## Installation

Add this to xcode or your SPM package file:

```swift
.package(url: "https://github.com/sentryco/SplitViewKit", branch: "main")
```

## Notes

- `SplitViewContainer` is kept in its own class to reduce complexity in the implementation file.
- `NavsplitView` is used over `HSplitView` to get synergies with the iPad.
- The package is designed with the mindset of different device sizes: small (iPhone, iPad window), medium (iPad portrait), and large (iPad, macOS).

## Gotchas:

- The iPad will use regular for both portrait and landscape when it's running full screen
- For SlideOver modes, it becomes compact for all sizes except for when the app is using 70% width in Landscape.
- In SplitView, when in Portrait it can either occupy 40% of 60% of the screen
- In Landscape it can occupy 30%, 50%, and 70% of the screen

## NavigationSplitViewVisibility

- `.automatic` – Use the default leading column visibility for the current device. This is the default setting.
- `.doubleColumn` – Show the content column and detail area of a three-column navigation split view.
- `.detailOnly` – Hide the leading two columns of a three-column split view. In other words, only the detail area shows.

## References

- Stack Navigation on macOS [https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4](https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4)
- SwiftUI macOS Navigation Basics [https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/](https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/)
- Comprehensive SplitNavigationView [https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/](https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/) 
## Todo: 
- Add notes about why you should probably not fight splitview "schenanegence" too much. as apple has taken care of a lot of edge cases underthe hood, and if you start to customize too much, these edgecases will start to break etc
- WWDC video on navigationsplitview: [https://developer.apple.com/videos/play/wwdc2022/10054/?ref=appcoda.com](https://developer.apple.com/videos/play/wwdc2022/10054/?ref=appcoda.com)
- Very comprehensive custom split-view completely built from the ground up: [https://github.com/stevengharris/SplitView](https://github.com/stevengharris/SplitView)
- Pretty gd: [https://www.appcoda.com/navigationsplitview-swiftui/](https://www.appcoda.com/navigationsplitview-swiftui/)

## Resources:

- SwiftUI Repaint View Components on Device Rotation [link](https://stackoverflow.com/questions/57441654/swiftui-repaint-view-components-on-device-rotation)
- NavigationSplitView Documentation [link](https://developer.apple.com/documentation/swiftui/navigationsplitview)
- Different Forms of Navigation in SwiftUI [link](https://bignerdranch.com/blog/the-different-forms-of-navigation-in-swiftui/)
- Developer Forums Thread on Navigation Issues [link](https://forums.developer.apple.com/forums/thread/708721)
- NavigationStack inside NavigationSplitView Detail in SwiftUI [link](https://stackoverflow.com/questions/77464914/navigationstack-inside-navigationsplitview-detail-in-swiftui)
- SwiftUI macOS Navigation Basics [link](https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/)
- How to Detect Device Rotation in SwiftUI [link](https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation)
- Stack Overflow Answer on Device Orientation [link](https://stackoverflow.com/a/78889492)
- UIKit UIInterfaceOrientation Documentation [link](https://developer.apple.com/documentation/uikit/uiinterfaceorientation)
- SwiftUI SplitView Compact Column Control [link](https://useyourloaf.com/blog/swiftui-splitview-compact-column-control/)

## Compact mode demo:

<img width="436" alt="img" src="https://s11.gifyu.com/images/SOKpP.gif">

## Todo:

- Add icon based buttons for sidebar, back and fullscreen 👈🏀
- Add anim to hide / show of sidebar-visibility-button 👈
- Clean up the readme a bit 
- Try not setting column width for ipad. see if OS adjusts it etc? ( might solve the issue regarding compact mode event detection etc )
- Add code example to readme 
- Test to see if macOS works out of the box 
- Remove SplitViewKitTests Unit tests. from code and github actions 
- Figure out how to avoid subduing the colors in compact mode (maybe because of hybrid color?, try pure black etc?) 👈
- When going to compact mode. Widths are not updated (currently orientation change only updates this) 👈
- Look for an event that is called when we go into different compact / regular modes etc. maybe the view will / did load etc?
- An option for 70% landscape mode could be to not use .all, and use .double instead
- Add dependency overview to readme. we use HybridColor etc 
- Look into using TupleView ? Research how it works etc
- Test support for dark / lightmode (make different b/w gifs etc) 

## Future improvements:

- Consider adding better support for 2-coulmn working right out of the box. Or add notes on how to do it
- Consider experimenting with overflow working in detail column (maybe not, better to contain content)
- Consider adding buttons that toggle different split-view modes? (explore how this should look first etc)
- Consider improving the datamodel in the example project. Make it simpler
