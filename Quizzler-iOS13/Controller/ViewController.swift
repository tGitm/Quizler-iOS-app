//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstAnswerOption: UIButton!
    @IBOutlet weak var secondAnswerOption: UIButton!
    @IBOutlet weak var thirdAnswerOption: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True, False
        let userAnswerRightNo = quizBrain.checkAnswer(userAnswer)
        
        if userAnswerRightNo {
            sender.backgroundColor = UIColor.green
            print("Correct!")
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong")
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        firstAnswerOption.setTitle(quizBrain.getAnswerOptionText(0), for: .normal)
        secondAnswerOption.setTitle(quizBrain.getAnswerOptionText(1), for: .normal)
        thirdAnswerOption.setTitle(quizBrain.getAnswerOptionText(2), for: .normal)
        
        firstAnswerOption.backgroundColor = UIColor.clear
        secondAnswerOption.backgroundColor = UIColor.clear
        thirdAnswerOption.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
}

