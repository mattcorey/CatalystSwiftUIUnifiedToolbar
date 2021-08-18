# Catalyst SwiftUI app, with Unified Toolbar

An example of a Catalyst app, built using the SwiftUI Lifecycle, and using the Unified Toolbar.

SwiftUI and Catalyst with the Mac Idiom has come a long way in iOS 15/macOS 12, but it still lags behind pure iOS or macOS implementation,
especially around Window management.  This project is an example of how you can get the awesome-looking Unified Toolbar design with SwiftUI
and Catalyst.

## Key Points

- Add the toolbar to the required WindowGroup by using `withHostingView` 
(defined [here](CatalystSwiftUIUniversalToolbar/Toolbar/View+HostingView)) to get a handle to the `titlebar` 
object.  Configure the look of the toolbar here, and add controls.

- To prevent the ToolbarDelegate from being created multiple times, it is implemented as a singleton, and shared 
state is passed in separately, via the `initialize` method

- Remove the space at the top of the views in the NavigationView with `.navigationBarHidden(true)`

