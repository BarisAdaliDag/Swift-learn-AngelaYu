//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var splitPrice = 0.0
    var numberOfPeople = 0.0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        //Deselect all tip buttons via IBOutlets
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                
                //Make the button that triggered the IBAction selected.
                sender.isSelected = true
                
                //Get the current title of the button that was pressed.
                let buttonTitle = sender.currentTitle!
                
                //Remove the last character (%) from the title then turn it back into a String.
                let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
                
                //Turn the String into a Double.
                let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
                
                //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
                tip = buttonTitleAsANumber / 100
       
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
       
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard var billTmp = billTextField.text else { return }
        if billTmp == ""{
            billTmp = "0"
        }
        
        numberOfPeople = Double(splitNumberLabel.text!)!
        let billPrice = Double(billTmp)
        
        let totalBill = billPrice! * Double(1 + tip)
         splitPrice = totalBill / numberOfPeople
        
       
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    //This method gets triggered just before the segue starts.
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           //If the currently triggered segue is the "goToResults" segue.
           if segue.identifier == "goToResult" {
               
               //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
               let destinationVC = segue.destination as! ResultsViewController
               
               //Set the destination ResultsViewController's properties.
               destinationVC.result = String(format: "%.2f", splitPrice)
               destinationVC.tip = Int(tip * 100)
               destinationVC.split = Int(numberOfPeople)
           }
       }

    
}

