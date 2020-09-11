//
//  AnswerViewController.swift
//  QuestionCards
//
//  Created by Marina Beatriz Santana de Aguiar on 11.09.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Cocoa

class AnswerViewController: NSViewController {

    @IBOutlet weak var answerLabel: NSTextField!
    var answer: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        answerLabel.stringValue = answer
    }
    
    @IBAction func backButtonPressed(_ sender: NSButtonCell) {
        dismiss(self)
    }
    
    
}
