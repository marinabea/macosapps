//
//  QuestionViewController.swift
//  QuestionCards
//
//  Created by Marina Beatriz Santana de Aguiar on 11.09.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Cocoa

class QuestionViewController: NSViewController {

    @IBOutlet weak var questionLabel: NSTextField!
    var questions = [String]()
    var answers = [String]()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = readFromFile(withName: "questions")
        answers = readFromFile(withName: "answers")
        questionLabel.stringValue = questions[counter]
        print(questions)
    }
    
    @IBAction func showAnswerButtonPressed(_ sender: NSButtonCell) {
        let storyboard = NSStoryboard.init(name: "Main", bundle: nil)
        let answerVC = storyboard.instantiateController(withIdentifier: "AnswerVC") as! AnswerViewController
        answerVC.answer = answers[counter]
        presentAsSheet(answerVC)
    }
    
    @IBAction func nextQuestionButtonPressed(_ sender: NSButton) {
        if let question = showQuestion(isPrevious: false) {
            questionLabel.stringValue = question
        }
    }
    
    @IBAction func previewQuestionButtonPressed(_ sender: NSButton) {
        if let question = showQuestion(isPrevious: true) {
            questionLabel.stringValue = question
        }
    }
    
    func showQuestion(isPrevious: Bool = false) -> String? {
        if isPrevious && counter != 0 {
            counter -= 1
            return questions[counter]
        } else if !isPrevious && counter != questions.count-1 {
            counter += 1
            return questions[counter]
        }
        return nil
    }
    
    func readFromFile(withName fileName: String) -> [String] {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt")  else {
            fatalError("Questions file not found.")
        }
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            return parseFromFileIntoArray(withRawContent: content)
        } catch {
            fatalError("Could not read content of questions file")
        }
    }
    
    func parseFromFileIntoArray(withRawContent: String) -> [String] {
        let token = "---"
        return withRawContent.components(separatedBy: token)
    }
    
    
}
