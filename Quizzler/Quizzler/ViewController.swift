//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        progressLabel.text = "\(questionNumber + 1) / 13"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
        
    }
    
    func nextQuestion(){
        if (questionNumber < 13){
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome!",
                                          message: "You've finished all the questions! Do you want to start again?",
                                          preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart",
                                              style: .default,
                                              handler: { UIAlertAction in self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            print("You got it!")
            score += 1
        } else {
            print("Wrong answer!")
        }
        
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
}
