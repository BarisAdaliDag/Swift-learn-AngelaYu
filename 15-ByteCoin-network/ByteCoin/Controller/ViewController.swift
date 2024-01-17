//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   
    
  
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
        
    }
    
    
   
    
    
    
    
}
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
        
    }
    
}

//MARK: -  UIPickerViewDelegate

extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
               coinManager.getCoinPrice(for: selectedCurrency)
        
           
    }
    
}

//MARK: -  CoinManagerDelegate


extension ViewController: CoinManagerDelegate {
    func didUpdateCoin(currency: String, rate: Double) {
        
        DispatchQueue.main.async {
            let moneyStr = String(format: "%.2f", rate)
            self.bitcoinLabel.text = moneyStr
            self.currencyLabel.text = currency
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}