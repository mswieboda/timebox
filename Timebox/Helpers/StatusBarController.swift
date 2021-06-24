//
//  StatusBarController.swift
//  Timebox
//
//  Created by Matt Swieboda on 06/23/21.
//  Copyright © 2021 Matt Swieboda. All rights reserved.
//

import AppKit
import SwiftUI

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    
    init() {
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        let view = NSHostingView(rootView: ContentView())
        // Don't forget to set the frame, otherwise it won't be shown.
        view.frame = NSRect(x: 0, y: 0, width: 300, height: 100)

        let menu = NSMenu()
        var menuItem = NSMenuItem()
        
        menuItem.view = view
        menu.addItem(menuItem)
        
        menuItem = NSMenuItem()
        menuItem.title = "quit..."
        menuItem.keyEquivalent = "q"
        menuItem.isEnabled = true
        menuItem.action = #selector(onQuit(sender:))
        menuItem.target = self
        menu.addItem(menuItem)
        
        statusItem.button?.image = #imageLiteral(resourceName: "StatusBarIcon")
        statusItem.button?.image?.size = NSSize(width: 18.0, height: 18.0)
        statusItem.button?.image?.isTemplate = true
        statusItem.menu = menu
    }
    
    @objc func onQuit(sender: AnyObject) {
        NSApplication.shared.terminate(self)
    }
}
