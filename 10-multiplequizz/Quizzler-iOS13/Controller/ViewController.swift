//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option2Button: UIButton!
    
    @IBOutlet weak var option1Button: UIButton!

    @IBOutlet weak var option3Button: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
       
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // True, false
     //   let actualAnswer = quiz[questionNumber].answer
       let userGotItRight = quizBrain.checkAnswer( userAnswer!)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
       
        quizBrain.nextQuestion()
        
        
        
        //WORKING
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
//            self.updateUI()
//        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { Timer in
            self.updateUI()
        }
        
        
        
    }
    func updateUI() {
        questionLabel.text = quizBrain.getQuewstionText()
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        //Benim cozum
//        let opt1Text = quizBrain.getButonText(0)
//        option1Button.setTitle(opt1Text, for: .normal)
//        let opt2Text = quizBrain.getButonText(1)
//        option2Button.setTitle(opt2Text, for: .normal)
//        let opt3Text = quizBrain.getButonText(2)
//        option3Button.setTitle(opt3Text, for: .normal)
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        option1Button.setTitle(answerChoices[0], for: .normal)
        option2Button.setTitle(answerChoices[1], for: .normal)
        option3Button.setTitle(answerChoices[2], for: .normal)
    }
    
}

