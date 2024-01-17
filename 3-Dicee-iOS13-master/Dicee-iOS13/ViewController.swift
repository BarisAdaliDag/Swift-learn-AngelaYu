//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrImageStr = ["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix", ]
    var lefDiceNumber = 0
    var rightDiceNumber = 5

    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    @IBAction func rollButtonPressed(_ sender: Any) {
     
        print("deneme")
        diceImageOne.image = UIImage(named: arrImageStr[Int.random(in: 0...5)])
        diceImageOne.alpha = 0.5
        diceImageTwo.image=UIImage(named: arrImageStr.randomElement()!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }


}

