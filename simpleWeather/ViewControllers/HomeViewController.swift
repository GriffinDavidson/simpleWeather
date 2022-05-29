//
//  HomeViewController.swift
//  simpleWeather
//
//  Created by Griffin Davidson on 5/27/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var precipitationProbabilityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.contact.getLocationData { city, error in
            guard let city = city, error == nil else {
                fatalError("Failed to load city")
            }
            
            API.contact.getWeather(from: city.key) { data, error in
                guard let data = data, error == nil else {
                    fatalError("Failed to load weather")
                }
                
                DispatchQueue.main.async {
                    self.title = city.localizedCityName
                    self.degreeLabel.text = "\(data[0].temperature.value)"
                    self.phraseLabel.text = data[0].phrase
                    self.precipitationProbabilityLabel.text = "Chance of rain: \(data[0].precipitationProbability)%"
                }
            }
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    
    
    


}

