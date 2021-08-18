//
//  CatalystSwiftUIUnifiedToolbarApp.swift
//  CatalystSwiftUIUnifiedToolbar
//
//  Created by Matthew Corey on 8/17/21.
//

import SwiftUI

@main
struct CatalystSwiftUIUnifiedToolbarApp: App {
    @State var showInspector = false
    @State var showSheet = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(showInspector: $showInspector, showSheet: $showSheet)
                .withHostingWindow { window in
                    if let titlebar = window?.windowScene?.titlebar {
                        let toolbar = NSToolbar(identifier: NSToolbar.Identifier.toolbarIdentifier)
                        
                        toolbar.displayMode = .iconOnly
                        toolbar.allowsUserCustomization = false

                        titlebar.toolbar = toolbar
                        titlebar.autoHidesToolbarInFullScreen = true

                        titlebar.toolbar?.delegate = ToolbarDelegate.shared
                        (titlebar.toolbar?.delegate as? ToolbarDelegate)?.initialize(showInspector: $showInspector, showSheet: $showSheet)

                        toolbar.insertItem(withItemIdentifier: NSToolbarItem.Identifier.toggleSidebar, at: 0)
                        toolbar.insertItem(withItemIdentifier: NSToolbarItem.Identifier.flexibleSpace, at: 1)
                        toolbar.insertItem(withItemIdentifier: NSToolbarItem.Identifier.showSheetToolbarIdentifier, at: 2)
                        toolbar.insertItem(withItemIdentifier: NSToolbarItem.Identifier.closeInspectorIdentifier, at: 3)
                    }
                }
        }
    }
}
