# SplitViewKit

> Easily config multi-column apps (iPad and macOS)

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
- 🐞 Apple has left countless bugs in the `navigationsplitview` API that has not been fixed. 
- 📏 Aligning column header height, can be a challenge because of Apple's inconsistent header API conventions across OSes
- 📱 Different iPads need different column widths to look really good  (iPad mini / iPad 11 / iPad 13) 
- 🗒️ Ensure that sheets and popups work in different orientations and compact windows

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

- [Stack Navigation on macOS](https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4)
- [SwiftUI macOS Navigation Basics](https://www.kiloloco.com/articles/019-swiftui-macos-navigation-basics/)
- Comprehensive SplitNavigationView [https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/](https://eon.codes/blog/2024/02/02/NavigationSplitView-in-swiftui/) 
## Todo: 
- Add notes about why you should probably not fight splitview "schenanegence" too much. as apple has taken care of a lot of edge cases underthe hood, and if you start to customize too much, these edgecases will start to break etc
- WWDC video on navigationsplitview: https://developer.apple.com/videos/play/wwdc2022/10054/?ref=appcoda.com
- Very comprehensive custom split-view completely built from the ground up: https://github.com/stevengharris/SplitView

## Todo:

- Consider renaming package to `SplitContainerView` or `SplitViewWrapper`
- Consider adding placeholder views when there is no selection etc (currently there is always a selection)
- Add orientation debug label: "portrait", "landscape" to the bottom debugcontainer
- An option for 70% landscape mode could be to not use .all, and use .double instead
- Add dependency overview to readme. we use HybridColor etc
- Add better support for 2-coulmn working right out of the box. Or add notes on how to do it
- Experiment with overflow working in detail column (maybe not, better to contain content)
- Maybe add buttons that toggle different split-view modes? (explore how this should look first etc)
- Remove mainIndex -> the "main index" and "main model" uuid does duplicate index keeping
- Add code example to readme
- Test support for dark / lightmode (make different b/w gifs etc) 
- Add alert for settings items in the example code