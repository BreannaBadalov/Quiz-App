//
//  ViewController.swift
//  Quiz App
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Breanna Badalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func handleSubmitAnswer0(_ sender: Any) {
        
        checkAnswer(choiceNo:0)
        
    }
    
    @IBAction func handleSubmitAnswer1(_ sender: Any) {
        checkAnswer(choiceNo:1)
    }
    
    @IBAction func handleSubmitAnswer2(_ sender: Any) {
        checkAnswer(choiceNo:2)
    }
    
    @IBAction func handleSubmitAnswer3(_ sender: Any) {
        checkAnswer(choiceNo:3)
    }
    
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question \(currentQuestionPosition + 1) of \(questions.count)"
    }
    func loadNextQuestion() {
        if ((currentQuestionPosition + 1) == questions.count){
            performSegue(withIdentifier: "sgShowResults", sender: nil)}
        else {  currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion() }
    }
    //    var checkAnswer: int = choiceNo
    // var choiceNo: Int = 0
    func  checkAnswer(choiceNo: Int){
        if (choiceNo == currentQuestion!.correctAnswer){
            noCorrect += 1 }
        loadNextQuestion()
        }
        // }
        // }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "sgShowResults") {
                let vc = segue.destination as! ResultsViewController
                vc.noCorrect = noCorrect
                vc.total = questions.count
            }
    
    }
    
    @IBOutlet weak var progressLabel: UILabel!
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    var questions: [Question] = [
        Question(
            question: "How many planets are in the Solar System?",
            answers: ["7", "6", "9", "8"],
            correctAnswer: 3),
        Question(
            question: "Which planet is the coldest?",
            answers: ["Saturn", "Neptune", "Uranus", "Jupiter"],
            correctAnswer: 2),
        Question(
            question: "On which two planets does it rain diamonds?",
            answers: ["Saturn and Uranus", "Neptune and Uranus", "Jupiter and Neptune", "Saturn and Jupiter"],
            correctAnswer: 1)
    ]
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Setup the question and reset currentQuestion
        currentQuestion = questions[0]
        setQuestion()
    }
    //    }
    
    
}

