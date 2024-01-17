//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
   
    
    
    
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        
      
        searchTextField.delegate = self // text field algilamasi yapiyor go buton icin
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation() projede yok devamli lokasyon istegi
        
        locationManager.requestLocation()
       
        
    }
    
 
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController : UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text)
        searchTextField.endEditing(true)
    }
    // keybord enter butonu calistiriyor
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text)
        searchTextField.endEditing(true)
        return true
    }
    // bir sey yazmadan klavye kapatamiyorusn
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = " Type semething"
            return false        }
    }
    // butona tiklandiktan sonra
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            
            weatherManager.fetchWeather(cityName: city)
        }
        // use searchTextField get weather for the city
        searchTextField.text = ""
    }
    
}

//MARK: - WeatherDelegate
extension WeatherViewController : WeatherManagerDelegate {
    
    
    func didUpdateWeather(_ weatherManager:WeatherManager , weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error")
    }
    
}

//MARK: - CLLocationManagerDelegate


extension WeatherViewController : CLLocationManagerDelegate {
  
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("error:: \(error.localizedDescription)")
        }

}
