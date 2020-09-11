//
//  ViewController.swift
//  waterMyFriend
//
//  Created by Marina Beatriz Santana de Aguiar on 04.09.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timer: Timer!
    @IBOutlet weak var timerLabel: NSTextField!
    @IBOutlet weak var timerSegment: NSSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        timerLabel.stringValue = "Remaining time: \(String(Int(abs(timer.fireDate.distance(to: Date()))/60)))min"
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

