//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImage: UIImageView!
    
    var ballcount = 0
   
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    
    
    override func viewDidLoad() {
        ballImage.image = UIImage(named: "ball2")
    }
    
    @IBAction func AskButtonTapped(_ sender: Any) {
        
        ballcount = Int.random(in: 0..<5)
        ballImage.image =  UIImage(named: ballArray[ballcount])
        
    }
    


}

