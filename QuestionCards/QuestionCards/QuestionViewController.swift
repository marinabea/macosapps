//
//  QuestionViewController.swift
//  QuestionCards
//
//  Created by Marina Beatriz Santana de Aguiar on 11.09.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Cocoa

class QuestionViewController: NSViewController {

    @IBOutlet weak var gestureRecognizer: NSClickGestureRecognizer!
    @IBOutlet weak var questionLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureRecognizer.target = self
        gestureRecognizer.action = #selector(showAnswerVC)
    }
    
    
    @objc func showAnswerVC() {
        let storyboard = NSStoryboard.init(name: "Main", bundle: nil)
        let answerVC = storyboard.instantiateController(withIdentifier: "AnswerVC") as! AnswerViewController
        answerVC.answer = "No Answer"
        presentAsSheet(answerVC)
    }
    
    
}
