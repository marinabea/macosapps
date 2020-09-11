//
//  AppDelegate.swift
//  waterMyFriend
//
//  Created by Marina Beatriz Santana de Aguiar on 04.09.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let messagePopoverView = NSPopover()
    var timer: Timer!
    let mins: Double = 30
    var secs: Double {
        get {
            mins*60
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "Waterson"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
        
        configurePopover()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func configurePopover() {
        startTimer()
            guard let alertVc = storyboard.instantiateController(withIdentifier: "AlertViewController") as? AlertViewController else {
                fatalError("Unable to find AlertViewController") }
        messagePopoverView.contentViewController = alertVc
        messagePopoverView.behavior = .transient
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: secs,
                                     target: self,
                                    selector: #selector(showNotification), userInfo: nil, repeats: true)
    }
    
    
    @objc func showSettings() {
        let popover = NSPopover()
        guard var settingsVc = storyboard.instantiateController(withIdentifier: "SettingsViewController") as? ViewController else {
            fatalError("Unable to find SettingsViewController") }
        settingsVc.timer = timer
        popover.contentViewController = settingsVc
        popover.behavior = .transient
        popover.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
    }

    @objc func showNotification() {
        messagePopoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
    }


}

