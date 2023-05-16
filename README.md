# appjs-demo-2023
React Native macOS Menubar demo from App.Js Conf 2023

Note: This was the minimal amount of code I needed for my demo, so there's a lot that could be better. Such as:
1. Rewrite this in Swift
2. Remove the main window / dock icon
3. Remove the iOS / Android targets
4. Make this work with Fabric as well

Steps to recreate this demo for yourself (and also if this repo doesn't built)
1. Initialize a standard React Native template
    - `npx react-native init menubar-example --template react-native@^0.71`
2. `cd menubar-example`
3. Run the macos init command
    - `npx react-native-macos-init`
4. Add the necessary modification to create a menubar app (marked in the :
     1. Add an `NSStatusItem` property to `AppDelegate.h`
     2. Initialize it and add an image / click handler to it's button in `applicationDidFinishLaunching` of `AppDelegate.m`
     3. Create the click handler (I called it showPopover) to create and show an NSPopover with the ViewController that creates our RCTRootView in `AppDelegate.m`
    4. Override `loadView` in `ViewController.m` (because Appkit can be annoying..) 

Menubar app tutorials:
- https://www.polpiella.dev/a-menu-bar-only-macos-app-using-appkit/
- https://sarunw.com/posts/how-to-make-macos-menu-bar-app/
- https://www.kodeco.com/450-menus-and-popovers-in-menu-bar-apps-for-macos

The calendar library I used (Thanks Wix!)
- https://github.com/wix/react-native-calendars
