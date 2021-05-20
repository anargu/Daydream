//
//  AppDelegate.swift
//  Daydream
//
//  Created by Anargu on 19/05/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        
        // Create the status item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        // Add a menu and a menu item
        let menu = NSMenu()
        let resetMenuItem = NSMenuItem()
        resetMenuItem.title = "Reset"
        resetMenuItem.action = #selector(resetAction(_:))

        let startMenuItem = NSMenuItem()
        startMenuItem.title = "Start"
        startMenuItem.action = #selector(startAction(_:))

        menu.addItem(resetMenuItem)
        menu.addItem(startMenuItem)
        

        //Set the menu
        self.statusBarItem.menu = menu
        
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "DaydreamIconv4")
//            button.action = #selector(togglePopover(_:))
        }
        
        
        
        NSApp.activate(ignoringOtherApps: true)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func startAction(_ sender: AnyObject?) {
        debugPrint("startAction")
    }
    
    @objc func resetAction(_ sender: AnyObject?) {
        debugPrint("resetAction")
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

}

