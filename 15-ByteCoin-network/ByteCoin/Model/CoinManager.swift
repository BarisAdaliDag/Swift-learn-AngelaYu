//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didUpdateCoin( currency:String , rate : Double)
    func didFailWithError(error: Error)
    
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "E8049229-EFF5-4563-A75E-306C2CF105EF"
    //https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=E8049229-EFF5-4563-A75E-306C2CF105EF
    
    var delegate:CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        
       // print(currencyArray[Int(currency)!])
        perfomRequest(with: currency)
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    
    func perfomRequest(with currencyStr:String) {
        let urlStr = baseURL + "/\(currencyStr)?apikey=" +  apiKey
        if let url = URL(string:urlStr) {
            
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){ ( data,response, error ) in
                
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                   // let str = String.init(data: safeData, encoding: .utf8)
                    //print(str)
                    
                    if let money = self.parseJSON(safeData) {
                        
                        self.delegate?.didUpdateCoin(currency: currencyStr, rate: money)
                        
                    }
                    
                }
                
            }
            task.resume()
        }
        
        
        
    }
    
    func parseJSON(_ weatherData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: weatherData)
            let lastPrice = decodedData.rate
         
            
          
            return lastPrice
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

    
    
    
    
}
