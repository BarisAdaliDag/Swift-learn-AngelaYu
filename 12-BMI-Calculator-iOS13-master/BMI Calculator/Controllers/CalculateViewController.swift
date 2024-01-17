//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // print(String(format: "%.2f", sender.value)
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
        
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //print(String(format: "%.0f", sender.value))
        
        weightLabel.text = String(format: "%.0f", sender.value) + "kg"
        
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       let height = heightSlider.value
      let weight =  weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1", bmi)
        
      //  self.present(secondVC, animated: true)
        
        
     self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //prefor
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" { // birden cok sayfaya gitme ihtimali oldugunda
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
        
    }
    
}
