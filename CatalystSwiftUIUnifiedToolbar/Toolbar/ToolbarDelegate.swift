//
//  ToolbarDelegate.swift
//  ToolbarDelegate
//
//  Created by Matthew Corey on 8/17/21.
//

import SwiftUI
import Combine
import os.log

extension NSToolbar.Identifier {
    static let toolbarIdentifier = NSToolbar.Identifier("com.mcorey.toolbar")
}

extension NSToolbarItem.Identifier {
    static let showSheetToolbarIdentifier = NSToolbarItem.Identifier("com.mcorey.toolbar.showSheet")
    static let closeInspectorIdentifier = NSToolbarItem.Identifier("com.mcorey.toolbar.toggleInspector")
}

class ToolbarDelegate: NSObject, NSToolbarDelegate {
    static let shared = ToolbarDelegate()

    var showInspector: Binding<Bool>?
    var showSheet: Binding<Bool>?
    
    static var cancellables = [ AnyCancellable ]()
    
    override init() {
    }
    
    func initialize(showInspector: Binding<Bool>, showSheet: Binding<Bool>) {
        guard self.showInspector == nil && self.showSheet == nil else {
            return
        }

        self.showInspector = showInspector
        self.showSheet = showSheet
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        guard showInspector != nil else {
            return nil
        }
        
        if itemIdentifier == NSToolbarItem.Identifier.showSheetToolbarIdentifier {
            let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(self.add(sender:)))
            
            let button = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            button.label = "Show Sheet"
            button.toolTip = "Show Sheet"
            
            return button
        } else if itemIdentifier == NSToolbarItem.Identifier.closeInspectorIdentifier {
            let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.trailing"), style: .plain, target: self, action: #selector(self.toggleInspector(sender:)))
            
            let button = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            button.label = "Toggle Inspector View"
            button.toolTip = "Toggle Inspector View"
            
            return button
        }

        return nil
    }
    
    @objc func add(sender: UIBarButtonItem) {
        guard let showSheet = showSheet else {
            os_log("'add' clicked, but showSheet is null - verify that `initialize` was called properly")
            return
        }
        
        withAnimation {
            showSheet.wrappedValue.toggle()
        }
    }
    
    @objc func toggleInspector(sender: UIBarButtonItem) {
        guard let showInspector = showInspector else {
            os_log("'toggleInspector' clicked, but showInspector is null - verify that `initialize` was called properly")
            return
        }
        
        withAnimation {
            showInspector.wrappedValue.toggle()
        }
    }
    
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [ NSToolbarItem.Identifier.toggleSidebar, NSToolbarItem.Identifier.flexibleSpace, NSToolbarItem.Identifier.flexibleSpace, NSToolbarItem.Identifier.showSheetToolbarIdentifier, NSToolbarItem.Identifier.closeInspectorIdentifier ]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        self.toolbarDefaultItemIdentifiers(toolbar)
    }

}
